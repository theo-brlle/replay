import SwiftUI
import RPCoreModule
import RPUIModule

struct ProgramDetailsView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject var viewModel: ProgramDetailsViewModel
    
    init(programSlug: String) {
        self._viewModel = StateObject(wrappedValue: ProgramDetailsViewModel(programSlug: programSlug))
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
        .background(backgroundImage)
    }
}

private extension ProgramDetailsView {
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
