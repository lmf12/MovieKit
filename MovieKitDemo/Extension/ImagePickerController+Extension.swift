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
    
    @objc public func backButtonAction(_ sender: UIBarButtonItem) {
        popViewController(animated: true)
    }
    
    func updateConfirmButton() {
        let button = doneButton.customView as? UIButton
        button?.setTitle("添加" + (assetStore.count > 0 ? "(\(assetStore.count))" : ""), for: .normal)
        button?.isEnabled = assetStore.count >= settings.selection.min
    }
    
    public override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        configPreview(viewController: viewController)
        super.pushViewController(viewController, animated: animated)
    }
    
    private func configPreview(viewController: UIViewController) {
        viewController.view.backgroundColor = UIColor(rgba: Colors.darkGray)
        
        let imageView = UIImageView(image: UIImage(named: "icon_back"))
        imageView.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 28, height: 28))
        }
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ImagePickerController.backButtonAction(_:))))
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: imageView)
        
    }
}
