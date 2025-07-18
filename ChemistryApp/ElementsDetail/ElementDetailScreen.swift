//
//  ElementDetailScreen.swift
//  ChemistryApp
//
//  Created by Jeevith  on 10/06/25.
//

import Foundation
import SwiftUI

struct ElementDetailScreen : View {
   @StateObject var elementsDetailViewModel = ElementsDetailViewModel()
    @StateObject var Menu = MenuViewComponents()
    @Environment(\.dismiss) var dismiss
    var selectedElement: Int
    @State var isBouncing : Bool = false
    @State var isBouncing2 : Bool = false
    var body: some View {
        NavigationStack {
            ZStack{
                elementsDetailViewModel.DetailViewModel(selectedElement: selectedElement, isBouncing: $isBouncing )
            }
            .blur(radius: Menu.isDrawerOpen ? 3:0)
            .overlay {
                Button(action: {self.dismiss()}, label: {components.BouncingBackButton(selectedElement: selectedElement, isBouncing: $isBouncing)})
                    .scaleEffect(isIPhone ? 0.6:1)
                    .offset(x:isIPhone ? -1 * screenWidth * 0.4:-1 * screenWidth * 0.375,y:isIPhone ? -1 * screenHeigth * 0.17:-1 * screenHeigth * 0.3)
                
                Menu.Drawer()
                Menu.drawerButton()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
#Preview {
    ElementDetailScreen(selectedElement: 100)
}
