import SwiftUI
import RPUIModule

struct ProgramCarouselView: View {
    var title: String
    var programs: [Program]
    
    var body: some View {
        CarouselView(title: self.title, items: self.programs, type: .fiveColumns) { programSlug in
            ProgramDetailsView(programSlug: programSlug)
        }
    }
}
