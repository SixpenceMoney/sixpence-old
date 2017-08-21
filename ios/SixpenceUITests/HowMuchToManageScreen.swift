import XCTest
import Nimble

final class HowMuchToManageScreen {
  
  private let app: XCUIApplication
  
  init?(app: XCUIApplication, file: String = #file, line: UInt = #line) {
    self.app = app
    
    let expectations = gatherExpectations {
      expect(self._titleText.exists).toEventually(beTrue(), timeout: 2)
      expect(self._amountText.exists).toEventually(beTrue(), timeout: 2)
      expect(self._keyboard?.exists).toEventually(beTrue(), timeout: 2)
    }

    let allPassed = expectations
      .map{ $0.success }
      .reduce(true, { $0 && $1 })
    
    guard allPassed else {
      fail("expected <\(HowMuchToManageScreen.self)> to exist", file: file, line: line)
      return nil
    }
  }
  
  private var _titleText: XCUIElement {
    return app.staticTexts["\(HowMuchToManageScreen.self).title"]
  }
  
  private var _amountText: XCUIElement {
    return app.otherElements["\(HowMuchToManageScreen.self).amount"]
  }

  private var _keyboard: XCUIElement? {
    return app.keyboards.allElementsBoundByIndex.first
  }
  
  // MARK: - Properties
  
  var titleText: String {
    return _titleText.label
  }

  var amountText: String {
    return _amountText.label
  }
  
  // MARK: - Actions
  
  func enters(amount: String) {
    _keyboard?.typeText(amount)
  }
}
