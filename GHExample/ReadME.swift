//
//  ReadME.swift
//  GHExample
//
//  Created by Brandon Sanchez on 1/24/17.
//  Copyright © 2017 Brandon Sanchez. All rights reserved.
//

import Foundation
import Down

struct ReadMEService: ReadME {
    
    var fullName: String

func markdown(download urlString: String, completion: @escaping (Result<String>) -> Void) {
    
    let url = URL(string: urlString)!
    let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
    let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    let task: URLSessionDataTask = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
        
        guard let data = data, let utf8Text = String(data: data, encoding: .utf8) else {
            fatalError("failure retrieving markdown")
        }
        print(utf8Text)
        completion(Result.success(utf8Text))
            //Place markdown into view
            //let downView = try? DownView(frame: self.view.bounds, markdownString: utf8Text)
            //self.view = downView
            
        

        }
    
        task.resume()
    }

    func getRawUrl(completion: @escaping (Result<String>) -> Void) {
        
        print(fullName)
        
        var readMeString = "https://api.github.com/repos/\(fullName)/readme"

        let url = URL(string: readMeString)!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task: URLSessionDataTask = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            

            
            //guard let data = data as? String else {fatalError("error retreiving downloadURL")}
            guard let data = data,
                let dataDictionary = try!JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary,
                let downloadURL = dataDictionary["download_url"] as? String
                else { fatalError(error as! String) }
            print(downloadURL)
            //var utf8Text = ""
            
            self.markdown(download: downloadURL) { result in
                switch result {
                case .success(let utf8Text):
                    //utf8Text = utf8Text
                    print(utf8Text)
                    completion(Result.success(utf8Text))
                case .failure(let error):
                    print(error)
                }
            }
            
            
                }
        
            task.resume()
        
        
        }
}

protocol ReadME {
    associatedtype readME
    
    func getRawUrl(completion: @escaping (Result<readME>) -> Void)
    
}

