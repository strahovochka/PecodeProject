//
//  DeleteAccountViewController.swift
//  FitnessApp
//
//  Created by Jane Strashok on 02.08.2024.
//

import UIKit

final class DeleteAccountViewController: BaseViewController {
    
    @IBOutlet weak private var deleteButton: PlainButton!
    @IBOutlet weak private var textField: CustomTextField!
    @IBOutlet weak private var explanationLabel: UILabel!
    var viewModel: DeleteAccountViewModel?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground(for: viewModel?.user.getSex() ?? .male)
        showNavigationBar(backButtonEnabled: true)
        configUI()
        viewModel?.disableDelete = { [weak self] isTrue in
            guard let self = self else { return }
            self.deleteButton.isActive = !isTrue
        }
    }
}

private extension DeleteAccountViewController {
    func configUI() {
        self.title = viewModel?.navigationTitle
        
        textField.setType(viewModel?.fieldType ?? .email)
        textField.errorChecker = viewModel?.emailChecker
        
        explanationLabel.numberOfLines = 0
        explanationLabel.font = .regularSaira
        explanationLabel.textColor = .secondaryGray
        explanationLabel.text = viewModel?.explanationText
        
        deleteButton.setType(.filled)
        deleteButton.bgColor = .primaryOrange
        deleteButton.title = viewModel?.deleteButtonText
    }
    
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        textField.checkForError()
        guard textField.getState() != .error else { return }
        viewModel?.showDeleteAccountPopUp()
    }
}
