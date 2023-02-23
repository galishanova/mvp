//
//  NewVersionsView.swift
//  iOSArchitecturesDemo
//
//  Created by Regina Galishanova on 27.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit
#if DEBUG
import SwiftUI
#endif

class NewVersionsView: UIView {
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.font = .boldSystemFont(ofSize: 23)
        label.numberOfLines = 3
        label.textColor = .label
        
        return label
    }()
    
    private(set) lazy var versionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.numberOfLines = 2
        label.textColor = .secondaryLabel
        return label
    }()
    
    private(set) lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 3
        label.textColor = .darkGray
        return label
    }()
    
    private(set) lazy var historyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("История версий", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 19)
        return button
    }()
    
    private(set) lazy var timeLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.preferredFont(forTextStyle: .headline)
            label.numberOfLines = 3
            label.textColor = .secondaryLabel
            return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    
    private func setupView() {
        self.addSubview(historyButton)
        self.addSubview(titleLabel)
        self.addSubview(versionLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(timeLabel)        
        
        NSLayoutConstraint.activate([

            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -250),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: versionLabel.topAnchor, constant: -20),
            
            
            versionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -250),
            versionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            versionLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -20),


            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            descriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -70),

            
            historyButton.topAnchor.constraint(equalTo: self.topAnchor, constant: -16),
            historyButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
             historyButton.bottomAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: -10),

            
            timeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            timeLabel.bottomAnchor.constraint(equalTo: versionLabel.bottomAnchor, constant: 0),
        ])
    }
    

}

#if DEBUG


struct NewVersionsView_Preview: PreviewProvider {
    static var previews: some View {
        
        let view = NewVersionsView()
        view.titleLabel.text = "Что нового"
        view.versionLabel.text = "Версия 4.1"
        view.descriptionLabel.text = "- Добавлены новые фичи"
        view.timeLabel.text = "6 дней назад"
        
        return Group {
            UIPreviewView(view)
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 388.0, height: 200))
            UIPreviewView(view)
                .previewLayout(.fixed(width: 388.0, height: 200))
        }
    }
}


#endif
