//
//  SongCellModel.swift
//  iOSArchitecturesDemo
//
//  Created by Regina Galishanova on 28.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

struct SongCellModel {
    let title: String
    let subtitle: String?
    let artist: String?
}

final class SongCellModelFactory {
    
    static func cellModel(from model: ITunesSong) -> SongCellModel {
        return SongCellModel(title: model.trackName,
                            subtitle: model.collectionName,
                            artist: model.artistName >>- { "\($0)" })
    }
}
