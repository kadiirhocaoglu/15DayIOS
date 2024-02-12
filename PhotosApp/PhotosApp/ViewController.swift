//
//  ViewController.swift
//  PhotosApp
//
//  Created by Kadir Hocaoğlu on 4.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(DemoTableViewCell.self, forCellReuseIdentifier: "DemoTableViewCell")
        tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: ImageTableViewCell.identifier)
        tableView.register(TextFieldTableViewCell.self, forCellReuseIdentifier: TextFieldTableViewCell.identifier)
        return tableView
    }()
    let names = ["kadir", "ahmet", "mehmet", "Ankara","İstanbul", "Bursa", "a", "b", "c", "d", "e", "g"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    

}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < 5 && indexPath.row > 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier, for: indexPath) as! ImageTableViewCell
            cell.configure(labelTxt: names[indexPath.row], imageName: "figure.wave.circle.fill")
            
            return cell
        } else if indexPath.row > 5{
            let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.identifier, for: indexPath) as! TextFieldTableViewCell
            cell.isUserInteractionEnabled = true
            cell.selectionStyle = .none
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DemoTableViewCell", for: indexPath) as! DemoTableViewCell
            
            let iSwitch = UISwitch()
            iSwitch.addTarget(self, action: #selector(didChangeValueISwitch), for: .valueChanged)
            cell.accessoryView = iSwitch
            cell.backgroundColor = .blue
            cell.textLabel?.text = names[indexPath.row]
            
            return cell
        }
    }
    @objc func didChangeValueISwitch(_ sender: UISwitch){
        if(sender.isOn){
            print("on   ")
        }else{
            print("off ")
        }
    }
    
}

//#Preview(){
//    ViewController()
//}
