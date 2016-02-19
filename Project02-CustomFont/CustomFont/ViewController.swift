//
//  ViewController.swift
//  CustomFont
//
//  Created by LeeWong on 16/2/19.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular"]
    
    
    @IBOutlet weak var textView: UITextView!

    
    @IBAction func reset() {
         textView.font = UIFont(name: orginFont, size: 14)
    }
    
    
    var orginFont : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for family in UIFont.familyNames() {
            for font in UIFont.fontNamesForFamilyName(family){
                orginFont = font
            }
        }
    }
    
    @IBAction func ChangeColor() {
        let loc : Int = random() % 3
        textView.font = UIFont(name: fontNames[loc], size:20)
    }

}

