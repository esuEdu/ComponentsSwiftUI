import SwiftUI

struct ShapeAnimation: View {
    
    @State private var waveOffset = Angle(degrees: 0)
    @State private var currentHue: Double = 0
    @State private var frequency: CGFloat = 50
    var body: some View {
        ZStack {
            Wave(offset: waveOffset, frequency: frequency)
                .fill(waveGradient())
                .frame(width: 250)
        }
        .onAppear {
            let timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { _ in
                updateColor()
            }
            timer.fire()
 
            withAnimation(Animation.linear(duration: 4.0).repeatForever(autoreverses: false)) {
                self.waveOffset = Angle(degrees: 360)
                
            }
        }
    }
    
    func waveGradient() -> LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [Color(hue: currentHue, saturation: 1.0, brightness: 1.0), Color(hue: currentHue + 0.1, saturation: 1.0, brightness: 1.0)]), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    func updateColor() {
        currentHue += 0.01 // Adjust the rate of color change here
        if currentHue >= 1.0 {
            currentHue = 0.0
        }
    }
    
}


struct Wave: Shape {
    var offset: Angle = Angle(degrees: 0)
    var frequency: CGFloat = 50

    var animatableData: Double {
        get { offset.degrees }
        set { offset = Angle(degrees: newValue) }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let segments = 360
        let segmentAngle = Angle(degrees: 360) / Double(segments)
        var nextPoint = CGPoint()
        for i in 0..<segments {
            let angle = segmentAngle * Double(i)

            let x = center.x + (radius + CGFloat(sin(offset.radians + angle.radians) * 10)) * CGFloat(cos(angle.radians))
            let y = center.y + (radius + CGFloat(sin(offset.radians + angle.radians) * -10)) * CGFloat(sin(angle.radians))

            nextPoint = CGPoint(x: x, y: y)

            if i == 0 {
                path.move(to: nextPoint)
            } else {
                path.addLine(to: nextPoint)
            }
        }
        return path
    }
}


#Preview {
    ShapeAnimation()
}
