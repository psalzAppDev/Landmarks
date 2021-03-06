//
//  Home.swift
//  Landmarks
//
//  Created by Peter Salz on 08.07.20.
//  Copyright © 2020 Peter Salz App Development. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
    
    @EnvironmentObject var userData: UserData
    
    var categories: [String: [Landmark]] {
        Dictionary(grouping: landmarkData,
                   by: { $0.category.rawValue })
    }
    
    @State var showingProfile = false
    
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                FeaturedLandmarks(landmarks: featured)
                    .scaledToFill()
                    .frame(height: 250)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key,
                                items: self.categories[key]!)
                        .environmentObject(self.userData)
                }
                .listRowInsets(EdgeInsets())
                
                NavigationLink(destination: LandmarkList()) {
                    Text("See All")
                }
            }
            .navigationBarTitle(Text("Featured"))
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(self.userData)
            }
        }
    }
}

struct FeaturedLandmarks: View {
    
    var landmarks: [Landmark]
    
    var body: some View {
        //landmarks[0].image.resizable()
        PageView(landmarks.map({ FeatureCard(landmark: $0) }))
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(UserData())
    }
}
