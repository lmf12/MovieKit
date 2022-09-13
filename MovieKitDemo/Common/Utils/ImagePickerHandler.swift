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
    static func showImagePicker(currentVC : UIViewController, completion: (([UIImage], [PHAsset], Bool) -> Void)?) {
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
        ZLPhotoUIConfiguration.default().indexLabelBgColor = UIColor(rgba: Colors.orange)
        ZLPhotoUIConfiguration.default().sheetBtnTitleTintColor = UIColor(rgba: Colors.orange)
        ZLPhotoUIConfiguration.default().bottomToolViewBtnNormalBgColor = UIColor(rgba: Colors.orange)
        ZLPhotoUIConfiguration.default().bottomToolViewBtnNormalBgColorOfPreviewVC = UIColor(rgba: Colors.orange)
        ZLPhotoUIConfiguration.default().selectedBorderColor = UIColor(rgba: Colors.orange)
        ZLPhotoUIConfiguration.default().customImageForKey["zl_navBack"] = UIImage(named: "icon_back")
        ZLPhotoUIConfiguration.default().customImageForKey["zl_navClose"] = UIImage(named: "icon_close")
    }
}
