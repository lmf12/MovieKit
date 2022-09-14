//
//  Composition.swift
//  MovieKitDemo
//
//  Created by Lyman Li on 2022/9/11.
//  Copyright © 2022 Lyman Li. All rights reserved.
//

import AVFoundation

class Composition {
    private var composition: AVComposition
    
    init(composition: AVComposition) {
        self.composition = composition
    }

    // MARK: - Public
    
    // 创建可播放项目
    public func createPlayerItem() -> AVPlayerItem {
        return AVPlayerItem(asset: composition.copy() as! AVAsset)
    }
    
    // 创建可导出项目
    public func createAssetExportSession(exportPreset: String?) -> AVAssetExportSession? {
        return AVAssetExportSession(asset: composition.copy() as! AVAsset,
                                    presetName: exportPreset ?? AVAssetExportPresetHighestQuality)
    }
}
