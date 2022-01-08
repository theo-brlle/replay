import SwiftUI
import SharedModule

class ProgramDetailsViewModel: ObservableObject, LoadableViewModel {
    @Published var state: ViewModelState = .success
    
    @Published var replayVideos: [Video] = []
    @Published var extractVideos: [Video] = []
    @Published var excluVideos: [Video] = []
    
    var programSlug: String
    
    init(programSlug: String) {
        self.programSlug = programSlug
    }
    
    @MainActor func getReplayVideos() async {
        do {
            self.state = .loading
            let request = try GetVideosByTypeRequest(programSlug: self.programSlug, type: "REPLAY")
            let videos = try await request.perform()
            
            self.replayVideos = videos.data.programBySlug.videos.items.map { Video(from: $0) }
            
            self.state = .success
        } catch {
            self.state = .failure(error)
        }
    }
    
    @MainActor func getExtractVideos() async {
        do {
            self.state = .loading
            let request = try GetVideosByTypeRequest(programSlug: self.programSlug, type: "EXTRACT")
            let videos = try await request.perform()
            
            self.extractVideos = videos.data.programBySlug.videos.items.map { Video(from: $0) }
            
            self.state = .success
        } catch {
            self.state = .failure(error)
        }
    }
    
    @MainActor func getExcluVideos() async {
        do {
            self.state = .loading
            let request = try GetVideosByTypeRequest(programSlug: self.programSlug, type: "BONUS")
            let videos = try await request.perform()
            
            self.excluVideos = videos.data.programBySlug.videos.items.map { Video(from: $0) }
            
            self.state = .success
        } catch {
            self.state = .failure(error)
        }
    }
}
