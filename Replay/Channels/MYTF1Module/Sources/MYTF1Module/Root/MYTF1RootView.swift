import SwiftUI
import RPCoreModule

public struct MYTF1RootView: View {
    public init() {}
    
    public var body: some View {
        TabView {
            TF1ProgramListView()
                .tabItem {
                    Text("CHANNEL_TF1_TITLE".localized(from: .module))
                }
            Text("TODO: TMC View")
                .tabItem {
                    Text("CHANNEL_TMC_TITLE".localized(from: .module))
                }
            Text("TODO: TFX View")
                .tabItem {
                    Text("CHANNEL_TFX_TITLE".localized(from: .module))
                }
            Text("TODO: TF1 Séries Films View")
                .tabItem {
                    Text("CHANNEL_TF1_SERIES_FILMS_TITLE".localized(from: .module))
                }
            Text("TODO: Search View")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
        }
    }
}
