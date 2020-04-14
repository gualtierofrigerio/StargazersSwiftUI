//
//  StargazersView.swift
//  StargazersSwiftUI
//
//  Created by Gualtiero Frigerio on 17/09/2019.
//  Copyright © 2019 Gualtiero Frigerio. All rights reserved.
//

import SwiftUI

struct StargazerView: View {
    var stargazer:User
    
    var body: some View {
        HStack {
            ImageView(withURL: stargazer.avatarUrl)
            Text(stargazer.login)
        }
    }
}

struct StargazersView: View {
    var stargazers:[User] = []
    
    var body: some View {
        List(stargazers) { stargazer in
            StargazerView(stargazer: stargazer)
        }
    }
}

struct StargazersView_Previews: PreviewProvider {
    static var previews: some View {
        StargazersView()
    }
}
