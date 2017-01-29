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
    
    @IBOutlet weak var ReadmeView: UIView!
    var fullName: String = "" {
        didSet{
            // Method returns Markdown as String
            Github().getReadME(fromService: ReadMEService(fullName: fullName)) { markdownString in
                let downView = try? DownView(frame: self.view.bounds, markdownString: markdownString)
                self.ReadmeView.addSubview(downView!)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
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
