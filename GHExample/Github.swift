//
//  Github.swift
//  Pods
//
//  Created by Hugh A. Miles II on 12/3/16.
//
//
import Foundation
import UIKit
import Alamofire
import SwiftyJSON

public class Github {
    var sessionManager:SessionManager?
    
    // Want to find a way to avoid having to initialize the token
    // I want the call to look like 'Github().getRepos()'
    public init(token: String){
        sessionManager = SessionManager()
        sessionManager?.adapter = AccessTokenAdapter(accessToken: token)
    }
    
//    public func getTrending(completion: @escaping (JSON) -> Void) {
//        //TODO: set trending by date
//        //TODO: set sort function
//        let url = "https://api.github.com/search/repositories?q=2017-01-03&sort=stars"
//        Alamofire.request(url).responseJSON { response in
//            if let JSON = response.result.value {
//                print("JSON: \(JSON)")
//            }
//        }
//    }

    /*
     authRequest
     - parameter endpoint: actual github endpoint you are trying to hit e.g. https://api.github.com/events
     - return: completion block
     
     */
    
    //needed to remove 'private' level to access it from the extensions
    func api(endPoint: String, completion: @escaping (_ response: Any?, _ error: NSError?) -> Void) {
        sessionManager?.request(endPoint).validate().responseJSON { response in
            let _: JSON?
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                completion(value, nil)
            case .failure(let error):
                completion(nil, error as NSError?)
            }
        }
    }
}


// keeps all this internal logic out of the public-facing API of this struct
// MARK: Private Attributed Github Helper Methods
private extension Github {
    class AccessTokenAdapter: RequestAdapter {
        private let accessToken: String
        
        init(accessToken: String) {
            self.accessToken = accessToken
        }
        
        func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
            var urlRequest = urlRequest
            
            if (urlRequest.url?.absoluteString.hasPrefix("https://api.github.com/"))! {
                
                urlRequest.setValue("Bearer " + accessToken, forHTTPHeaderField: "Authorization")
            }
            
            return urlRequest
        }
    }
}
