import Cocoa

@main
struct MenuApp: App {
    var body: some Scene {
        Window("Menu 菜单", id: "main") {
            ContentView()
        }
        .defaultSize(width: 500, height: 400)
    }
}
