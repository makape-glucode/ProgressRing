import SwiftUI

struct ContentView: View {
    @State private var points: Int = 0

    var body: some View {
        VStack {
            ProgressRingView(points: points)
            
            Button("Add Point") {
                if points < 8 {
                    points += 1
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
