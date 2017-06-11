//
//  RocketView.swift
//  DonationGO2
//
//  Created by Christos Chadjikyriacou on 10/06/2017.
//  Copyright © 2017 Christos Chadjikyriacou. All rights reserved.
//

import UIKit

class RocketView:UIImageView {
    var view: UIView! {
        didSet {
            view.backgroundColor = UIColor.clear
        }
    }
    
    @IBOutlet weak var barView: UIView!
 
    @IBOutlet weak var barWidthConstraint: NSLayoutConstraint!
    
    var value:CGFloat = 0 {
        
        didSet {
            self.barWidthConstraint.constant = self.value
            UIView.animate(withDuration: 1.5) {
                self.view.layoutIfNeeded()
            }
           
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        barView.layer.cornerRadius = barView.frame.height / 2
        barView.clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: RocketView.nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
}
