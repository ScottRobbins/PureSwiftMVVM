import UIKit

protocol RegistrationViewControllerViewModel {
    
    weak var delegate: RegistrationViewControllerViewModelDelegate? { get set }
    
    var usernamePlaceholderText: String? { get }
    var usernameBorderColor: UIColor? { get }
    var usernameBorderWidth: CGFloat { get }
    var passwordPlaceholderText: String? { get }
    var passwordBorderColor: UIColor? { get }
    var passwordBorderWidth: CGFloat { get }
    var submitTextColor: UIColor { get }
    var submitEnabled: Bool { get }
    
    func submitButtonPressed()
    func usernameTextDidChangeToText(text: String?)
    func passwordTextDidChangeToText(text: String?)
}

protocol RegistrationViewControllerViewModelDelegate: class {
    func reloadViews()
    func moveToHomeScreen()
}
