import Foundation

protocol VideoDataRepresentable {
    var streamID: String { get }
    var thumbailURLs: [String] { get }
}

struct Video: Identifiable {
    let id = UUID()
    var streamID: String
    var thumbnailURL: URL?
    
    init(from videoData: VideoDataRepresentable) {
        self.streamID = videoData.streamID
        if let thumbnailURL = videoData.thumbailURLs.first {
            self.thumbnailURL = URL(string: thumbnailURL)
        }
    }
}

extension GetVideosByTypeRequestResponse.Data.ProgramBySlug.Videos.Item: VideoDataRepresentable {
    var streamID: String {
        return self.streamId
    }
    
    var thumbailURLs: [String] {
        return self.decoration.images[1].sources.map { $0.url }
    }
}
