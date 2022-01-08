class VideoCarouselViewModel {
    var title: String
    var videos: [Video]
    
    init(title: String, videos: [Video]) {
        self.title = title
        self.videos = videos
    }
}

