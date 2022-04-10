import SwiftUI
import PlaygroundSupport

enum DeviceTraitStatus {
    case wRhR
    case wChR
    case wRhC
    case wChC

    init(hSizeClass: UserInterfaceSizeClass?, vSizeClass: UserInterfaceSizeClass?) {

        switch (hSizeClass, vSizeClass) {
        case (.regular, .regular):
            self = .wRhR
        case (.compact, .regular):
            self = .wChR
        case (.regular, .compact):
            self = .wRhC
        case (.compact, .compact):
            self = .wChC
        default:
            self = .wChR
        }
    }
}

struct ContentView: View {
    
    @Environment(\.horizontalSizeClass) var hSizeClass
    @Environment(\.verticalSizeClass) var vSizeClass

    var body: some View {
        VStack {
            let deviceTraitStatus = DeviceTraitStatus(hSizeClass: self.hSizeClass, vSizeClass: self.vSizeClass)
            switch deviceTraitStatus {
            case .wRhR, .wChR:
                self.portraitLayout
            case .wRhC, .wChC:
                self.landscapeLayout
            }
        }
    }
}

extension ContentView {
    var time: some View {
        Text("12:34:56")
            .frame(width: 200, height: 200)
            .background(Color.red)
    }
    
    var calendar: some View {
        Text("Calendar")
            .frame(width: 200, height: 200)
            .background(Color.blue)
    }
    
    var portraitLayout: some View {
        VStack {
            time
            calendar
        }
    }
    
    var landscapeLayout: some View {
        HStack {
            time
            calendar
        }
    }
}

PlaygroundPage.current.liveView = UIHostingController(rootView: ContentView())
