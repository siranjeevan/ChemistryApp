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
    @Published var spacing: CGFloat = 5
//    @Binding var selectedElement: Int

    @Published var isAppearFlags = Array(repeating: false, count: 19)
    @Published var isBumbingFlags = Array(repeating: false, count: 19)
    
    @Published private var timer: Timer? // Store reference to timer
    
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
        }
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
    }
    
    private func animateIncrementer(selectedElement: Int){
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
                    DottedLine()
                }
            }
            .rotationEffect(Angle(degrees: 135))
        }
    }
    
    func DottedLine() -> some View {
        return AnyView(
            Path { path in
                path.move(to: CGPoint(x: 0, y: 10))  // y: 10 to align with arrow shaft
                path.addLine(to: CGPoint(x: 70, y: 10))
            }
            .stroke(style: StrokeStyle(lineWidth: 2, dash: [3]))
            .foregroundColor(.gray)
            .frame(width: 70, height: 20)  // match arrow frame
        )
    }
    
    func DottedArrow() -> some View {
            return AnyView(
                Path { path in
                    // Arrow shaft
                    path.move(to: CGPoint(x: 0, y: 10))
                    path.addLine(to: CGPoint(x: 70, y: 10))
                    
                    // Arrow head
                    path.move(to: CGPoint(x: 70, y: 10))
                    path.addLine(to: CGPoint(x: 50, y: 0))
                    path.move(to: CGPoint(x: 70, y: 10))
                    path.addLine(to: CGPoint(x: 50, y: 20))
                }
                .stroke(style: StrokeStyle(lineWidth: 2, dash: [3]))
                .foregroundColor(.gray)
                .frame(width: 70, height: 20, alignment: .bottomTrailing)
            )
    }
    func removeZeros(selectedElement: Int) -> [Int] {
        let processArray = Data.getAllElectronicConfiguration(index: selectedElement)
        guard let lastNonZero = processArray.lastIndex(where: { $0 != 0 }) else {
            return []
        }
        return Array(processArray[...lastNonZero])
    }
    
    func animateElementCardWithTimer(selectedElement: Int) {
        let APRFilledSubShells = [2, 2, 6, 2, 6, 10, 2, 6, 10, 14, 2, 6, 10, 14, 2, 6, 10, 2, 6]
        let elementConfig = Data.getAllElectronicConfiguration(index: selectedElement)
        let count = removeZeros(selectedElement: selectedElement).count
        
        var index = 0
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] timer in
            if index >= ChemistryAppConstants.APR.count || index >= count {
                timer.invalidate()
                self.timer = nil
                return
            }
            
            let i = ChemistryAppConstants.APR[index]
            if elementConfig[i] != 0 {
                withAnimation(.easeInOut(duration: 0.5)) {
                    self.isAppearFlags[i] = true
                }

                if APRFilledSubShells[i] != elementConfig[i] {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        self.isBumbingFlags[i] = true
                    }
                }
            }
            
            index += 1
        }
    }

}

#Preview {
//    AufbauView()
}
