struct GetVideoURLRequestResponse: Decodable {
    let delivery: Delivery
    
    struct Delivery: Decodable {
        let url: String
    }
}
