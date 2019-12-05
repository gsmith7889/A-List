//
//  AddViewController.swift
//  CelebMedia
//
//  Created by Amy Ouyang on 11/17/19.
//  Copyright © 2019 Gabriella Smith. All rights reserved.
//
import UIKit

class AddViewController: UIViewController {
    var add = UIButton()
    var profileLabel = UILabel()
    var profileTextLabel = UILabel()
    var artistLabel = UILabel()
    var artistTextField = UITextField()
    var instaLabel = UILabel()
    var instaTextField = UITextField()
    var imageTextLabel = UILabel()
    var imageLabel = UILabel()
//    var imageImage : UIImageView!
    
    
    var celebs: [Celebrity]!
    let padding = 31
    
    //    init(celebrities: [Celebrity]) {
    //        self.celebs = celebrities
    //        super.init(nibName: nil, bundle: nil)
    //    }
    //
    //    required init?(coder aDecoder: NSCoder) {
    //        fatalError("init(coder:) has not been implemented")
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Add an Artist"
        
        
        artistLabel = UILabel()
        artistLabel.text = "Artist's Name* "
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.textColor = .black
        artistLabel.textAlignment = .center
        artistLabel.font = UIFont.systemFont(ofSize: 10)
        view.addSubview(artistLabel)
        
        artistTextField = UITextField()
        artistTextField.backgroundColor = .white
        artistTextField.translatesAutoresizingMaskIntoConstraints = false
        artistTextField.textAlignment = .left
        artistTextField.clearsOnBeginEditing = true
        artistTextField.layer.backgroundColor = UIColor(red: 0.946, green: 0.946, blue: 0.946, alpha: 1).cgColor
        artistTextField.layer.cornerRadius = 10
        view.addSubview(artistTextField)
        
        instaLabel = UILabel()
        instaLabel.text = "Instagram "
        instaLabel.translatesAutoresizingMaskIntoConstraints = false
        instaLabel.textColor = .black
        instaLabel.textAlignment = .center
        instaLabel.font = UIFont.systemFont(ofSize: 10)
        view.addSubview(instaLabel)
        
        instaTextField = UITextField()
        instaTextField.backgroundColor = .white
        instaTextField.translatesAutoresizingMaskIntoConstraints = false
        instaTextField.textAlignment = .left
        instaTextField.clearsOnBeginEditing = true
        instaTextField.layer.backgroundColor = UIColor(red: 0.946, green: 0.946, blue: 0.946, alpha: 1).cgColor
        instaTextField.layer.cornerRadius = 10
        view.addSubview(instaTextField)
        
        profileLabel = UILabel()
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        profileLabel.frame = CGRect(x: 0, y: 0, width: 45, height: 45)
        profileLabel.layer.backgroundColor = UIColor(red: 0.946, green: 0.946, blue: 0.946, alpha: 1).cgColor
        profileLabel.layer.cornerRadius = 45
        view.addSubview(profileLabel)
        
        profileTextLabel  = UILabel()
        profileTextLabel.translatesAutoresizingMaskIntoConstraints = false
        profileTextLabel.text = "Add a Profile Picture"
        profileTextLabel.textAlignment = .center
        profileTextLabel.font = UIFont.systemFont(ofSize: 10)
        view.addSubview(profileTextLabel)
        
        imageTextLabel  = UILabel()
        imageTextLabel.translatesAutoresizingMaskIntoConstraints = false
        imageTextLabel.text = "Add a Photo"
        imageTextLabel.textAlignment = .center
        imageTextLabel.font = UIFont.systemFont(ofSize: 10)
        view.addSubview(imageTextLabel)
        
        imageLabel = UILabel()
        imageLabel.translatesAutoresizingMaskIntoConstraints = false
        imageLabel.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
        imageLabel.layer.backgroundColor = UIColor(red: 0.946, green: 0.946, blue: 0.946, alpha: 1).cgColor
        imageLabel.layer.cornerRadius = 10
        view.addSubview(imageLabel)
        
        add = UIButton()
        add.layer.backgroundColor = UIColor(red: 0.388, green: 0.341, blue: 1, alpha: 1).cgColor
        add.layer.cornerRadius = 8
        add.setTitle("Add", for: .normal)
        add.setTitleColor(.white, for: .normal)
        
        //        add.addTarget(self, action: #selector(dismissViewControllerAndSaveLinks), for: .touchUpInside)
        
        add.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(add)
        
//        imageImage = UIImageView()
//        imageImage.clipsToBounds = true
//        imageImage.contentMode = .scaleAspectFit
//        imageImage.translatesAutoresizingMaskIntoConstraints = false
//        imageImage.image = UIImage(named: "landscape")!
//        imageImage.addSubview(imageImage)
        
        setupConstraints()
        
        
    }
    
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            profileLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            profileLabel.heightAnchor.constraint(equalToConstant: 90),
            profileLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -161),
            profileLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 162)
        ])
        NSLayoutConstraint.activate([
            profileTextLabel.topAnchor.constraint(equalTo: profileLabel.bottomAnchor),
            //            profileTextLabel.heightAnchor.constraint(equalToConstant: 90),
            profileTextLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 32),
            profileTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -32)
        ])
        NSLayoutConstraint.activate([
            artistLabel.topAnchor.constraint(equalTo: profileTextLabel.bottomAnchor, constant: CGFloat(padding)),
            artistLabel.heightAnchor.constraint(equalToConstant: 12),
            artistLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            artistLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -164)
        ])
        NSLayoutConstraint.activate([
            artistTextField.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 1),
            artistTextField.heightAnchor.constraint(equalToConstant: 32),
            artistTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45),
            artistTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45)
        ])
        NSLayoutConstraint.activate([
            instaLabel.topAnchor.constraint(equalTo: artistTextField.bottomAnchor, constant: CGFloat(padding)),
            instaLabel.heightAnchor.constraint(equalToConstant: 12),
            instaLabel.trailingAnchor.constraint(equalTo: artistLabel.trailingAnchor, constant: CGFloat(-padding)),
            instaLabel.leadingAnchor.constraint(equalTo: artistLabel.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            instaTextField.topAnchor.constraint(equalTo: instaLabel.bottomAnchor, constant: 1),
            instaTextField.heightAnchor.constraint(equalToConstant: 32),
            instaTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45),
            instaTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45)
        ])
        NSLayoutConstraint.activate([
            imageTextLabel.topAnchor.constraint(equalTo: instaTextField.bottomAnchor, constant: CGFloat(padding)),
            //            profileTextLabel.heightAnchor.constraint(equalToConstant: 90),
            imageTextLabel.trailingAnchor.constraint(equalTo: artistLabel.trailingAnchor, constant: CGFloat(-padding)),
            imageTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -164)
        ])
        NSLayoutConstraint.activate([
            imageLabel.topAnchor.constraint(equalTo: imageTextLabel.bottomAnchor, constant: 1),
            imageLabel.heightAnchor.constraint(equalToConstant: 120),
            imageLabel.trailingAnchor.constraint(equalTo: artistTextField.leadingAnchor, constant: 120),
            imageLabel.leadingAnchor.constraint(equalTo: artistTextField.leadingAnchor)
        ])
//        NSLayoutConstraint.activate([
//            imageImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 116),
//            imageImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 192)
//        ])
        NSLayoutConstraint.activate([
            add.widthAnchor.constraint(equalToConstant: 113),
            add.heightAnchor.constraint(equalToConstant: 38),
            add.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150),
            add.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -29)
        ])
        
    }
    
}
