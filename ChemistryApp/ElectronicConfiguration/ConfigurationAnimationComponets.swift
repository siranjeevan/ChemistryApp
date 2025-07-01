//
//  ConfigurationAnimationComponets.swift
//  ChemistryApp
//
//  Created by Jeevith on 7/1/25.
//

import SwiftUI
import Foundation

class ConfigurationAnimationComponets: ObservableObject {
    
    @Published var isHibirnateShell = false
    @Published var angle: CGFloat = 0
    @Published var timer: Timer? = nil
    @Published var dummyTrigger = false // 👈 key fix to force re-render

    func ClockWiseAtomShell(numberOfBalls: Int , radius: CGFloat , color:Color) -> some View {
        ZStack {
            Circle()
                .stroke(isHibirnateShell ? .gray : color, lineWidth: 2)
                .frame(width: radius * 2)
                .shadow(color: isHibirnateShell ? .clear : color, radius: 10)
            
            ForEach(0..<numberOfBalls, id: \.self) { [self] index in
                let angleOffset = 2 * .pi * CGFloat(index) / CGFloat(numberOfBalls)
                let xPosition = radius * cos(self.angle + angleOffset)
                let yPosition = radius * sin(self.angle + angleOffset)
                
                Circle()
                    .frame(width: 7)
                    .offset(x: xPosition, y: yPosition)
                    .foregroundColor(isHibirnateShell ? .gray : .red)
            }
        }
        .onAppear {
            if !self.isHibirnateShell {
                self.ClockWiseAtomShellAnimationStart()
            }
        }
        .onDisappear {
            self.timer?.invalidate()
        }
    }

    private func ClockWiseAtomShellAnimationStart() {
        let newTimer = Timer(timeInterval: 1 / 60, repeats: true) { _ in
            DispatchQueue.main.async {
                self.angle += 0.01
                self.dummyTrigger.toggle() // 👈 force SwiftUI to observe a change
            }
        }
        RunLoop.current.add(newTimer, forMode: .common)
        timer = newTimer
    }
}

struct k : View {
    @StateObject var s = ConfigurationAnimationComponets()

    var body: some View {
        s.ClockWiseAtomShell(numberOfBalls: 10, radius: 100, color: .red)
    }
}

#Preview {
    k()
}
