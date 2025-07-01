//
//  ConfigurationComponets.swift
//  ChemistryApp
//
//  Created by Jeevith on 6/9/25.
//

import Foundation
import SwiftUI

class ConfigurationComponets: ObservableObject {
    
    func renderAtomStructure(selectedElement: Int) -> some View {
        
        ZStack {
            Circle()
                .fill(.blue)
                .frame(width: 30)
                .overlay(alignment: .center) {
                    Text("\(Data.getElementsSymbols(index: selectedElement))")
                        .font(.custom(ChemistryAppConstants.atomSymbolFont, size: 16))
                        .bold()
                        .foregroundColor(.white)
                }
            
            // index0 -> x offset
            // index1 -> y offset
            // index2 -> arrow rotation
            // index3 -> text rotation
            let _ : [[Int]] = [
                [63, -12, -135, 120],
                [39, 10, -165, 110],
                [17, 20, -195, 90],
                [7, 40, -235, 80],
                [130, -20, -30, 70],
                [142, 10, 10, 60],
                [133, 60, 30, 50]
            ]
            
            ForEach(0..<getShellElectronData(selectedElement: selectedElement).count, id: \.self) { index in
                let electrons = self.getShellElectronData(selectedElement: selectedElement)[index]
                if electrons != 0 {
                    ZStack {
                        if index % 2 == 0 {
//                            ClockWiseAtomShell(
//                                numberOfBalls: electrons,
//                                radius: 20 + CGFloat(index * 15),
//                                color: shellColors[index]
//                            )
                        } else {
//                            AntiClockWiseAtomShell(
//                                numberOfBalls: electrons,
//                                radius: 20 + CGFloat(index * 15),
//                                color: shellColors[index]
//                            )
                        }
//                        
//                        AnimatedArrow(
//                            color: shellColors[index],
//                            arrowRotation: shellProperties[index][2],
//                            textRotation: abs(shellProperties[index][2]),
//                            arrowWidth: CGFloat(shellProperties[index][3]),
//                            shellSymbol: shellSymbols[index]
//                        )
//                        .offset(
//                            x: CGFloat(shellProperties[index][0]),
//                            y: CGFloat(shellProperties[index][1])
//                        )
                    }
                }
            }
        }
    }
    
    
    
    func getShellElectronData(selectedElement:Int)->[Int]{
        return [
            Data.getElementsConfiguration(index1: selectedElement, index2: 0),
            Data.getElementsConfiguration(index1: selectedElement, index2: 1)+Data.getElementsConfiguration(index1: selectedElement, index2: 2),
            Data.getElementsConfiguration(index1: selectedElement, index2: 3)+Data.getElementsConfiguration(index1: selectedElement, index2: 4)+Data.getElementsConfiguration(index1: selectedElement, index2: 5),
            Data.getElementsConfiguration(index1: selectedElement, index2: 6)+Data.getElementsConfiguration(index1: selectedElement, index2: 7)+Data.getElementsConfiguration(index1: selectedElement, index2: 8)+Data.getElementsConfiguration(index1: selectedElement, index2: 9),
            Data.getElementsConfiguration(index1: selectedElement, index2: 10)+Data.getElementsConfiguration(index1: selectedElement, index2: 11)+Data.getElementsConfiguration(index1: selectedElement, index2: 12)+Data.getElementsConfiguration(index1: selectedElement, index2: 13),
            Data.getElementsConfiguration(index1: selectedElement, index2: 14)+Data.getElementsConfiguration(index1: selectedElement, index2: 15)+Data.getElementsConfiguration(index1: selectedElement, index2: 16),
            Data.getElementsConfiguration(index1: selectedElement, index2: 17)+Data.getElementsConfiguration(index1: selectedElement, index2: 18)
            ]
    }
}

struct c : View {
    @StateObject var b = ConfigurationComponets()
    var body: some View {
        b.renderAtomStructure(selectedElement: 102)
    }
}

#Preview {
    c()
}
