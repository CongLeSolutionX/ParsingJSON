//
//  ParsingJSONUITests.swift
//  ParsingJSONUITests
//
//  Created by Consultant on 2/11/20.
//  Copyright © 2020 Enhance IT. All rights reserved.
//

import XCTest

class ParsingJSONUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    override func tearDown() {
        
    }

    func testExample() {
        let app = XCUIApplication()
        app.launch()
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
