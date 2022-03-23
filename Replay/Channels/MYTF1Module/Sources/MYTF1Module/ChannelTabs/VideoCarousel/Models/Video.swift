import Foundation

protocol VideoDataRepresentable {
    var streamID: String { get }
    var thumbailURLs: [String] { get }
}

struct Video: Identifiable {
    let id = UUID()
    var streamID: String
    var thumbnailURL: URL?
    
    var isAlreadySeen: Bool {
        guard let seenPrograms = UserDefaults.standard.array(forKey: "seen-programs") else {
            return false
        }
        
        return seenPrograms.contains { $0 as? String == streamID }
    }
    
    init(from videoData: VideoDataRepresentable) {
        self.streamID = videoData.streamID
        if let thumbnailURL = videoData.thumbailURLs.first {
            self.thumbnailURL = URL(string: thumbnailURL)
        }
    }
}
