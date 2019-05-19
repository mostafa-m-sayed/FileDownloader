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
    private var hitsCount = Dictionary<String, Int>()
    var cache = NSCache<AnyObject, AnyObject>()
    var cacheCountLimit = 10

    override private init() {
        super.init()
        cache.countLimit = cacheCountLimit
    }
    func setObjectForKey(data: Data, key: String) {
        cache.setObject(data as AnyObject, forKey: key as AnyObject)
        if hitsCount.count >= cache.countLimit {
            removedLeastUsedCache()
        }
        updateHitsCount(key: key)
    }
    
    func getObjectForKey(key: String) -> Data? {
        updateHitsCount(key: key)
        return cache.object(forKey: key as AnyObject) as? Data
    }
    func removeAllCache() {
        cache.removeAllObjects()
        hitsCount.removeAll()
    }
    func removedLeastUsedCache() {
        var leastKey = ""
        var leastCount = 0
        for item in hitsCount {
            if item.value < leastCount {
                leastCount = item.value
                leastKey = item.key
            }
        }
        cache.removeObject(forKey: leastKey as AnyObject)
    }
    
    func updateHitsCount(key: String) {
        var exists = false
        for item in hitsCount where item.key == key {
            exists = true
        }
        if exists {
            hitsCount[key] = (hitsCount[key] ?? 0) + 1
        } else {
            hitsCount[key] = 0
        }
    }
}
