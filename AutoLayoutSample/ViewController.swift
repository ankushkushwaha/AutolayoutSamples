//
//  ViewController.swift
//  Label
//
//  Created by Ankush Kushwaha on 12/19/17.
//  Copyright © 2017 Power Deriva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var customViewViaXib: CustomView!
    @IBOutlet weak var customViewViaStoryboard: CustomView!
   
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var lable1: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customView = CustomView.init(frame: CGRect(x: 20, y: 20, width: 100, height: 300))
        
        self.customViewViaXib = customView
        self.view.addSubview(customView)        
    }

    @IBAction func buttonAction(_ sender: Any) {
        
        customViewViaStoryboard.largeText()
        customViewViaXib.largeText()
        
        self.lable1.text = "1234567890\n1234567890\n1234567890\n1234567890\n1234567890\n1234567890\n1234567890\n1234567890"
        self.label2.text = "123456789012345678901234567890\n1234567890\n1234567890\n1234567890\n1234567890\n1234567890"
    }
    
    @IBAction func smallButtonAction(_ sender: Any) {
        
        customViewViaStoryboard.smallText()
        customViewViaXib.smallText()

        self.lable1.text = "xxx"
        
        self.label2.text = "xxx"
        
 
    }
}

