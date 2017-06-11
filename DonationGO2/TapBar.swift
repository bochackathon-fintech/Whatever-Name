//
//  TabBar.swift
//  MFSNetinfo
//
//  Created by Panayiotis on 30/03/2017.
//  Copyright © 2017 netinfo. All rights reserved.
//

import UIKit

class TapBar:UIView {
    
    
    var lineViewFrame:CGRect  {
        let height:CGFloat = 0.5
        let width:CGFloat = frame.width
        let x:CGFloat = 0
        let y:CGFloat = 0
        return CGRect.init(x: x, y: y, width: width, height: height)
    }
    
    lazy var lineView:UIView = {
        let view = UIView.init(frame: self.lineViewFrame)
        view.backgroundColor = UIColor.white
        return view
    }()
    
    
    var actions = [TapBarAction]()
    
    func addAction(action:TapBarAction) {
        action.delegate = self
        actions.append(action)
        stackView.addArrangedSubview(action)
        refreshLineViewPosition()
        
        if actions.count == 1 {
            selectedAction = action
        }
    }
    
    func removeAction(action:TapBarAction) {
        
        actions.removeElement(element: action)
        stackView.removeArrangedSubview(action)
        
        if action == selectedAction {
            selectedAction = nil
        }
    
    }
    
    lazy var stackView:UIStackView = {
        let stackView = UIStackView(frame: self.bounds)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
    var selectionLineHeight:CGFloat = 3 {
        didSet {
            refreshLineViewPosition()
        }
    }
    
    
    var selectionLineColor:UIColor = UIColor.init(red: 80/255, green: 210/255, blue: 195/255, alpha: 1) {
        didSet {
            selectionLineView.backgroundColor = self.selectionLineColor
        }
    }
    
    fileprivate var selectionLineFrame:CGRect {
        guard let selectedAction = selectedAction else {return CGRect.zero}
        let height = selectionLineHeight
        let width = frame.width / CGFloat(actions.count)
        let y = frame.height - height
        let x = selectedAction.frame.origin.x
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    lazy var selectionLineView:UIView = {
        let lineView = UIView(frame: self.selectionLineFrame)
        lineView.backgroundColor = self.selectionLineColor
        return lineView
    }()

    
    fileprivate func refreshLineViewPosition() {
        UIView.animate(withDuration: 0.25) { 
            self.selectionLineView.frame = self.selectionLineFrame
        }
    }
    
    var selectedAction:TapBarAction? {
        didSet {
            
            _ = actions.map({$0.isSelected = false})
            UIView.animate(withDuration: 0.25) { 
                self.selectedAction?.isSelected = true
            }
            refreshLineViewPosition()
        }
    }
    
    fileprivate func setup() {
        
        addSubview(stackView)
        addSubview(selectionLineView)
        addSubview(lineView)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        lineView.frame = lineViewFrame
        bringSubview(toFront: lineView)
        stackView.frame = bounds
         self.selectionLineView.frame = self.selectionLineFrame
    }
    
}

extension TapBar:TapBarActionDelegate {
    func tapBarActionDidGetSelected(tapBarAction: TapBarAction) {
        selectedAction = tapBarAction
    }
}
