//
//  VideoSplashViewController.swift
//  SplashVideoBackground
//
//  Created by LeeWong on 16/2/25.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit

enum ScalingMode {
    case Resize
    case ResizeAspect
    case ResizeAspectFill
}

class VideoSplashViewController: UIViewController {

    private let moviePlayer = AVPlayerViewController()
    private var moviePlayerSoundLevel : Float = 1.0
    
    var contentURL : NSURL = NSURL() {
        didSet {
            setMoviePlayer(contentURL)
        }
    }
    
    
    var videoFrame = CGRect()
    var startTimer:CGFloat = 0.0
    var duration:CGFloat = 0.0
    
    private var backgroundColor = UIColor.blackColor() {
        didSet {
            view.backgroundColor = backgroundColor
        }
    }
    
    var sound = true {
        didSet {
            if sound {
                moviePlayerSoundLevel = 1.0
            } else {
                moviePlayerSoundLevel = 0.0
            }
        }
    }
    
    var alpha = CGFloat() {
        didSet {
            moviePlayer.view.alpha = alpha
        }
    }
    
    var alwaysRepeat = true {
        didSet {
            if alwaysRepeat {
                NSNotificationCenter.defaultCenter().addObserver(self, selector: "playEnd", name: AVPlayerItemDidPlayToEndTimeNotification, object: moviePlayer.player?.currentItem)
            }
        }
    }
    
    var fillMode : ScalingMode = .ResizeAspectFill {
        didSet {
            switch fillMode {
            case .Resize :
                moviePlayer.videoGravity = AVLayerVideoGravityResize
            case .ResizeAspect :
                moviePlayer.videoGravity = AVLayerVideoGravityResizeAspect
            case .ResizeAspectFill :
                moviePlayer.videoGravity = AVLayerVideoGravityResizeAspectFill
            }
        }
    }
    
    
    
    
   @objc private func playEnd() {
        moviePlayer.player?.seekToTime(kCMTimeZero)
        moviePlayer.player?.play()
    }
    
    //set url 
    private func setMoviePlayer(url:NSURL) {
        let videoCutter = VideoCutter()
        videoCutter.cropVideoWithURL(videoURL: url, startTime: startTimer, duration: duration) { (videoPath, error) -> Void in
            if let path = videoPath as NSURL? {
                let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
                dispatch_async(dispatch_get_global_queue(priority, 0), { () -> Void in
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.moviePlayer.player = AVPlayer(URL: path)
                        self.moviePlayer.player?.play()
                        self.moviePlayer.player?.volume = self.moviePlayerSoundLevel
                    })
                })
            }
        }
    }
    
//#Mark lift cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        moviePlayer.view.frame = videoFrame
        moviePlayer.showsPlaybackControls = false
        view.addSubview(moviePlayer.view)
        view.sendSubviewToBack(moviePlayer.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
