package dynamusic;

import atg.repository.RepositoryException;
import atg.repository.servlet.RepositoryFormHandler;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;

import javax.servlet.ServletException;
import java.io.IOException;

public class ArtistFormHandler extends RepositoryFormHandler {

    private SongsManager songsManager;

    @Override
    protected void preDeleteItem(DynamoHttpServletRequest pRequest, DynamoHttpServletResponse pResponse) throws ServletException, IOException {
        String artistId = getRepositoryItem().getRepositoryId();
        if (isLoggingDebug()) {
            logDebug("ArtistFormHandler.preDeleteItem() called for artist " + artistId);
        }
        try {
            songsManager.deleteAlbumsByArtist(artistId);
        } catch (RepositoryException e) {
            if (isLoggingDebug()) {
                logDebug("RepositoryException occurred: " + e.getMessage());
            }
        }
    }

    public SongsManager getSongsManager() {
        return songsManager;
    }

    public void setSongsManager(SongsManager songsManager) {
        this.songsManager = songsManager;
    }
}
