//
//  RefreshButtonView.swift
//  Apply-Improving
//
//  Created by Adriano Rodrigues Vieira on 25/02/21.
//

import SwiftUI

struct RefreshButtonImageView: View {
    var body: some View {
        Image(systemName: Filenames.REFRESH_BUTTON)
            .resizable()
            .frame(width: 20, height: 20, alignment: .center)
            .shadow(radius: 3)
            .foregroundColor(.black)
    }
}

struct RefreshButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RefreshButtonImageView()
    }
}
