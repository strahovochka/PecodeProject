//
//  CalculatorCoordinator.swift
//  FitnessApp
//
//  Created by Jane Strashok on 07.07.2024.
//

import UIKit

final class CalculatorCoordinator: Coordinator {
    
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = CalculatorViewController.instantiate(from: Identifiers.Storyboard.calculator)
        navigationController.pushViewController(vc, animated: true)
    }
}
