//
//  AufbaPrincipleComponents.swift
//  ChemistryApp
//
//  Created by Jeevith on 6/10/25.
//

import Foundation
import SwiftUI

class AufbaPrincipleComponents: ObservableObject {
    
    @Published var incrementer: Int = 0
    
    func ElectronicScoreboardCard(index: Int, selectedElement: Int) -> some View {
        HStack {
            RoundedRectangle(cornerRadius: 5)
                .fill(ChemistryAppConstants.spdfOrdering[index])
                .frame(
                    width: ChemistryAppConstants.screenWidth * 0.025,
                    height: ChemistryAppConstants.screenWidth * 0.025
                )
                .overlay {
                    Text("\(Data.getElementsConfiguration(index1: selectedElement, index2: index))")
                        .font(.custom(ChemistryAppConstants.headerFont, size: 16))
                        .foregroundColor(ChemistryAppConstants.contentFontColor)
                }
            Text(ChemistryAppConstants.content[index])
                .font(.custom(ChemistryAppConstants.atomSymbolFont, size: 16))
                .foregroundColor(ChemistryAppConstants.contentFontColor)
        }
    }
    
    func ElectronicScoreboard(selectedElement: Int) -> some View {
        Group{
            RoundedRectangle(cornerRadius: 20)
                .fill(Data.getElementsColor(index: selectedElement))
                .frame(width: screenWidth * 0.25, height: screenHeigth * 0.34)
                .overlay(alignment:.top){
                    Text("Electronic Configuration")
                        .font(.custom(ChemistryAppConstants.headerFont, size: 16))
                        .bold()
                        .foregroundStyle(ChemistryAppConstants.contentFontColor)
                        .padding()
                        .offset(y : -5)
                }// Add text overlay with dynamic element name
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.2), radius: 10, x: 5, y: 5) // Subtle shadow for depth
               
                .overlay(alignment:.center){
                    HStack{
                        VStack(alignment:.leading){
                            ForEach(0..<10){i in
                                self.ElectronicScoreboardCard(index:i, selectedElement: selectedElement)
                            }
                        }
                        .padding(.leading,30)
                        Spacer()
                        //next section
                        VStack(alignment:.leading){
                            ForEach(10..<19){i in
                                self.ElectronicScoreboardCard(index:i, selectedElement: selectedElement)
                            }
                        }
                        .padding(.trailing,30)
                    }
                    .padding(.top,50)
                    .scaleEffect(0.82)
                }
        } .offset(x: -1 * screenWidth * 0.28, y: screenWidth * 0.025)
    }
    
    func incrementerSideBar(selectedElement: Int)->some View{
        Group{
            RoundedRectangle(cornerRadius: 10)
                .fill(Data.getElementsColor(index: selectedElement))
                .frame(width: screenWidth * 0.15, height: screenWidth * 0.15)
                .overlay(alignment:.top){
                    Text("Electrons")
                        .font(.custom(ChemistryAppConstants.headerFont, size: 16))
                        .bold()
                        .padding()
                        
                }
                .overlay{
                    Text("\(incrementer)")
                        .font(.custom(ChemistryAppConstants.headerFont, size: 38))
                }
        }
        .foregroundStyle(ChemistryAppConstants.contentFontColor)
        .onAppear{
//            Analytics.logEvent("Aufba_View", parameters: ["aufbaView":"Aufba_View_Appeared"])
//            print("periodic_Table_view_appeared")
            self.animateIncrementer(selectedElement: selectedElement)
        }
        .offset(x:screenWidth * 0.25)
    }
    
    func animateIncrementer(selectedElement: Int){
        for index in 0..<Data.getElementConfigurationCount(index1: selectedElement){
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 1) {
                withAnimation(.easeInOut){
                    self.incrementer += Data.getElementsConfiguration(index1: selectedElement, index2: ChemistryAppConstants.APR[index])
                }
            }
        }
    }
    
    func AufbaElementCard(content: String , color: Color , isColor: Bool , isBumping: Bool , index: Int) -> some View {
        ZStack {
            Circle()
                .stroke(Color.gray, lineWidth: 2)
                .frame(width: 33)
                .scaleEffect(isBumping ? 1.1 : 1) // Slightly larger scale effect for bumping
                .animation(.easeIn(duration: 0.5).repeatForever(autoreverses: true),value: isBumping)

            Circle()
                .fill(isColor ? color : Color.white)
                .frame(width: 30)
                .scaleEffect(isBumping ? 1.1 : 1)
                .animation(.easeIn(duration: 0.5).repeatForever(autoreverses: true),value: isBumping)

            Text(content)
                .font(.custom(ChemistryAppConstants.aufbaPrincipleCardFont, size: 14))
                .foregroundColor(isColor ? .white : .black)
                .animation(.easeIn(duration: 0.5).repeatForever(autoreverses: true),value: isBumping)
        }
        .background {
            Group {
                if index == 0 {
                    DottedArrow()
                } else {
//                    DottedLine()
                }
            }
            .rotationEffect(Angle(degrees: 135))
        }
    }
}
struct ArrowShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Arrow shaft
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        
        // Arrow head
        path.move(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX - 20, y: rect.midY - 10))
        path.move(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX - 20, y: rect.midY + 10))
        
        return path
    }
}

struct DottedArrow:View {
    var body: some View {
        ArrowShape()
        .stroke(style: StrokeStyle(lineWidth: 2, dash: [3]))
        .foregroundColor(.gray)
        .frame(width: 70, height: 1,alignment:.bottomTrailing)
    }
}
struct b : View {
    @StateObject var aufbaPrincipleComponents = AufbaPrincipleComponents()
    @State private var isAppearFlags = Array(repeating: false, count: 19)
    @State private var isBumbingFlags = Array(repeating: false, count: 19)
    var body: some View {
        aufbaPrincipleComponents.AufbaElementCard(content: ChemistryAppConstants.content[3], color: ChemistryAppConstants.spdfColors[1], isColor: isAppearFlags[0], isBumping: isBumbingFlags[0], index: 0)
        aufbaPrincipleComponents.AufbaElementCard(content: ChemistryAppConstants.content[3], color: ChemistryAppConstants.spdfColors[1], isColor: isAppearFlags[0], isBumping: isBumbingFlags[0], index: 0)
    }
}

#Preview {
    b()
}
