//
//  AnimationComponets.swift
//  ChemistryApp
//
//  Created by Jeevith  on 10/06/25.
//

import Foundation
import SwiftUI

class AnimationComponets: ObservableObject {
    @Published var isHibirnateShell = false
    @Published var angle: CGFloat = 0  // Make this @Published to trigger UI updates
    private var timer: Timer?

    func ClockWiseAtomShell(numberOfBalls: Int, radius: CGFloat, color: Color) -> some View {
        ZStack {
            // Shell ring
            Circle()
                .stroke(self.isHibirnateShell ? .gray : color, lineWidth: 2)
                .frame(width: radius * 2)
                .shadow(color: isHibirnateShell ? .clear : color, radius: 10)

            // Balls rotating in shell
            ForEach(0..<numberOfBalls, id: \.self) { index in
                let angleOffset = 2 * .pi * CGFloat(index) / CGFloat(numberOfBalls)
                let xPosition = radius * cos(self.angle + angleOffset)
                let yPosition = radius * sin(self.angle + angleOffset)

                Circle()
                    .frame(width: 7)
                    .offset(x: xPosition, y: yPosition)
                    .foregroundColor(self.isHibirnateShell ? .gray : .red)
            }
        }
        .onAppear {
            if !self.isHibirnateShell && self.timer == nil {
                let newTimer = Timer(timeInterval: 1/60, repeats: true) { _ in
                    DispatchQueue.main.async {
                        self.angle += 0.01
                    }
                }
                RunLoop.current.add(newTimer, forMode: .common)
                self.timer = newTimer
            }
        }
        .onDisappear {
            self.timer?.invalidate()
            self.timer = nil
        }
    }
}


struct AtomShellPreview: View {
    @StateObject var animation = AnimationComponets()

    var body: some View {
        VStack {
            animation.ClockWiseAtomShell(
                numberOfBalls: 10,
                radius: 20 + CGFloat(5 * 15),
                color: .red
            )
            .frame(width: 300, height: 300)

            Button(action: {
                animation.isHibirnateShell.toggle()
            }) {
                Text(animation.isHibirnateShell ? "Wake Atom" : "Hibernate Atom")
            }
            .padding()
        }
    }
}

#Preview {
    AtomShellPreview()
}

