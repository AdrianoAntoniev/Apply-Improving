//
//  IssueDetailsView.swift
//  Apply-Improving
//
//  Created by Adriano Rodrigues Vieira on 22/02/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct IssueDetailView: View {
    @ObservedObject var fetcher = IssuesFetcher.instance!
    private var issue: Issue = Samples.ISSUE_OBJECT
    var url: String = ""
    
    init(url: String) {
        self.url = url
        issue = fetcher.issues[self.url] ?? Samples.ISSUE_OBJECT
    }
        
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.vertical) {
                Text(issue.title)
                    .font(.system(size: 40))
                    .shadow(radius: 2)
            }.frame(height: 200)
            
            IssueAuthorDataView(avatarURL: issue.avatarURL, githubURL: issue.githubUrl, username: issue.username, date: issue.date)                
            
            Spacer(minLength: 50)
            
            ScrollView(.vertical) {
                Text(issue.description)
            }
        }
        .padding(20)
        
        
    }
}

struct IssueDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        IssueDetailView(url: URLS.SAMPLE)
    }
}
