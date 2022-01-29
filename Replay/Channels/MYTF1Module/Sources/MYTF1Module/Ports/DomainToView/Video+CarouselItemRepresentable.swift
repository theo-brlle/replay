import UIModule

extension Video: CarouselItemRepresentable {
    var remoteID: String {
        self.streamID
    }
    
    var title: String {
        "ToDo"
    }
}
