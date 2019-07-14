package dynamusic;

import atg.nucleus.GenericService;
import atg.repository.*;
import atg.repository.rql.RqlStatement;

public class SongsManager extends GenericService {

    private Repository repository;

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
        for (RepositoryItem album : albums) {
            String albumId = album.getRepositoryId();
            repository.removeItem(albumId, "album");
            if (isLoggingDebug()) {
                logDebug("Album with id " + albumId + " deleted");
            }
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
}
