protocol VideoURLDataRepresentable {
    var videoURL: String { get }
}

extension GetVideoURLRequestResponse: VideoURLDataRepresentable {
    var videoURL: String {
        return self.delivery.url
    }
}
