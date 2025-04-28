import UIKit
import Foundation

class ViewController: UIViewController {
    
    private let deleteLastUserButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Delete Last User", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        return button
    }()
    
    private let fetchAllUsersButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Fetch All Users", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        return button
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        return button
    }()
    
    private let fetchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Fetch", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        deleteLastUserButton.addTarget(self, action: #selector(deleteLastUserTapped), for: .touchUpInside)
        fetchAllUsersButton.addTarget(self, action: #selector(fetchAllUsersTapped), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
        fetchButton.addTarget(self, action: #selector(fetchTapped), for: .touchUpInside)
        setupUI()
    }
    
    @objc private func saveTapped() {
        CoreDataManager.shared.saveUser()
    }
    
    @objc private func fetchTapped() {
        CoreDataManager.shared.fetchLastUser()
    }
    
    @objc private func fetchAllUsersTapped() {
        CoreDataManager.shared.fetchAllUsers()
    }
    
    @objc private func deleteLastUserTapped() {
        CoreDataManager.shared.deleteLastUser()
    }
    
    private func setupUI() {
        [saveButton, fetchButton, fetchAllUsersButton, deleteLastUserButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            saveButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            saveButton.heightAnchor.constraint(equalToConstant: 44),
            saveButton.widthAnchor.constraint(equalToConstant: 120),
            
            fetchButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            fetchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            fetchButton.heightAnchor.constraint(equalToConstant: 44),
            fetchButton.widthAnchor.constraint(equalToConstant: 120),
            
            fetchAllUsersButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fetchAllUsersButton.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -16),
            fetchAllUsersButton.heightAnchor.constraint(equalToConstant: 44),
            fetchAllUsersButton.widthAnchor.constraint(equalToConstant: 150),
            
            deleteLastUserButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            deleteLastUserButton.topAnchor.constraint(equalTo: fetchButton.bottomAnchor, constant: 16),
            deleteLastUserButton.heightAnchor.constraint(equalToConstant: 44),
            deleteLastUserButton.widthAnchor.constraint(equalToConstant: 160),
        ])
    }

}

