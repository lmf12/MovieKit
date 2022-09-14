//
//  CompositionBuilder.swift
//  MovieKitDemo
//
//  Created by Lyman Li on 2022/9/15.
//  Copyright © 2022 Lyman Li. All rights reserved.
//

import AVFoundation

class CompositionBuilder {
    private var timeline: Timeline
    private var mutComposition: AVMutableComposition?
    
    init(timeline: Timeline) {
        self.timeline = timeline
    }
    
    // MARK: - Public
    
    public func bulidComposition() -> Composition {
        let mutComposition = AVMutableComposition()
        self.mutComposition = mutComposition
        for clips in timeline.clips {
            self.addCompositionTrack(type: .video, clips: clips)
            self.addCompositionTrack(type: .audio, clips: clips)
        }
        return Composition(composition: mutComposition.copy() as! AVComposition)
    }
    
    // MARK: - Private
    
    private func addCompositionTrack(type: AVMediaType, clips: [Clip]) {
        if clips.isEmpty {
            return
        }
        let trackID = kCMPersistentTrackID_Invalid
        let compositionTrack = self.mutComposition?.addMutableTrack(withMediaType: type, preferredTrackID: trackID)
        for clip in clips {
            if let assetTrack = clip.asset.tracks(withMediaType: type).first {
                do {
                    try compositionTrack?.insertTimeRange(clip.timeRange, of: assetTrack, at: clip.startTime)
                } catch let error {
                    print(error)
                }
            }
            
        }
    }
}
