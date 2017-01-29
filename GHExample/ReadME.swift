//
//  ReadME.swift
//  GHExample
//
//  Created by Brandon Sanchez on 1/24/17.
//  Copyright © 2017 Brandon Sanchez. All rights reserved.
//

import Foundation
import Down

protocol ReadME {
    associatedtype readME
    
    func markdown(completion: @escaping (Result<readME>) -> Void)
    
}

struct ReadMEService: ReadME {
    
    var fullName: String
    
    
func markdown(completion: @escaping (Result<String>) -> Void) {
    
    let rawGithub = "https://raw.githubusercontent.com/\(fullName)/master/README.md"
    let url = URL(string: rawGithub)!
    let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
    let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    let task: URLSessionDataTask = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
        
        guard let data = data, let utf8Text = String(data: data, encoding: .utf8) else {
            fatalError("failure retrieving markdown")
        }
        
        completion(Result.success(utf8Text))
        
        }
    
        task.resume()
    }
}

// MARK: - Github extension to make it readable on the call side, also @escaping result to cast result into down view

extension Github {
    func getReadME<Service: ReadME>(fromService service: Service, completion: @escaping (String) -> Void) where Service.readME == String {
        service.markdown() { result in
            switch result {
            case .success(let utf8Text):
                completion(utf8Text)
                print(utf8Text)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
