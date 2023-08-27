//
//  PhotoGalleryView.swift
//  MobileApp
//
//  Created by Yulia Ignateva on 23.04.2022.
//

import UIKit

final class PhotoGalleryModel {
    weak var delegate: PhotoGalleryModelDelegate?
    
    private let token: String
    private var photosUrl = [URL]()
    
    init(token: String) {
        self.token = token
    }
    
    // MARK: - Public methods
    
    func viewDidLoad(width: Int) {
        getData(forViewWithWidth: width)
    }
    
    func didSelectItem(_ item: Int) {
        delegate?.showPhoto(item: item, photoUrl: photosUrl)
    }
    
    func didTapExit() {
        TokenManager.shared.delete(token: token)
        delegate?.dismiss()
    }
    
    // MARK: - Private methods
    
    private func getData(forViewWithWidth: Int) {
        let url = "https://api.vk.com/method/photos.get?owner_id=-128666765&album_id=266310117&access_token="
        let request = URLRequest(url: URL(string: url + token + "&v=5.131")!)
        
        URLSession.shared.dataTask(with: request, completionHandler: { [weak self] data, response, error -> Void in
            do {
                guard let self = self else { return }
                guard let data = data else { return }
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(Model.self, from: data)
                
                DispatchQueue.main.async {
                    for item in responseModel.response.items {
                        let index = self.findSize(forViewWithWidth: forViewWithWidth, sizes: item.sizes)
                        self.photosUrl.append(item.sizes[index].url)
                    }
                    
                    self.delegate?.showPhotoGalleryView(photos: self.photosUrl)
                }
            } catch {
                guard let self = self else { return }
                DispatchQueue.main.async {
                    self.delegate?.showLoadingError()
                }
            }
        }).resume()
    }
    
    private func findSize(forViewWithWidth: Int, sizes: [Sizes]) -> Int {
        var minimumSize = 5000
        var index = 0

        for size in 0..<sizes.count {
            if sizes[size].width >= forViewWithWidth && sizes[size].width <= minimumSize {
                minimumSize = sizes[size].width
                index = size
            } else if sizes[size].height >= forViewWithWidth && sizes[size].height <= minimumSize {
                minimumSize = sizes[size].height
                index = size
            }
        }
        return index
    }
}
