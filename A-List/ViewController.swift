//
//  ViewController.swift
//  CelebMedia
//
//  Created by Gabriella Smith on 11/16/19.
//  Copyright © 2019 Gabriella Smith. All rights reserved.
//
import UIKit

protocol Delegate: class {
    func addCelebrity(to artist: String, to insta: String, to profile: UIImage, to image: UIImage)
}

class ViewController: UIViewController, UIActionSheetDelegate {
    
    var isMultipleTouchEnabled: Bool {true}
    var tableView: UITableView!
    var artistCountLabel: UILabel!
    let rightBarButtonItem = UIBarButtonItem()
    
    let reuseIdentifier = "celebrityCellReuse"
    let cellWidth: CGFloat = 379
    let cellHeight: CGFloat = 74
    let cellSpacingHeight: CGFloat = 30
    var celebrities: [Celebrity]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "A-List"
        view.backgroundColor = .white
        
        let bts = Celebrity(name: "BTS", profile: "bts", photo: "map")
        let ariana = Celebrity(name: "Ariana Grande", profile: "ari", photo: "thanks")
        let halsey = Celebrity(name: "Halsey", profile:  "halsey", photo: "maniac")
        
        
        celebrities = [bts, ariana, halsey]
        
        tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CelebrityTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        let headerView = ArtistHeader(frame: .init(x: 0, y: 0, width: cellWidth, height: 98))
        tableView.tableHeaderView = headerView
        headerView.artistCountLabel.text = "You have added " + String(celebrities.count) + " artist(s)."
        view.addSubview(tableView)
        
        rightBarButtonItem.title = "➕"
        rightBarButtonItem.style = .plain
        rightBarButtonItem.tintColor = .black
        rightBarButtonItem.target = self
        rightBarButtonItem.action = #selector(pushAddViewController)
        navigationItem.rightBarButtonItems = [rightBarButtonItem]
        
        setupConstraints()
    }
    
    @objc func pushAddViewController() {
        let viewController =  AddViewController()
        viewController.delegate = self
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            tableView.widthAnchor.constraint(equalToConstant: cellWidth + 10),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 17),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 8),
            
        ])
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return celebrities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CelebrityTableViewCell
        let celeb = self.celebrities[indexPath.row]
        cell.configure(for: celeb)
        cell.selectionStyle = .none
        cell.ellipse.tag = indexPath.row
        cell.ellipse.addTarget(self, action: #selector(self.displayActionSheet), for: .touchUpInside)
        
        return cell
    }
    
    @objc func displayActionSheet(_ sender: UIButton){
        let celebrity = celebrities[sender.tag]
        
        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .actionSheet)
        
        let editAction = UIAlertAction(title: "Edit ✎", style: .default)
        editAction.setValue(UIColor(red: 0.302, green: 0.302, blue: 0.302, alpha: 1), forKey: "titleTextColor")
//        editAction.
        let deleteAction = UIAlertAction(title: "Delete ☓", style: .default, handler: { action in
            self.deleteCelebrity(index: celebrity)})
        deleteAction.setValue(UIColor(red: 0.302, green: 0.302, blue: 0.302, alpha: 1), forKey: "titleTextColor")
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        cancelAction.setValue(UIColor(red: 0.302, green: 0.302, blue: 0.302, alpha: 1), forKey: "titleTextColor")
        
        optionMenu.addAction(editAction)
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    func deleteCelebrity(index : Celebrity){
        celebrities.removeAll { (celeb) -> Bool in
            if  index.name == celeb.name{
                return true
            }
            return false
        }
        tableView.reloadData()
        
        
    }
}
    
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 104
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let celebrity = celebrities[indexPath.row]
        let viewController = ArtistViewController(celebrity: celebrity)
        navigationController?.pushViewController(viewController, animated: true)
        
    }
}

extension ViewController: Delegate {
    func addCelebrity(to artist: String, to insta: String, to profile: UIImage, to image: UIImage){
//        celebrities.add(Celebrity(name: artist, profile: "bts", photo: "map"))
}
}


//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//           let cell = tableView.cellForRow(at: indexPath) as! PlaylistTableViewCell
//           let index = indexPath.row
//           let viewController = DetailViewController(songTextFieldtext: cell.songLabel.text!
//               , artistTextFieldtext: cell.artistLabel.text!, albumTextFieldtext: cell.albumLabel.text!, index: index)
//           viewController.delegate = self
//
//
//}




//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let celeb = celebrities[indexPath.row]
//        let viewController = SongViewController(song: song)
//        navigationController?.pushViewController(viewController, animated: true)
//        viewController.delegate = self
//    }


