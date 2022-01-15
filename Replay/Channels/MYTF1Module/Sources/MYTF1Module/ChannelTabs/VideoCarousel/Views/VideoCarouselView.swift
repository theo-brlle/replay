import SwiftUI
import RPUIModule

struct VideoCarouselView: View {
    var title: String
    var videos: [Video]
    
    var body: some View {
        CarouselView(title: self.title, items: self.videos, type: .fourColumns) { videoStreamID in
            VideoPlayerView(streamID: videoStreamID)
        }
    }
}

