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
        view.backgroundColor = UIColor(rgba: .darkGray)
        
        let bottomPanel = UIView()
        bottomPanel.backgroundColor = UIColor(rgba: .middleGray)
        view.addSubview(bottomPanel)
        
        setupTopToolBar()
        setupPlayerView()
        setupBottomToolBar()
        setupSubBottomToolBar()
        setupTimelineBar()
        
        bottomPanel.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(view)
            make.top.equalTo(timelineBar.snp.top)
        }
    }
    
    // MARK: - Private
    
    private func setupTopToolBar() {
        view.addSubview(topToolBar)
        topToolBar.snp.makeConstraints { make in
            make.left.right.equalTo(view)
            make.height.equalTo(50)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
    }
    
    private func setupPlayerView() {
        view.addSubview(playerView)
        playerView.snp.makeConstraints { make in
            make.left.right.equalTo(view)
            make.top.equalTo(topToolBar.snp.bottom)
        }
    }
    
    private func setupBottomToolBar() {
        view.addSubview(bottomToolBar)
        bottomToolBar.snp.makeConstraints { make in
            make.left.right.equalTo(view)
            make.height.equalTo(80)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func setupSubBottomToolBar() {
        view.addSubview(subBottomToolBar)
        subBottomToolBar.snp.makeConstraints { make in
            make.left.right.equalTo(view)
            make.bottom.equalTo(bottomToolBar.snp.top)
            make.height.equalTo(50)
        }
    }
    
    private func setupTimelineBar() {
        timelineBar.delegate = self
        view.addSubview(timelineBar)
        timelineBar.snp.makeConstraints { make in
            make.left.right.equalTo(view)
            make.top.equalTo(playerView.snp.bottom)
            make.bottom.equalTo(subBottomToolBar.snp.top)
            make.height.equalTo(180)
        }
    }
}
