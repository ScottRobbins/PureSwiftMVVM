import UIKit

enum RegistrationInputValidatorError: ErrorType {
    case EmptyUsername
    case EmptyPassword
}

class RegistrationInputValidator {
    
    // MARK: - Interface
    
    func validateUsername(username: String?) throws {
        guard let username = username where !username.isEmpty else {
            throw RegistrationInputValidatorError.EmptyUsername
        }
    }
    
    func validatePassword(password: String?) throws {
        guard let password = password where !password.isEmpty else {
            throw RegistrationInputValidatorError.EmptyPassword
        }
    }
}
