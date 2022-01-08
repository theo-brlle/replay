struct GetProgramsByCategoryRequestResponse: Decodable {
    let data: Data
    
    struct Data: Decodable {
        let programs: Programs
        
        struct Programs: Decodable {
            let items: [Item]
            
            struct Item: Decodable {
                let slug: String
                let decoration: Decoration
                
                struct Decoration: Decodable {
                    let image: Image
                    
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
