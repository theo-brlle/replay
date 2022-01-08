import Foundation

struct GetVideosByTypeRequest {
    let session = URLSession.shared
    var request: URLRequest
    
    init(programSlug: String, type: String) throws {
        var urlComponents = URLComponents(string: "https://www.tf1.fr/graphql/web")
        urlComponents?.queryItems = [
            URLQueryItem(name: "id", value: "6708f510f2af7e75114ab3c4378142b2ce25cd636ff5a1ae11f47ce7ad9c4a91"),
            URLQueryItem(name: "variables", value: "{\"programSlug\":\"\(programSlug)\",\"offset\":0,\"limit\":500,\"sort\":{\"type\":\"DATE\",\"order\":\"DESC\"},\"types\":[\"\(type)\"]}")
        ]
        
        guard let url = urlComponents?.url else {
            throw URLError(.badURL)
        }

        self.request = URLRequest(url: url)
        
        self.request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        self.request.setValue("https://www.tf1.fr/programmes-tv", forHTTPHeaderField: "Referer")
        self.request.setValue("AppleWebKit/537.36 (KHTML, like Gecko)", forHTTPHeaderField: "User-Agent")
    }
    
    func perform() async throws -> GetVideosByTypeRequestResponse {
        let (data, _) = try await session.data(for: request)
        let decoder = JSONDecoder()
        return try decoder.decode(GetVideosByTypeRequestResponse.self, from: data)
    }
}

