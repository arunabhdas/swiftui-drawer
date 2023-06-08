
import SwiftUI
import Drawer

struct ContentView: View {

  @State private var isOpened = true

  @Environment(\.colorScheme) private var colorScheme

  @State private var selection: MenuItem? = .dashboard
  @State var appearance: MenuAppearance = .default

  var body: some View {
    Drawer(
      isOpened: $isOpened,
      menu: {
        MenuView(selection: $selection, isOpened: $isOpened)
      },
      content: {
        ZStack {
            Color("color/foreground")
            .environment(\.colorScheme, colorScheme.inverted())
            .edgesIgnoringSafeArea(.all)
            .animation(.default, value: colorScheme)

            /* TODO-FIXME-DEBUG
            Button {
            isOpened.toggle()
            } label: {
            Text("Open")
              .foregroundColor(Color("color/text"))
              .typographyStyle(.headline)
            }
            */
            
            switch selection {
            case .home:
                HomeView()
            case .dashboard:
                DashboardView()
            case .artAI:
                ArtView()
            case .musicAI:
                MusicView()
            case .companionAI:
                SettingsView()
            case .notifications:
                SettingsView()
            case .healthAI:
                HealthView()
            case .archive:
                SettingsView()
            case .none:
                EmptyView()
            }
            

            // Menu button
            VStack {
              HStack {
                Button(action: {
                  isOpened.toggle()
                }) {
                  Image(systemName: "line.horizontal.3")
                    .imageScale(.large)
                    .padding()
                    .foregroundColor(Color("color/text"))
                }
                Spacer()
              }
              Spacer()
            }

        }
      }
    )
    .statusBarHidden(true)

  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
