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
            CustomImageView(url: URL(string: stargazer.avatarUrl))
                .frame(width: 100, height: 100)
            Text(stargazer.login)
        }
    }
}
