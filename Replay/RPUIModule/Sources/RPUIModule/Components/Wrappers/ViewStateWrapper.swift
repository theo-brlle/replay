import SwiftUI

public protocol ViewStateRepresentable {
    var isSuccess: Bool { get }
    var isFailure: Bool { get }
    var isLoading: Bool { get }
    
    var error: Error? { get }
}

public struct ViewStateWrapper<Content: View, ViewState: ViewStateRepresentable>: View {
    public var state: ViewState
    
    @ViewBuilder public var content: () -> Content
    
    public init(state: ViewState, @ViewBuilder content: @escaping () -> Content) {
        self.state = state
        self.content = content
    }
    
    public var body: some View {
        if state.isSuccess {
            content()
        } else if state.isFailure {
            VStack {
                Text("TODO: Error View")
                if let error = self.state.error {
                    Text(error.localizedDescription)
                }
            }
        } else {
            ProgressView()
        }
    }
}
