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
    
    func elementCard(index:Int)->some View{
        ZStack{
            RoundedRectangle(cornerRadius: 5)
                .fill(Data.getElementsColor(index: index))
                .frame(width:isIPhone ? screenWidth * 0.045:screenWidth * 0.055,height:isIPhone ? screenWidth * 0.045:screenWidth * 0.055)
            
            Text(Data.getElementsSymbols(index: index))
                .font(.system(size:isIPhone ? 14:18))
                .foregroundColor(.white).bold()

        }
        .overlay(alignment:.topLeading)
        {
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
