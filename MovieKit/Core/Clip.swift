//
//  Clip.swift
//  MovieKitDemo
//
//  Created by Lyman Li on 2022/9/11.
//  Copyright © 2022 Lyman Li. All rights reserved.
//

import AVFoundation

class Clip {
    private(set) var asset: AVAsset
    private(set) var startTime: CMTime
    private var targetTimeRange: CMTimeRange = .zero
        
    var timeRange: CMTimeRange {
        get {
            return CMTimeRangeEqual(targetTimeRange, .zero) ? sourceTimeRange : targetTimeRange
        }
        set {
            targetTimeRange = newValue
        }
    }
    
    var sourceTimeRange: CMTimeRange {
        get {
            return CMTimeRange(start: .zero, duration: self.asset.duration)
        }
    }
    
    init(asset: AVAsset, startTime: CMTime, timeRange: CMTimeRange = .zero) {
        self.asset = asset
        self.startTime = startTime
        self.timeRange = timeRange
    }
}

extension Clip {
    /// 片段是否重叠
    func isOverlap(clip: Clip) -> Bool {
        return ((CMTimeCompare(self.startTime, clip.startTime) < 0 &&
                CMTimeCompare(self.timeRange.end, clip.startTime) > 0) ||
                (CMTimeCompare(clip.startTime, self.startTime) < 0 &&
                 CMTimeCompare(clip.timeRange.end, self.startTime) > 0))
    }
}
