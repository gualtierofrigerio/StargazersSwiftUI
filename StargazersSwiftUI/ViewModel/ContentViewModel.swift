//
//  ContentViewModel.swift
//  StargazersSwiftUI
//
//  Created by Gualtiero Frigerio on 17/09/2019.
//  Copyright © 2019 Gualtiero Frigerio. All rights reserved.
//

import Combine
import Foundation

class ContentViewModel:ObservableObject {
    @Published var owner:String = ""
    @Published var repository:String = ""
    
    var enableSearch:AnyPublisher<Bool, Never> {
        return Publishers.CombineLatest(validOwner, validRepository)
            .map {$0 && $1}
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    var validOwner:AnyPublisher<Bool, Never> {
        return $owner
            .map {$0.count > 0}
            .eraseToAnyPublisher()
    }
    var validRepository:AnyPublisher<Bool, Never> {
        return $repository
            .map {$0.count > 0}
            .eraseToAnyPublisher()
    }
}
