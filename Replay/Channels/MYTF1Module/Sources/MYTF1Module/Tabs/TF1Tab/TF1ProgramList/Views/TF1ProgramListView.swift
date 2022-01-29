import SwiftUI
import CoreModule
import UIModule

struct TF1ProgramListView: View {
    @StateObject var viewModel = TF1ProgramListViewModel()
    
    var body: some View {
        VStack {
            ViewStateWrapper(state: viewModel.state) {
                ScrollView {
                    LazyVStack {
                        CarouselView(title: "CATEGORY_SERIES_AND_FICTIONS_TITLE".localized(from: .module),
                                     items: viewModel.seriesAndFictionsPrograms,
                                     type: .fiveColumns) { programSlug in
                            TF1ProgramDetailsView(programSlug: programSlug)
                        }
                        
                        CarouselView(title: "CATEGORY_ENTERTAINEMENT_TITLE".localized(from: .module),
                                     items: viewModel.entertainementPrograms,
                                     type: .fiveColumns) { programSlug in
                            TF1ProgramDetailsView(programSlug: programSlug)
                        }
                        
                        CarouselView(title: "CATEGORY_INFOS_MAGAZINE_SPORTS_TITLE".localized(from: .module),
                                     items: viewModel.infosMagazineSportsPrograms,
                                     type: .fiveColumns) { programSlug in
                            TF1ProgramDetailsView(programSlug: programSlug)
                        }
                        
                        CarouselView(title: "CATEGORY_YOUTH_TITLE".localized(from: .module),
                                     items: viewModel.youthPrograms,
                                     type: .fiveColumns) { programSlug in
                            TF1ProgramDetailsView(programSlug: programSlug)
                        }
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
