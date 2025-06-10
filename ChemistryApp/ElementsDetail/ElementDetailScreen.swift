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
    var body: some View {
        elementsDetailViewModel.DetailViewModel(selectedElement: 102)
    }
}
#Preview {
    ElementDetailScreen()
}
