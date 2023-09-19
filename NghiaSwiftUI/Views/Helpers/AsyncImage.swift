//
//  AsyncImage.swift
//  App
//
//  Created by Nghia Tran on 7/24/23.
//  Copyright © 2023 Fiision Studio. All rights reserved.
//

import Combine
import SwiftUI

struct AsyncImage: View {
    var urlString: String
    var contentMode: ContentMode = .fit
    var placeholder: Image = Image("twinlake")

    @ObservedObject var imageLoader = ImageLoaderObservable()
    @State var image: UIImage = .init()
    @State var imageLoaded = false

    var body: some View {
        ZStack {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: self.contentMode)
                .onReceive(imageLoader.$image) { image in
                    self.image = image
                    withAnimation {
                        self.imageLoaded = true
                    }
                }
                .onAppear {
                    imageLoader.loadImage(for: urlString)
                }
            if !imageLoaded {
                placeholder
                    .resizable()
                    .aspectRatio(contentMode: self.contentMode)
            }
        }
    }
}

class ImageLoaderObservable: ObservableObject {
    @Published var image: UIImage = .init()

    func loadImage(for urlString: String) {
        guard let url = URL(string: urlString) else { return }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data) ?? UIImage()
            }
        }
        task.resume()
    }
}

struct AsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImage(urlString: "https://fiisionstudio.com/wp-content/themes/twentyseventeen/assets/images/header.jpg")
    }
}
