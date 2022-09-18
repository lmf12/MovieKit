//
//  ImagePickerHandler.swift
//  MovieKitDemo
//
//  Created by Lyman Li on 2022/9/12.
//  Copyright © 2022 Lyman Li. All rights reserved.
//

import UIKit
import Photos
import SnapKit
import ZLPhotoBrowser

class ImagePickerHandler {
    static func showImagePicker(currentVC : UIViewController,
                                willRequest: (([UIImage], [PHAsset], Bool) -> Void)?,
                                completion: (([UIImage], [AVAsset], Bool) -> Void)?) {
        showImagePicker(currentVC: currentVC) { (images, assets, isFull) in
            if let willRequest = willRequest {
                willRequest(images, assets, isFull)
            }
            DispatchQueue.global().async {
                var avassets: [AVAsset] = []
                let group = DispatchGroup()
                for asset in assets {
                    group.enter()
                    PHImageManager.default().requestAVAsset(forVideo: asset, options: nil) { avAsset, audioMix, info in
                        if let avAsset = avAsset {
                            avassets.append(avAsset)
                        }
                        group.leave()
                    }
                }
                group.wait()
                if let completion = completion {
                    DispatchQueue.main.async {
                        completion(images, avassets, isFull)
                    }
                }
            }
        }
    }
    
    static func showImagePicker(currentVC : UIViewController,
                                completion: (([UIImage], [PHAsset], Bool) -> Void)?) {
        setupConfiguration()
        let imagePicker = ZLPhotoPreviewSheet()
        imagePicker.selectImageBlock = completion
        imagePicker.showPhotoLibrary(sender: currentVC)
    }
    
    static func setupConfiguration() {
        ZLPhotoConfiguration.default().allowEditImage = false
        ZLPhotoConfiguration.default().allowEditVideo = false
        ZLPhotoConfiguration.default().allowTakePhoto = false
        ZLPhotoConfiguration.default().allowRecordVideo = false
        ZLPhotoConfiguration.default().allowTakePhotoInLibrary = false
        ZLPhotoConfiguration.default().allowSelectOriginal = false
        ZLPhotoConfiguration.default().allowSlideSelect = false
        ZLPhotoConfiguration.default().showPreviewButtonInAlbum = false
        ZLPhotoConfiguration.default().maxSelectCount = 5
        
        ZLPhotoUIConfiguration.default().previewVCBgColor = ZLPhotoUIConfiguration.default().albumListBgColor
        ZLPhotoUIConfiguration.default().indexLabelBgColor = UIColor(rgba: .orange)
        ZLPhotoUIConfiguration.default().sheetBtnTitleTintColor = UIColor(rgba: .orange)
        ZLPhotoUIConfiguration.default().bottomToolViewBtnNormalBgColor = UIColor(rgba: .orange)
        ZLPhotoUIConfiguration.default().bottomToolViewBtnNormalBgColorOfPreviewVC = UIColor(rgba: .orange)
        ZLPhotoUIConfiguration.default().selectedBorderColor = UIColor(rgba: .orange)
        ZLPhotoUIConfiguration.default().customImageForKey["zl_navBack"] = UIImage(named: "icon_back")
        ZLPhotoUIConfiguration.default().customImageForKey["zl_navClose"] = UIImage(named: "icon_close")
    }
}
