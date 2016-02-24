//
//  ViewController.swift
//  Project09-ImageScroller
//
//  Created by LeeWong on 16/2/24.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var scrollView = UIScrollView()
    var imageView = UIImageView(image: UIImage(named: "steve"))
    
    private func customUI() {
        self.view.addSubview(scrollView)
        scrollView.frame = self.view.frame
        scrollView.zoomScale = scrollView.minimumZoomScale
        scrollView.delegate = self
        
        setZoomScale(scrollView.bounds.size)
        scrollView.addSubview(imageView)
        //这样设置图片无法显示
//        let image = UIImage(named: "steve")
//        imageView.image = image
        scrollView.contentSize = (imageView.image?.size)!

        reCenterImage()
        
    }
    
    
    private func  reCenterImage() {
        let imageSize = imageView.frame.size
        let scrollSize = scrollView.frame.size
        
        let verticalMargin = (scrollSize.height > imageSize.height) ? (scrollSize.height - imageSize.height)/2.0 : 0.0
        let horizontalMargin = scrollSize.width > imageSize.width ? (scrollSize.width - imageSize.width)/2.0 : 0.0
        
        scrollView.contentInset = UIEdgeInsetsMake(verticalMargin, horizontalMargin, verticalMargin, horizontalMargin)
    }
    
    private func  setZoomScale(scrollViewSize:CGSize) {
        let imageSize = imageView.frame.size
        
        let widthScale = scrollViewSize.width / imageSize.width
        let heightScale = scrollViewSize.height / imageSize.height
        
        let miniumScale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = miniumScale
        scrollView.maximumZoomScale = 3.0
    }
    
//Mark: Lift Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        customUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setZoomScale(scrollView.bounds.size)
        
        if scrollView.zoomScale < scrollView.minimumZoomScale {
            scrollView.zoomScale = scrollView.minimumZoomScale
        }
        
        reCenterImage()
    }

}


extension ViewController : UIScrollViewDelegate {
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    func scrollViewDidZoom(scrollView: UIScrollView) {
        self.reCenterImage()
    }
}

