//
//  Cache.swift
//  MobileApp
//
//  Created by Yulia Ignateva on 15.06.2022.
//

import UIKit

final class Cache {
    static let shared = Cache()
    
    private let wrapped = NSCache<WrappedKey, UIImage>()
    
    private init() {}
    
    func insert(_ value: UIImage, forKey key: URL) {
        wrapped.setObject(value, forKey: WrappedKey(key: key))
    }
    
    func value(forKey key: URL) -> UIImage? {
        return wrapped.object(forKey: WrappedKey(key: key))
    }
    
    func removeValue(forKey key: URL) {
        wrapped.removeObject(forKey: WrappedKey(key: key))
    }
}

private extension Cache {
    final class WrappedKey: NSObject {
        let key: URL
        
        init(key: URL) {
            self.key = key
        }
        
        override var hash: Int {
            return key.hashValue
        }
        
        override func isEqual(_ object: Any?) -> Bool {
            guard let value = object as? WrappedKey else {
                return false
            }
            
            return value.key == key
        }
    }
}
