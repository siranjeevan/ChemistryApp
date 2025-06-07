//
//  PeriodicTableComponets.swift
//  ChemistryApp
//
//  Created by Jeevith  on 07/06/25.
//

import Foundation
import SwiftUI

let Data = Datas()

class PeriodicTableComponets : ObservableObject {

    func tableView() -> some View {
        
        VStack(spacing:5){
            //row 1
            HStack(spacing:5){
                NavigationLink(destination: {
//                    DetailView(selectedElement: 0)
                }, label: {
                    elementCard(index: 0)
                })
                
                // elements space for HStack
                ForEach(0..<16){_ in
                    self.transparentElementCard()
                }
                
                
                NavigationLink(destination:{
//                    DetailView(selectedElement: 1)
                }, label: {
                    self.elementCard(index: 1)
                })
                
            }
            //row 2
            HStack(spacing:5){
                ForEach(2..<4){i in
                    NavigationLink(destination: {
//                        DetailView(selectedElement: i)
                    }, label: {
                        self.elementCard(index: i)
                    })
                }
                //empty boxes
                ForEach(0..<10){_ in
                    self.transparentElementCard()
                }
                
                ForEach(4..<10){i in
                    NavigationLink(destination: {
//                        DetailView(selectedElement: i)
                    }, label: {
                        self.elementCard(index: i)
                    })
                }
            }
            //row 3
            HStack(spacing:5){
                ForEach(10..<12){i in
                    NavigationLink(destination: {
//                        DetailView(selectedElement: i)
                    }, label: {
                        self.elementCard(index: i)
                    })
                }
                //empty boxes
                ForEach(0..<10){_ in
                    self.transparentElementCard()
                }
                ForEach(12..<18){i in
                    NavigationLink(destination: {
//                        DetailView(selectedElement: i)
                    }, label: {
                        self.elementCard(index: i)
                    })
                }
            }
            //row 4
            HStack(spacing:5){
                ForEach(18..<36){i in
                    NavigationLink(destination: {
//                        DetailView(selectedElement: i)
                    }, label: {
                        self.elementCard(index: i)
                    })
                }
            }
            //row 5
            HStack(spacing:5){
                ForEach(36..<54){i in
                    NavigationLink(destination: {
//                        DetailView(selectedElement: i)
                    }, label: {
                        self.elementCard(index: i)
                    })
                }
            }
            //row 6
            HStack(spacing:5){
                ForEach(54..<56){i in
                    NavigationLink(destination: {
//                        DetailView(selectedElement: i)
                    }, label: {
                        self.elementCard(index: i)
                    })
                }
                staticElementCard(text: "57-71")
                ForEach(71..<86){i in
                    NavigationLink(destination: {
//                        DetailView(selectedElement: i)
                    }, label: {
                        self.elementCard(index: i)
                    })
                }
            }
            //row 7
            HStack(spacing:5){
                ForEach(86..<88){i in
                    NavigationLink(destination: {
//                        DetailView(selectedElement: i)
                    }, label: {
                        self.elementCard(index: i)
                    })
                }
                staticElementCard(text: "89-103")
                ForEach(0..<15){_ in
                    self.transparentElementCard()
                }
            }
            //row 8
            HStack(spacing:5){
                ForEach(0..<3){_ in
                    self.transparentElementCard()
                }
                ForEach(56..<71){i in
                    NavigationLink(destination: {
//                        DetailView(selectedElement: i)
                    }, label: {
                        self.elementCard(index: i)
                    })
                }
            }
            //row 8
            HStack(spacing:5){
                ForEach(0..<3){_ in
                    self.transparentElementCard()
                }
                ForEach(88..<103){i in
                    NavigationLink(destination: {
//                        DetailView(selectedElement: i)
                    }, label: {
                        self.elementCard(index: i)
                        
                    })
                }
            }
        }
    }
    
    
    func elementCard(index:Int)->some View{
        ZStack{
            RoundedRectangle(cornerRadius: 5)
                .fill(Data.getElementsColor(index: index))
//                .fill(Datas.elementCardColor[index])
                .frame(width:isIPhone ? screenWidth * 0.045:screenWidth * 0.055,height:isIPhone ? screenWidth * 0.045:screenWidth * 0.055)
//            Text(elementsSymbols[index])
            Text(Data.getElementsSymbols(index: index))
                .font(.system(size:isIPhone ? 14:18))
                .foregroundColor(.white).bold()

        }
        .overlay(alignment:.topLeading){
            Text("\(Data.getElementsNumber(index: index))")
                .font(.system(size:isIPhone ? 7:10))
                .padding([.leading,.top],3)
                .foregroundColor(.white)
        }
        .overlay(alignment:.topTrailing){
            Text(String(format: "%.1f", Data.getElementsMassNo(index: index)))
                .font(.system(size:isIPhone ? 7:10))
                .padding([.trailing,.top],3)
                .foregroundColor(.white)
                
        }
        .overlay(alignment: .bottom){
            Text(Data.getElementsNames(index: index))
                .font(.system(size:isIPhone ? 7:11))
                .foregroundColor(.white)
                .lineLimit(1)
        }
        
    }
    
    func transparentElementCard()->some View{
        ZStack{
            RoundedRectangle(cornerRadius: 4)
                .fill(.clear)
                .frame(width:isIPhone ? screenWidth * 0.045:screenWidth * 0.055,height:isIPhone ? screenWidth * 0.045:screenWidth * 0.055)
        }
    }
    
    func staticElementCard(text:String)->some View{
        ZStack{
            RoundedRectangle(cornerRadius: 5)
                .stroke(style: StrokeStyle(lineWidth: 1 ))
                .fill(.black)
                .frame(width:isIPhone ? screenWidth * 0.045:screenWidth * 0.055,height:isIPhone ? screenWidth * 0.045:screenWidth * 0.055)
            Text(text)
                .font(.system(size:isIPhone ? 10:14))
        }
    }
    
}

struct j : View {
    let periodicTableComponets = PeriodicTableComponets()
    var body: some View {
        periodicTableComponets.tableView()
    }
}

#Preview {
    j()
}
