//
//  ElementsDetailView.swift
//  ChemistryApp
//
//  Created by Jeevith on 6/8/25.
//

import SwiftUI

let components =  Components()
let DetailViewComponents = elementsDetailViewComponents()

//ChemistryAppConstants
struct ElementsDetailView: View {
    @State var isDrawerOpen : Bool = false
    @State var selectedElement:Int
    var body: some View {
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
                            RoundedRectangle(cornerRadius: 10) // Step 1: Create Rounded Rectangle
                                .stroke(Data.getElementsColor(index: selectedElement) ,style:     StrokeStyle(lineWidth: 2)) // Fill color for the rounded rectangle
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
                    DetailViewComponents.renderValanceElectron(selectedElement: selectedElement)
                    
                }
                .offset(y:screenHeigth * 0.03)
                .scaleEffect(isIPhone ? 0.85:1.1)
                .foregroundColor(ChemistryAppConstants.contentFontColor)
            }
            .blur(radius:isDrawerOpen ? 3:0)
        }
    }
}

#Preview {
    ElementsDetailView(selectedElement: 3)
}
