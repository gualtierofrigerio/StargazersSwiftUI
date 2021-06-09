//
//  StargazerView.swift
//  StargazersSwiftUI
//
//  Created by Gualtiero Frigerio on 14/04/2020.
//  Copyright © 2020 Gualtiero Frigerio. All rights reserved.
//

import SwiftUI

struct StargazerView: View {
    var stargazer:User
    
    var body: some View {
        HStack {
            if #available(iOS 15.0, *) {
                AsyncImage(url: URL(string: stargazer.avatarUrl)!) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 100, height: 100)
            }
            else {
                ImageView(withURL: stargazer.avatarUrl)
            }
            Text(stargazer.login)
        }
    }
}
