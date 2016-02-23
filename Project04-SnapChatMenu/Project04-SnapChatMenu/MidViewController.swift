//
//  MidViewController.swift
//  Project04-SnapChatMenu
//
//  Created by LeeWong on 16/2/22.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit
import AVFoundation

class MidViewController: UIViewController {

    @IBOutlet weak var carmerView: UIView!
    
    var captureSession : AVCaptureSession?
    var stillImageOutput : AVCaptureStillImageOutput?
    var previewLayer : AVCaptureVideoPreviewLayer?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        previewLayer?.frame = carmerView.bounds
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = AVCaptureSessionPreset1920x1080
        
        let backCamera = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        var error : NSError?
        var input : AVCaptureDeviceInput!
        
        do {
            input = try AVCaptureDeviceInput(device: backCamera)
        } catch let error1 as NSError {
            error = error1
            input = nil
        }
        
        if (error == nil && captureSession?.canAddInput(input) != nil) {
            captureSession?.addInput(input)
            
            stillImageOutput = AVCaptureStillImageOutput()
            stillImageOutput?.outputSettings = [AVVideoCodecKey : AVVideoCodecJPEG]
            
            if (captureSession?.canAddOutput(stillImageOutput) != nil) {
                captureSession?.addOutput(stillImageOutput)
                
                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                previewLayer?.videoGravity = AVLayerVideoGravityResizeAspect
                previewLayer?.connection.videoOrientation = AVCaptureVideoOrientation.Portrait
                carmerView.layer.addSublayer(previewLayer!)
                captureSession?.startRunning()
            }
        }
    }
    
    @IBOutlet weak var photoImage: UIImageView!
    
    func didPressToTakePhoto() {
        if let videoConnection = stillImageOutput?.connectionWithMediaType(AVMediaTypeVideo) {
            videoConnection.videoOrientation = AVCaptureVideoOrientation.Portrait
            stillImageOutput?.captureStillImageAsynchronouslyFromConnection(videoConnection, completionHandler: { (sampleBuffer, error) -> Void in
                if sampleBuffer != nil {
                    let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(sampleBuffer)
                    let dataProvider = CGDataProviderCreateWithCFData(imageData)
                    let cgImageRef = CGImageCreateWithJPEGDataProvider(dataProvider, nil, true, CGColorRenderingIntent.RenderingIntentDefault)
                    
                    let image = UIImage(CGImage: cgImageRef!, scale: 1.0, orientation:UIImageOrientation.Right)
                    
                    self.photoImage.image = image
                    self.photoImage.hidden = false
                }
            })
        }
    }
    
    var didTakePhoto = Bool()
    
    func didPressTakeAnother() {
        if didTakePhoto {
            photoImage.hidden = true
            didTakePhoto = false
        } else {
            captureSession?.startRunning()
            didTakePhoto = true
            didPressToTakePhoto()
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        didPressTakeAnother()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}
