//
//  EditorTimelineBar.swift
//  MovieKitDemo
//
//  Created by Lyman Li on 2022/9/11.
//  Copyright © 2022 Lyman Li. All rights reserved.
//

import UIKit
import SnapKit

protocol EditorTimelineBarDelegate {
    func timelineBarDidClickAdd(timelineBar: EditorTimelineBar);
}

class EditorTimelineBar: UIView {
    
    var delegate: EditorTimelineBarDelegate?;
    
    private let addButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    // MARK: - Private
    
    private func setup() {
        setupAddButton()
    }
    
    private func setupAddButton() {
        addButton.setImage(UIImage(named: "icon_add"), for: .normal)
        addButton.addTarget(self, action: #selector(addButtonDidClick), for: .touchUpInside)
        addSubview(addButton)
        addButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 50, height: 50))
            make.center.equalTo(self)
        }
    }
    
    // MARK: - Action
    
    @objc func addButtonDidClick(_ sender: UIGestureRecognizer) {
        delegate?.timelineBarDidClickAdd(timelineBar: self)
    }
}
