import Foundation
import SwiftUI

protocol ProgramDataRepresentable {
    var slug: String { get }
    var thumbailURLs: [String] { get }
}

struct Program: Identifiable {
    let id = UUID()
    var slug: String
    var thumbnailURL: URL?
    
    init(from programData: ProgramDataRepresentable) {
        self.slug = programData.slug
        if let thumbnailURL = programData.thumbailURLs.first {
            self.thumbnailURL = URL(string: thumbnailURL)
        }
    }
}
