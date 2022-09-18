//
//  EditorViewController+EditorTimelineBarDelegate.swift
//  MovieKitDemo
//
//  Created by Lyman Li on 2022/9/12.
//  Copyright © 2022 Lyman Li. All rights reserved.
//

import UIKit
import Photos
import AVFoundation

extension EditorViewController : EditorTimelineBarDelegate {
    func timelineBarDidClickAdd(timelineBar: EditorTimelineBar) {
        ImagePickerHandler.showImagePicker(currentVC: self) { (images, assets, isFull) in
            self.view.makeToastLoading()
        } completion: { (images, assets, isFull) in
            var start = CMTime.zero
            for asset in assets {
                let clip = Clip(asset: asset, startTime: start)
                start = CMTimeAdd(start, asset.duration)
                MovieManager.shared.addVideoClip(clip: clip)
            }
            
            MovieManager.shared.export { success, error in
                self.view.hideToastLoading()
                self.view.makeToast(success ? "保存成功" : "保存失败")
                MovieManager.shared.reset()
            }
        }
    }
}
