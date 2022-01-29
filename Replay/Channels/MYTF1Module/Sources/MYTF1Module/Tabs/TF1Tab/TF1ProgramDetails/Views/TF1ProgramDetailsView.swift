import SwiftUI
import CoreModule
import UIModule

struct TF1ProgramDetailsView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject var viewModel: TF1ProgramDetailsViewModel
    
    init(programSlug: String) {
        self._viewModel = StateObject(wrappedValue: TF1ProgramDetailsViewModel(programSlug: programSlug))
    }
    
    var body: some View {
        VStack {
            ViewStateWrapper(state: viewModel.state) {
                GeometryReader { container in
                    VStack(spacing: 0) {
                        ScrollView {
                            VStack(spacing: 0) {
                                Spacer(minLength: container.size.height * 0.65)
                                LazyVStack {
                                    CarouselView(title: "TYPE_REPLAY_TITLE".localized(from: .module),
                                                 items: viewModel.replayVideos,
                                                 type: .fourColumns) { videoStreamID in
                                        VideoPlayerView(streamID: videoStreamID)
                                    }
                                    
                                    CarouselView(title: "TYPE_EXTRACT_TITLE".localized(from: .module),
                                                 items: viewModel.extractVideos,
                                                 type: .fourColumns) { videoStreamID in
                                        VideoPlayerView(streamID: videoStreamID)
                                    }
                                    
                                    CarouselView(title: "TYPE_EXCLU_TITLE".localized(from: .module),
                                                 items: viewModel.excluVideos,
                                                 type: .fourColumns) { videoStreamID in
                                        VideoPlayerView(streamID: videoStreamID)
                                    }
                                }
                                .padding(.top, 30)
                                .background(backgroundBlur)
                            }
                        }
                        .edgesIgnoringSafeArea([.horizontal, .bottom])
                    }
                }
            }
            .task {
                await viewModel.getReplayVideos()
                await viewModel.getExtractVideos()
                await viewModel.getExcluVideos()
            }
        }
        .background(backgroundImage)
    }
}

private extension TF1ProgramDetailsView {
    @ViewBuilder var backgroundImage: some View {
        if let url = viewModel.backgroundURL {
            AsyncImage(url: url)
        } else {
            EmptyView()
        }
    }
    
    var backgroundBlur: some View {
        Color.background
            .padding(.horizontal, -80)
            .padding(.bottom, -60)
            .opacity(0.3)
            .blur(radius: 50)
            .edgesIgnoringSafeArea(.all)
    }
}
