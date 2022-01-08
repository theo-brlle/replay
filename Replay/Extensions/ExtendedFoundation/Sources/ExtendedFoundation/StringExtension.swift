import Foundation

public extension String {
    func localized(from bundle: Bundle = .main, withParameters parameters: CVarArg...) -> String {
        return String(format: NSLocalizedString(self, bundle: bundle, comment: ""), arguments: parameters)
    }
}
