package dynamusic;

import atg.nucleus.GenericService;
import atg.repository.*;

import javax.transaction.TransactionManager;
import java.util.Set;

public class PlaylistManager extends GenericService {
    private Repository userRepository;
    private Repository songsRepository;
    private TransactionManager transactionManager;

    public void addPlaylistToUser(String playlistId, String userId) throws RepositoryException {
        MutableRepository mutableUserRepository = (MutableRepository) userRepository;
        MutableRepositoryItem user = mutableUserRepository.getItemForUpdate(userId, "user");
        RepositoryItem playlist = userRepository.getItem(playlistId, "playlist");
        Set<RepositoryItem> playlists = (Set<RepositoryItem>) user.getPropertyValue("playlists");
        playlists.add(playlist);
        mutableUserRepository.updateItem(user);
    }

    public void addSongToPlaylist(String playlistId, String songId) throws RepositoryException {
        MutableRepository mutableUserRepository = (MutableRepository) userRepository;
        MutableRepositoryItem playlist = mutableUserRepository.getItemForUpdate(playlistId, "playlist");
        RepositoryItem song = songsRepository.getItem(songId,"song");
        Set<RepositoryItem> songs = (Set<RepositoryItem>) playlist.getPropertyValue("songs");
        songs.add(song);
        mutableUserRepository.updateItem(playlist);
    }

    public Repository getUserRepository() {
        return userRepository;
    }

    public void setUserRepository(Repository userRepository) {
        this.userRepository = userRepository;
    }

    public Repository getSongsRepository() {
        return songsRepository;
    }

    public void setSongsRepository(Repository songsRepository) {
        this.songsRepository = songsRepository;
    }

    public TransactionManager getTransactionManager() {
        return transactionManager;
    }

    public void setTransactionManager(TransactionManager transactionManager) {
        this.transactionManager = transactionManager;
    }
}
