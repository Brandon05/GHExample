//
//  ViewController.swift
//  GHExample
//
//  Created by Brandon Sanchez on 1/18/17.
//  Copyright © 2017 Brandon Sanchez. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    private var accessToken = ""
    var repos: [RepoModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        let git = Github(token: accessToken)
        git.getTrending(fromService: RepoService()) { result in
            self.repos = result
            print(self.repos)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

private extension Github {
    
}



