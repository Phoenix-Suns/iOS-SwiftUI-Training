//
//  LandmarkRow.swift
//  NghiaSwiftUI
//
//  Created by Nghia PC on 21/05/2023.
//

import SwiftUI

struct ListHorizontalItem: View {
    var landmark: Landmark
    
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            HStack {
                Text(landmark.name)
                    .foregroundColor(.primary)
                .font(.caption)
                // Favorite
                if landmark.isFavorite {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
            }
        }.padding()
    }
}

struct ListHorizontalItem_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        Group {
            ListHorizontalItem(landmark: landmarks[0])
            ListHorizontalItem(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
