//
//  ContentView.swift
//  Apply-Improving
//
//  Created by Adriano Rodrigues Vieira on 22/02/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert: Bool = false
        
    var body: some View {        
        IssuesListView()
            .alert(isPresented: $showAlert) {
                Alerts.NO_INTERNET
            }
            .onAppear() {
                showAlert = !Connectivity.hasConnection
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
