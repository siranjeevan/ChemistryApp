//
//  ChemistryAppConstantsData.swift
//  ChemistryApp
//
//  Created by Jeevith on 6/7/25.
//

import SwiftUI

struct ChemistryAppConstants {
    static let updatePicture = "UpdatePic"
    static let noNetworkImage = "noNetwork"
    static let contactUs  = "contactUs"
    static let email = "email"
    static let linkedin = "linkedIn"
    static let instagram = "instagram"
    static let facebook = "facebook"
    
    static let standardFontColor: Color = .black
    static let HeaderFontColor: Color = .white
    static let drawerContentColor: Color = .white
    static let versionContentColor: Color = .white
    static let contentFontColor: Color = .white
    
    static let headerFont: String = "Arial Rounded MT Bold"
    static let titleFont: String = "Futura"
    static let versionFont: String = "Futura"
    static let atomSymbolFont = "Arial Rounded MT Bold"
    static let aufbaPrincipleCardFont: String = "Arial Rounded MT Bold"
    
    static let screenWidth: CGFloat = UIScreen.main.bounds.width
    static let screenHeigth: CGFloat = UIScreen.main.bounds.height
    
    static var isIPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
    
    static let menuViewsTitles: [String] = ["Home", "About Us", "Contact Us", "Privacy Policy"]
    
    static let shellColors: [Color] = [.kShell, .lShell, .mShell, .nShell, .oShell, .pShell, .qShell]
    static let shellSymbols: [String] = ["K", "L", "M", "N", "O", "P", "Q"]
    
    static let spdfColors: [Color] = [.s1, .p1, .d1, .F_1]
    static let spdfOrdering: [Color] = [.s1, .s1, .p1, .s1, .p1, .d1, .s1, .p1, .d1, .F_1, .s1, .p1, .d1, .F_1, .s1, .p1, .d1, .s1, .p1]
    
    static let content: [String] = ["1s", "2s", "2p", "3s", "3p", "3d", "4s", "4p", "4d", "4f", "5s", "5p", "5d", "5f", "6s", "6p", "6d", "7s", "7p"]
    
    static let APR: [Int] = [0, 1, 2, 3, 4, 6, 5, 7, 10, 8, 11, 14, 9, 12, 15, 17, 13, 16, 18]
}
