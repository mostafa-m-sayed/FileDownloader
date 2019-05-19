//
//  Links.swift
//  FileDownloader
//
//  Created by Mostafa sayed on 5/19/19.
//  Copyright © 2019 Mostafa sayed. All rights reserved.
//

import Foundation

struct Links: Codable {
    let linksSelf: String?
    let html, download: String?
    
    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, download
    }
}
