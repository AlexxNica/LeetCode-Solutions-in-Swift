//
//  Medium_093_Restore_IP_Addresses_Test.swift
//  Solutions
//
//  Created by Di Wu on 11/2/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Medium_093_Restore_IP_Addresses_Test: XCTestCase {
    private static let ProblemName: String = "Medium_093_Restore_IP_Addresses"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        let input: String = "25525511135"
        let expected: [String] = [
            "255.255.11.135",
            "255.255.111.35"
        ]
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input input: String, expected: [String]) {
        weak var expectation: XCTestExpectation? = self.expectationWithDescription(Medium_093_Restore_IP_Addresses_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            let result_swift: [String] = Medium_093_Restore_IP_Addresses.restoreIpAddresses(input)
            let result_objc: [String] = ObjC_Medium_093_Restore_IP_Addresses.restoreIpAddresses(input)
            assertHelper(NSSet.init(array: result_swift) == NSSet.init(array: expected), problemName: Medium_093_Restore_IP_Addresses_Test.ProblemName, input: input, resultValue: result_swift, expectedValue: expected)
            assertHelper(NSSet.init(array: result_objc) == NSSet.init(array: expected), problemName: Medium_093_Restore_IP_Addresses_Test.ProblemName, input: input, resultValue: result_objc, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectationsWithTimeout(Medium_093_Restore_IP_Addresses_Test.TimeOut) { (error: NSError?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Medium_093_Restore_IP_Addresses_Test.ProblemName, input: input, resultValue: Medium_093_Restore_IP_Addresses_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}