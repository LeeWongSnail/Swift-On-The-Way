//
//  ViewController.swift
//  PullToRefresh
//
//  Created by LeeWong on 16/2/24.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let reuserID = "emojiCell"
    
    let favoriteEmoji = ["🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆"]
    let newFavoriteEmoji = ["🏃🏃🏃🏃🏃", "💩💩💩💩💩", "👸👸👸👸👸", "🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆" ]
    
    var data = [String]()
    
    var tableView = UITableView(frame: CGRectZero, style: UITableViewStyle.Plain)
    var refreshControl = UIRefreshControl()
    
    private func conifgTableView() {
        self.view.addSubview(tableView)
        self.tableView.frame = self.view.frame
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier:reuserID)
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 60;
        self.tableView.backgroundColor = UIColor.grayColor()
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.tableView.tableFooterView = UIView()
    }
    
    
    private func configRefreshControl() {
        self.tableView.addSubview(refreshControl)
        
        let attribute = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        self.refreshControl.attributedTitle = NSAttributedString(string: "\(NSDate()) 刷新", attributes: attribute)
        
        self.refreshControl.addTarget(self, action: "refresh", forControlEvents: UIControlEvents.ValueChanged)
    }
    
    
    @objc func refresh() {
        self.refreshControl.beginRefreshing()
        
        self.data += self.newFavoriteEmoji
        self.tableView.reloadData()
        self.refreshControl.endRefreshing()
        dispatch_after(1, dispatch_get_global_queue(0, 0)) { () -> Void in
            //在闭包中必须指明使用的变量的所属对象
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //可以研究一下设置导航栏上文字的颜色
        self.title = "PULL TO Refresh"
        self.navigationController?.navigationBar.barTintColor = UIColor.blackColor()
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor(),NSFontAttributeName:UIFont.systemFontOfSize(12)]
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named:""), forBarMetrics: UIBarMetrics.Compact)
        self.navigationController?.navigationBar.translucent = true
        
//        automaticallyAdjustsScrollViewInsets属性可以控制滚动内容是否会在bar下方显示。
//        设置导航栏下方不显示内容，此时导航栏无透明度
//        self.extendedLayoutIncludesOpaqueBars = YES;
        
        conifgTableView()
        configRefreshControl()
        data = favoriteEmoji
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController : UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuserID)!
        
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.font = UIFont.systemFontOfSize(50)
        cell.contentView.backgroundColor = UIColor.redColor()
        cell.textLabel?.textAlignment = NSTextAlignment.Center
        
        return cell
        
    }
}

extension ViewController : UITableViewDelegate {

}