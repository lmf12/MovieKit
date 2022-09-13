//
//  EditorViewController+EditorTimelineBarDelegate.swift
//  MovieKitDemo
//
//  Created by Lyman Li on 2022/9/12.
//  Copyright © 2022 Lyman Li. All rights reserved.
//

import UIKit

extension EditorViewController : EditorTimelineBarDelegate {
    func timelineBarDidClickAdd(timelineBar: EditorTimelineBar) {
        ImagePickerHandler.showImagePicker(currentVC: self) { (images, assets, isFull) in
            
        }
    }
}
