//
//  ForgotPasswordCoodinator.swift
//  FitnessApp
//
//  Created by Jane Strashok on 16.07.2024.
//

import UIKit

final class ForgotPasswordCoodinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ForgotPasswordViewController.instantiate(from: Identifiers.Storyboard.forgotPassword)
        let viewModel = ForgotPasswordViewModel()
        viewModel.coordinator = self
        vc.viewModel = viewModel
        navigationController.navigationBar.isHidden = true
        navigationController.pushViewController(vc, animated: true)
    }
    
    @objc func navigateBackToLogIn() {
        navigationController.popViewController(animated: true)
    }
    
}