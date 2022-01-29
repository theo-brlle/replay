import SwiftUI

public protocol CarouselItemRepresentable: Identifiable {
    var remoteID: String { get }
    var title: String { get }
    var thumbnailURL: URL? { get }
}

public enum CarouselType {
    case fourColumns
    case fiveColumns
    
    var unfocusedItemWidth: CGFloat {
        switch self {
        case .fourColumns:
            return 410
            
        case .fiveColumns:
            return 320
        }
    }
    
    var unfocusedItemHeight: CGFloat {
        switch self {
        case .fourColumns:
            return 230
            
        case .fiveColumns:
            return 426
        }
    }
}

public struct CarouselView<Item: CarouselItemRepresentable, Content: View>: View {
    var title: String
    var items: [Item]
    var type: CarouselType
    @ViewBuilder var content: (String) -> Content
    
    public init(title: String, items: [Item], type: CarouselType, @ViewBuilder content: @escaping (String) -> Content) {
        self.title = title
        self.items = items
        self.type = type
        self.content = content
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(self.title)
                .font(.headline)
                .foregroundStyle(.primary)
                .padding(.horizontal, 80)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 40) {
                    ForEach(self.items) { carouselItem in
                        NavigationLink {
                            content(carouselItem.remoteID)
                        } label: {
                            CarouselItemView(thumbnailURL: carouselItem.thumbnailURL)
                                .frame(width: self.type.unfocusedItemWidth, height: self.type.unfocusedItemHeight)
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
