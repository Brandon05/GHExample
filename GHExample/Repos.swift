//
//  Repos.swift
//  
//
//  Created by Brandon Sanchez on 1/7/17.
//
//

import Foundation
import SwiftyJSON

public extension Github {
    
    /**
     getUserRepos
     - description: get repos affiliated with current user/accessToken
     */
    func getUserRepos(endPoint: String, completion: @escaping (JSON) -> Void){
        
        api(endPoint: endPoint) {
            (response, error) in
            if(error == nil){
                completion(JSON(response!))
                
                 //User parses JSON in their completion block
 
            } else {
                print("error in getRepos: \(error)")
            }
        }
    }
    
}
