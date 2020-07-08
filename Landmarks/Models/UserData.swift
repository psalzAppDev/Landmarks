//
//  UserData.swift
//  Landmarks
//
//  Created by Peter Salz on 07.07.20.
//  Copyright © 2020 Peter Salz App Development. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
