//
//  CatchingController.swift
//  FileDownloader
//
//  Created by Mostafa sayed on 5/18/19.
//  Copyright © 2019 Mostafa sayed. All rights reserved.
//

import Foundation
class CachingController: NSObject {
    static let shared = CachingController()
    private var currentAccessCounts = Dictionary<String, Int>()
    var cache = NSCache<AnyObject, AnyObject>()
    override init() {
        cache.countLimit = 3
    }
    func setObjectForKey(imageData: Data, imageKey: String) {
        cache.setObject(imageData as AnyObject, forKey: imageKey as AnyObject)
        if currentAccessCounts.count >= cache.countLimit {
            removedLeastUsedCache()
        }
        saveToAccessCounts(key: imageKey)
    }
    
    func getObjectForKey(imageKey: String) -> Data? {
        saveToAccessCounts(key: imageKey)
        return cache.object(forKey: imageKey as AnyObject) as? Data
    }
    func removeAllCache() {
        cache.removeAllObjects()
        currentAccessCounts.removeAll()
    }
    func removedLeastUsedCache() {
        var leastKey = ""
        var leastCount = 0
        for item in currentAccessCounts {
            if item.value < leastCount {
                leastCount = item.value
                leastKey = item.key
            }
        }
        cache.removeObject(forKey: leastKey as AnyObject)
    }
    func saveToAccessCounts(key: String) {
        var exists = false
        for item in currentAccessCounts where item.key == key {
            exists = true
        }
        if exists {
            currentAccessCounts[key] = (currentAccessCounts[key] ?? 0) + 1
        } else {
            currentAccessCounts[key] = 0
        }
    }
}
