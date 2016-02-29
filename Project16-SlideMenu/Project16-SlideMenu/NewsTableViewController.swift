//
//  NewsTableViewController.swift
//  Project16-SlideMenu
//
//  Created by LeeWong on 16/2/29.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController,MenuTransitionManagerDelegate {
    
    let menuTransitionManager = MenuTransitionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tableView.registerNib("Main", forCellReuseIdentifier: "newscell")
//        self.tableView.registerClass(NewsCell.self, forCellReuseIdentifier: "newscell")
        self.title = "Everyday Moments"
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.view.backgroundColor = UIColor(red:0.062, green:0.062, blue:0.07, alpha:1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("newscell", forIndexPath: indexPath) as! NewsCell
        cell.contentView.backgroundColor = UIColor.clearColor()
        
        if indexPath.row == 0 {
            cell.bgImage.image = UIImage(named: "1")
            cell.titleLabel.text = "Love mountain."
            cell.descLabel.text = "Allen Wang"
            cell.iconImage.image = UIImage(named: "a")
            
        } else if indexPath.row == 1 {
            cell.bgImage.image = UIImage(named: "2")
            cell.titleLabel.text = "New graphic design - LIVE FREE"
            cell.descLabel.text = "Cole"
            cell.iconImage.image = UIImage(named: "b")
            
        } else if indexPath.row == 2 {
            cell.bgImage.image = UIImage(named: "3")
            cell.titleLabel.text = "Summer sand"
            cell.descLabel.text = "Daniel Hooper"
            cell.iconImage.image = UIImage(named: "c")
            
        } else {
            cell.bgImage.image = UIImage(named: "4")
            cell.titleLabel.text = "Seeking for signal"
            cell.descLabel.text = "Noby-Wan Kenobi"
            cell.iconImage.image = UIImage(named: "d")
            
        }
       

        return cell
    }

    func dismiss() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let menuTableViewController = segue.destinationViewController as! MenuViewController
        menuTableViewController.currentItem = self.title!
        menuTableViewController.transitioningDelegate = menuTransitionManager
        menuTransitionManager.delegate = self
        
    }
}
