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
                        ProgramCarouselView(title: "CATEGORY_SERIES_AND_FICTIONS_TITLE".localized(from: .module), programs: viewModel.seriesAndFictionsPrograms)
                        ProgramCarouselView(title: "CATEGORY_ENTERTAINEMENT_TITLE".localized(from: .module), programs: viewModel.entertainementPrograms)
                        ProgramCarouselView(title: "CATEGORY_INFOS_MAGAZINE_SPORTS_TITLE".localized(from: .module), programs: viewModel.infosMagazineSportsPrograms)
                        ProgramCarouselView(title: "CATEGORY_YOUTH_TITLE".localized(from: .module), programs: viewModel.youthPrograms)
                    }
                }
                .edgesIgnoringSafeArea(.horizontal)
            }
            .task {
                await viewModel.getSeriesAndFictionsPrograms()
                await viewModel.getEntertainementPrograms()
                await viewModel.getInfosMagazineSportsPrograms()
                await viewModel.getYouthPrograms()
            }
        }
    }
}
