import SwiftUI
import RPCoreModule
import RPUIModule

struct TF1TabView: View {
    @StateObject var viewModel = TF1TabViewModel()
    
    var body: some View {
        VStack {
            ViewStateWrapper(state: viewModel.state) {
                ScrollView {
                    LazyVStack {
                        currentlyLiveBannerSection
                        ProgramCarouselView(title: "CATEGORY_SERIES_AND_FICTIONS_TITLE".localized(from: .module), programs: viewModel.seriesAndFictionsPrograms)
                        ProgramCarouselView(title: "CATEGORY_ENTERTAINEMENT_TITLE".localized(from: .module), programs: viewModel.entertainementPrograms)
                        ProgramCarouselView(title: "CATEGORY_INFOS_MAGAZINE_SPORTS_TITLE".localized(from: .module), programs: viewModel.infosMagazineSportsPrograms)
                        ProgramCarouselView(title: "CATEGORY_YOUTH_TITLE".localized(from: .module), programs: viewModel.youthPrograms)
                    }
                }
                .edgesIgnoringSafeArea(.horizontal)
            }
            .task {
                await viewModel.getCurrentlyLiveBannerURL()
                await viewModel.getSeriesAndFictionsPrograms()
                await viewModel.getEntertainementPrograms()
                await viewModel.getInfosMagazineSportsPrograms()
                await viewModel.getYouthPrograms()
            }
        }
    }
}

private extension TF1TabView {
    var currentlyLiveBannerSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("CATEGORY_CURRENTLY_LIVE_TITLE".localized(from: .module))
                .font(.headline)
                .foregroundStyle(.primary)
                .padding(.horizontal, 80)
            
            GeometryReader { geometry in
                NavigationLink {
                    VideoPlayerView(streamID: "L_TF1")
                } label: {
                    AsyncImage(url: viewModel.currentlyLiveBannerURL) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: .infinity)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: geometry.size.width, height: 426)
                    .clipped()
                }
                .buttonStyle(.card)
            }
            .frame(height: 426)
            .padding(.horizontal, 80)
            .padding(.top, 30)
            .padding(.bottom, 60)
        }
    }
}
