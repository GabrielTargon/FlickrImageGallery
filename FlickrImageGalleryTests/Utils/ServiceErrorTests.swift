//
//  ServiceErrorTests.swift
//  FlickrImageGalleryTests
//
//  Created by Gabriel Targon on 03/12/20.
//

@testable import FlickrImageGallery
import XCTest

class ServiceErrorTests: XCTestCase {

    // MARK: Subject under test
    
    var sut: ServiceError!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: Tests
    
    func testDataUnavailable() {
        let result = ServiceError.dataUnavailable
        XCTAssertEqual(result.localizedDescription, "Error to receive data")
    }
    
    func testSystemUnavailable() {
        let result = ServiceError.systemUnavailable
        XCTAssertEqual(result.localizedDescription, "System unavailable")
    }
    
    func testCustom() {
        let result = ServiceError.custom(message: "Test")
        XCTAssertEqual(result.localizedDescription, "Test")
    }
    

}
