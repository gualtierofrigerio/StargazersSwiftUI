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
    
    private var restClient:RESTClient!
    private var dataSource:DataSource!
    
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
    
    var enableSearch:AnyPublisher<Bool, Never> {
        return Publishers.CombineLatest(validOwner, validRepository)
            .map {$0 && $1}
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    init() {
        restClient = SimpleRESTClient()
        dataSource = DataSource(withClient: restClient, baseURLString: "https://api.github.com")
    }
    
    func getStargazers(completion: @escaping([User]?) ->Void) {
        dataSource.getStargazers(owner:owner, repo:repository) { stargazers,_  in
            completion(stargazers)
        }
    }
}
