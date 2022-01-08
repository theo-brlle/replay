import SwiftUI
import AVKit
import SharedModule

struct VideoPlayerView: View {
    @StateObject var viewModel: VideoPlayerViewModel
    
    init(streamID: String) {
        self._viewModel = StateObject(wrappedValue: VideoPlayerViewModel(streamID: streamID))
    }
    
    var body: some View {
        ViewModelStateHelper(state: viewModel.state) {
            VideoPlayerViewController(videoURL: viewModel.videoURL)
                .ignoresSafeArea()
        }
        .task {
            await viewModel.getVideoURL()
        }
    }
}

private struct VideoPlayerViewController: UIViewControllerRepresentable {
    var videoURL: URL?
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        guard let videoURL = self.videoURL else {
            return AVPlayerViewController()
        }
        
        let playerViewController = AVPlayerViewController()
        
        playerViewController.player = AVPlayer(url: videoURL)
        playerViewController.player?.play()
        
        return playerViewController
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {}
}
