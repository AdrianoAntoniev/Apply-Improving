//
//  DetailedIssueModel.swift
//  Apply-Improving
//
//  Created by Adriano Rodrigues Vieira on 23/02/21.
//

import Foundation
import SwiftUI

// Struct para representar a Issue detalhada, com o avatar do usuario, descricao entre outros itens.
struct IssueData: Codable {        
    let title: String
    let description: String
    let date: String
    let state: String
    let url: String
    let githubUrl: String
    let user: User
    
    struct User: Codable {
        let login: String
        let avatar: String
        
        enum CodingKeys: String, CodingKey {
            case login = "login"
            case avatar = "avatar_url"
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "body"
        case date = "updated_at"
        case user = "user"
        case state = "state"
        case url = "url"
        case githubUrl = "html_url"
    }
    
}

struct Issue: Hashable {
    let title: String
    let description: String
    let date: String
    let username: String
    let avatarURL: URL
    let state: String
    let url: String
    let githubUrl: URL
            
    init(from issueData: IssueData) {
        self.title = issueData.title
        self.description = issueData.description
        self.date = Date.convertToDayMonthYear(from: issueData.date)
        self.username = issueData.user.login
        self.avatarURL = Self.assertURL(issueData.user.avatar)
        self.state = Self.adaptState(issueData.state)
        self.url = issueData.url
        self.githubUrl = Self.assertGithubURL(issueData.githubUrl)
    }
    
    private static func adaptState(_ state: String) -> String {
        var tempState = "Issue opened"
        if state == "close" {
            tempState = "Issue closed"
        }
        
        return tempState
    }
    
    private static func assertURL(_ url: String) -> URL {
        if let assertedURL = URL(string: url) {
            return assertedURL
        }
        
        return URLS.SAMPLE_IMAGE
    }
    
    private static func assertGithubURL(_ url: String) -> URL {
        if let assertedURL = URL(string: url) {
            return assertedURL
        }
        
        return URL(string: URLS.GITHUB_PAGE)!
    }
}



