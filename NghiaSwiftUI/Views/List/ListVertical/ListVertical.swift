//
//  ListVertical.swift
//  NghiaSwiftUI
//
//  Created by Nghia on 5/23/23.
//

import SwiftUI

struct ListVertical: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    // Filter base showFavoritesOnly
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
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
                    
                    // Nav Button
                    NavigationLink {
                        // Row click
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        // Row View
                        ListVerticalRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")   // Nav title
        }

}

struct ListVertical_Previews: PreviewProvider {
    static var previews: some View {
        // Review on list phone
        //        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
        //            LandmarkList()
        //                .previewDevice(PreviewDevice(rawValue: deviceName))
        //                .previewDisplayName(deviceName)
        //        }
        
        ListVertical()
            .environmentObject(ModelData())
    }
}
