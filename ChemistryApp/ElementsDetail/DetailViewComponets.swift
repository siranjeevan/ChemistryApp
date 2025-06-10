//
//  elementsDetail.swift
//  ChemistryApp
//
//  Created by Jeevith  on 07/06/25.
//

import Foundation
import SwiftUI

//ChemistryAppConstants
class ElementsDetailViewComponents: ObservableObject {
    
    @Environment(\.dismiss) var dismiss
    @Published private var scale: CGFloat = 1.0
//    @Published var isBouncing: Bool = false
    
    func renderElementCard(selectedElement:Int)->some View{
        
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(Data.getElementsColor(index: selectedElement))
                .frame(width: screenWidth * 0.15,height: screenWidth * 0.15)
            
            Text(Data.getElementsSymbols(index: selectedElement))
                .font(.custom(ChemistryAppConstants.atomSymbolFont, size: 32))
                .foregroundColor(ChemistryAppConstants.contentFontColor)
        }
        .overlay(alignment: .bottom){
            Text(Data.getElementsNames(index: selectedElement))
                .font(.custom(ChemistryAppConstants.atomSymbolFont, size: 18))
                .foregroundColor(ChemistryAppConstants.contentFontColor)
                .padding(.bottom,10)
        }
        .overlay(alignment: .topLeading){
            Text("\(Data.getElementsNumber(index: selectedElement))")
                .font(.custom(ChemistryAppConstants.atomSymbolFont, size: 18))
                .foregroundColor(ChemistryAppConstants.contentFontColor)
                .padding([.top,.leading],5)
        }
        .overlay(alignment: .topTrailing){
            Text("\(Data.getElementsMassNo(index: selectedElement), specifier: "%.1f")")
                .font(.custom(ChemistryAppConstants.atomSymbolFont, size: 18))
                .foregroundColor(ChemistryAppConstants.contentFontColor)
                .padding([.top,.trailing],5 )
        }
    }
    
    func ScalableImageView(imgName : String ) -> some View{
        Image(imgName)
            .resizable()
            .frame(width:screenWidth * 0.15, height: screenWidth * 0.15)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .scaleEffect(scale)
            .gesture(
                MagnificationGesture()
                    .onChanged { value in
                        // Apply scaling based on the gesture, with a maximum scale limit of 3
                        let newScale = self.scale * value
                        self.scale = min(newScale, 3) // Limit the scale to a maximum of 3
                    }
                    .onEnded { _ in
                        // Store the last scale value for future gestures and reset to 1 if above 3k
                        if self.scale >= 3 {
                            withAnimation {
                                self.scale = 1
                            }
                        }
                    }
            )
    }
    
    func renderBasicParticlesOfAnAtom(selectedElement:Int) -> some View{
        
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(Data.getElementsColor(index: selectedElement))
                .frame(width: screenWidth * 0.3,height: screenWidth * 0.2)
                .overlay(alignment:.top){
                    Text("Basic particles of an atom")
                        .font(.custom(ChemistryAppConstants.atomSymbolFont, size: 16))
                                .padding(.all,5)
                }
            
            let datas:[String] = ["Protons","Neutrons","Electrons"]
            let PNEdata = [Data.getElementsAllNumber() , Data.getElementsAllneturons() , Data.getElementsAllNumber()]
            
            Group{
                VStack(alignment: .leading){
                    ForEach(0..<datas.count,id: \.self){data in
                        HStack{
                            Text(datas[data])
                            Spacer()
                            Text("\(PNEdata[data][selectedElement])")
                        }.frame(width: 100, height: 10, alignment: .center)
                            .font(.custom(ChemistryAppConstants.atomSymbolFont, size: 14))
                            .padding(.all,2)
                    }
                }
            }
            .offset(x:-70,y:10)
            Group{
                Section{
                    ZStack{
                        RoundedRectangle(cornerRadius: CGFloat(10))
                            .fill(.atomBackground)
                            .frame(width:isIPhone ? screenWidth*0.14:screenWidth*0.12,height: isIPhone ? screenWidth*0.14:screenWidth*0.12)
//                        renderMiniatureAtomStructure(selectedElement: selectedElement)
                    }
                }
            }
            .offset(x:66,y:10)
            .foregroundColor(ChemistryAppConstants.contentFontColor)
            
        }
    }
    
    func elementDetailTableView(selectedElement: Int) -> some View {
        RoundedRectangle(cornerRadius: 10) // Step 1: Create Rounded Rectangle
            .fill(Data.getElementsColor(index: selectedElement)) // Fill color for the rounded rectangle
                   .frame(width: screenWidth * 0.3,height: screenWidth * 0.2)
                   .shadow(radius: 10) // Optional shadow for better visibility
                   .overlay{ // Step 2: Overlay to add ScrollView
                       VStack{
                           Text("Basic particles of an atom")
                               .font(.custom(ChemistryAppConstants.atomSymbolFont, size: 18))
                           Divider()
                               .frame(width:screenWidth*0.3,height: 2)
                               .overlay(.blackFont)
                              
                               
                           ScrollView {
                               VStack(spacing: 10) { // Content inside ScrollView
                                   let Headings: [String] = ["Element Name", "Element Symbol", "Group","Period","Block","Electronic Configuration","Melting Point","Density","Oxidation State"]
//                                   let content = [
//                                       elementsNames, elementsSymbols, groups,periods,blocks,electronicConfigurationContents,meltingPoints,densities,oxidationStates
//                                   ]

                                   ForEach(0..<Headings.count, id: \.self) { index in
                                       VStack {
                                           Text(Headings[index])
                                               .font(.custom(ChemistryAppConstants.atomSymbolFont, size: 18))
                                               .fontWeight(.medium)
                                               .padding(.horizontal)
//                                           Text("\(content[index][selectedElement])")
                                       }
                                       Divider()
                                           .frame(width: 200)
                                           .background(.gray)
                                   }
                               }
                               .padding() // Padding around the VStack
                           }
                       }
                       .padding() // Padding around the ScrollView
                   }
                   .foregroundColor(ChemistryAppConstants.contentFontColor)
                  // Set a fixed height for the rounded rectangle
                   .padding()
    }
    
    
    func applicationOfAtom(selectElement:Int)->some View{
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(Data.getElementsColor(index: selectElement))
                .frame(width: screenWidth * 0.3,height: screenWidth * 0.2)
            
           
        }
        .overlay(alignment:.top){
            Text("Applications of \(Data.getElementsNames(index: selectElement))")
                .font(.custom(ChemistryAppConstants.atomSymbolFont, size: 16))
                .padding(.all,5)
        }
        .overlay(alignment:.center){
            HStack{
                VStack(alignment:.leading){
                    Text("1) \(Data.getElementsElementsUsers(index1: selectElement, index2: 0))")
                    
                    Text("2) \(Data.getElementsElementsUsers(index1: selectElement, index2: 1))")
                    Text("3) \(Data.getElementsElementsUsers(index1: selectElement, index2: 2))")
                 }
                .font(.custom(ChemistryAppConstants.atomSymbolFont, size: 14))
                Image("\(Data.getElementsSymbols(index: selectElement))_Rimg")
                       .resizable()
                       
                       .frame(width:isIPhone ? screenWidth*0.1:screenWidth*0.12,height: isIPhone ? screenWidth*0.1:screenWidth*0.12)
                       .cornerRadius(5)
                       .padding()
                       .onAppear{
                           print("\(Data.getElementsSymbols(index: selectElement))_Rimg")
                       }
            }
            .padding()
            
                       
        }
        .foregroundColor(ChemistryAppConstants.contentFontColor)
    }
    
    
    func renderValanceElectron(selectedElement:Int)->some View{
        VStack(spacing:15){
            Text("Valance Electron")
                .font(.custom(ChemistryAppConstants.titleFont, size: 20))
                .foregroundColor(.darkGrey)
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(.atomBackground)
                    .frame(width: screenWidth*0.15,height: screenWidth*0.15)
                Circle()
                    .fill(.blue)
                    .frame(width: 30)
                    .overlay(alignment:.center){
                        Text("\(Data.getElementsSymbols(index: selectedElement))")
                            .font(.custom(ChemistryAppConstants.atomSymbolFont, size: 16))
                            .bold()
    //                        .foregroundColor(.white)
                    }
//                ClockWiseAtomShell(numberOfBalls: valanceShellElectrons[selectedElement], radius: 50, color: .black)
                
            }
//            BouncingButton(buttonContent: "Electronic Configuration", selectedElement: selectedElement )
//            BouncingButton(buttonContent: "Electronic Configuration", selectedElement: selectedElement )
            
//            BouncingButton(buttonContent: "Electronic Configuration", selectedElement: selectedElement, destination: ElectronicConfiguration(selectedElement: selectedElement))
//            BouncingButton(buttonContent: "Aufba Principle", selectedElement: selectedElement, destination: AufbaIntegerationView(selectedElement: selectedElement))
            
        }
        .padding()
    }
    
    func BouncingButton(buttonContent : String, selectedElement:Int , isBouncing : Binding<Bool>) -> some View {
        NavigationLink(destination: PeriodicTableScreen()) {
            Text(buttonContent)
                .padding()
                .font(.custom("YourCustomFontName", size: 14)) // Replace with your font name
                .frame(width: UIScreen.main.bounds.width * 0.15)
                .foregroundColor(ChemistryAppConstants.contentFontColor) // Replace with your actual color
                .background(Data.getElementsColor(index: selectedElement)) // Replace with your actual color array
                .cornerRadius(8)
                .scaleEffect(isBouncing.wrappedValue ? 1.05 : 1.0) // Scale effect for bouncing
                .shadow(color: Data.getElementsColor(index: selectedElement) , radius: isBouncing.wrappedValue ? 5 : 0)
                .onAppear {
                    // Start the bouncing animation
                    withAnimation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true)) {
                        isBouncing.wrappedValue.toggle()
                    }
                }
        }
    }
    
}

struct y: View {
    @StateObject var detailComponents = ElementsDetailViewComponents()
    @State var isBouncing1 : Bool = false
    @State var isBouncing2 : Bool = false
    
    var body: some View {
        VStack {
            detailComponents.BouncingButton(buttonContent: "Aufba Principle", selectedElement: 3, isBouncing: $isBouncing1)
            detailComponents.BouncingButton(buttonContent: "Aufba Principle", selectedElement: 3, isBouncing: $isBouncing2)
        }
    }
}


#Preview {
    y()
}
