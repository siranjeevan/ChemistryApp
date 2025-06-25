//
//  AufbaPrincipleScreen.swift
//  ChemistryApp
//
//  Created by Jeevith on 6/24/25.
//

import SwiftUI

struct AufbaPrincipleScreen: View {
    @StateObject var aufbaPrinciple = AufbaPrincipleViewModel()
    @StateObject var Menu = MenuViewComponents()
    @Environment(\.dismiss) var dismiss
    var selectedElement: Int
    @State var isBouncing : Bool = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                aufbaPrinciple.AufbaPrincipleViewModel(selectedElement: selectedElement, isBouncing: $isBouncing)
            }
            .blur(radius: Menu.isDrawerOpen ? 3:0)
            .overlay{
                Button(action: {self.dismiss()}, label: {components.BouncingBackButton(selectedElement: selectedElement, isBouncing: $isBouncing)})
                    .scaleEffect(isIPhone ? 0.6:1)
                    .offset(x:isIPhone ? -1 * screenWidth * 0.4:-1 * screenWidth * 0.375,y:isIPhone ? -1 * screenWidth * 0.17:-1 * screenWidth * 0.3)
                Menu.Drawer()
                Menu.drawerButton()
            }
        .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    AufbaPrincipleScreen(selectedElement: 100)
}
