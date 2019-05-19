//
//  User.swift
//  FileDownloader
//
//  Created by Mostafa sayed on 5/19/19.
//  Copyright © 2019 Mostafa sayed. All rights reserved.
//

import Foundation

struct User: Codable {
    let id, username, name: String?
    let profileImage: ProfileImage?
    let links: UserLinks?
    
    enum CodingKeys: String, CodingKey {
        case id, username, name
        case profileImage = "profile_image"
        case links
    }
}
