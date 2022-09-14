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
            var clips: [Clip] = []
            let group = DispatchGroup()
            var start = CMTime.zero
            for asset in assets {
                group.enter()
                PHImageManager.default().requestAVAsset(forVideo: asset, options: nil) { avAsset, audioMix, info in
                    if let avAsset = avAsset {
                        let clip = Clip(asset: avAsset)
                        clip.startTime = start
                        clips.append(clip)
                        start = CMTimeAdd(start, avAsset.duration)
                    }
                    group.leave()
                }
            }
            group.wait()
            let timeline = Timeline()
            timeline.clips = [clips]
            
            let builder = CompositionBuilder(timeline: timeline)
            let composition = builder.bulidComposition()
            let exportSession = composition.createAssetExportSession(exportPreset: nil)
            
            let fileName = String(format: "%f.m4v", NSDate.timeIntervalSinceReferenceDate * 1000)
            let path = NSTemporaryDirectory() + fileName
            
            exportSession?.outputFileType = .m4v
            exportSession?.outputURL = URL(fileURLWithPath: path)
            
            exportSession?.exportAsynchronously {
                PHPhotoLibrary.shared().performChanges {
                    PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: URL(fileURLWithPath: path))
                } completionHandler: { success, error in
                    if (success) {
                        print("保存成功")
                    }
                }

            }
        }
    }
}
