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
                AsyncImage(url: URL(string: stargazer.avatarUrl)!) { phase in
                    viewForPhase(phase)
                        .frame(width: 100, height: 100)
                }
            }
            else {
                ImageView(withURL: stargazer.avatarUrl)
            }
            Text(stargazer.login)
        }
    }
    
    @available(iOS 15.0, *)
    @ViewBuilder
    private func viewForPhase(_ phase:AsyncImagePhase) -> some View {
        switch phase {
        case .empty:
            ProgressView()
        case .success(let image):
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        case .failure(let error):
            let _ = print("error \(error)")
            Image(systemName: "person.fill.xmark")
                .font(.largeTitle)
        @unknown default:
            let _ = print("unknown phase \(phase)")
            Image(systemName: "person.fill.xmark")
                .font(.largeTitle)
        }
    }
}
