//
//  RepoModel.swift
//  GHExample
//
//  Created by Brandon Sanchez on 1/18/17.
//  Copyright © 2017 Brandon Sanchez. All rights reserved.
//

import Foundation
import SwiftyJSON

struct RepoModel {
    //json["url"]
    var url: String?
    //json["created_at"]
    var createdAt: String?
    //json["description"]
    var description: String?
    //json["language"]
    var language: String?
    //json["owner"]["url"]
    var owner: String?
    
}

extension RepoModel {
    init?(json: JSON) {
        
        guard let url = json["url"] as? String,
            let createdAt = json["created_at"] as? String,
            let description = json["description"] as? String,
            let language = json["language"] as? String,
            let owner = json["owner"]["url"] as? String
            else {
                return nil
        }
        
        self.url = url
        self.createdAt = createdAt
        self.description = description
        self.language = language
        self.owner = owner
    }
}





