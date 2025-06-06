//
//  NetworkMoniter.swift
//  ChemistryApp
//
//  Created by Jeevith  on 06/06/25.
//

import SwiftUI
import Network

class NetworkMoniter: ObservableObject {
    
    @Published var isConnected: Bool = false
    private let monitor = NWPathMonitor()
    
    init() {
        monitor.start(queue: .main)
        monitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
        }
    }
}

struct NetworkMoniter_Previews: View {
   @StateObject var NetWord = NetworkMoniter()
     var body : some View {
         Text(NetWord.isConnected ? "Connected" : "Not Connected")
    }
}

#Preview {
    NetworkMoniter_Previews()
}
