//
//  Trending.swift
//  GHExample
//
//  Created by Brandon Sanchez on 1/19/17.
//  Copyright © 2017 Brandon Sanchez. All rights reserved.
//

import Foundation

// MARK: - Protocol for Trending call

protocol Gettable {
    associatedtype repos
    
    func get(completion: @escaping (Result<repos>) -> Void)
}

// MARK: - Result enum for error handling in network calls

enum Result<T> {
    case success(T)
    case failure(Error)
}

struct RepoService: Gettable {
    
    func get(completion: @escaping (Result<[RepoModel]>) -> Void) {
        
        let url = URL(string: "https://api.github.com/search/repositories?q=2017-01-03&sort=stars")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task: URLSessionDataTask = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            var repos = [RepoModel]()
            
            guard let data = data,
                let dataDictionary = try!JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary,
                let results = dataDictionary["items"] as? [NSDictionary]
            else{fatalError("error with JSONSerialization,jsonObject")}
            
        
        
        for case let result in results {
            if let repo = RepoModel(dictionary: result) {
                repos.append(repo)
            }
        }
        
        completion(Result.success(repos))
            
        }
        
        task.resume()
    
    
    }
}

// MARK: - Method to mke network cal in View Controllers, checks for a Repo model retun type

extension Github {
    
    func getTrending<Service: Gettable>(fromService service: Service, completion: @escaping ([RepoModel]) -> Void) where Service.repos == [RepoModel] {
        
        service.get() { result in
            switch result {
            case .success(let repos):
                //self?.repos = repos
                //print(repos)
                completion(repos)
            case .failure(let error):
                fatalError("error unable to init RepoModel(json:)")
            }
        }
    }
}



