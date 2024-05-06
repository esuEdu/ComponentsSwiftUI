import SwiftUI
import SwiftData

struct LavaLampView: View {
    @Environment(Navigation.self) private var coordinator
    @State private var waveOffset = Angle(degrees: 0)
    @State private var currentHue: Double = 0
    @Binding var text: String
    @State private var xFrequency: CGFloat = 50
    @State private var yFrequency: CGFloat = -50
    
    var body: some View {
        VStack {
            
            Button(action: {coordinator.push(.profile, type: .link)}, label: {
                Text("Button")
            })
            ZStack {
                Wave(offset: waveOffset, xFrequency: xFrequency, yFrequency: yFrequency)
                    .fill(waveGradient())
                    .frame(width: 250)
            }
        }
        .navigationTitle(text)
        .onAppear {
            let timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
                updateFrequencies()
            }
            timer.fire()
            
            let colorTimer = Timer.scheduledTimer(withTimeInterval: 0.0000005, repeats: true) { _ in
                updateColor()
            }
            colorTimer.fire()
            
            withAnimation(Animation.linear(duration: 3.5).repeatForever(autoreverses: false)) {
                self.waveOffset = Angle(degrees: 360)
                generateFrequencies()

            }
        }
    }
    
    func waveGradient() -> LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [Color(hue: currentHue, saturation: 1.0, brightness: 1.0), Color(hue: currentHue + 0.1, saturation: 1.0, brightness: 1.0)]), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    func updateColor() {
        currentHue += 0.000001 // Adjust the rate of color change here
        if currentHue >= 1.0 {
            currentHue = 0.0
        }
    }
    
    func generateFrequencies() {
        xFrequency = CGFloat.random(in: 0...80)
        yFrequency = CGFloat.random(in: -80...0)
    }
    
    func updateFrequencies() {
        xFrequency += 0.5 // Adjust the rate of color change here
        yFrequency -= 0.5 // Adjust the rate of color change here

    }
    
}

struct Wave: Shape {
    var offset: Angle = Angle(degrees: 360)
    var xFrequency: CGFloat
    var yFrequency: CGFloat
    
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
            
            let x = center.x + (radius + CGFloat(sin(offset.radians + angle.radians) * xFrequency)) * CGFloat(cos(angle.radians))
            let y = center.y + (radius + CGFloat(sin(offset.radians + angle.radians) * yFrequency)) * CGFloat(sin(angle.radians))
            
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
    let dataContainer: ModelContainer = .previewContainer
    return NavigationRoot(.lavaLamp(.constant("")))
        .swiftDataManagerModifier(dataContainer)
}
