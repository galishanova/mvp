//
//  AppDetailHeaderViewController.swift
//  iOSArchitecturesDemo
//
//  Created by v.prusakov on 7/6/21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppDetailHeaderViewController: UIViewController {
    
    private let app: ITunesApp
    private let imageDownloader = ImageDownloader()
    
    private var appDetailView: AppDetailHeaderView {
        return self.view as! AppDetailHeaderView
    }
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        self.view = AppDetailHeaderView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillData()
    }
    
    
    // MARK: - Private
    
    private func fillData() {
        self.downloadIcon()
        
        self.appDetailView.titleLabel.text = app.appName
        self.appDetailView.subtitleLabel.text = app.company
    }
    
    private func downloadIcon() {
        guard let url = self.app.iconUrl else { return }
        
        self.imageDownloader.getImage(fromUrl: url) { image, _ in
            self.appDetailView.iconImageView.image = image
        }
    }
    
}
