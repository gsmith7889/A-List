//
//  ArtistViewController.swift
//  CelebMedia
//
//  Created by Amy Ouyang on 11/17/19.
//  Copyright © 2019 Gabriella Smith. All rights reserved.
//
import UIKit
import SafariServices

class ArtistViewController: UIViewController {
    
    var celebrity: Celebrity
    
    var nameLabel: UILabel!
    var profileView: UIImageView!
    var nameText: UILabel!
    var bar: UILabel!
    var photoView: UIImageView!
    
    var instaButton = UIButton()
    var twitterButton = UIButton()
    var spotifyButton = UIButton()

    
    let nameLabelHeight: CGFloat = 36
    let profileLength: CGFloat = 65
    
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
        
        bar = UILabel()
        bar.frame = CGRect(x: 0, y: 0, width: 369, height: 51)
        bar.backgroundColor = .white
        
        photoView = UIImageView()
        photoView.image = UIImage(named: celebrity.photo)!
        photoView.clipsToBounds = true
        photoView.layer.cornerRadius = profileLength/2
        photoView.contentMode = .scaleAspectFill
        photoView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(photoView)
        
        let shadows = UIView()
        shadows.frame = bar.frame
        shadows.clipsToBounds = false
        bar.addSubview(shadows)

        let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 50)
        let layer0 = CALayer()
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 10
        layer0.shadowOffset = CGSize(width: 0, height: 4)
        layer0.bounds = shadows.bounds
        layer0.position = shadows.center
        shadows.layer.addSublayer(layer0)

        let shapes = UIView()
        shapes.frame = bar.frame
        shapes.clipsToBounds = true
        bar.addSubview(shapes)

        let layer1 = CALayer()
        layer1.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        layer1.bounds = shapes.bounds
        layer1.position = shapes.center
        shapes.layer.addSublayer(layer1)

        shapes.layer.cornerRadius = 25
        bar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bar)
        
        instaButton = UIButton()
        instaButton.frame = CGRect(x: 0, y: 0, width: 28, height: 28)
        instaButton.layer.cornerRadius = 45
//        instaButton.layer.backgroundColor = UIColor(red: 0.946, green: 0.946, blue: 0.946, alpha: 1).cgColor
        instaButton.setImage(UIImage(named: "insta"), for: .normal)
        instaButton.translatesAutoresizingMaskIntoConstraints = false
        instaButton.addTarget(self, action: #selector(displayUrl), for: .touchUpInside)
        view.addSubview(instaButton)
        
        twitterButton = UIButton()
        twitterButton.frame = CGRect(x: 0, y: 0, width: 28, height: 28)
        twitterButton.layer.cornerRadius = 45
        //        instaButton.layer.backgroundColor = UIColor(red: 0.946, green: 0.946, blue: 0.946, alpha: 1).cgColor
        twitterButton.setImage(UIImage(named: "twitter"), for: .normal)
        twitterButton.translatesAutoresizingMaskIntoConstraints = false
        twitterButton.addTarget(self, action: #selector(displayUrl), for: .touchUpInside)
        view.addSubview(twitterButton)
        
        spotifyButton = UIButton()
        spotifyButton.frame = CGRect(x: 0, y: 0, width: 28, height: 28)
        spotifyButton.layer.cornerRadius = 45
        //        instaButton.layer.backgroundColor = UIColor(red: 0.946, green: 0.946, blue: 0.946, alpha: 1).cgColor
        spotifyButton.setImage(UIImage(named: "spotify"), for: .normal)
        spotifyButton.translatesAutoresizingMaskIntoConstraints = false
        spotifyButton.addTarget(self, action: #selector(displayUrl), for: .touchUpInside)
        view.addSubview(spotifyButton)

        setupConstraints()
    }
    
    @objc func displayUrl(sender: UIButton){
        var index: Int = 0
        
        if (sender == instaButton){
            index = 0
        }else if (sender == twitterButton){
            index = 1
        }else if (sender == spotifyButton){
            index = 2
        }
        if let url = URL(string: celebrity.urls[index]) {
            //            UIApplication.shared.open(url)
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            
            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
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
        
        NSLayoutConstraint.activate([
            bar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            bar.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16)
            //            bar.heightAnchor.constraint(equalToConstant: 51),
            //            bar.widthAnchor.constraint(equalToConstant: 369),
        ])
        
        NSLayoutConstraint.activate([
            instaButton.leadingAnchor.constraint(equalTo: bar.leadingAnchor, constant: 107),
            instaButton.topAnchor.constraint(equalTo: bar.bottomAnchor, constant: 12),
            instaButton.heightAnchor.constraint(equalToConstant: 28),
            instaButton.widthAnchor.constraint(equalToConstant: 28)

        ])
        
        NSLayoutConstraint.activate([
            twitterButton.leadingAnchor.constraint(equalTo: instaButton.trailingAnchor, constant: 36),
            twitterButton.topAnchor.constraint(equalTo: bar.bottomAnchor, constant: 12),
            twitterButton.heightAnchor.constraint(equalToConstant: 28),
            twitterButton.widthAnchor.constraint(equalToConstant: 28)

        ])
        
        
        NSLayoutConstraint.activate([
            spotifyButton.leadingAnchor.constraint(equalTo: twitterButton.trailingAnchor, constant: 36),
            spotifyButton.topAnchor.constraint(equalTo: bar.bottomAnchor, constant: 12),
            spotifyButton.heightAnchor.constraint(equalToConstant: 28),
            spotifyButton.widthAnchor.constraint(equalToConstant: 28)

        ])
        
        NSLayoutConstraint.activate([
            photoView.heightAnchor.constraint(equalToConstant: 527),
            photoView.widthAnchor.constraint(equalToConstant: 369),
            photoView.topAnchor.constraint(equalTo: bar.bottomAnchor, constant: 80),
            photoView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    
        ])
    }
    
}
