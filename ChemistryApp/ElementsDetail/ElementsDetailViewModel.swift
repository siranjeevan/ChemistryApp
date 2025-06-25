//
//  ElementsDetailViewModel.swift
//  ChemistryApp
//
//  Created by Jeevith  on 10/06/25.
//

import Foundation
import SwiftUI

//let components =  Components()

class ElementsDetailViewModel  : ObservableObject {
    @StateObject var DetailViewComponents = ElementsDetailViewComponents()
    @StateObject var Menu = MenuViewComponents()
   
    @State var isBouncing1 : Bool = false
    @State var isBouncing2 : Bool = false
//    @State var isBouncing = false
    
    func DetailViewModel(selectedElement : Int , isBouncing : Binding<Bool>) -> some View {
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
                    DetailViewComponents.renderNavigationButtons(selectedElement: selectedElement, isBouncing: isBouncing)
                }
            }
            .offset(y : screenHeigth * 0.03)
            .scaleEffect(isIPhone ? 0.85 : 1.1)
            .foregroundColor(ChemistryAppConstants.contentFontColor)
        }
    }
}

struct jk : View {
    @StateObject var elementsDetailViewModel = ElementsDetailViewModel()
    @State var isBouncing : Bool = false
    @State var isBouncing2 : Bool = false
    var body: some View {
        ZStack{
            elementsDetailViewModel.DetailViewModel(selectedElement: 10, isBouncing: $isBouncing)
        }
    }
}

#Preview {
    jk()
}
