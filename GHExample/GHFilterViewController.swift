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
    
    var dictionary: [String:[String]] = [
        "Language" : ["Swift", "Objective-C", "C++"],
        "Sort" : ["By Fork", "By Stars"],
        "Time" : ["Today", "3 Days", "Week", "Month", "Year", "All Time"]
    ]
    
    var selections: [String:String] = [
        "Language": "Swift",
        "Sort": "By Fork",
        "Time": "Today"
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
        guard dictionary != nil else {return 3}
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
            
            // show current selections for filter values
            if(self.selections[key] == valueArray?[indexPath.row]){
                cell.accessoryType = UITableViewCellAccessoryType.checkmark
            } else {
                cell.accessoryType = UITableViewCellAccessoryType.none
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = tableView.cellForRow(at: indexPath) as! GHFilterTableViewCell
        selectedCell.accessoryType = UITableViewCellAccessoryType.checkmark
        self.selections[(tableView.headerView(forSection: indexPath.section)?.textLabel?.text)!] = selectedCell.filterName.text
        print(selections)
        tableView.reloadData()
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

extension GHFilterViewController {}
