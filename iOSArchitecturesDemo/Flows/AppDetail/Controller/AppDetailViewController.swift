//
//  AppDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 20.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppDetailViewController: UIViewController {
    
    public var app: ITunesApp!
    lazy var headerViewController = AppDetailHeaderViewController(app: app)
    lazy var newVersionsViewController = NewVersionsViewController(app: app)
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
    }
    
    // MARK: - Private
    
    func configureView() {
        self.view.backgroundColor = .systemBackground
        self.configureNavigationController()
        self.addHeaderViewController()
        self.addNewVersionsViewController()
    }
    
    private func configureNavigationController() {
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    private func addHeaderViewController() {
        self.addChild(headerViewController)
        let headerView = headerViewController.view!
        self.view.addSubview(headerView)
        headerViewController.didMove(toParent: self)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    private func addNewVersionsViewController() {
        
        self.addChild(newVersionsViewController)
        let newVersionsView = newVersionsViewController.view!
        self.view.addSubview(newVersionsView)
        newVersionsViewController.didMove(toParent: self)
        
        newVersionsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newVersionsView.topAnchor.constraint(equalTo: self.headerViewController.view.bottomAnchor),
            newVersionsView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            newVersionsView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
        ])
    }

}
