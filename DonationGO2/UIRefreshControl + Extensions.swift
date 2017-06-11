//
//  UIRefreshControl + Extensions.swift
//  MFSNetinfo
//
//  Created by Panayiotis on 24/04/2017.
//  Copyright © 2017 netinfo. All rights reserved.
//

import UIKit

extension UIRefreshControl {
    func beginRefreshingManually() {
        if let scrollView = superview as? UIScrollView {
            scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentOffset.y - frame.height), animated: true)
        }
        beginRefreshing()
    }
}
