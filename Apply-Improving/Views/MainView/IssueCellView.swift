//
//  IssueCell.swift
//  Apply-Improving
//
//  Created by Adriano Rodrigues Vieira on 22/02/21.
//

import SwiftUI

struct IssueCellView: View {
    @State private var showSheet = false
    @State private var cellShakes = 0
    
    var issue: Issue
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .frame(height: 150)
                .foregroundColor(Colors.CELL_BG)
                .shadow(radius: 5)
                .overlay(RoundedRectangle(cornerRadius: 10.0).stroke(Colors.CELL_STROKE, lineWidth: 2.0))
           
            VStack {
                Text(issue.title)
                CapsuleView(state: issue.state)
                
            }.padding(20)
            .onTapGesture {
                withAnimation {
                    self.cellShakes += 1
                    Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { _ in
                        self.showSheet = true
                    }
                }
                
            }
        }.modifier(Shake(animatableData: CGFloat(self.cellShakes)))
        .sheet(isPresented: $showSheet) {
            IssueDetailView(url: issue.url)
        }
    }
}

struct IssueCellView_Previews: PreviewProvider {
    static var previews: some View {
        IssueCellView(issue: Samples.ISSUE_OBJECT)
    }
}
