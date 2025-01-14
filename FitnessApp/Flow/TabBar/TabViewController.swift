//
//  TabViewController.swift
//  FitnessApp
//
//  Created by Jane Strashok on 09.07.2024.
//

import UIKit

protocol UserDataChangeDelegate {
    func updateUser()
}

final class TabViewController: UITabBarController {
    
    var viewModel: TabViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        configUI()
    }
    
    private func configUI() {
        self.tabBar.tintColor = .primaryYellow
        self.tabBar.unselectedItemTintColor = UIColor(hex: "#D9D9D9")
        prepareTabBarController()
    }
    
    private func prepareTabBarController() {
        guard let viewModel = viewModel else { return }
        self.setViewControllers(viewModel.getControllers(), animated: true)
        self.selectedIndex = TabBarItem.home.rawValue
        self.tabBar.isTranslucent = false
    }
}
