//
//  CustomView.swift
//  Label
//
//  Created by Ankush Kushwaha on 12/19/17.
//  Copyright © 2017 Power Deriva. All rights reserved.
//

import UIKit

class CustomView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    // https://medium.com/@brianclouser/swift-3-creating-a-custom-view-from-a-xib-ecdfe5b3a960

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInitWithFrame(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInitWithCoder(aDecoder: aDecoder)
    }
    
    func commonInitWithCoder(aDecoder: NSCoder) // for init via storyboard (interface builder)
    {
        Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)
        addSubview(contentView)
        
        contentView.frame = self.bounds
        
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func commonInitWithFrame(frame: CGRect) // for init programatically
    {
        Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)
        addSubview(contentView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false // so that we can change the frame dynamically
        
        contentView.frame = self.bounds

        // We need this width constraint. If we dont use this constraint(we are not using hight constraint) then width or height is being defined by the UIlabel size, as a result of large text, label can have width more than the screen size. comment following line and you will see the bug
        
        let horizontalConstraintForContentView = NSLayoutConstraint(item: contentView, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: 0)
        let verticalConstraintForContentView = NSLayoutConstraint(item: contentView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0)

        NSLayoutConstraint.activate([horizontalConstraintForContentView, verticalConstraintForContentView])
        
        let widthConstraintForContentView = NSLayoutConstraint(item: contentView, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: frame.width)

        let widthConstraintForView = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: frame.width)

        NSLayoutConstraint.activate([widthConstraintForView, widthConstraintForContentView])
        

    }

    func largeText()
    {
        self.label1.text = "1234567890\n1234567890\n1234567890\n1234567890\n1234567890\n1234567890\n1234567890\n1234567890"
        
        self.label2.text = "1234567890123456789012345678901234567890\n1234567890\n1234567890\n1234567890\n1234567890"

    }
    
    func smallText()
    {
        self.label1.text = "Small text"
        
        self.label2.text = "Small text"
        
    }

}
