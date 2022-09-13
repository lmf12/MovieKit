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
import BSImagePicker

class ImagePickerHandler {
    static func showImagePicker(currentVC : UIViewController) {
        let imagePicker = ImagePickerController()
        imagePicker.navigationBar.barTintColor = UIColor(rgba: Colors.darkGray)
        imagePicker.modalPresentationStyle = .fullScreen
        imagePicker.albumButton.tintColor = .white
        imagePicker.settings = configSettings()
        
        imagePicker.doneButton = configConfirmButton(target: imagePicker)
        imagePicker.cancelButton = configCloseButton(target: imagePicker)
        
        currentVC.presentImagePicker(imagePicker,
                                     select: { (asset) in
            imagePicker.updateConfirmButton()
        },
                                     deselect: { (asset) in
            imagePicker.updateConfirmButton()
        },
                                     cancel: nil,
                                     finish: { (assets) in
        })
    }
    
    static func configSettings() -> Settings {
        let settings = Settings.shared
        
        settings.theme.backgroundColor = UIColor(rgba: Colors.darkGray)
        settings.theme.selectionFillColor = UIColor(rgba: Colors.orange)
        settings.theme.selectionShadowColor = .white
        settings.theme.selectionStrokeColor = .white
        settings.theme.albumTitleAttributes[NSAttributedString.Key.foregroundColor] = UIColor.white
        settings.theme.previewTitleAttributes[NSAttributedString.Key.foregroundColor] = UIColor.clear
        settings.theme.previewSubtitleAttributes[NSAttributedString.Key.foregroundColor] = UIColor.clear
        
        settings.selection.max = 5
        settings.fetch.assets.supportedMediaTypes = [.image, .video]
        
        let options = settings.fetch.album.options
        settings.fetch.album.fetchResults = [
            PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: options),
            PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumVideos, options: options),
        ]
        
        return settings
    }
    
    static private func configCloseButton(target: Any) -> UIBarButtonItem {
        let imageView = UIImageView(image: UIImage(named: "icon_close"))
        imageView.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 28, height: 28))
        }
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: target, action: #selector(ImagePickerController.cancelButtonAction(_:))))
        
        return UIBarButtonItem(customView: imageView)
    }
    
    static private func configConfirmButton(target: Any) -> UIBarButtonItem {
        let button = UIButton()
        button.setTitle("添加", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(UIColor(rgba: Colors.lightGray), for: .disabled)
        button.addTarget(target, action: #selector(ImagePickerController.doneButtonAction(_:)), for: .touchUpInside)
        
        button.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 60, height: 30))
        }
        
        return UIBarButtonItem(customView: button)
    }
    
    
}
