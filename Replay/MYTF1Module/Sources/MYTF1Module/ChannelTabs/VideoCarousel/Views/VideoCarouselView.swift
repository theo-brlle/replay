import SwiftUI

struct VideoCarouselView: View {
    private var viewModel: VideoCarouselViewModel
    
    init(title: String, videos: [Video]) {
        self.viewModel = VideoCarouselViewModel(title: title, videos: videos)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(self.viewModel.title)
                .font(.headline)
                .foregroundStyle(.primary)
                .padding(.horizontal, 80)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 40) {
                    ForEach(self.viewModel.videos) { video in
                        NavigationLink {
                            VideoPlayerView(streamID: video.streamID)
                        } label: {
                            ProgramCarouselItemView(thumbnailURL: video.thumbnailURL)
                                .frame(width: 410, height: 230)
                        }
                        .buttonStyle(.card)
                    }
                }
                .padding(.horizontal, 80)
                .padding(.top, 30)
                .padding(.bottom, 60)
            }
        }
    }
}

