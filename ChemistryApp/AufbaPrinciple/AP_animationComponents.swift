//
//  AP_animationComponents.swift
//  ChemistryApp
//
//  Created by Jeevith on 6/10/25.
//

import Foundation
import SwiftUI

class Ap_animationComponents: ObservableObject {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        
        path.move(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX - 20, y: rect.midY - 10))
        path.move(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX - 20, y: rect.midY + 10))
        
        return path
    }
}

struct ArrowView: View {
    @StateObject var animation = Ap_animationComponents()
    
    var body: some View {
        Canvas { context, size in
            let path = animation.path(in: CGRect(origin: .zero, size: size))
            context.stroke(path, with: .color(.red), lineWidth: 2)
        }
        .frame(width: 200, height: 50)
        .padding()
    }
}

#Preview {
    ArrowView()
}
