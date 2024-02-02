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
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return button
    }()
    private let deleteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Delete", for: .normal)
        button.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        button.backgroundColor = .red
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        showOnDisplay()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }


}
extension ViewController {
    @objc func saveButtonTapped(_ sender: UIButton){
        guard let name = nameTextField.text else {return}
        guard let birth = birthDateTextField.text else {return}
        UserDefaults.standard.set(name, forKey: "name")
        UserDefaults.standard.set(birth, forKey: "birth")
        showOnDisplay()
    }
    @objc func deleteButtonTapped(_ sender: UIButton){
        let getUS = getStoredUS()
        let getUSName = getUS[0].count
        let getUSBirth  = getUS[1].count
        if getUSName != 0 {
            UserDefaults.standard.removeObject(forKey: "name")
            if getUSBirth != 0 {
                UserDefaults.standard.removeObject(forKey: "birth")
            }
        }
        showOnDisplay()
    }
    func showOnDisplay(){
        let getUS = getStoredUS()
        nameLabel.text = getUS.first
        birthDateLabel.text = getUS.last
    }
    func getStoredUS() -> [String] {
        if let storedName = UserDefaults.standard.object(forKey: "name") as? String,
           let storedBirth = UserDefaults.standard.object(forKey: "birth") as? String {
            return [storedName, storedBirth]
        }
        return ["", ""]
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
        view.addSubview(deleteButton)
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
        NSLayoutConstraint.activate([
            deleteButton.topAnchor.constraint(equalTo: birthDateLabel.bottomAnchor, constant: 10),
            deleteButton.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 10),
            deleteButton.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: 10)
        ])
        
    }
}
#Preview() {
     ViewController()
}
