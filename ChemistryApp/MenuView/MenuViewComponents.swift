//
//  MenuView.swift
//  ChemistryApp
//
//  Created by Jeevith  on 07/06/25.
//
import Foundation
import SwiftUI

let screenWidth: CGFloat = UIScreen.main.bounds.width // measures the width of the screen
let screenHeigth: CGFloat = UIScreen.main.bounds.width // measures the height of the
var isIPhone: Bool {
    UIDevice.current.userInterfaceIdiom == .phone
}

class MenuViewComponents : ObservableObject {
    
    private let menuViewsTitles: [String] = ["Home", "About Us" , "Contact Us","Privacy Policy"]
    
    @Published var isDrawerOpen : Bool = false
    
    func Drawer()->some View{
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(.gray).opacity(0.8)
                .frame(width: screenWidth*0.3)
            
                .edgesIgnoringSafeArea(.all)
                .overlay{
                    VStack(alignment:.leading,spacing:15){
                        ForEach(0..<4,id: \.self){ menuView in
//                            NavigationLink(destination: getMenuView(at: menuView), label: {
//
//                            })
                            Text(self.menuViewsTitles[menuView])
                                .font(.custom(ChemistryAppConstants.titleFont, size: 18))
                        }
                    }
                }
                .foregroundColor(.white)
                .offset(x:isDrawerOpen ? (-1*screenWidth*0.4):(-1*screenWidth*0.7))
        }
    }
    
    func drawerButton() ->some View{
        Button(action: {
            self.isDrawerOpen.toggle()
        }, label: {
            VStack(spacing: 6) {
                RoundedRectangle(cornerRadius: 3)
                    .frame(width: 30, height: 3)
                    .rotationEffect(self.isDrawerOpen ? Angle(degrees: 45) : .zero)
                    .offset(y: isDrawerOpen ? 9 : 0)
                
                RoundedRectangle(cornerRadius: 3)
                    .frame(width: 30, height: 3)
                    .opacity(isDrawerOpen ? 0 : 1)
                
                RoundedRectangle(cornerRadius: 3)
                    .frame(width: 30, height: 3)
                    .rotationEffect(isDrawerOpen ? Angle(degrees: -45) : .zero)
                    .offset(y: isDrawerOpen ? -9 : 0)
            }
            .animation(.easeIn, value: isDrawerOpen)
            .foregroundColor(isDrawerOpen ? .white : .darkGrey)
        })
        .scaleEffect(isIPhone ? 1:1.5)
        .offset(x:-1 * screenWidth*0.45,y:isIPhone ? -1 * screenHeigth*0.17: -1 * screenHeigth*0.3)
        
    }
    
}

struct vie : View {
    @StateObject var menuView = MenuViewComponents()
    var body: some View {
        ZStack
        {
            menuView.Drawer()
            menuView.drawerButton()
        }
//
    }
}

#Preview {
    vie()
}
