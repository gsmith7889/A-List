//
//  EditViewController.swift
//  A-List
//
//  Created by Amy Ouyang on 12/7/19.
//  Copyright © 2019 Gabriella Smith. All rights reserved.
//

import UIKit

class EditViewController: ViewController {
    var celebrity: Celebrity
    var nameLabel: UILabel!
    var profileView: UIImageView!
    var nameText: UILabel!
    var bar: UILabel!
    
    var profileLabel = UILabel()
    var profileTextLabel = UILabel()
    var artistLabel = UILabel()
    var artistTextField = UITextField()
    var instaLabel = UILabel()
    var instaTextField = UITextField()
    var imageTextLabel = UILabel()
    var imageLabel = UILabel()
    
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
        title = "Edit"
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
        
//        bar = UIImageView()
//        bar.frame = CGRect(x: 0, y: 0, width: 369, height: 51)
//        bar.backgroundColor = .white
        
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
        
        setupConstraints()
    }

//    @objc func dismissViewControllerAndSaveText() {
//           artistTextField
//           instaTextField = UITextField()
//
//           var imageTextLabel = UILabel()
//           if let text = ATextField.text, text != "" {
//                      wLabel.text = ""
//                      delegate?.changeButtonTextB(to: text)
//                      dismiss(animated: true, completion: nil)
//                  }
//
//              }
    
    override func setupConstraints() {
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
    }
    
}
// Do any additional setup after loading the view.



/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


