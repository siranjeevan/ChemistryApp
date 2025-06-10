//
//  ElementsDetailViewModel.swift
//  ChemistryApp
//
//  Created by Jeevith  on 10/06/25.
//

import Foundation
import SwiftUI

class ElementsDetailViewModel : ObservableObject {
    @StateObject var DetailViewComponents = ElementsDetailViewComponents()
    @StateObject var Menu = MenuViewComponents()
    @Environment(\.dismiss) var dismiss
    @State var isBouncing1 : Bool = false
    @State var isBouncing2 : Bool = false
    
    func DetailViewModel(selectedElement : Int) -> some View {
        NavigationStack{
            ZStack{
                components.AppBackground()
                components.Header(
                    content: "\(Data.getElementsNames(index: selectedElement)) - \(Data.getElementsNumber(index: selectedElement))",
                    selectedElement: selectedElement
                )
                HStack{
                    VStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Data.getElementsColor(index: selectedElement) ,style:     StrokeStyle(lineWidth: 2))
                                .frame(width: screenWidth * 0.3,height: screenWidth * 0.2)
                            
                            HStack{
                                DetailViewComponents.renderElementCard(selectedElement: selectedElement)
                                DetailViewComponents.ScalableImageView(imgName: "\(Data.getElementsSymbols(index: selectedElement))_Img")
                            }
                            .scaleEffect(0.8)
                        }
                        DetailViewComponents.renderBasicParticlesOfAnAtom(selectedElement: selectedElement)
                    }
                    .offset(y:screenHeigth * 0.012)
                    VStack{
                        DetailViewComponents.elementDetailTableView(selectedElement: selectedElement)
                        DetailViewComponents.applicationOfAtom(selectElement: selectedElement)
                    }
                    
                    VStack {
                        DetailViewComponents.renderValanceElectron(selectedElement: selectedElement)
                        DetailViewComponents.BouncingButton(buttonContent: "Electronic Configuration", selectedElement: selectedElement, isBouncing: $isBouncing1)
                        DetailViewComponents.BouncingButton(buttonContent: "Aufba Principle", selectedElement: selectedElement, isBouncing: $isBouncing2)
                    }
                }
                .offset(y : screenHeigth * 0.03)
                .scaleEffect(isIPhone ? 0.85 : 1.1)
                .foregroundColor(ChemistryAppConstants.contentFontColor)
            }
            .blur(radius: Menu.isDrawerOpen ? 3:0)
            .overlay {
                Button(action: {self.dismiss()}, label: {components.BouncingBackButton(selectedElement: selectedElement)})
                    .scaleEffect(isIPhone ? 0.6:1)
                    .offset(x:isIPhone ? -1 * screenWidth * 0.4:-1 * screenWidth * 0.375,y:isIPhone ? -1 * screenHeigth * 0.17:-1 * screenHeigth * 0.3)
                
                Menu.Drawer()
                Menu.drawerButton()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

