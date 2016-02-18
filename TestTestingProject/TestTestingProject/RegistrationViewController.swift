import UIKit

class RegistrationViewController: UIViewController,
    UITextFieldDelegate,
    RegistrationViewControllerViewModelDelegate
{
    
    // MARK: - Properties
    // MARK: -- Internal
    
    var viewModel: RegistrationViewControllerViewModel? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    // MARK: -- Outlets
    
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var submitButton: UIButton!
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAllViews()
    }
    
    // MARK: - Configuration Methods
    
    private func configureAllViews() {
        configureUsernameTextField()
        configurePasswordTextField()
        configureSubmitButton()
    }
    
    private func configureUsernameTextField() {
        guard let viewModel = viewModel else {
            return
        }
        
        usernameTextField.delegate = self
        
        usernameTextField.placeholder = viewModel.usernamePlaceholderText
        usernameTextField.layer.borderColor = viewModel.usernameBorderColor?.CGColor
        usernameTextField.layer.borderWidth = viewModel.usernameBorderWidth
    }
    
    private func configurePasswordTextField() {
        guard let viewModel = viewModel else {
            return
        }
        
        passwordTextField.delegate = self
        
        passwordTextField.placeholder = viewModel.passwordPlaceholderText
        passwordTextField.layer.borderColor = viewModel.passwordBorderColor?.CGColor
        passwordTextField.layer.borderWidth = viewModel.passwordBorderWidth
    }
    
    private func configureSubmitButton() {
        guard let viewModel = viewModel else {
            return
        }
        
        submitButton.setTitleColor(viewModel.submitTextColor, forState: .Normal)
        submitButton.enabled = viewModel.submitEnabled
    }
    
    // MARK - Actions
    
    @IBAction private func submitButtonPressed(sender: UIButton) {
        viewModel?.submitButtonPressed()
    }
    
    func textField(textField: UITextField,
        shouldChangeCharactersInRange range: NSRange,
        replacementString string: String)
        -> Bool
    {
        let text = (textField.text as NSString?)?.stringByReplacingCharactersInRange(range, withString: string)
        
        if textField == usernameTextField {
            viewModel?.usernameTextDidChangeToText(text)
        } else if textField == passwordTextField {
            viewModel?.passwordTextDidChangeToText(text)
        }
        
        return true
    }
    
    // MARK: - RegistrationViewControllerViewModelelegate Methods
    
    func reloadViews() {
        configureAllViews()
    }
    
    func moveToHomeScreen() {
        let alertController = UIAlertController(title: "Success!",
            message: "Successful Registration!",
            preferredStyle: .Alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(OKAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
}