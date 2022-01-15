extension GetVideosByTypeRequestResponse.Data.ProgramBySlug.Videos.Item: VideoDataRepresentable {
    var streamID: String {
        return self.streamId
    }
    
    var thumbailURLs: [String] {
        return self.decoration.images[1].sources.map { $0.url }
    }
}
