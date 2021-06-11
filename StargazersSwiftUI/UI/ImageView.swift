//
//  ImageView.swift
//  StargazersSwiftUI
//
//  Created by Gualtiero Frigerio on 17/09/2019.
//  Copyright © 2019 Gualtiero Frigerio. All rights reserved.
//

import Combine
import SwiftUI

struct ImageView: View {
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()
    
    init(withURL url:String) {
        imageLoader = ImageLoader(urlString:url)
    }
    
    init(url: URL) {
        imageLoader = ImageLoader(url: url)
    }
    
    var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }.onReceive(imageLoader.didChange) { data in
            self.image = UIImage(data: data) ?? UIImage()
        }
    }
    
    static var empty: some View {
        Image(systemName: "person.fill.xmark")
            .font(.largeTitle)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(withURL: "")
    }
}
