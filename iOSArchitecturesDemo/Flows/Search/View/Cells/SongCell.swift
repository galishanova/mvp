//
//  SongCell.swift
//  iOSArchitecturesDemo
//
//  Created by Regina Galishanova on 28.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//


import UIKit
#if DEBUG
import SwiftUI
#endif

final class SongCell: UITableViewCell {
    
    // MARK: - Subviews
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0)
        return label
    }()
    
    private(set) lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 13.0)
        return label
    }()
    
    private(set) lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12.0)
        return label
    }()
    
    private(set) lazy var songIcon: UIImageView = {
        let image = UIImage(systemName: "music.quarternote.3")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.secondarySystemFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.contentMode = .scaleToFill
        imageView.tintColor = UIColor.systemRed
        return imageView
        
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    // MARK: - Methods
    
    func configure(with cellModel: SongCellModel) {
        self.titleLabel.text = cellModel.title
        self.subtitleLabel.text = cellModel.subtitle
        self.ratingLabel.text = cellModel.artist
    }
    
    // MARK: - UI
    
    override func prepareForReuse() {
        [self.titleLabel, self.subtitleLabel, self.ratingLabel].forEach { $0.text = nil }
    }
    
    private func configureUI() {
        self.addTitleLabel()
        self.addSubtitleLabel()
        self.addRatingLabel()
        self.addSongIcon()
    }
    
    private func addSongIcon() {
        self.contentView.addSubview(self.songIcon)
        NSLayoutConstraint.activate([
            self.songIcon.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 14.0),
            self.songIcon.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10.0),
            self.songIcon.rightAnchor.constraint(equalTo: self.titleLabel.leftAnchor, constant: -370.0),
            self.songIcon.heightAnchor.constraint(equalToConstant: 45),
            self.songIcon.widthAnchor.constraint(equalToConstant: 45)
            ])
    }
    private func addTitleLabel() {
        self.contentView.addSubview(self.titleLabel)
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
            self.titleLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 65.0),
            self.titleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }
    
    private func addSubtitleLabel() {
        self.contentView.addSubview(self.subtitleLabel)
        NSLayoutConstraint.activate([
            self.subtitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 4.0),
            self.subtitleLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 65.0),
            self.subtitleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }
    
    private func addRatingLabel() {
        self.contentView.addSubview(self.ratingLabel)
        NSLayoutConstraint.activate([
            self.ratingLabel.topAnchor.constraint(equalTo: self.subtitleLabel.bottomAnchor, constant: 4.0),
            self.ratingLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 65.0),
            self.ratingLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        songIcon.layer.borderColor = UIColor.systemGray2.cgColor
    }
    

}
#if DEBUG


struct SongCell_Preview: PreviewProvider {
    static var previews: some View {
        let view = SongCell()
        view.titleLabel.text = "Рюмка водки на столе"
        view.subtitleLabel.text = "The Best"
        view.ratingLabel.text = "Григорий Лепс"
        view.songIcon.image = UIImage(systemName: "music.quarternote.3")
        return Group {
            UIPreviewView(view)
                .preferredColorScheme(.light)
                .previewLayout(.fixed(width: 375, height: 75))
            UIPreviewView(view)
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 375, height: 75))
        }
    }
}

#endif
