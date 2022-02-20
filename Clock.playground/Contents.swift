import SwiftUI
import PlaygroundSupport

struct Time {
    var hour: Int = 0
    var minute: Int = 0
    var second: Int = 0
}

struct ContentView: View {
    @State var time = Time()
    
    // Combineで1秒ごとに実行されるタイマーを宣言
    let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    
    var body: some View {
        Text(String(format: "%02d:%02d:%02d",time.hour, time.minute, time.second))      // HH:mm:ssで表示する
            .font(Font(UIFont.monospacedDigitSystemFont(ofSize: 64, weight: .light)))   // 等幅フォントを指定（時刻変化でサイズが変わらないように）
            .onReceive(timer){ _ in
                // タイマー処理で現在時刻に更新
                let now = Date()
                self.time.hour = Calendar.current.component(.hour, from: now)
                self.time.minute = Calendar.current.component(.minute, from: now)
                self.time.second = Calendar.current.component(.second, from: now)
            }
    }
}

PlaygroundPage.current.liveView = UIHostingController(rootView: ContentView())
