//
//  GithubButtonView.swift
//  Apply-Improving
//
//  Created by Adriano Rodrigues Vieira on 24/02/21.
//

import SwiftUI

struct GithubButtonView: View {
    @State private var degrees: Double = 0
    @Environment(\.presentationMode) var presentationMode
    
    let destination: URL
    
    var body: some View {
        
        VStack(spacing: 1) {
            Text(Labels.READ_IN.lowercased())
                .font(.footnote)
            Button(action: {
                withAnimation(.default) {
                    degrees += 360
                    
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                        presentationMode.wrappedValue.dismiss()
                        UIApplication.shared.open(destination)
                    }
                }
            }, label: {
                Image(Filenames.GITHUB_ICON)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .rotation3DEffect(.degrees(degrees), axis: (x: 0.0, y: 1.0, z: 0.0))
            })
        }
    }
}

struct GithubButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GithubButtonView(destination: URL(string: URLS.GITHUB_PAGE)!)
    }
}
