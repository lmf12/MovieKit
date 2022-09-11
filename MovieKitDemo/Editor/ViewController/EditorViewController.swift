//
//  EditorViewController.swift
//  MovieKitDemo
//
//  Created by Lyman Li on 2022/9/11.
//  Copyright © 2022 Lyman Li. All rights reserved.
//

import UIKit

class EditorViewController: BaseViewController {
    
    let topToolBar = EditorTopToolBar()
    let bottomToolBar = EditorBottomToolBar()
    let subBottomToolBar = EditorSubBottomToolBar()
    let playerView = EditorPlayerView()
    let timelineBar = EditorTimelineBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Private
    
    private func setup() {
        setupUI()
    }
}
