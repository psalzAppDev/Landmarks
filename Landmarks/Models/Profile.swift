//
//  Profile.swift
//  Landmarks
//
//  Created by Peter Salz on 08.07.20.
//  Copyright © 2020 Peter Salz App Development. All rights reserved.
//

import Foundation

struct Profile {
    
    var username: String
    var prefersNotifications: Bool
    var seasonalPhoto: Season
    var goalDate: Date
    
    static let `default` = Self(username: "g_kumar",
                               prefersNotifications: true,
                               seasonalPhoto: .winter)
    
    init(username: String,
         prefersNotifications: Bool = true,
         seasonalPhoto: Season = .winter) {
        
        self.username = username
        self.prefersNotifications = prefersNotifications
        self.seasonalPhoto = seasonalPhoto
        self.goalDate = Date()
    }
    
    enum Season: String, CaseIterable {
        
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
    }
}
