//
//  PeriodicTableView.swift
//  ChemistryApp
//
//  Created by Jeevith  on 10/06/25.
//

import Foundation
import SwiftUI

class PeriodicTableViewModel : ObservableObject {
    @StateObject var periodicTableComponets = PeriodicTableComponets()
    
    func tableView() -> some View {
        
        VStack(spacing:5){
            //row 1
            HStack(spacing:5){
                NavigationLink(destination: {
                     ElementDetailScreen(selectedElement: 0)
                    
                }, label: {
                    periodicTableComponets.elementCard(index: 0)
                })
                
                // elements space for HStack
                ForEach(0..<16){_ in
                    self.periodicTableComponets.transparentElementCard()
                }
                
                
                NavigationLink(destination:{
                     ElementDetailScreen(selectedElement: 1)
                }, label: {
                    periodicTableComponets.elementCard(index: 1)
                })
                
            }
            //row 2
            HStack(spacing:5){
                ForEach(2..<4){i in
                    NavigationLink(destination: {
                         ElementDetailScreen(selectedElement: i)
                    }, label: {
                        self.periodicTableComponets.elementCard(index: i)
                    })
                }
                //empty boxes
                ForEach(0..<10){_ in
                    self.periodicTableComponets.transparentElementCard()
                }
                
                ForEach(4..<10){i in
                    NavigationLink(destination: {
                         ElementDetailScreen(selectedElement: i)
                    }, label: {
                        self.periodicTableComponets.elementCard(index: i)
                    })
                }
            }
            //row 3
            HStack(spacing:5){
                ForEach(10..<12){i in
                    NavigationLink(destination: {
                         ElementDetailScreen(selectedElement: i)
                    }, label: {
                        self.periodicTableComponets.elementCard(index: i)
                    })
                }
                //empty boxes
                ForEach(0..<10){_ in
                    self.periodicTableComponets.transparentElementCard()
                }
                ForEach(12..<18){i in
                    NavigationLink(destination: {
                         ElementDetailScreen(selectedElement: i)
                    }, label: {
                        self.periodicTableComponets.elementCard(index: i)
                    })
                }
            }
            //row 4
            HStack(spacing:5){
                ForEach(18..<36){i in
                    NavigationLink(destination: {
                         ElementDetailScreen(selectedElement: i)
                    }, label: {
                        self.periodicTableComponets.elementCard(index: i)
                    })
                }
            }
            //row 5
            HStack(spacing:5){
                ForEach(36..<54){i in
                    NavigationLink(destination: {
                         ElementDetailScreen(selectedElement: i)
                    }, label: {
                        self.periodicTableComponets.elementCard(index: i)
                    })
                }
            }
            //row 6
            HStack(spacing:5){
                ForEach(54..<56){i in
                    NavigationLink(destination: {
                         ElementDetailScreen(selectedElement: i)
                    }, label: {
                        self.periodicTableComponets.elementCard(index: i)
                    })
                }
                periodicTableComponets.staticElementCard(text: "57-71")
                ForEach(71..<86){i in
                    NavigationLink(destination: {
                         ElementDetailScreen(selectedElement: i)
                    }, label: {
                        self.periodicTableComponets.elementCard(index: i)
                    })
                }
            }
            //row 7
            HStack(spacing:5){
                ForEach(86..<88){i in
                    NavigationLink(destination: {
                         ElementDetailScreen(selectedElement: i)
                    }, label: {
                        self.periodicTableComponets.elementCard(index: i)
                    })
                }
                periodicTableComponets.staticElementCard(text: "89-103")
                ForEach(0..<15){_ in
                    self.periodicTableComponets.transparentElementCard()
                }
            }
            //row 8
            HStack(spacing:5){
                ForEach(0..<3){_ in
                    self.periodicTableComponets.transparentElementCard()
                }
                ForEach(56..<71){i in
                    NavigationLink(destination: {
                         ElementDetailScreen(selectedElement: i)
                    }, label: {
                        self.periodicTableComponets.elementCard(index: i)
                    })
                }
            }
            //row 8
            HStack(spacing:5){
                ForEach(0..<3){_ in
                    self.periodicTableComponets.transparentElementCard()
                }
                ForEach(88..<103){i in
                    NavigationLink(destination: {
                         ElementDetailScreen(selectedElement: i)
                    }, label: {
                        self.periodicTableComponets.elementCard(index: i)
                        
                    })
                }
            }
        }
        .scaleEffect(0.9)
    }
}

//struct j : View {
//    @StateObject var periodicTableComponets = PeriodicTableViewModel()
//    @StateObject var Menu = MenuViewComponents()
//    var body: some View {
//        NavigationStack{
//            ZStack{
//                ZStack {
//                    components.Header(content: "", selectedElement: 3)
//                    periodicTableComponets.tableView()
//                }
//                .blur(radius:Menu.isDrawerOpen ? 3:0)
//                
//                Menu.Drawer()
//                Menu.drawerButton()
//            }
//        }
//        .navigationBarBackButtonHidden(true)
//    }
//}
//
//#Preview {
//    j()
//}
