struct GetVideosByTypeRequestResponse: Decodable {
    let data: Data
    
    struct Data: Decodable {
        let programBySlug: ProgramBySlug
        
        struct ProgramBySlug: Decodable {
            let decoration: Decoration
            let videos: Videos
            
            struct Decoration: Decodable {
                let background: Background
                
                struct Background: Decodable {
                    let sources: [Source]
                    
                    struct Source: Decodable {
                        let url: String
                    }
                }
            }
            
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
