import Foundation

struct GetCurrentlyLiveBannerRequest {
    let session = URLSession.shared
    var request: URLRequest
    
    init() throws {
        var urlComponents = URLComponents(string: "https://mediainfo.tf1.fr/mediainfocombo/L_TF1")
        urlComponents?.queryItems = [
            URLQueryItem(name: "context", value: "MYTF1"),
            URLQueryItem(name: "pver", value: "4019001"),
            URLQueryItem(name: "platform", value: "web"),
            URLQueryItem(name: "os", value: "iOS"),
            URLQueryItem(name: "osVersion", value: "unknown"),
            URLQueryItem(name: "topDomain", value: "wwww.tf1.fr")
        ]
        
        guard let url = urlComponents?.url else {
            throw URLError(.badURL)
        }

        self.request = URLRequest(url: url)
    }
    
    func perform() async throws -> GetCurrentlyLiveBannerRequestResponse {
        let (data, _) = try await session.data(for: request)
        let decoder = JSONDecoder()
        return try decoder.decode(GetCurrentlyLiveBannerRequestResponse.self, from: data)
    }
}


