import SwiftUI
import AppKit
import Sparkle

@main
struct SwiftShiftApp: App {
  @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
  @AppStorage("showMenuBarIcon") var showMenuBarIcon = true
  
  var body: some Scene {
    MenuBarExtra(isInserted: $showMenuBarIcon) {
      AppView()
    } label: {
      Image("MenuBarIcon").renderingMode(.template).resizable()
    }
    .menuBarExtraStyle(.window)
    .windowResizability(.contentMinSize)
    .defaultSize(width: 400, height: 400)
    .commands {
      CommandGroup(after: .appInfo) {
        CheckUpdatesButton()
      }
    }
  }
}
