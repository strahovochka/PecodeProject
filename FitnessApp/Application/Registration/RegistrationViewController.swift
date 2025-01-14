//
//  RegistrationViewController.swift
//  FitnessApp
//
//  Created by Jane Strashok on 09.07.2024.
//

import UIKit

class RegistrationViewController: BaseViewController {
    
    @IBOutlet weak private var mainTitle: UILabel!
    @IBOutlet weak private var subtitle: UILabel!
    @IBOutlet private var textFields: [CustomTextField]!
    @IBOutlet weak private var logInButton: PlainButton!
    @IBOutlet weak private var signUpButton: PlainButton!
    @IBOutlet weak private var loginLabel: UILabel!
    
    var viewModel: RegistrationViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        configUI()
    }
    
}


//-MARK: Private functions
private extension RegistrationViewController {
    func configUI() {
        if let viewModel = viewModel {
            mainTitle.text = viewModel.title
            mainTitle.font = .boldFutura?.withSize(32)
            subtitle.text = viewModel.subtitle
            subtitle.font = .regularSaira?.withSize(24)
            let textFieldsData = viewModel.textFieldsData
            for (index, data) in textFieldsData.enumerated() {
                textFields[index].setType(data)
                textFields[index].errorChecker = viewModel.getErrorChecker(for: data)
                textFields[index].delegate = self.viewModel
            }
            signUpButton.setType(.filled)
            signUpButton.title = viewModel.signInButtonText
            loginLabel.text = viewModel.loginText
            loginLabel.font = .lightSaira
            logInButton.setType(.unfilled)
            logInButton.title = viewModel.logInButtonText
        }
    }
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        textFields.forEach { $0.checkForError() }
        guard let _ = textFields.first(where: { $0.getState() == .error}) else {
            self.signUpButton.isActive = false
            viewModel?.registerUser { [weak self] isSuccessful in
                guard let self = self else { return }
                self.signUpButton.isActive = !isSuccessful
            }
            return
        }
    }
    
    @IBAction func loginButtonPresses(_ sender: Any) {
        viewModel?.goToLogin()
    }
}
