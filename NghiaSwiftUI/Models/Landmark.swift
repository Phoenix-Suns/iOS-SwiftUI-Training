//
//  Landmark.swift
//  NghiaSwiftUI
//
//  Created by Nghia PC on 21/05/2023.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    // Catergory
    var category: Category = Category.lakes
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    // Image
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    // Location on Mapkit
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    // Store locations
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
