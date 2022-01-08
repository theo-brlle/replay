import SwiftUI
import ExtendedFoundation
import SharedModule
import RPCoreUI

struct ProgramDetailsView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject var viewModel: ProgramDetailsViewModel
    
    init(programSlug: String) {
        self._viewModel = StateObject(wrappedValue: ProgramDetailsViewModel(programSlug: programSlug))
    }
    
    var body: some View {
        VStack {
            ViewModelStateHelper(state: viewModel.state) {
                GeometryReader { container in
                    VStack(spacing: 0) {
                        ScrollView {
                            VStack(spacing: 0) {
                                Spacer(minLength: container.size.height * 0.65)
                                LazyVStack {
                                    VideoCarouselView(title: "TYPE_REPLAY_TITLE".localized(from: .module), videos: viewModel.replayVideos)
                                    VideoCarouselView(title: "TYPE_EXTRACT_TITLE".localized(from: .module), videos: viewModel.extractVideos)
                                    VideoCarouselView(title: "TYPE_EXCLU_TITLE".localized(from: .module), videos: viewModel.excluVideos)
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
        .background(AsyncImage(url: URL(string: "https://photos.tf1.fr/1920/1080/cover-showpage-404e38-06b00e-0@1x.jpg")))
    }
}

private extension ProgramDetailsView {
    var backgroundBlur: some View {
//        colorScheme == .light ? Color.white : Color.black
        Color.background
            .padding(.horizontal, -80)
            .padding(.bottom, -60)
            .opacity(0.6)
            .blur(radius: 50)
            .edgesIgnoringSafeArea(.all)
    }
}
