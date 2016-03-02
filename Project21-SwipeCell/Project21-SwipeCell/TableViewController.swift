//
//  TableViewController.swift
//  Project21-SwipeCell
//
//  Created by LeeWong on 16/3/2.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    let reuserID = "patternCell"
    
    var data = [
        pattern(image: "1", name: "Pattern Building"),
        pattern(image: "2", name: "Joe Beez"),
        pattern(image: "3", name: "Car It's car"),
        pattern(image: "4", name: "Floral Kaleidoscopic"),
        pattern(image: "5", name: "Sprinkle Pattern"),
        pattern(image: "6", name: "Palitos de queso"),
        pattern(image: "7", name: "Ready to Go? Pattern"),
        pattern(image: "8", name: "Sets Seamless"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.tableFooterView = UIView()
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        self.tableView.estimatedRowHeight = 60
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        
        self.title = reuserID
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuserID, forIndexPath: indexPath) as! PatternCell
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        
        let pattern = data[indexPath.row]
        
        cell.contentLabel.text = pattern.name
        cell.iconImage.image = UIImage(named: pattern.image)

        return cell
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    
    //show delete
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .Normal, title: "Delete") { (action, indexPath) -> Void in
            print("press \(action.title) at \(indexPath.row)")
        }
        
        delete.backgroundColor = UIColor.grayColor()
        
        let share = UITableViewRowAction(style: .Normal, title: "Share") { (action, indexPath) -> Void in
            let firstActivityItem = self.data[indexPath.row]
            
            let activityViewController = UIActivityViewController(activityItems: [firstActivityItem.image as NSString], applicationActivities: nil)
            
            self.presentViewController(activityViewController, animated: true, completion: nil)
        }
        
        share.backgroundColor = UIColor.redColor()

        let download = UITableViewRowAction(style: .Normal, title: "Download") { (action, indexPath) -> Void in
            print("press \(action.title) at \(indexPath.row)")
        }
        
        download.backgroundColor = UIColor.blueColor()

    
        return [delete,share,download]
    }
    
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
    }

}
