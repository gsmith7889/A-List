//
//  ArtistViewController.swift
//  CelebMedia
//
//  Created by Amy Ouyang on 11/17/19.
//  Copyright © 2019 Gabriella Smith. All rights reserved.
//
import UIKit

class ArtistViewController: ViewController {
    
    var celebrity: Celebrity
    var nameLabel: UILabel!
    var profileView: UIImageView!
    var nameText: UILabel!
    let profileLength: CGFloat = 55

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
        
        nameLabel = UILabel()
        nameLabel.font = UIFont(name: "Verdana", size: 17)
        nameLabel.text = celebrity.name
        nameLabel.addCharacterSpacing(kernValue: 0.68)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        profileView = UIImageView()
        profileView.clipsToBounds = true
        profileView.layer.cornerRadius = profileLength/2
        profileView.contentMode = .scaleAspectFill
        profileView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileView)

        setupConstraints()
    }
    
//    override func setupConstraints() {
//        NSLayoutConstraint.activate([
//            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 89),
//            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 12)
//        ])
//    }
}
