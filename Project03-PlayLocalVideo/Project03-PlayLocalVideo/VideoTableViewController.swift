//
//  VideoTableViewController.swift
//  Project03-PlayLocalVideo
//
//  Created by LeeWong on 16/2/22.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoTableViewController: UITableViewController,VideoCellPlayBtnDidClick {

    var data = [String]()
    
    private func loadLocalData() {
        for index in 1...6 {
            let name = "videoScreenshot0\(index)"
            data.append(name)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Play Local Video"
        tableView.rowHeight = 150
        loadLocalData()
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
        return data.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("videocell", forIndexPath: indexPath) as! VideoCell
        cell.delegate = self
        let imageName = data[indexPath.row]
        cell.videoBg.image = UIImage(named:imageName)
    

        return cell
    }


    func playBtnDidClick(cell: VideoCell) {
        //get url
        let url = NSBundle.mainBundle().pathForResource("emoji zone", ofType: "mp4") ?? ""
        
        let player = AVPlayer(URL:NSURL.fileURLWithPath(url))
        
        let playController = AVPlayerViewController()
        playController.player = player
        
        self.presentViewController(playController, animated:true, completion: {
            playController.player?.play()
        })
    }


}
