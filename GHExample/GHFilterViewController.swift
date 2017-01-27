//
//  GHFilterViewController.swift
//  GHExample
//
//  Created by Hugh A. Miles II on 1/26/17.
//  Copyright © 2017 Brandon Sanchez. All rights reserved.
//

import UIKit

class GHFilterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var filterTableView: UITableView!
    
    var filter = ["testing", "this", ":"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.filterTableView.delegate = self
        self.filterTableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Mark: - UITableView Delegate and DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard filter != nil else {return 3}
        return filter.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = filterTableView.dequeueReusableCell(withIdentifier: "FilterCell", for: indexPath) as? GHFilterTableViewCell else {
            fatalError("Unable to dequeueResuableCell withIdentifier: FilterCell")
        }
        
        if filter != nil {
            cell.filterName.text = filter[indexPath.row]
            //print(repos[indexPath.row].owner)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        tableView.sectionHeaderHeight = 100
        return "title"
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
