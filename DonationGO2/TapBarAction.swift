//
//  TapBarAction.swift
//  MFSNetinfo
//
//  Created by Panayiotis on 30/03/2017.
//  Copyright © 2017 netinfo. All rights reserved.
//

import UIKit

protocol TapBarActionDelegate:class {
    func tapBarActionDidGetSelected(tapBarAction:TapBarAction)
}

class TapBarAction:UIView {
    
    var text:String? {
        didSet {
            button.setTitle(text, for: .normal)
        }
    }
    var image:UIImage? {
        didSet {
            button.setImage(image, for: .normal)
        }
    }
    
    var unselectedTextColor:UIColor = UIColor.black {
        didSet {
            button.setTitleColor(unselectedTextColor, for: .normal)
        }
    }
    
    var selectedTextColor:UIColor = UIColor.black {
        didSet {
            button.setTitleColor(selectedTextColor, for: .selected)
        }
    }

    
    var isSelected:Bool = false{
        didSet {
            button.isSelected = isSelected
        }
    }
    
    var action:((_ action:TapBarAction) -> Void)?
    
    var font:UIFont = UIFont.init(name: "Avenir-Book", size: 16)! {
        didSet {
            button.titleLabel?.font = font
        }
    }
    
    weak var delegate:TapBarActionDelegate?
    
    lazy var button:UIButton = {
        let button = UIButton(frame: self.bounds)
        let selector = #selector(actionDidTapped)
        button.backgroundColor = UIColor.clear
        button.titleLabel?.font = self.font
        button.addTarget(self, action: selector, for: .touchUpInside)
        button.setImage(self.image, for: .normal)
        button.setTitle(self.text, for: .normal)
        button.setTitleColor(self.unselectedTextColor, for: .normal)
        button.setTitleColor(self.selectedTextColor, for: .selected)
        return button
    }()
    
    fileprivate func setup() {
        backgroundColor = UIColor.clear
        addSubview(button)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        button.frame = bounds
    }
    
    
    func actionDidTapped() {
        delegate?.tapBarActionDidGetSelected(tapBarAction: self)
        action?(self)
    }
    
    init(text:String? = nil,image:UIImage? = nil,action:((_ action:TapBarAction) -> Void)? = nil) {
        super.init(frame: CGRect.zero)
        
        self.text = text
        self.image = image
        self.action = action
        
        setup()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
