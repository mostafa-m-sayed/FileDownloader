//
//  Category.swift
//  FileDownloader
//
//  Created by Mostafa sayed on 5/19/19.
//  Copyright © 2019 Mostafa sayed. All rights reserved.
//

import Foundation

struct Category: Codable {
    let id: Int?
    let title: Title?
    let photoCount: Int?
    let links: CategoryLinks?
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case photoCount = "photo_count"
        case links
    }
}
