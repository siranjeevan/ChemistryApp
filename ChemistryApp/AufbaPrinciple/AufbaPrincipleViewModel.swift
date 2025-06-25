//
//  AufbaPrincipleViewModel.swift
//  ChemistryApp
//
//  Created by Jeevith on 6/23/25.
//

import Foundation
import SwiftUI

class AufbaPrincipleViewModel : AufbaPrincipleComponents {
    
    
    func AufbauView(selectedElement : Int) -> some View {
        VStack(alignment: .leading, spacing: spacing) {
            
            HStack(spacing: spacing) {
                 AufbaElementCard(
                    content: ChemistryAppConstants.content[3],
                    color: ChemistryAppConstants.spdfColors[1],
                    isColor:  isAppearFlags[0],
                    isBumping:  isBumbingFlags[0],
                    index: 0
                )
            }
            
            HStack(spacing: spacing) {
                ForEach(0..<2) {[self]sub in
                    AufbaElementCard(
                        content: ChemistryAppConstants.content[sub+1],
                        color: ChemistryAppConstants.spdfColors[sub],
                        isColor:  isAppearFlags[sub+1],
                        isBumping:  isBumbingFlags[sub+1],
                        index: sub
                    )
                }
            }
            
            HStack(spacing: spacing) {
                ForEach(0..<3) { [self] sub in
                     AufbaElementCard(
                        content: ChemistryAppConstants.content[sub+3],
                        color: ChemistryAppConstants.spdfColors[sub],
                        isColor:  isAppearFlags[sub+3],
                        isBumping:  isBumbingFlags[sub+3],
                        index: sub
                    )
                }
            }
            
            HStack(spacing: spacing) {
                ForEach(0..<4) { [self] sub in
                     AufbaElementCard(
                        content: ChemistryAppConstants.content[sub+6],
                        color: ChemistryAppConstants.spdfColors[sub],
                        isColor:  isAppearFlags[sub+6],
                        isBumping:  isBumbingFlags[sub+6],
                        index: sub
                    )
                }
            }

            HStack(spacing: spacing) {
                ForEach(0..<4) { [self] sub in
                     AufbaElementCard(
                        content: ChemistryAppConstants.content[sub+10],
                        color: ChemistryAppConstants.spdfColors[sub],
                        isColor:  isAppearFlags[sub+10],
                        isBumping:  isBumbingFlags[sub+10],
                        index: sub
                    )
                }
            }

            HStack(spacing: spacing) {
                ForEach(0..<3) { [self] sub in
                     AufbaElementCard(
                        content: ChemistryAppConstants.content[sub+14],
                        color: ChemistryAppConstants.spdfColors[sub],
                        isColor:  isAppearFlags[sub+14],
                        isBumping:  isBumbingFlags[sub+14],
                        index: sub
                    )
                }
            }

            HStack(spacing: spacing) {
                ForEach(0..<2) { [self] sub in
                     AufbaElementCard(
                        content: ChemistryAppConstants.content[sub+17],
                        color: ChemistryAppConstants.spdfColors[sub],
                        isColor:  isAppearFlags[sub+17],
                        isBumping:  isBumbingFlags[sub+17],
                        index: sub
                    )
                }
            }
        }
        .onAppear {
            self.animateElementCardWithTimer(selectedElement: selectedElement)
        }
    }
    
    func AufbaPrincipleViewModel(selectedElement : Int , isBouncing : Binding<Bool>) -> some View {
        
            ZStack{
                components.AppBackground()
                components.viewBackgroundColor()
                components.Header(
                    content: "\(Data.getElementsNames(index: selectedElement)) - \(Data.getElementsNumber(index: selectedElement))",
                    selectedElement: selectedElement
                )
                HStack(spacing:isIPhone ? screenWidth * 0.1:screenWidth * 0.12){
                    self.ElectronicScoreboard(selectedElement: selectedElement)
                    self.AufbauView(selectedElement: selectedElement)
                    self.incrementerSideBar(selectedElement: selectedElement)
                }
                .scaleEffect(isIPhone ? 1:1.1)
                .offset(y:screenWidth * 0.04)
            }
    }
    
}

struct j : View {
    @StateObject var aufbaPrincipleComponents = AufbaPrincipleViewModel()
    @State var isBouncing: Bool = false
    var body: some View {
        ZStack
        {
            aufbaPrincipleComponents.AufbaPrincipleViewModel(selectedElement: 10, isBouncing: $isBouncing)
        }
    }
}

#Preview {
    j()
}
