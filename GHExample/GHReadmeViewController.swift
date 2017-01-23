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
    
    var markdownString: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request("https://raw.githubusercontent.com/KickSwap/Bred1s-iOS/master/README.md").response { response in
            print("Request: \(response.request)")
            print("Response: \(response.response)")
            print("Error: \(response.error)")
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                //Place markdown into view
                let downView = try? DownView(frame: self.view.bounds, markdownString: utf8Text)
                self.view = downView

            }
        }
        
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
