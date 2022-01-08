import SwiftUI

public struct ViewModelStateHelper<Content: View>: View {
    public var state: ViewModelState
    
    @ViewBuilder public var content: () -> Content
    
    public init(state: ViewModelState, @ViewBuilder content: @escaping () -> Content) {
        self.state = state
        self.content = content
    }
    
    public var body: some View {
        switch self.state {
        case .success:
            content()
            
        case .failure:
            VStack {
                Text("TODO: Error View")
                if case let ViewModelState.failure(error) = self.state {
                    Text(error.localizedDescription)
                }
            }
            
        case .loading:
            ProgressView()
        }
    }
}
