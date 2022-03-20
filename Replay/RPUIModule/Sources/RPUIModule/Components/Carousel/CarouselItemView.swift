import SwiftUI

struct CarouselItemView: View {
    var thumbnailURL: URL?
    var isDotPresented: Bool = false
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            AsyncImage(url: thumbnailURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .clipped()
            
            if isDotPresented {
                Image("seen-program-icon")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding([.top, .trailing], 4)
            }
        }
    }
}
