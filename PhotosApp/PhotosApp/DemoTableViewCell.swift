//
//  DemoTableViewCell.swift
//  PhotosApp
//
//  Created by Kadir Hocaoğlu on 12.02.2024.
//

import UIKit

class DemoTableViewCell: UITableViewCell {
    static let identifier = "DemoTableViewCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: DemoTableViewCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
