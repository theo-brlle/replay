struct GetCurrentlyLiveBannerRequestResponse: Decodable {
    var media: Media
    
    struct Media: Decodable {
        var preview: String
    }
}
