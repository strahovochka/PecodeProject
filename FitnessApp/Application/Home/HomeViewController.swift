//
//  HomeViewController.swift
//  FitnessApp
//
//  Created by Jane Strashok on 30.06.2024.
//

import Foundation
import UIKit

final class HomeViewController: BaseViewController {
    
    @IBOutlet weak private var sexLabel: UILabel!
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var profileButton: UIButton!
    @IBOutlet weak private var collectionView: UICollectionView!
    
    var viewModel: HomeViewModel?
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        viewModel?.getUser()
    }

    override func viewDidLoad() {
        configUI()
        configCollection()
        viewModel?.update = { [weak self] in
            guard let self = self else { return }
            self.updateUI()
        }
        guard let _ = viewModel?.user else {
            viewModel?.getUser()
            return
        }
        updateUI()
    }
}

private extension HomeViewController {
    func configUI() {
        sexLabel.text = viewModel?.heroPlaceholderName
        nameLabel.text = viewModel?.namePlaceholder
        sexLabel.font = .regularSaira?.withSize(24)
        nameLabel.font = .regularSaira?.withSize(16)
        profileButton.setImage(.profileImage, for: .normal)
        profileButton.imageView?.contentMode = .scaleAspectFill
        profileButton.layer.cornerRadius = 8
        profileButton.layer.borderWidth = 1
        profileButton.layer.borderColor = UIColor.primaryYellow.cgColor
        profileButton.layer.masksToBounds = true
        collectionView.backgroundColor = .clear
    }
    
    func configCollection() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(Identifiers.NibNames.optionCollectionCell)
    }
    
    func updateUI() {
        setBackground(for: viewModel?.user?.getSex() ?? .male)
        self.sexLabel.text = viewModel?.user?.getSex().heroName
        self.nameLabel.text = viewModel?.user?.userName
        profileButton.setImage(viewModel?.getProfileImage(), for: .normal)
        collectionView.reloadData()
    }
    
    @IBAction func profileButtonPressed(_ sender: Any) {
        viewModel?.goToProfile()
    }
}


extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel?.getVisibleOptions().count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.NibNames.optionCollectionCell, for: indexPath) as? OptionCollectionViewCell else {
            return UICollectionViewCell()
        }
        if let visibleOptions = viewModel?.getVisibleOptions() {
            cell.config(with: visibleOptions[indexPath.section])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: screenSize.width * 0.72, height: 104)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
    }
    
}

