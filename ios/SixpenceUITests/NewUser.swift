import XCTest
import Nimble

final class NewUser {
  
  private let app = XCUIApplication()
  
  deinit {
    app.terminate()
  }
  
  // MARK: - Actions
  
  func opensApp(file: FileString = #file, line: UInt = #line,
                _ closure: ((HowMuchToManageScreen)->())? = nil) {
    
    app.launch()
    
    guard let initialScreen = HowMuchToManageScreen(app: app) else {
      fail("expected <\(HowMuchToManageScreen.self)> to be the first screen", file: file, line: line)
      return
    }
    
    closure?(initialScreen)
  }
  
  func enters(file: String = #file, line: UInt = #line,
              amount: String,
              _ closure: ((HowMuchToManageScreen)->())? = nil) {
    
    guard let screen = HowMuchToManageScreen(app: app) else {
      fail("Couldn't enter an amount. Wrong screen.", file: file, line: line)
      return
    }
    
    screen.enters(amount: amount)
    
    closure?(screen)
  }
  
}
