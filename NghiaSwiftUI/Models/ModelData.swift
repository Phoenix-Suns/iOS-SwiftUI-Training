//
//  ModelData.swift
//  NghiaSwiftUI
//
//  Created by Nghia PC on 21/05/2023.
//

import Foundation
import Combine

//var landmarks: [Landmark] = load("landmarkData.json")

// Update View by data change (@State for Object), like View Model
final class ModelData: ObservableObject {
    // Notify data change, View change
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    
    var features: [Landmark] {
        landmarks.filter{ $0.isFeatured }
    }
    
    // Create list categories
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks, by: { $0.category.rawValue }
        )
    }
}

/*
 Update View Anotation
 
 @State những kiểu dữ liệu đơn giản, thuộc về một view duy nhất và nên được khai báo private
 @ObservedObjectcho kiểu dữ liệu phức tạp hơn như các class chúng ta định nghĩa và có thể được chia sẻ cho nhiều Views. Đây cũng là kiểu lưu trữ State hữu dụng và sử dụng phổ biết nhất
 @EnviromentObject những thuộc tính được khởi tạo ở một nơi nào đó trong App nhưng có thể truy xuất ở mọi nơi
 @Binding khi muốn đánh dấu giá trị của một biến trong View được cung cấp từ một nơi khác và chia sẻ lẫn nhau
 */


// Load Json data from .json file
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
