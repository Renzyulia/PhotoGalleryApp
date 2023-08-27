//
//  PhotoGalleryCell.swift
//  MobileApp
//
//  Created by Yulia Ignateva on 24.04.2022.
//

import UIKit

final class PhotoGalleryCell: UICollectionViewCell {
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    
    func configurePhotoGalleryCell(photoUrl: URL) {
        imageView.loadImage(with: photoUrl)
    }
    
    func configurePhotoGallerySelectedCell(photoUrl: URL) {
        layer.borderWidth = 2
        layer.borderColor = UIColor.green.cgColor
        imageView.loadImage(with: photoUrl)
    }
    
    // MARK: - Private methods
    
    private func configureSubviews() {
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        contentView.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])
    }
}
