//
//  Helpers.swift
//  Apply-Improving
//
//  Created by Adriano Rodrigues Vieira on 22/02/21.
//

import Foundation
import SwiftUI

// MARK: - Constants for use as example, or when it is necessary to pass an object or property in ViewProvider.
struct Samples {
    static let DATE_STRING = "25/02/2021"
    static let DATE_STRING_8061 = "2021-02-25T01:11:51Z"
    static let USERNAME = "Adriano Rodrigues"
    static let USERDATA = IssueData.User(login: USERNAME, avatar: URLS.SAMPLE_IMAGE_STRING)
   
    static let ISSUEDATA_OBJECT = IssueData(title: "Passei no processo da JYA - Improving!",
                                            description: "Finalmente consegui passar. Foi bastante dificil, porem desafiador! \nAgradeco ao Michael Nascimento pela oportunidade e paciencia.",
                                            date: DATE_STRING_8061,
                                            state: "open",
                                            url: URLS.SAMPLE,
                                            githubUrl: URLS.GITHUB_PAGE,
                                            user: USERDATA)
    
    static let ISSUE_OBJECT = Issue(from: ISSUEDATA_OBJECT)
}


// MARK: - Constants for use in fetching data or in case of sample data
struct URLS {
    static let API = "https://api.github.com/repos/apple/swift/issues"
    static let SAMPLE = "https://api.github.com/repos/apple/swift/issues/36099"
    static let GITHUB_PAGE = "https://github.com/"
    
    static let SAMPLE_IMAGE_STRING = "https://avatars.githubusercontent.com/u/1896383?v=4"
    static let SAMPLE_IMAGE = URL(string: SAMPLE_IMAGE_STRING)!
}


// MARK: - Constants for use in color of views like labels etc
struct Colors {
    static let CELL_BG = Color(hex: "#FFFFFF")
    static let CELL_STROKE = Color(hex: "#FF9300")

//    static let CAPSULE_FONT = Color(hex: "#FF9016")
//    static let CAPSULE_FONT = Color.blue
    
    static let CAPSULE_FONT = Color(hex: "#28BCDA")
    static let CAPSULE_BG = Color(hex: "#FFFFFF")
}

// MARK: - Constants for use in case of format of date or so on
struct Formats {
    static let DATE = "dd/MM/yyyy"
}

// MARK: - Constants for use to identity localizations
struct Identifiers {
    static let DATE_EN = "en_US_POSIX"
    static let DATE_PT = "pt_BR_POSIX"
}

// MARK: - Constants for use when access files in bundle
struct Filenames {
    static let GITHUB_ICON = "github_icon"
    static let REFRESH_BUTTON = "arrow.clockwise"
}

// MARK: - Constants for use in labels, alerts and so on
struct Labels {
    static let MAIN_TITLE = "Apple Github Issues"
    static let STATE_WORD = "Issue state:"
    static let READ_IN = "Read in"
    
    struct NoInternet {
        static let TITLE_ALERT = Text("Connection Error")
        static let CONTENT_ALERT = Text("This app needs an internet connection in order to run. Please verify your connection and try again")
        static let BUTTON_ALERT = Text("Open settings")
    }
}

// MARK: - Constants for use when there is a need of show an alert
struct Alerts {
    static let NO_INTERNET = Alert(title: Labels.NoInternet.TITLE_ALERT,
              message: Labels.NoInternet.CONTENT_ALERT,
              dismissButton: .default(Labels.NoInternet.BUTTON_ALERT)
                                {
                                    SettingsOpener.open()
                                }
                        )
}
