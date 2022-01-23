import Foundation

struct GetProgramsByCategoryRequest {
    let session = URLSession.shared
    var request: URLRequest
    
    init(category: String) throws {
        var urlComponents = URLComponents(string: "https://www.tf1.fr/graphql/web")
        urlComponents?.queryItems = [
            URLQueryItem(name: "id", value: "400be301099f781dbee5bf2641b3bfba74f9fb6c13a54a22cae1fde916e42c7a"),
            URLQueryItem(name: "variables", value: "{\"context\":{\"persona\":\"PERSONA_2\",\"application\":\"WEB\",\"device\":\"DESKTOP\",\"os\":\"WINDOWS\"},\"filter\":{\"channel\":\"tf1\", \"category\":\"\(category)\"},\"offset\":0,\"limit\":500}")
        ]
        
        guard let url = urlComponents?.url else {
            throw URLError(.badURL)
        }

        self.request = URLRequest(url: url)
        
        self.request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        self.request.setValue("https://www.tf1.fr/programmes-tv", forHTTPHeaderField: "Referer")
        self.request.setValue("AppleWebKit/537.36 (KHTML, like Gecko)", forHTTPHeaderField: "User-Agent")
    }
    
    func perform() async throws -> GetProgramsByCategoryRequestResponse {
        let (data, _) = try await session.data(for: request)
        let decoder = JSONDecoder()
        return try decoder.decode(GetProgramsByCategoryRequestResponse.self, from: data)
    }
}
