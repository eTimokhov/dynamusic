package dynamusic;

import atg.dtm.TransactionDemarcation;
import atg.dtm.TransactionDemarcationException;
import atg.nucleus.GenericService;
import atg.repository.*;
import atg.repository.rql.RqlStatement;

import javax.transaction.SystemException;
import javax.transaction.TransactionManager;

public class SongsManager extends GenericService {

    private Repository repository;
    private TransactionManager transactionManager;

    public void deleteAlbumsByArtist(String artistId) throws RepositoryException {
        if (isLoggingDebug()) {
            logDebug("deleteAlbumsByArtist called with artistId " + artistId);
        }
        MutableRepository repository = (MutableRepository) getRepository();
        RepositoryView albumView = repository.getView("album");
        RqlStatement findAlbumsByArtistRql = RqlStatement.parseRqlStatement("artist.id = ?0");
        Object[] rqlParams = new Object[1];
        rqlParams[0] = artistId;
        RepositoryItem[] albums = findAlbumsByArtistRql.executeQuery(albumView, rqlParams);
        if (albums == null)
            return;

        TransactionDemarcation transactionDemarcation = new TransactionDemarcation();
        try {
            transactionDemarcation.begin(transactionManager, TransactionDemarcation.REQUIRED);
            try {
                for (RepositoryItem album : albums) {
                    String albumId = album.getRepositoryId();
                    repository.removeItem(albumId, "album");
                    if (isLoggingDebug()) {
                        logDebug("Album with id " + albumId + " deleted");
                    }
                }
            } catch (Exception e) {
                try {
                    transactionManager.setRollbackOnly();
                } catch (SystemException ex) {
                    if (isLoggingError()) {
                        logError(ex);
                    }
                }
            } finally {
                transactionDemarcation.end();
            }
        } catch (TransactionDemarcationException e) {
            e.printStackTrace();
        }

    }

    public Repository getRepository() {
        if (isLoggingDebug()) {
            logDebug("getRepository called, returning " + repository);
        }
        return repository;
    }

    public void setRepository(Repository repository) {
        if (isLoggingDebug()) {
            logDebug("setRepository called with" + repository);
        }
        this.repository = repository;
    }

    public TransactionManager getTransactionManager() {
        return transactionManager;
    }

    public void setTransactionManager(TransactionManager transactionManager) {
        this.transactionManager = transactionManager;
    }
}
