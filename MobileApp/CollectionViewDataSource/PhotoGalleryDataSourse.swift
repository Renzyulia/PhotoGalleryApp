//
//  DataSourse.swift
//  MobileApp
//
//  Created by Yulia Ignateva on 23.04.2022.
//

import UIKit

final class PhotoGalleryDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    weak var delegate: PhotoGalleryDataSourceDelegate?
    
    private let photosUrl: [URL]
    private let photoItem: Int?
    private let reuseIdentifier = "Cell"
    
    init(photoItem: Int?, in photosUrl: [URL]) {
        self.photoItem = photoItem
        self.photosUrl = photosUrl
    }
    
    // MARK: - Public methods
    func didAttach(to collectionView: UICollectionView) {
        collectionView.register(PhotoGalleryCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosUrl.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoGalleryCell
        
        cell.configurePhotoGalleryCell(photoUrl: photosUrl[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectItem(indexPath.item)
    }
}
