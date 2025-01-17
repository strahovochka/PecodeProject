//
//  LogInViewController.swift
//  FitnessApp
//
//  Created by Jane Strashok on 14.07.2024.
//

import UIKit

final class LogInViewController: BaseViewController {
    
    @IBOutlet weak private var mainTitle: UILabel!
    @IBOutlet weak private var subtitle: UILabel!
    @IBOutlet private var textFields: [CustomTextField]!
    @IBOutlet weak private var forgotPasswordButton: PlainButton!
    @IBOutlet weak private var loginButton: PlainButton!
    @IBOutlet weak private var backToRegistrationButton: PlainButton!
    
    var viewModel: LogInViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        configUI()
    }
}

private extension LogInViewController {
    func configUI() {
        mainTitle.text = viewModel?.title
        mainTitle.font = .boldFutura?.withSize(32)
        subtitle.text = viewModel?.subtitle
        subtitle.font = .regularSaira?.withSize(24)
        if let viewModel = viewModel {
            for (index, data) in viewModel.textFieldsData.enumerated() {
                textFields[index].setType(data)
                textFields[index].errorChecker = data.getErrorChecker()
                textFields[index].delegate = viewModel
            }
        }
        forgotPasswordButton.setType(.unfilled)
        forgotPasswordButton.title = viewModel?.forgotPasswordText
        loginButton.setType(.filled)
        loginButton.title = viewModel?.loginButtonText
        backToRegistrationButton.setType(.unfilled)
        backToRegistrationButton.title = viewModel?.backToRegisterButtonText
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        view.endEditing(true)
        textFields.forEach { $0.checkForError()}
        guard let _ = textFields.first(where: { $0.getState() == .error}) else {
            loginButton.isActive = false
            viewModel?.logIn(completition: { [weak self] isSuccessful in
                guard let self = self else { return }
                self.loginButton.isActive = !isSuccessful
            })
            return
        }
    }
    
    @IBAction func forgotPasswordButtonPressed(_ sender: Any) {
        viewModel?.goToForgotPassword()
    }
    
    @IBAction func backToRegisterButtonPressed(_ sender: Any) {
        viewModel?.goBack()
    }
}
