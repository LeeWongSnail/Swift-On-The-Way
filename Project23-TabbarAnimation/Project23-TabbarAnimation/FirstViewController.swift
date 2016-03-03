//
//  FirstViewController.swift
//  Project23-TabbarAnimation
//
//  Created by LeeWong on 16/3/3.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit

class FirstViewController: UITableViewController {

    let reuserID = "newsCell"
    
    var data = [
        
        news(iconImage: "allen", nickName: "Allen Wang", newImage: "giphy",tagText: "Read Later", newsTitle: "Giphy Cam Lets You Create And Share Homemade Gifs", newsTime: "5min  •  13:20", newsSource: "TheNextWeb"),
        
        news(iconImage: "Daniel Hooper", nickName: "Daniel Hooper", newImage: "my workflow flow",tagText: "Shared on Twitter", newsTitle: "Principle. The Sketch of Prototyping Tools", newsTime: "3min  •  12:57", newsSource: "SketchTalk"),
        
        news(iconImage: "davidbeckham", nickName: "David Beckhamg", newImage: "Ohlala",tagText: "Shared on Facebook", newsTitle: "Ohlala, An Uber For Escorts, Launches Its ‘Paid Dating’ Service In NYC", newsTime: "1min  •  12:59", newsSource: "TechCrunch"),
        
        news(iconImage: "bruce", nickName: "Bruce Fan", newImage: "Lonely Planet",tagText: "Shared on Weibo", newsTitle: "Lonely Planet’s new mobile app helps you explore major cities like a pro", newsTime: "5min  •  11:21", newsSource: "36Kr")
        
    ]
    
    
    func animateTable() {
        
        self.tableView.reloadData()
        
        let cells = tableView.visibleCells
        let tableHeight: CGFloat = tableView.bounds.size.height
        
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransformMakeTranslation(0, tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            let cell: UITableViewCell = a as UITableViewCell
            UIView.animateWithDuration(1.0, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = CGAffineTransformMakeTranslation(0, 0);
                }, completion: nil)
            
            index += 1
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.tableView.tableFooterView = UIView()
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 130
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        animateTable()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 10
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuserID, forIndexPath: indexPath) as! NewsCell

        let new = data[indexPath.row]
        
        cell.iconImageV.image = UIImage(named: new.iconImage)
        cell.nickNameLabel.text = new.nickName
        cell.nickNameLabel.sizeToFit()
        cell.tagLabel.text = new.tagText
        cell.newSourceLabel.text = new.newsSource
        cell.newsImageV.image = UIImage(named: new.newImage)
        cell.newsTitleLabel.text = new.newsTitle
        cell.timerLabel.text = new.newsTime

        return cell
    }
  

   override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 130
    }

}
