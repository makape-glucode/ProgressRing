import SwiftUI

struct ProgressRingView: View {
    @State var awardPoints = false
    @State var fullPoints = false
    var points: Int
    var strokeColor: Color
    var circleSize: CGFloat
    
    init(strokeColor: Color = .red, circleSize: CGFloat = 125, points: Int = 0) {
        self.strokeColor = strokeColor
        self.circleSize = circleSize
        self.points = points
    }
    
    var body: some View {
        VStack {
            ZStack {
                // Background Circle
                Circle()
                    .stroke(lineWidth: 20.0)
                    .opacity(0.3)
                    .foregroundColor(Color.gray)

                // Progress Ring
                Circle()
                    .trim(from: 0.0, to: CGFloat(points) / 8.0)
                    .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(strokeColor)
                
                // Points
                Circle()
                    .stroke(lineWidth: 90)
                    .frame(width: 25, height: 25)
                    .foregroundColor(fullPoints ? strokeColor : Color.clear)
//                    .foregroundColor(strokeColor)
                    .shadow(radius: 25)
                    .overlay {
                        Text("\(points)")
                            .font(.title)
                            .foregroundColor(strokeColor)
//                            .foregroundColor(awardPoints ? strokeColor : Color.white)
                            .fontWeight(.bold)
                    }
            }
            .frame(width: 150, height: 150)
        }
    }
}

struct ProgressRingView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressRingView()
    }
}
