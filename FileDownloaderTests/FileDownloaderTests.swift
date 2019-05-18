//
//  FileDownloaderTests.swift
//  FileDownloaderTests
//
//  Created by Mostafa sayed on 5/17/19.
//  Copyright © 2019 Mostafa sayed. All rights reserved.
//

import XCTest
@testable import FileDownloader

class FileDownloaderTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testSerialization() {
        let service = Service()
        let mockString = "[\r\n    {\r\n        \"id\": \"4kQA1aQK8-Y\",\r\n        \"created_at\": \"2016-05-29T15:42:02-04:00\",\r\n        \"width\": 2448,\r\n        \"height\": 1836,\r\n        \"color\": \"#060607\",\r\n        \"likes\": 12,\r\n        \"liked_by_user\": false,\r\n        \"user\": {\r\n            \"id\": \"OevW4fja2No\",\r\n            \"username\": \"nicholaskampouris\",\r\n            \"name\": \"Nicholas Kampouris\",\r\n            \"profile_image\": {\r\n                \"small\": \"https://images.unsplash.com/profile-1464495186405-68089dcd96c3?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=32&w=32&s=63f1d805cffccb834cf839c719d91702\",\r\n                \"medium\": \"https://images.unsplash.com/profile-1464495186405-68089dcd96c3?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=64&w=64&s=ef631d113179b3137f911a05fea56d23\",\r\n                \"large\": \"https://images.unsplash.com/profile-1464495186405-68089dcd96c3?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=128&w=128&s=622a88097cf6661f84cd8942d851d9a2\"\r\n            },\r\n            \"links\": {\r\n                \"self\": \"https://api.unsplash.com/users/nicholaskampouris\",\r\n                \"html\": \"http://unsplash.com/@nicholaskampouris\",\r\n                \"photos\": \"https://api.unsplash.com/users/nicholaskampouris/photos\",\r\n                \"likes\": \"https://api.unsplash.com/users/nicholaskampouris/likes\"\r\n            }\r\n        },\r\n        \"current_user_collections\": [],\r\n        \"urls\": {\r\n            \"raw\": \"https://images.unsplash.com/photo-1464550883968-cec281c19761\",\r\n            \"full\": \"https://images.unsplash.com/photo-1464550883968-cec281c19761?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&s=4b142941bfd18159e2e4d166abcd0705\",\r\n            \"regular\": \"https://images.unsplash.com/photo-1464550883968-cec281c19761?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&w=1080&fit=max&s=1881cd689e10e5dca28839e68678f432\",\r\n            \"small\": \"https://images.unsplash.com/photo-1464550883968-cec281c19761?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&w=400&fit=max&s=d5682032c546a3520465f2965cde1cec\",\r\n            \"thumb\": \"https://images.unsplash.com/photo-1464550883968-cec281c19761?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&w=200&fit=max&s=9fba74be19d78b1aa2495c0200b9fbce\"\r\n        },\r\n        \"categories\": [\r\n            {\r\n                \"id\": 4,\r\n                \"title\": \"Nature\",\r\n                \"photo_count\": 46148,\r\n                \"links\": {\r\n                    \"self\": \"https://api.unsplash.com/categories/4\",\r\n                    \"photos\": \"https://api.unsplash.com/categories/4/photos\"\r\n                }\r\n            },\r\n            {\r\n                \"id\": 6,\r\n                \"title\": \"People\",\r\n                \"photo_count\": 15513,\r\n                \"links\": {\r\n                    \"self\": \"https://api.unsplash.com/categories/6\",\r\n                    \"photos\": \"https://api.unsplash.com/categories/6/photos\"\r\n                }\r\n            }\r\n        ],\r\n        \"links\": {\r\n            \"self\": \"https://api.unsplash.com/photos/4kQA1aQK8-Y\",\r\n            \"html\": \"http://unsplash.com/photos/4kQA1aQK8-Y\",\r\n            \"download\": \"http://unsplash.com/photos/4kQA1aQK8-Y/download\"\r\n   }\r\n    }]"
        service.mockModel = mockString
        service.getData() {images in
            XCTAssert(images != nil)
            
        }
    }
    func testDownload() {
        guard let url = URL(string: "https://via.placeholder.com/300/09f/fff.png") else {return}
        let realBase64 = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAAEsBAMAAACLU5NGAAAAG1BMVEUAmf/////f8v+f2P8fpf9/zP+/5f9fv/8/sv/7XAkNAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAD90lEQVR4nO3cwW+bSBQH4AcGw5HnJDhHaN3dHO1su9ojNGnPtrUb7dFuIiVHnEo5263Uv3vfGwab1myVA5DV6vcpgeD35HmeGYbJxUQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/zOb3N5BRexlu9/Jo+NCQFl/HbWrRK7s6Amcdy3jCfaftyOT/OmsnLxSFqkzu04Ns1Z+RxPOMtUc63fH6U5HP8O5/uo1Vyh9IJhTylwSjz0pV0y4Tex0dJ7iij3ck+WiV3J9RPvVhRLgO5O5V+KOSl7MesnXSRH++jNrlDAWurEW0i6ZOz8jI9mlwaDXkftckd8nXEdgnNVjI2sf6Q+VvLSMiMHJnupHC0j9rkrmlL87Lhs7JK86oM1fowVFq0jdrkjn2QKbMuTEvD8aGsfCQ9th9PbzHeR21yt1KWkUq3et+Tq4tDHpnXfZ67+7Zdltu1itrkbrEuRWVLWdmwHbl0shlXSQ7LLVtFbXLXZUmLphHOHK3IsWVtTg6Lk6PFV1Gb3G1Z9I1Xjb015NpSHq7jfntL7reoaW7JhD+pJQ2537llVuyGO1Em17iWJMt7f3ei/zeZcdGlKLDr1saW5XPV9F9bM2pV1CZ3yDxDZFx0HZcF0z+s8rpwVcuWPo5k1KqoTe7QwD58mp6Js/PUTn4tVEatx2ei3lAzu4M4t3uErQl5PN3YOb84NR+gitrkDnl8J51QNO23hjLH7SqQxxnp0trbfotmo9t0RE27U9k9hFw2PuBfLnVD0d/u9KMs8hNq2svrxFqXJXprZtmg9riXp5v0jTRI4afyn5lv1X8+gRaQ22XA/zT6sxatkgEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD65tjf/5gXLYtHb/8l8kNZkVw5zEwjIjei8ru7rtJ7/YqcO3ISorTFsiLvt+eXZY7xlp5sWd6b7KscrpeZ80DBus2y6D1dviY3C+QP/9WUnGWkp8GrhZa1fE3DQiK1ssYrurdlDeblwZ86TzTctFuWf/dxPihy+kw31+/IuTOnm2v98I6EwoTe1cuKLsLEluVm5cFLHHf7pc2JKIPoZl4STpfFHzSRfnEyc5pQrmVJiO7l13yRHpdlPQ0LW5ZTHSInWN23WZZMedMJycUq0aa1FT1F1dyK6MugoHpvuY903Fv0a9Jqb+n7apesHlY0KSvRU6233CV9V5Z/RsdzixbzlsvSuUXL4nFOT9mVtq2nw9yiYPx9WebCHGt3IrW7yOnby51IuyzPKEgv9M31dLgTKUgayioH+oqrdavlsp5hWPTb3jM9vnQBjZyLl64AAP43/gHVSaMe2vmdiAAAAABJRU5ErkJggg=="
        let fileDownloader = FileDownloader(url: url)
        fileDownloader.download() {data in
            let base64 = data.base64EncodedString()
            XCTAssert(base64 != realBase64)
        }
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
