//
//  NewVersionsViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Regina Galishanova on 27.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

import UIKit

class NewVersionsViewController: UIViewController {
    
    private let app: ITunesApp
    
    private var newVersionsView: NewVersionsView {
        return self.view as! NewVersionsView
    }
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        self.view = NewVersionsView()
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
        
        func timeAgoStringFromDate(date: Date) -> String? {
            let formatter = DateComponentsFormatter()
            formatter.unitsStyle = .full

            let now = Date()

            let calendar = NSCalendar.current
            let components1: Set<Calendar.Component> = [.year, .month, .weekOfMonth, .day, .hour, .minute, .second]
            let components = calendar.dateComponents(components1, from: date, to: now)

            if components.year ?? 0 > 0 {
                formatter.allowedUnits = .year
            } else if components.month ?? 0 > 0 {
                formatter.allowedUnits = .month
            } else if components.weekOfMonth ?? 0 > 0 {
                formatter.allowedUnits = .weekOfMonth
            } else if components.day ?? 0 > 0 {
                formatter.allowedUnits = .day
            } else if components.hour ?? 0 > 0 {
                formatter.allowedUnits = [.hour]
            } else if components.minute ?? 0 > 0 {
                formatter.allowedUnits = .minute
            } else {
                formatter.allowedUnits = .second
            }

            let formatString = NSLocalizedString("%@ left", comment: "Used to say how much time has passed. e.g. '2 hours ago'")

            guard let timeString = formatter.string(for: components) else {
                return nil
            }
            return String(format: formatString, timeString)
        }
        
        
        let versionDate = app.currentVersionReleaseDate
        
        let dateFormatter = DateFormatter()
         dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
         dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
         let date = dateFormatter.date(from: versionDate ?? "")
        print(date ?? "")
        

        let timeAgo = timeAgoStringFromDate(date: date!)
        print(timeAgo!)
        
        self.newVersionsView.titleLabel.text = "Что нового"
        self.newVersionsView.versionLabel.text = "Версия \(app.versionNumber!)"
        self.newVersionsView.descriptionLabel.text = app.releaseNotes
        self.newVersionsView.timeLabel.text = timeAgo
    }

    
}
