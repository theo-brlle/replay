struct GetVideosByTypeRequestResponse: Decodable {
    let data: Data
    
    struct Data: Decodable {
        let programBySlug: ProgramBySlug
        
        struct ProgramBySlug: Decodable {
            let videos: Videos
            
            struct Videos: Decodable {
                let items: [Item]
                
                struct Item: Decodable {
                    let streamId: String
                    let decoration: Decoration
                    
                    struct Decoration: Decodable {
                        let images: [Image]
                        
                        struct Image: Decodable {
                            let sources: [Source]
                            
                            struct Source: Decodable {
                                let url: String
                            }
                        }
                    }
                }
            }
        }
    }
}
