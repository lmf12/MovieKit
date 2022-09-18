//
//  MovieModel.swift
//  MovieKitDemo
//
//  Created by Lyman Li on 2022/9/18.
//  Copyright © 2022 Lyman Li. All rights reserved.
//

import Foundation

class MovieModel {    
    private var videoTrack = MovieTrack()
        
    // MARK: - Public
    
    public func addVideoClip(clip: Clip) {
        let success = videoTrack.addClip(clip: clip)
        if !success {
            print("add video clip failed")
        }
    }
    
    public func buildTimeline() -> Timeline {
        let timeline = Timeline()
        timeline.tracks.append(videoTrack.clips)
        return timeline
    }
}
