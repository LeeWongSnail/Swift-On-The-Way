//
//  FirstTableViewController.swift
//  Project13 - AnimateTableCell
//
//  Created by LeeWong on 16/2/26.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit

class FirstTableViewController: UITableViewController {

    let reuseID = "FirstTableViewController"
    
    var tableData = ["Personal Life", "Buddy Company", "#30 days Swift Project", "Body movement training", "AppKitchen Studio", "Project Read", "Others" ]
    
    
    private func animatedTableView() {
        //先将所有的cell的位置下移  然后在移上来
        self.tableView.reloadData()
        
        let height = self.tableView.frame.size.height
        
        let visibleCells = self.tableView.visibleCells
        
        for cell in visibleCells {
            cell.transform = CGAffineTransformMakeTranslation(0, height)
        }
        
        
        for cell in visibleCells {
            UIView.animateWithDuration(1.5, delay: 0.5, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                    cell.transform = CGAffineTransformMakeTranslation(0, -height)
                }, completion: nil)
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.tableView.tableFooterView = UIView()
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 60
        
        self.tableView.registerClass(FirstCell.self, forCellReuseIdentifier: reuseID)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        animatedTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tableData.count
    }

    
   override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseID, forIndexPath: indexPath) as! FirstCell

        cell.textLabel?.text = tableData[indexPath.row]
        cell.textLabel?.font = UIFont.systemFontOfSize(20)
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.backgroundColor = UIColor.clearColor()
        cell.selectionStyle = UITableViewCellSelectionStyle.None

        return cell
    }

    func colorforIndex(index: Int) -> UIColor {
        
        let itemCount = tableData.count - 1
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red: 1.0, green: color, blue: 0.0, alpha: 1.0)
        
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        cell.backgroundColor =  colorforIndex(indexPath.row)
        
    }
    
   override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("pushtoSecond", sender: nil)
    }

}
