//
//  ImageItem.swift
//  FileDownloader
//
//  Created by Mostafa sayed on 5/17/19.
//  Copyright © 2019 Mostafa sayed. All rights reserved.
//

import Foundation


// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

typealias Images = [ImageItem]

struct ImageItem: Codable {
    let id: String?
    let createdAt: String?
    let width, height: Int?
    let color: String?
    let likes: Int?
    let likedByUser: Bool?
    let user: User?
    let urls: Urls?
    let categories: [Category]?
    let links: Links?
    
    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case width, height, color, likes
        case likedByUser = "liked_by_user"
        case user
        case urls, categories, links
    }
}

enum Title: String, Codable {
    case buildings = "Buildings"
    case nature = "Nature"
    case objects = "Objects"
    case people = "People"
}

