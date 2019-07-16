package dynamusic;

import atg.repository.RepositoryException;
import atg.repository.servlet.RepositoryFormHandler;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;

import javax.servlet.ServletException;
import java.io.IOException;

public class PlaylistFormHandler extends RepositoryFormHandler {
    private String songId;
    private String userId;
    private String addSongSuccessURL;
    private String addSongErrorURL;
    private PlaylistManager playlistManager;

    @Override
    protected void postCreateItem(DynamoHttpServletRequest pRequest, DynamoHttpServletResponse pResponse) throws ServletException, IOException {
        String playlistId = getRepositoryItem().getRepositoryId();
        try {
            playlistManager.addPlaylistToUser(playlistId, userId);
        } catch (Exception e) {
            e.printStackTrace();
            if (isLoggingError()) logError(e);
        }
    }

    public void handleAddSong(DynamoHttpServletRequest pRequest, DynamoHttpServletResponse pResponse) throws ServletException, IOException {
        String playlistId = getRepositoryItem().getRepositoryId();
        try {
            playlistManager.addSongToPlaylist(playlistId, songId);
            if (addSongSuccessURL != null) {
                pResponse.sendLocalRedirect(addSongSuccessURL, pRequest);
            }
        } catch (Exception e) {
            e.printStackTrace();
            if (isLoggingError()) logError(e);
            if (addSongErrorURL != null) {
                pResponse.sendLocalRedirect(addSongErrorURL, pRequest);
            }
        }

    }

    public String getSongId() {
        return songId;
    }

    public void setSongId(String songId) {
        this.songId = songId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getAddSongSuccessURL() {
        return addSongSuccessURL;
    }

    public void setAddSongSuccessURL(String addSongSuccessURL) {
        this.addSongSuccessURL = addSongSuccessURL;
    }

    public String getAddSongErrorURL() {
        return addSongErrorURL;
    }

    public void setAddSongErrorURL(String addSongErrorURL) {
        this.addSongErrorURL = addSongErrorURL;
    }

    public PlaylistManager getPlaylistManager() {
        return playlistManager;
    }

    public void setPlaylistManager(PlaylistManager playlistManager) {
        this.playlistManager = playlistManager;
    }
}
