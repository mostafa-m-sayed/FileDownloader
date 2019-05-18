//
//  Service.swift
//  FileDownloader
//
//  Created by Mostafa sayed on 5/18/19.
//  Copyright © 2019 Mostafa sayed. All rights reserved.
//

import Foundation
import Alamofire
enum URLs:String
{
    case baseURL = "http://pastebin.com/raw/wgkJgazE"
}
class Service {
    var mockModel: String?
    func getData(completion: @escaping ([ImageItem]?) -> Void) {
        if mockModel != nil {
            if let data = mockModel!.data(using: .utf8) {
               completion(decodeJson(data: data))
            }
        }
        Alamofire.request(URLs.baseURL.rawValue,
                          method: .get,
                          parameters: nil)
            .validate()
            .responseJSON { response in
                guard response.result.isSuccess else {
                    print("Error while fetching remote rooms: \(String(describing: response.result.error))")
                    completion(nil)
                    return
                }
                guard let data = response.data else {print("Error while serializing data")
                    completion(nil)
                    return}
                let images = self.decodeJson(data: data)
                completion(images)
        }
    }
    func decodeJson(data: Data) -> [ImageItem]? {
        return try? JSONDecoder().decode(Images.self, from: data)
    }
}
