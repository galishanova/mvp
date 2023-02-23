//
//  SearchSongViewIO.swift
//  iOSArchitecturesDemo
//
//  Created by Regina Galishanova on 28.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

protocol SearchSongViewInput: AnyObject {
    
    func setSearchSong(_ items: [ITunesSong])
    
    func throbber(show: Bool)
    func showError(error: Error)
    func showNoResults()
    func hideNoResults()
}

protocol SearchSongViewOutput: AnyObject {
    func viewDidSearch(with queury: String)
    
    func viewDidSelectSong(_ song: ITunesSong)
}
