//
//  StateCapsuleView.swift
//  Apply-Improving
//
//  Created by Adriano Rodrigues Vieira on 24/02/21.
//

import SwiftUI

struct CapsuleView: View {
    let state: String
    
    var body: some View {
        ZStack {
            Capsule(style: .continuous)
                .frame(width: 140, height: 20)
                .foregroundColor(Colors.CAPSULE_BG)
                .overlay(Capsule(style: .continuous).stroke(Colors.CAPSULE_FONT, lineWidth: 3))
            
            Text(state.uppercased())
                .foregroundColor(Colors.CAPSULE_FONT)
                .bold()
                .font(.headline)
        }        
    }
}

struct StateCapsuleView_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleView(state: "Issue Closed")
    }
}
