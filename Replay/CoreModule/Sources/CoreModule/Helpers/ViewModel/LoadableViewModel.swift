public protocol LoadableViewModel {
    var state: ViewModelState { get set }
}

public extension LoadableViewModel {
    var isLoading: Bool {
        switch self.state {
        case .loading:
            return true
            
        default:
            return false
        }
    }
}
