//
//  FileDownloader.swift
//  FileDownloader
//
//  Created by Mostafa sayed on 5/18/19.
//  Copyright © 2019 Mostafa sayed. All rights reserved.
//

import Foundation
class FileDownloader {
    private var request: URLRequest!
    private var session: URLSession!

    init(url: URL) {
        request = URLRequest(url: url)
        request.httpMethod = "GET"
    }

    func download(completion: @escaping (_ data: Data) -> Void)
    {
        if let cachedImage = CachingController.shared.getObjectForKey(key: "\(self.request!.url!)"){
            completion(cachedImage)
            return
        }
        session = URLSession(configuration: URLSession.shared.configuration, delegate: nil, delegateQueue:OperationQueue.main)
        
        session.dataTask(with: request)
        {
            (data, response, error) in
            
            guard let data = data else { return }
            CachingController.shared.setObjectForKey(data: data, key: "\(self.request!.url!)")
            completion(data)
            }.resume()
    }
    func stopDownload() {
        guard let session = session else { return }
        session.invalidateAndCancel()
        self.session = URLSession(configuration: URLSession.shared.configuration, delegate: nil, delegateQueue:OperationQueue.main)
    }
}
