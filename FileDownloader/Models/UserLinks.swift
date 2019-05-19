//
//  UserLinks.swift
//  FileDownloader
//
//  Created by Mostafa sayed on 5/19/19.
//  Copyright © 2019 Mostafa sayed. All rights reserved.
//

import Foundation

struct UserLinks: Codable {
    let linksSelf: String?
    let html: String?
    let photos, likes: String?
    
    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, photos, likes
    }
}
