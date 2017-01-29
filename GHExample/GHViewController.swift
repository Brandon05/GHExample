//
//  GHViewController.swift
//  GHExample
//
//  Created by Hugh A. Miles II on 1/22/17.
//  Copyright © 2017 Brandon Sanchez. All rights reserved.
//

import UIKit

class GHViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var trendingTableView: UITableView!
    
    var repos = [RepoModel]() {
        didSet {
            trendingTableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        trendingTableView.delegate = self
        trendingTableView.dataSource = self
        
        Github().getTrending(fromService: RepoService()) { result in
            self.repos = result
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard repos != nil else {return 3}
            return repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = trendingTableView.dequeueReusableCell(withIdentifier: "TrendingCell", for: indexPath) as? TrendingCell else {
            fatalError("Unable to dequeueResuableCell withIdentifier: TrendingCell")
        }
        
        if repos != nil {
        cell.repo = repos[indexPath.row]
            //print(repos[indexPath.row].owner)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if(segue.identifier == "TimelineToDetails"){
            // Detail
            let cell = sender as! UITableViewCell
            let indexPath = trendingTableView.indexPathForSelectedRow
            
            guard let fullName = repos[(indexPath?.row)!].owner else {fatalError("error passing data")}
            
            let readMeController = segue.destination as! GHReadmeViewController
            readMeController.fullName = fullName

        }
        
    }
}
