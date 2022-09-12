//
//  ImagePickerController+Extension.swift
//  MovieKitDemo
//
//  Created by Lyman Li on 2022/9/13.
//  Copyright © 2022 Lyman Li. All rights reserved.
//

import BSImagePicker

extension ImagePickerController {
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @objc public func cancelButtonAction(_ sender: UIBarButtonItem) {
        imagePickerDelegate?.imagePicker(self, didCancelWithAssets: assetStore.assets)
        
        if settings.dismiss.enabled {
            dismiss(animated: true)
        }
    }
    
    @objc public func doneButtonAction(_ sender: UIBarButtonItem) {
        imagePickerDelegate?.imagePicker(self, didFinishWithAssets: assetStore.assets)
        
        if settings.dismiss.enabled {
            dismiss(animated: true)
        }
    }
    
    func updateConfirmButton() {
        let button = doneButton.customView as? UIButton
        button?.setTitle("添加" + (assetStore.count > 0 ? "(\(assetStore.count))" : ""), for: .normal)
        button?.isEnabled = assetStore.count >= settings.selection.min
    }
}
