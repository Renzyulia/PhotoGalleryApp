//
//  PhotoModel.swift
//  MobileApp
//
//  Created by Yulia Ignateva on 25.04.2022.
//

import UIKit

final class PhotoModel {
    weak var delegate: PhotoModelDelegate?
    
    private let token: String
    
    init(token: String) {
        self.token = token
    }
    
    // MARK: - Public methods
    
    func didSelectItem(_ item: Int) {
        getData(item: item)
    }
    
    func didTapShareButton() {
        delegate?.showShareMenu()
    }
    
    func photoSavedSuccessfully() {
        delegate?.showSuccessfulSaving()
    }
    
    func photoSavingError() {
        delegate?.showSavingError()
    }
    
    // MARK: - Private methods
    
    private func getData(item: Int) {
        let url = "https://api.vk.com/method/photos.get?owner_id=-128666765&album_id=266310117&access_token="
        let request = URLRequest(url: URL(string: url + token + "&v=5.131")!)
        
        URLSession.shared.dataTask(with: request, completionHandler: { [weak self] data, response, error -> Void in
            do {
                guard let self = self else { return }
                guard let data = data else { return }
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(Model.self, from: data)
                
                DispatchQueue.main.async {
                    let date = NSDate(timeIntervalSince1970: TimeInterval(responseModel.response.items[item].date)) as Date
                    let transformDate = date.transform()
                    let index = self.findTheLargestSize(responseModel.response.items[item].sizes)
                    let url = responseModel.response.items[item].sizes[index].url

                    self.delegate?.showPhotoView(url, byDate: transformDate, item: item)
                }
            } catch {
                DispatchQueue.main.async {
                    self?.delegate?.showLoadingPhotoError()
                }
            }
        }).resume()
    }
    
    private func findTheLargestSize(_ sizes: [Sizes]) -> Int {
        var maximumSize = 0
        var index = 0

        for size in 0..<sizes.count {
            if sizes[size].width > maximumSize {
                maximumSize = sizes[size].width
                index = size
            } else if sizes[size].height > maximumSize {
                maximumSize = sizes[size].height
                index = size
            }
        }
        return index
    }
}
