import SwiftUI
import Foundation

class ConfigurationAnimationComponets: ObservableObject {
    @Published var isHibirnateShell = false
    @Published var timer: Timer? = nil

    func ClockWiseAtomShell(numberOfBalls: Int, radius: CGFloat, color: Color, angle: Binding<CGFloat>) -> some View {
        ZStack {
            Circle()
                .stroke(isHibirnateShell ? .gray : color, lineWidth: 2)
                .frame(width: radius * 2)
                .shadow(color: isHibirnateShell ? .clear : color, radius: 10)

            ForEach(0..<numberOfBalls, id: \.self) { [self] index in
                let angleOffset = 2 * .pi * CGFloat(index) / CGFloat(numberOfBalls)
                let xPosition = radius * cos(angle.wrappedValue + angleOffset)
                let yPosition = radius * sin(angle.wrappedValue + angleOffset)

                Circle()
                    .frame(width: 7)
                    .offset(x: xPosition, y: yPosition)
                    .foregroundColor(isHibirnateShell ? .gray : .red)
            }
        }
        .onAppear {
            if !self.isHibirnateShell {
                self.ClockWiseAtomShellAnimationStart(angle: angle)
            }
        }
        .onDisappear {
            self.timer?.invalidate()
        }
    }

    private func ClockWiseAtomShellAnimationStart(angle: Binding<CGFloat>) {
        let newTimer = Timer.scheduledTimer(withTimeInterval: 1/60, repeats: true) { _ in
            DispatchQueue.main.async {
                angle.wrappedValue += 0.01
            }
        }
        RunLoop.current.add(newTimer, forMode: .common)
        timer = newTimer
    }
}

struct k: View {
    @StateObject var s = ConfigurationAnimationComponets()
    @State var angle: CGFloat = 0

    var body: some View {
        s.ClockWiseAtomShell(numberOfBalls: 10, radius: 100, color: .red, angle: $angle)
    }
}

#Preview {
    k()
}
