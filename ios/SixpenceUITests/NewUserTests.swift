import Quick
import Nimble

final class NewUserTests: QuickSpec {
  override func spec() {
    
    it("sees a simple screen screen", flags: ["150293542": true]) {
      let user = NewUser()

      user.opensApp() { screen in
        expect(screen.titleText) == "How much to manage?"
        expect(screen.amountText) == "$0.00"
      }
    }
    
  }
}
