//
//  GHReadmeViewController.swift
//  GHExample
//
//  Created by Hugh A. Miles II on 1/22/17.
//  Copyright © 2017 Brandon Sanchez. All rights reserved.
//

import UIKit
import Alamofire
import Down

class GHReadmeViewController: UIViewController {
    
    var fullName: String = "" {
        didSet{
            //Call 1st function to get "download_url"
            getReadME(fromService: ReadMEService(fullName: fullName))
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // API Request: GET /repos/:owner/:repo/readme
        // repo["full_name"] = owner/repo
        // 1. GET /repos/full_name/readme
        // 2. readme["download_url"] = Markdown url
        // 3. Make the following call:
        
//        Alamofire.request("https://raw.githubusercontent.com/KickSwap/Bred1s-iOS/master/README.md").response { response in
//            //print("Request: \(response.request)")
//            //print("Response: \(response.response)")
//            //print("Error: \(response.error)")
//            
//            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//                //Place markdown into view
//                let downView = try? DownView(frame: self.view.bounds, markdownString: utf8Text)
//                self.view = downView
//
//            }
//        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension GHReadmeViewController {
    func getReadME<Service: ReadME>(fromService service: Service) where Service.readME == String {
        service.markdown() { result in
            switch result {
            case .success(let utf8Text):
                print(utf8Text)
                let downView = try? DownView(frame: self.view.bounds, markdownString: utf8Text)
                self.view = downView
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
