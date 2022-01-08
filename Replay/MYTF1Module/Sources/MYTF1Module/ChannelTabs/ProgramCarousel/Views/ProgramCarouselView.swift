import SwiftUI

struct ProgramCarouselView: View {
    private var viewModel: ProgramCarouselViewModel
    
    init(title: String, programs: [Program]) {
        self.viewModel = ProgramCarouselViewModel(title: title, programs: programs)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(self.viewModel.title)
                .font(.headline)
                .foregroundStyle(.primary)
                .padding(.horizontal, 80)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 40) {
                    ForEach(self.viewModel.programs) { program in
                        NavigationLink {
                            ProgramDetailsView(programSlug: program.slug)
                        } label: {
                            ProgramCarouselItemView(thumbnailURL: program.thumbnailURL)
                                .frame(width: 320, height: 426)
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
