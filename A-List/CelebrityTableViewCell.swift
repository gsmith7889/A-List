//
//  CelebrityTableViewCell.swift
//  CelebMedia
//
//  Created by Gabriella Smith on 11/16/19.
//  Copyright © 2019 Gabriella Smith. All rights reserved.
//
import UIKit

class CelebrityTableViewCell: UITableViewCell {
    
    var nameLabel: UILabel!
    var profileView: UIImageView!
    var ellipse : UIButton!
    
    let nameLabelHeight: CGFloat = 20
    let profileLength: CGFloat = 55

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.frame = CGRect(x: 0, y: 0, width: 379, height: 74)
        let shadows = UIView()
        shadows.frame = contentView.frame
        shadows.clipsToBounds = false
        contentView.addSubview(shadows)
        
        let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 20)
        let layer0 = CALayer()
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 4
        layer0.shadowOffset = CGSize(width: 0, height: 3)
        layer0.bounds = shadows.bounds
        layer0.position = shadows.center
        shadows.layer.addSublayer(layer0)

        let shapes = UIView()
        shapes.frame = contentView.frame
        shapes.clipsToBounds = true
        contentView.addSubview(shapes)

        let layer1 = CALayer()
        layer1.backgroundColor = UIColor(red: 1, green: 0.996, blue: 0.996, alpha: 1).cgColor
        layer1.bounds = shapes.bounds
        layer1.position = shapes.center
        shapes.layer.addSublayer(layer1)
        
        shapes.layer.cornerRadius = 20
        
        nameLabel = UILabel()
        nameLabel.font = UIFont(name: "Verdana", size: 17)
        nameLabel.addCharacterSpacing(kernValue: 0.68)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        
        profileView = UIImageView()
        profileView.clipsToBounds = true
        profileView.layer.cornerRadius = profileLength/2
        profileView.contentMode = .scaleAspectFill
        profileView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(profileView)
        
        ellipse = UIButton(type: .custom)
        ellipse.translatesAutoresizingMaskIntoConstraints = false
        if let image = UIImage(named: "e") {
            ellipse.setImage(image, for: .normal)
        }
        contentView.addSubview(ellipse)
        
        layoutSubviews()
        setupConstraints()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 2, left: 2, bottom: 0, right: 0))
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            profileView.heightAnchor.constraint(equalToConstant: profileLength),
            profileView.widthAnchor.constraint(equalToConstant: profileLength),
            profileView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
            profileView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 9),
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 89),
            nameLabel.heightAnchor.constraint(equalToConstant: nameLabelHeight),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12)
        ])
        
        NSLayoutConstraint.activate([
            ellipse.widthAnchor.constraint(equalToConstant: 21),
            ellipse.heightAnchor.constraint(equalToConstant: 5),
            ellipse.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 333),
            ellipse.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 21),
        ])
    }
    
    func configure(for celebrity: Celebrity) {
        nameLabel.text = celebrity.name
        profileView.image = UIImage(named: celebrity.profile )!
    }
    
   
               
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
