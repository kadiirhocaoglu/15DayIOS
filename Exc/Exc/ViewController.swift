//
//  ViewController.swift
//  Exc
//
//  Created by Kadir Hocaoğlu on 1.02.2024.
//

import UIKit

class ViewController: UIViewController {

    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemBackground
        label.text = ""
        return label
    }()
    private let birthDateLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemBackground
        label.text = ""
        return label
    }()
    private let nameTextField: UITextField = {
        let textField =  UITextField()
        textField.backgroundColor = .systemBackground
        textField.placeholder = "Name"
        return textField
    }()
    private let birthDateTextField: UITextField = {
        let textField =  UITextField()
        textField.backgroundColor = .systemBackground
        textField.placeholder = "Birthdate"
        return textField
    }()
    private let saveButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.titleLabel?.text = "Save"
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        getStoredUS()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }


}
extension ViewController {
    @objc func saveButtonTapped(_ sender: UIButton){
        nameLabel.text = nameTextField.text?.lowercased()
        birthDateLabel.text = birthDateTextField.text?.lowercased()
        guard let name = nameTextField.text else {return}
        guard let birth = birthDateTextField.text else {return}
        UserDefaults.standard.set(name, forKey: "name")
        UserDefaults.standard.set(birth, forKey: "birth")
    }
    func getStoredUS(){
        if let storedName = UserDefaults.standard.object(forKey: "name"){
            nameLabel.text = "Name: \(storedName)"
        }
        if let storedBirth = UserDefaults.standard.object(forKey: "birth"){
            birthDateLabel.text = "BirthDate: \(storedBirth)"
        }
    }
    
    func style(){
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.image = UIImage(named: "background")
        backgroundImageView.contentMode = .scaleAspectFill
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        birthDateTextField.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        birthDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
    }
    func layout() {
        view.addSubview(backgroundImageView)
        view.addSubview(nameTextField)
        view.addSubview(birthDateTextField)
        view.addSubview(saveButton)
        view.addSubview(nameLabel)
        view.addSubview(birthDateLabel)
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            nameTextField.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 10),
            nameTextField.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -10)
        ])
        NSLayoutConstraint.activate([
            birthDateTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
            birthDateTextField.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 10),
            birthDateTextField.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -10)
        ])
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: birthDateTextField.bottomAnchor, constant: 10),
            saveButton.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 10),
            saveButton.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -10)
        ])
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: 10)
        ])
        NSLayoutConstraint.activate([
            birthDateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            birthDateLabel.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 10),
            birthDateLabel.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: 10)
        ])
        
    }
}
#Preview() {
     ViewController()
}
