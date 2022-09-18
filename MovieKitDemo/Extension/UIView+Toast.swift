//
//  UIView+Toast.swift
//  MovieKitDemo
//
//  Created by Lyman Li on 2022/9/18.
//  Copyright © 2022 Lyman Li. All rights reserved.
//

import UIKit
import Toast_Swift

extension UIView {
    func makeToastLoading() {
        self.isUserInteractionEnabled = false
        self.makeToastActivity(.center)
    }
    
    func hideToastLoading() {
        self.isUserInteractionEnabled = true
        self.hideToastActivity()
    }
}
