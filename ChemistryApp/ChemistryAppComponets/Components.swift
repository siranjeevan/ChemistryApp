//
//  Components.swift
//  ChemistryApp
//
//  Created by Jeevith  on 07/06/25.
//

import Foundation
import SwiftUI

class Components : ObservableObject {
   @Published var isBouncing: Bool = false
    
    func BouncingBackButton(selectedElement: Int) -> some View {
        Text("Back")
            .padding()
            .font(.body)
            .bold()
            .foregroundColor(ChemistryAppConstants.contentFontColor) // Replace with your actual color
            .background(Data.getElementsColor(index: selectedElement)) // Replace with your actual color array
            .cornerRadius(20)
            .scaleEffect(isBouncing ? 1.1 : 1.0) // Scale effect for bouncing
            .shadow(color:Data.getElementsColor(index: selectedElement) ,radius: isBouncing ? 10 : 0)
            .onAppear {
                // Start the bouncing animation
                withAnimation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true)) {
                    self.isBouncing.toggle()
                }
            }
    }
    
    func Header(content: String, selectedElement: Int) -> some View {
        if content == "" {
            return AnyView(
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.headerBackground)
                        .opacity(0.9)
                        .frame(width: screenWidth * 0.5, height: screenHeigth * 0.07)
                        .edgesIgnoringSafeArea(.all)

                    Text("Periodic Table")
                        .font(.custom(ChemistryAppConstants.headerFont, size: isIPhone ? 24 : 36))
                        .offset(y: screenHeigth * 0.012)
                        .foregroundColor(ChemistryAppConstants.HeaderFontColor)
                        .bold()
                }
                .scaledToFit()
                .offset(y: isIPhone ? -1 * screenHeigth * 0.21 : -1 * screenHeigth * 0.365)
            )
        } else {
            return AnyView(
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Data.getElementsColor(index: selectedElement))
                        .opacity(0.9)
                        .frame(width: screenWidth * 0.5, height: screenHeigth * 0.07)
                        .edgesIgnoringSafeArea(.all)

                    Text(content)
                        .font(.custom(ChemistryAppConstants.headerFont, size: isIPhone ? 24 : 36))
                        .offset(y: screenHeigth * 0.012)
                        .foregroundColor(ChemistryAppConstants.HeaderFontColor)
                }
                .scaledToFit()
                .offset(y: isIPhone ? -1 * screenHeigth * 0.21 : -1 * screenHeigth * 0.365)
            )
        }
    }
    
    func AppBackground()->some View{
        Image("app")
            .resizable()
            .scaledToFill()
            .opacity(0.5)
            .edgesIgnoringSafeArea(.all)
    }
    
}

struct a : View {
   @StateObject var components = Components()
    var body: some View {
        components.Header(content: "", selectedElement: 3)
        
    }
}

#Preview {
    a()
}
