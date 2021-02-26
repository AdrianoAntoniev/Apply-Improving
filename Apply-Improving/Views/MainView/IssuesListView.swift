//
//  IssuesListView.swift
//  Apply-Improving
//
//  Created by Adriano Rodrigues Vieira on 24/02/21.
//

import SwiftUI

struct IssuesListView: View {
    @ObservedObject var fetcher = IssuesFetcher.instance!
    @State private var showAlert: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Array(fetcher.issues.values), id: \.self) { issue in
                    HStack {
                        IssueCellView(issue: issue)
                    }
                }
            }
            .navigationBarTitle(Labels.MAIN_TITLE)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        if Connectivity.hasConnection {
                                            fetcher.reloadData()
                                        } else {
                                            showAlert = true
                                        }
                                    }, label: {
                                        RefreshButtonImageView()
                                    }))
            .alert(isPresented: $showAlert) {
                Alerts.NO_INTERNET
            }            
        }
    }
}

struct IssuesListView_Previews: PreviewProvider {
    static var previews: some View {
        IssuesListView()
    }
}
