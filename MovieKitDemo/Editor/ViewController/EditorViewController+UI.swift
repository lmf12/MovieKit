//
//  EditorViewController+UI.swift
//  MovieKitDemo
//
//  Created by Lyman Li on 2022/9/11.
//  Copyright © 2022 Lyman Li. All rights reserved.
//

import UIKit
import SnapKit

extension EditorViewController {
    
    func setupUI() {
        view.addSubview(topToolBar)
        view.addSubview(bottomToolBar)
        view.addSubview(subBottomToolBar)
        view.addSubview(playerView)
        view.addSubview(timelineBar)
        
        topToolBar.snp.makeConstraints { make in
            make.left.right.top.equalTo(view)
            make.height.equalTo(100)
        }
        
        bottomToolBar.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(view)
            make.height.equalTo(120)
        }
        
        subBottomToolBar.snp.makeConstraints { make in
            make.left.right.equalTo(view)
            make.bottom.equalTo(bottomToolBar.snp.top)
            make.height.equalTo(50)
        }
        
        timelineBar.snp.makeConstraints { make in
            make.left.right.equalTo(view)
            make.bottom.equalTo(subBottomToolBar.snp.top)
            make.height.equalTo(200)
        }
        
        playerView.snp.makeConstraints { make in
            make.left.right.equalTo(view)
            make.top.equalTo(topToolBar.snp.bottom)
            make.bottom.equalTo(subBottomToolBar.snp.top)
        }
    }
}
