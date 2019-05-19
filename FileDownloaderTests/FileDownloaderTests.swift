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

        guard let path = Bundle.main.path(forResource: "JsonTestData", ofType: "") else {
            XCTAssert(false)
            return
        }
        let mockString = try? String(contentsOf: URL(fileURLWithPath: path), encoding: .utf8)
        //String(contentsOf: URL(fileURLWithPath: path))
        service.mockModel = mockString
        service.getData() {images in
            XCTAssert(images != nil)
            
        }
    }
    func testDownload() {
        guard let url = URL(string: "https://via.placeholder.com/300/09f/fff.png") else {
            XCTAssert(false)
            return
            
        }
        guard let path = Bundle.main.path(forResource: "Base64Image", ofType: "") else {
            XCTAssert(false)
            return
        }
        let realBase64 = try? String(contentsOf: URL(fileURLWithPath: path), encoding: .utf8)
        
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
