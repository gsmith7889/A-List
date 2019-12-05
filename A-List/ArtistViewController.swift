//
//  ArtistViewController.swift
//  CelebMedia
//
//  Created by Amy Ouyang on 11/17/19.
//  Copyright © 2019 Gabriella Smith. All rights reserved.
//
import UIKit

class ArtistViewController: UIViewController {
    
    var celebrity: Celebrity
    var nameLabel: UILabel!
    var profileView: UIImageView!
    var nameText: UILabel!
    
    let nameLabelHeight: CGFloat = 36
    let profileLength: CGFloat = 65

//    weak var delegate: ArtistDelegate?
    
    init(celebrity: Celebrity) {
        self.celebrity = celebrity
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        nameLabel = UILabel()
        nameLabel.font = UIFont(name: "Verdana", size: 30)
        nameLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        nameLabel.text = celebrity.name
        nameLabel.addCharacterSpacing(kernValue: 0.75)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        profileView = UIImageView()
        profileView.image = UIImage(named: celebrity.profile)!
        profileView.clipsToBounds = true
        profileView.layer.cornerRadius = profileLength/2
        profileView.contentMode = .scaleAspectFill
        profileView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileView)

        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            profileView.heightAnchor.constraint(equalToConstant: profileLength),
            profileView.widthAnchor.constraint(equalToConstant: profileLength),
            profileView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: nameLabelHeight),
            nameLabel.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 16)
        ])
    }
    
}
