//
//  ImageTableViewCell.swift
//  PhotosApp
//
//  Created by Kadir Hocaoğlu on 12.02.2024.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    static let identifier = "ImageTableViewCell"
    private let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let cellLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    public func configure(labelTxt: String, imageName: String){
        cellImageView.image = UIImage(systemName: imageName)
        cellLabel.text = labelTxt
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        addSubview(cellImageView)
        addSubview(cellLabel)
        
        cellImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        cellImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cellImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        cellImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        cellImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        cellLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cellLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50
        ).isActive = true
        cellLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
