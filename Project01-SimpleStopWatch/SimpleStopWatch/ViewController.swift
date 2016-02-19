//
//  ViewController.swift
//  SimpleStopWatch
//
//  Created by LeeWong on 16/2/19.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    private let timerInterval = 0.1
    
    private var isPlaying = false
    
    var timer : NSTimer?
    
    private func addTimer() {
      timer = NSTimer.scheduledTimerWithTimeInterval(timerInterval, target: self, selector:"changeTime", userInfo: nil, repeats: true)
        
    }
    
    //这里注意 在使用selector调用某个私有方法的时候 必须在前面加上@objc
    @objc private func changeTime() {
        timeLabel.text = "\(Double(timeLabel.text!)! + timerInterval)"
    }
    
    @IBAction func pause() {
        timer?.invalidate()
        isPlaying = false
    }

    @IBAction func play() {
        if !isPlaying {
            addTimer()
            isPlaying = true
        }
        
    }
    
    @IBAction func reset() {
        timeLabel.text = "0.0"
        isPlaying = false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

