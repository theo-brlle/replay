import SwiftUI

struct CarouselItemView: View {
    var thumbnailURL: URL?
    
    var body: some View {
        AsyncImage(url: thumbnailURL) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            ProgressView()
        }
        .clipped()
    }
}
