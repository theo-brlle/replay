import UIModule

extension Program: CarouselItemRepresentable {
    var title: String {
        "ToDo"
    }
    
    var remoteID: String {
        self.slug
    }
}
