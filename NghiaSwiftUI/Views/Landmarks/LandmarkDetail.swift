//
//  LandmarkDetail.swift
//  NghiaSwiftUI
//
//  Created by Nghia PC on 21/05/2023.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    // Check landmark Index on landmarks
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex (where: { $0.id == landmark.id})!
    }
    
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            HStack {
                Spacer()
                CircleImage(image: landmark.image)
                Spacer()
            }
            .padding(.top, -130)
            
            // Text Detail
            VStack(alignment: .leading) {
                
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    // Favorite
                    FovoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }.padding()
            
            Spacer()
        }
        // Navigation bar
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var modelData = ModelData()
    
    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
    }
}
