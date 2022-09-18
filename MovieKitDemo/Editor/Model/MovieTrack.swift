//
//  MovieTrack.swift
//  MovieKitDemo
//
//  Created by Lyman Li on 2022/9/18.
//  Copyright © 2022 Lyman Li. All rights reserved.
//

import Foundation
import CoreMedia

class MovieTrack {
    private(set) var clips: [Clip] = []
    
    // MARK: - Private
    
    public func canAdd(clip: Clip) -> Bool {
        if CMTimeCompare(clip.startTime, .zero) < 0 {
            return false
        }
        for clipItem in clips {
            if clip.isOverlap(clip: clipItem) {
                return false
            }
        }
        return true
    }
    
    public func addClip(clip: Clip) -> Bool {
        if !canAdd(clip: clip) {
            return false
        }
        clips.append(clip)
        clips.sort { clip1, clip2 in
            return CMTimeCompare(clip1.startTime, clip2.startTime) < 0
        }
        return true
    }
}
