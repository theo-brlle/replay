import SwiftUI
import CoreModule

class TF1ProgramListViewModel: ObservableObject, LoadableViewModel {
    @Published var state: ViewModelState = .success
    
    @Published var seriesAndFictionsPrograms: [Program] = []
    @Published var entertainementPrograms: [Program] = []
    @Published var infosMagazineSportsPrograms: [Program] = []
    @Published var youthPrograms: [Program] = []

    @MainActor func getSeriesAndFictionsPrograms() async {
        do {
            self.state = .loading
            let request = try GetProgramsByCategoryRequest(category: "MAIN_SERIES_AND_FICTIONS")
            let programs = try await request.perform()
            
            self.seriesAndFictionsPrograms = programs.data.programs.items.map { Program(from: $0) }
            
            self.state = .success
        } catch {
            self.state = .failure(error)
        }
    }
    
    @MainActor func getEntertainementPrograms() async {
        do {
            self.state = .loading
            let request = try GetProgramsByCategoryRequest(category: "MAIN_ENTERTAINEMENT")
            let programs = try await request.perform()
            
            self.entertainementPrograms = programs.data.programs.items.map { Program(from: $0) }
            
            self.state = .success
        } catch {
            self.state = .failure(error)
        }
    }
    
    @MainActor func getInfosMagazineSportsPrograms() async {
        do {
            self.state = .loading
            let request = try GetProgramsByCategoryRequest(category: "MAIN_INFOS_MAGAZINE_SPORTS")
            let programs = try await request.perform()
            
            self.infosMagazineSportsPrograms = programs.data.programs.items.map { Program(from: $0) }
            
            self.state = .success
        } catch {
            self.state = .failure(error)
        }
    }
    
    @MainActor func getYouthPrograms() async {
        do {
            self.state = .loading
            let request = try GetProgramsByCategoryRequest(category: "MAIN_YOUTH")
            let programs = try await request.perform()
            
            self.youthPrograms = programs.data.programs.items.map { Program(from: $0) }
            
            self.state = .success
        } catch {
            self.state = .failure(error)
        }
    }
}
