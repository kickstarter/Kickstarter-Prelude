import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Kickstarter_PreludeTests.allTests),
    ]
}
#endif
