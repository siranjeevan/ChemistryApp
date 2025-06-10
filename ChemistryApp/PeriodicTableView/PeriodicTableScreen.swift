//
//  PeriodicTableScreen.swift
//  ChemistryApp
//
//  Created by Jeevith  on 10/06/25.
//

import Foundation
import SwiftUI

struct PeriodicTableScreen: View {
    @StateObject var periodicTableComponets = PeriodicTableViewModel()
    @StateObject var Menu = MenuViewComponents()
    
    var body: some View {
        NavigationStack {
            ZStack {
                ZStack {
                    components.Header(content: "", selectedElement: 3)
                    periodicTableComponets.tableView()
                }
                .blur(radius: Menu.isDrawerOpen ? 3 : 0)

                Menu.Drawer()
                Menu.drawerButton()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    PeriodicTableScreen()
}
