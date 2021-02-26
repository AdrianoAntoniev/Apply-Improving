//
//  Apply_ImprovingTests.swift
//  Apply-ImprovingTests
//
//  Created by Adriano Rodrigues Vieira on 22/02/21.
//

import XCTest
@testable import Apply_Improving
import Alamofire
import StatusCodes

class Apply_ImprovingTests: XCTestCase {
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testConnectionOKWithAPI() throws {
        let request = AF.request(URLS.API)
                    
        request.responseDecodable(of: [IssueData].self) { data in
            if let _ = data.value {
                XCTAssertEqual(request.response!.statusCode, StatusCodes.Code200OK.code)
            }
        }
    }
    
    func testFetchAvatarImage() throws {
        let request = AF.request(URLS.API)
            .validate(statusCode: StatusCodes.Code200OK.code..<StatusCodes.Code300MultipleChoices.code)
                    
        request.responseDecodable(of: [IssueData].self) { data in
            if let d = data.value {
                if let statusCode = AF.request(d[0].user.avatar).response?.statusCode {
                    XCTAssertEqual(statusCode, StatusCodes.Code200OK.code)
                }
            }
        }
    }
    
    func testFetchIssueGitHubPage() throws {
        let request = AF.request(URLS.API)
            .validate(statusCode: StatusCodes.Code200OK.code..<StatusCodes.Code300MultipleChoices.code)
                    
        request.responseDecodable(of: [IssueData].self) { data in
            if let d = data.value {
                if let statusCode = AF.request(d[0].githubUrl).response?.statusCode {
                    XCTAssertEqual(statusCode, StatusCodes.Code200OK.code)
                }
            }
        }
    }
    
    func testCompleteListOfIssuesData() throws {
        let request = AF.request(URLS.API)
            .validate(statusCode: StatusCodes.Code200OK.code..<StatusCodes.Code300MultipleChoices.code)
                    
        request.responseDecodable(of: [IssueData].self) { data in
            if let d = data.value {
                XCTAssertEqual(d.count, 30)
            }
        }
    }
    
    func testAssertInstanceOfFetcherData() throws {
        let fetcher = IssuesFetcher.instance
        
        XCTAssertNotNil(fetcher)
    }
    
    func testAssertInternetConnection() {
        XCTAssertTrue(Connectivity.hasConnection)
    }
    
    func testConsistencyOfIssueObject() {
        let request = AF.request(URLS.API)
            .validate(statusCode: StatusCodes.Code200OK.code..<StatusCodes.Code300MultipleChoices.code)
                    
        request.responseDecodable(of: [IssueData].self) { data in
            if let issueJSONArray = data.value {
                for issueJSONItem in issueJSONArray {
                    let issue = Issue(from: issueJSONItem)
                    XCTAssertNotNil(issue)
                }
            }
        }
    }
    
    func testConvertIsoDateFormatTo_ddMMyyyy_format() {
        let isoDate = Date.convertToDayMonthYear(from: Samples.DATE_STRING_8061)
        
        XCTAssertEqual(isoDate, Samples.DATE_STRING)
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            let _ = IssuesFetcher.instance
        }
    }

}
