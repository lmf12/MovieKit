//
//  MovieManager.swift
//  MovieKitDemo
//
//  Created by Lyman Li on 2022/9/18.
//  Copyright © 2022 Lyman Li. All rights reserved.
//

import AVFoundation
import Photos

class MovieManager {
    static let shared = MovieManager()
    private var movieModel = MovieModel()
    
    private init() {
    }
    
    // MARK: - Public
    public func addVideoClip(clip: Clip) {
        movieModel.addVideoClip(clip: clip)
    }
    
    public func export(completion: ((Bool, Error?) -> Void)? = nil) {
        let timeline = movieModel.buildTimeline()
        let builder = CompositionBuilder(timeline: timeline)
        let composition = builder.bulidComposition()
        let exportSession = composition.createAssetExportSession(exportPreset: nil)
        
        let tmpPath = tmpOutputPath()
        let tmpURL = URL(fileURLWithPath: tmpPath)
        exportSession?.outputFileType = .m4v
        exportSession?.outputURL = tmpURL
        
        exportSession?.exportAsynchronously {
            PHPhotoLibrary.shared().performChanges {
                PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: tmpURL)
            } completionHandler: { success, error in
                if let completion = completion {
                    DispatchQueue.main.async {
                        completion(success, error)
                    }
                }
            }

        }
    }
    
    public func reset() {
        movieModel = MovieModel()
    }
    
    // MARK: - Private
    
    private func tmpOutputPath() -> String {
        let fileName = String(format: "%f.m4v", NSDate.timeIntervalSinceReferenceDate * 1000)
        let path = NSTemporaryDirectory() + fileName
        return path
    }
}
