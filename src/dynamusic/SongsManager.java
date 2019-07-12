package dynamusic;

import atg.nucleus.GenericService;
import atg.repository.Repository;
import atg.repository.RepositoryException;

public class SongsManager extends GenericService {

    private Repository repository;

    public void deleteAlbumsByArtist(String artistId) throws RepositoryException {

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
