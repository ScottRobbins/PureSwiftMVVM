import UIKit

class RegistrationViewControllerDefaultViewModel: RegistrationViewControllerViewModel {
    
    // MARK: - Properties
    // MARK: -- Internal
    
    weak var delegate: RegistrationViewControllerViewModelDelegate?
    
    let usernamePlaceholderText: String? = "Username"
    var usernameBorderColor: UIColor? {
        return usernameValid ? .blackColor() : .redColor()
    }
    
    let usernameBorderWidth: CGFloat = 2.0
    let passwordPlaceholderText: String? = "Password"
    var passwordBorderColor: UIColor? {
        return passwordValid ? .blackColor() : .redColor()
    }
    
    let passwordBorderWidth: CGFloat = 2.0
    var submitTextColor: UIColor {
        return submitEnabled ? .blackColor() : .lightGrayColor()
    }
    
    var submitEnabled: Bool {
        return usernameValid && passwordValid
    }
    
    // MARK: -- Private
    
    private let registrationInputValidator: RegistrationInputValidator
    private var usernameText: String = ""
    private var passwordText: String = ""
    private var usernameValid: Bool = false
    private var passwordValid: Bool = false
    
    init(registrationInputValidator: RegistrationInputValidator) {
        self.registrationInputValidator = registrationInputValidator
    }
    
    // MARK: - Actions
    
    func submitButtonPressed() {
        do {
            try registrationInputValidator.validateUsername(usernameText)
            try registrationInputValidator.validatePassword(passwordText)
            
            tellDelegateToMoveToHomeScreen()
        } catch {
            print("Danger Will Robinson! Danger!")
        }
    }
    
    func usernameTextDidChangeToText(text: String?) {
        usernameText = text ?? ""
        
        do {
            try registrationInputValidator.validateUsername(usernameText)
            usernameValid = true
        } catch {
            usernameValid = false
        }
        
        tellDelegateToReloadViews()
    }
    
    func passwordTextDidChangeToText(text: String?) {
        passwordText = text ?? ""
        
        do {
            try registrationInputValidator.validatePassword(passwordText)
            passwordValid = true
        } catch {
            passwordValid = false
        }
        
        tellDelegateToReloadViews()
    }
    
    // MARK: - Delegate Response
    
    private func tellDelegateToMoveToHomeScreen() {
        delegate?.moveToHomeScreen()
    }
    
    private func tellDelegateToReloadViews() {
        delegate?.reloadViews()
    }
}
