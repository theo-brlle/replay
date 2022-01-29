import SwiftUI
import CoreModule

class VideoPlayerViewModel: ObservableObject, LoadableViewModel {
    @Published var state: ViewModelState = .success
    
    @Published var videoURL: URL? = nil
    
    var streamID: String
    
    init(streamID: String) {
        self.streamID = streamID
    }
    
    @MainActor func getVideoURL() async {
        do {
            self.state = .loading
            let request = try GetVideoURLRequest(streamID: self.streamID)
            let videoURL = try await request.perform()
            
            self.videoURL = URL(string: videoURL.videoURL)
            
            self.state = .success
        } catch {
            self.state = .failure(error)
        }
    }
}
