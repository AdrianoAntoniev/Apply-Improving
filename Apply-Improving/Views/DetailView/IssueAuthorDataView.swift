//
//  AvatarView.swift
//  Apply-Improving
//
//  Created by Adriano Rodrigues Vieira on 24/02/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct IssueAuthorDataView: View {
    @State private var degrees: Double = 0
    
    let avatarURL: URL
    let githubURL: URL
    let username: String
    let date: String
    
    var body: some View {
        HStack {
            AuthorImageView(url: self.avatarURL)
                
            VStack(alignment: .leading, spacing: 10) {
                Text(self.username)
                    .bold()
                    .font(.title2)
                    .shadow(radius: 5)
                
                Text("\(self.date)")
                    .font(.caption)
            }
                                    
            Spacer()
            
            GithubButtonView(destination: self.githubURL)
        }
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        IssueAuthorDataView(avatarURL: URLS.SAMPLE_IMAGE,
                   githubURL: URL(string: URLS.GITHUB_PAGE)!,
                   username: Samples.USERNAME, date: Samples.DATE_STRING)
    }
}
