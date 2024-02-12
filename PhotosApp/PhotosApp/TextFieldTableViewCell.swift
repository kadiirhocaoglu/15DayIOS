//
//  TextFieldTableViewCell.swift
//  PhotosApp
//
//  Created by Kadir Hocaoğlu on 12.02.2024.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell, UITextFieldDelegate {
    static let identifier = "TextFieldTableViewCell"
    
    private let cellTextField: UITextField = {
        let textField =  UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Hello"
        textField.isUserInteractionEnabled = true
        return textField
    }()
    private let cellButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = false
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(cellTextField)
        addSubview(cellButton)
        cellTextField.delegate = self

        cellTextField.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        cellTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant : -10).isActive = true
        cellTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant : 10).isActive = true
        cellButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        cellTextField.trailingAnchor.constraint(equalTo: cellButton.leadingAnchor, constant: -10).isActive = true
        cellButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        cellButton.addTarget(self, action: #selector(didTappedButton), for: .touchUpInside)
    }
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    @objc func didTappedButton(_ sender: UIButton) {
        print("Buttoon tapped")
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            return true
        }
}
