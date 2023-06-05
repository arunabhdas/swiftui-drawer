
import SwiftUI

struct MenuView: View {
    
    @Binding private var selection: MenuItem?
    @Binding private var isOpened: Bool
    
    @SceneStorage("menuAppearance")
    private var appearance: MenuAppearance = .default
    
    @State private var colorScheme: ColorScheme?
    @Environment(\.colorScheme) private var systemColorScheme
    
    // MARK: - Init
    
    init(selection: Binding<MenuItem?>, isOpened: Binding<Bool>) {
        _selection = selection
        _isOpened = isOpened
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            MenuItemList(selection: $selection, isOpened: $isOpened, onUserSelected: {
                withAnimation {
                    appearance.toggle()
                }
            })
            
            Spacer()
                .frame(height: 10)
            
            ColorSchemePicker(selection: Binding($colorScheme, default: systemColorScheme))
                .anchorPreference(key: AnchorPreferenceKey<CGRect>.self, value: .bounds) { $0 }
                .overrideColorScheme($colorScheme.animation(.default))
            
            Button(
                action: {
                    /* noop */
                    if let sel = selection {
                        print("TODO-FIXME-CLEANUP The selection is \(sel)")
                    }
                    
                },
                label: {
                    Label.logout
                }
            )
            .buttonStyle(MenuItemButtonStyle())
            
            Spacer()
        }
        .fixedSize(horizontal: true, vertical: false)
        .padding()
        .backgroundPreferenceValue(AnchorPreferenceKey<CGRect>.self) { anchor in
            MenuBackground(colorScheme: colorScheme ?? systemColorScheme)
                .transition(.menuBackgroundFadeIn(from: anchor))
                .id(colorScheme ?? systemColorScheme)
        }
        .menuAppearance(appearance)
        .animation(.default, value: colorScheme)
        .clipped()
        .background {
            RoundedRectangle(cornerRadius: UIDimenion.backgroundCornerRadius)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 0)
        }
        .padding(.leading)
    }
}

struct MenuView_Previews: PreviewProvider {
    
    struct Preview: View {
        
        @State var appearance: MenuAppearance = .default
        @State var menuItem: MenuItem? = .dashboard
        @State var isOpened: Bool = true
        
        var body: some View {
            ZStack(alignment: .leading) {
                MenuView(selection: $menuItem, isOpened: $isOpened)
                    .menuAppearance(appearance)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            appearance.toggle()
                            print("TODO-FIXME-CLEANUP The selection is \($menuItem)")
                        }
                    }
            }
        }
    }
    
    static var previews: some View {
        Preview()
            .previewLayout(.sizeThatFits)
    }
}
