import XCTest
@testable import TestTestingProject

class RegistrationViewControllerDefaultViewModelTests: XCTestCase {
    
    var viewModel: RegistrationViewControllerDefaultViewModel!
    
    override func setUp() {
        super.setUp()
        
        let registrationInputValidator = RegistrationInputValidator()
        viewModel = RegistrationViewControllerDefaultViewModel(registrationInputValidator: registrationInputValidator)
    }
    
    func testInvalidUsernameInvalidPassword() {
        viewModel.usernameTextDidChangeToText(nil)
        viewModel.passwordTextDidChangeToText(nil)
        
        XCTAssertEqual(viewModel.usernameBorderColor, UIColor.redColor())
        XCTAssertEqual(viewModel.passwordBorderColor, UIColor.redColor())
        XCTAssertFalse(viewModel.submitEnabled)
    }
    
    func testValidUsernameInvalidPassword() {
        viewModel.usernameTextDidChangeToText("fan")
        viewModel.passwordTextDidChangeToText(nil)
        
        XCTAssertEqual(viewModel.usernameBorderColor, UIColor.blackColor())
        XCTAssertEqual(viewModel.passwordBorderColor, UIColor.redColor())
        XCTAssertFalse(viewModel.submitEnabled)
    }
    
    func testInvalidUsernameValidPassword() {
        viewModel.usernameTextDidChangeToText(nil)
        viewModel.passwordTextDidChangeToText("9:41")
        
        XCTAssertEqual(viewModel.usernameBorderColor, UIColor.redColor())
        XCTAssertEqual(viewModel.passwordBorderColor, UIColor.blackColor())
        XCTAssertFalse(viewModel.submitEnabled)
    }
    
    func testValidUsernameValidPassword() {
        viewModel.usernameTextDidChangeToText("fan")
        viewModel.passwordTextDidChangeToText("9:41")
        
        XCTAssertEqual(viewModel.usernameBorderColor, UIColor.blackColor())
        XCTAssertEqual(viewModel.passwordBorderColor,UIColor.blackColor())
        XCTAssertTrue(viewModel.submitEnabled)
    }
}
