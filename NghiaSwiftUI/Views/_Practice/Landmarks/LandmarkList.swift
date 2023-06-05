//
//  LandmarkList.swift
//  NghiaSwiftUI
//
//  Created by Nghia PC on 21/05/2023.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    // Filter base showFavoritesOnly
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            //        List {
            //            LandmarkRow(landmark: landmarks[0])
            //            LandmarkRow(landmark: landmarks[1])
            //        }
            
            // if Landmark not extend Identifiable
            //List(landmarks, id: \.id) { landmark in
            //List(landmarks) { landmark in
            
            List {
                // Filter View
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                // Filtered List View
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        // Row click navigate (symbol: >)
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        // Row View
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")   // Nav title
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        // Review on list phone
        //        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
        //            LandmarkList()
        //                .previewDevice(PreviewDevice(rawValue: deviceName))
        //                .previewDisplayName(deviceName)
        //        }
        
        LandmarkList()
            .environmentObject(ModelData())
            .environment(\.sizeCategory, .extraLarge)   // Phone size
            .environment(\.colorScheme, .dark)  // Dark theme
            .environment(\.layoutDirection, .rightToLeft)   // right to left
            .environment(\.locale, Locale(identifier: "ar"))    // Language
    }
}
