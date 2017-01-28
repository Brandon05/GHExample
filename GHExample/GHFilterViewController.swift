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
    var dictionary: [String:[String]] = [
        "Language" : ["Swift", "Objective-C", "C++"],
        "Sort" : ["By Fork", "By Stars"],
        "Time" : ["Today", "3 Days", "Week", "Month", "Year", "All Time"]
    ]
    
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
        var keys = Array(dictionary.keys)
        return dictionary[keys[section]]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = filterTableView.dequeueReusableCell(withIdentifier: "FilterCell", for: indexPath) as? GHFilterTableViewCell else {
            fatalError("Unable to dequeueResuableCell withIdentifier: FilterCell")
        }
        var keyArray = Array(dictionary.keys)
        
        if  keyArray != nil {
            var key = keyArray[indexPath.section]
            var valueArray = dictionary[key]
            cell.filterName.text = valueArray?[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dictionary.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        tableView.sectionHeaderHeight = 35
        var keyArray = Array(dictionary.keys)
        return keyArray[section]
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
