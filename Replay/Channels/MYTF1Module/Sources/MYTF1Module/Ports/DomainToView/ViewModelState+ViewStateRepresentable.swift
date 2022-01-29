import CoreModule
import UIModule

extension ViewModelState: ViewStateRepresentable {
    public var isSuccess: Bool {
        switch self {
        case .success:
            return true
            
        default:
            return false
        }
    }
    
    public var isFailure: Bool {
        switch self {
        case .failure:
            return true
            
        default:
            return false
        }
    }
    
    public var isLoading: Bool {
        switch self {
        case .loading:
            return true
            
        default:
            return false
        }
    }
    
    public var error: Error? {
        switch self {
        case .failure(let error):
            return error
            
        default:
            return nil
        }
    }
}
