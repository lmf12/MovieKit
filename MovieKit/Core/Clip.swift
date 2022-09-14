//
//  Clip.swift
//  MovieKitDemo
//
//  Created by Lyman Li on 2022/9/11.
//  Copyright © 2022 Lyman Li. All rights reserved.
//

import AVFoundation

class Clip {
    var startTime: CMTime = .zero
    var timeRange: CMTimeRange {
        get {
            return CMTimeRange(start: .zero, duration: self.asset.duration)
        }
    }
    private(set) var asset: AVAsset
    
    init(asset: AVAsset) {
        self.asset = asset
    }
}
