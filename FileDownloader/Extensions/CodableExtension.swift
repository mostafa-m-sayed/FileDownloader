//
//  CodableExtension.swift
//  FileDownloader
//
//  Created by Mostafa sayed on 5/18/19.
//  Copyright © 2019 Mostafa sayed. All rights reserved.
//

import Foundation

extension Data
{
    func getObject<T:Decodable>()->T?
    {
        do
        {
            let decoder = JSONDecoder()
            let parsedData = try decoder.decode(T.self, from: self)
            return parsedData
        }
        catch let error
        {
            print(error)
        }
        return nil
    }
}
