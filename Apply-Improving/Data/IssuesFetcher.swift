//
//  IssueModel.swift
//  Apply-Improving
//
//  Created by Adriano Rodrigues Vieira on 22/02/21.
//

import Foundation
import Alamofire
import StatusCodes

class IssuesFetcher: ObservableObject {
    @Published var issues: [String: Issue] = [:]
    @Published var internetConnected: Bool
            
    static let instance: IssuesFetcher? = IssuesFetcher()    
    
    private init() {
        self.internetConnected = Connectivity.hasConnection
        
        if internetConnected {
            loadData()
        }        
    }
    
    // Function used for the refresh button. This function was made because of semantic (it makes more sense "reload a data"
    // when a refresh button is pressed instead of "load a data".
    func reloadData() {
        loadData()
    }
    
        
    private func loadData() {
        self.issues = [:]
                
        let request = AF.request(URLS.API)
            .validate(statusCode: StatusCodes.Code200OK.code..<StatusCodes.Code300MultipleChoices.code)
                    
        request.responseDecodable(of: [IssueData].self) { data in
            if let issueJSONArray = data.value {
                DispatchQueue.main.async {
                    for issueJSONItem in issueJSONArray {
                        let issue = Issue(from: issueJSONItem)
                        self.issues[issueJSONItem.url] = issue
                    }
                }
            }
        }
    }
}

// MARK: - Helper class for connectivity
class Connectivity {
    static var hasConnection: Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
