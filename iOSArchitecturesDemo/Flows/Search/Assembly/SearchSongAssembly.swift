//
//  SearchSongAssembly.swift
//  iOSArchitecturesDemo
//
//  Created by Regina Galishanova on 28.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

enum SearchSongAssembly {
    static func make() -> SearchSongViewController {

        let searchSongViewController = SearchSongViewController()
        let searchSongPresenter = SearchSongPresenter()
        
        searchSongViewController.output = searchSongPresenter
        searchSongPresenter.view = searchSongViewController
        
        return searchSongViewController
    }
}
