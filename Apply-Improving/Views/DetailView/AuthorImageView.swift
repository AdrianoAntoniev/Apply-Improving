//
//  AuthorImageView.swift
//  Apply-Improving
//
//  Created by Adriano Rodrigues Vieira on 24/02/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct AuthorImageView: View {
    @State private var avatarImageShakes: Int = 0
    let url: URL
    
    var body: some View {
        WebImage(url: self.url)
            .resizable()
            .frame(width: 60, height: 60, alignment: .center)
            .clipShape(Circle())
            .shadow(radius: 10)
            .overlay(Circle().stroke(Color.gray, lineWidth: 3))
//            .modifier(Shake(animatableData: CGFloat(self.avatarImageShakes)))
//            .onTapGesture {
//                withAnimation(.default) {
//                    self.avatarImageShakes += 1
//                }
//            }
    }
}

struct AuthorImageView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorImageView(url: URLS.SAMPLE_IMAGE)
    }
}
