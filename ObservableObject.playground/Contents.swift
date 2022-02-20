import SwiftUI
import PlaygroundSupport
//import Combine

class ViewModel: ObservableObject {
    @Published var count = 0
    
    init() {
        print("ViewModel.init()")
    }
    
    func countUp() {
        count = count + 1
    }
}

struct ChildView: View {
//    @ObservedObject var viewModel = ViewModel()
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        Text("\(viewModel.count)")
        Button {
            viewModel.countUp()
        } label: {
            Text("カウントアップ")
        }.onAppear {
            print("Child View onAppear.")
        }
    }
}

struct ContentView: View {
    @State var count = 0
    
    var body: some View {
        VStack {
            Text("Parent count: \(count)")
            Button {
                count += 1
            } label: {
                Text("Increment parent count")
            }

            ChildView()
        }
    }
}

PlaygroundPage.current.liveView = UIHostingController(rootView: ContentView())
