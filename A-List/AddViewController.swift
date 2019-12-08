//
//  AddViewController.swift
//  CelebMedia
//
//  Created by Amy Ouyang on 11/17/19.
//  Copyright © 2019 Gabriella Smith. All rights reserved.
//
import UIKit

class AddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    weak var delegate: Delegate?
    var pickerController = UIImagePickerController()
    
    var tappedProfile: Bool = false
    var tappedImage: Bool = false

    var add = UIButton()
    
    var profileAdd = UIButton()
    var profileLabel = UILabel()
    var profileTextLabel = UILabel()
    var profileImage : UIImage!
    
    var artistLabel = UILabel()
    var artistTextField = UITextField()
    
    var instaLabel = UILabel()
    var instaTextField = UITextField()
    
    var imageTextLabel = UILabel()
    var imageLabel = UILabel()
    var imageAdd = UIButton()
    var imageImage : UIImage!
    
    
    var celebs: [Celebrity]!
    let padding = 31
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        pickerController.delegate = self
        pickerController.allowsEditing = true
        pickerController.mediaTypes = ["public.image", "public.movie"]
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "Add an Artist"
        
        
        
        add = UIButton()
        add.layer.backgroundColor = UIColor(red: 0.388, green: 0.341, blue: 1, alpha: 1).cgColor
        add.layer.cornerRadius = 8
        add.setTitle("Add", for: .normal)
        add.addTarget(self, action: #selector(dismissViewControllerAndAdd), for: .touchUpInside)
        add.setTitleColor(.white, for: .normal)
        add.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(add)
        
        profileLabel = UILabel()
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        profileLabel.frame = CGRect(x: 0, y: 0, width: 45, height: 45)
        profileLabel.layer.backgroundColor = UIColor(red: 0.946, green: 0.946, blue: 0.946, alpha: 1).cgColor
        profileLabel.layer.cornerRadius = 45
        view.addSubview(profileLabel)
        
        profileTextLabel  = UILabel()
        profileTextLabel.translatesAutoresizingMaskIntoConstraints = false
        profileTextLabel.text = "Add a Profile Picture"
        profileTextLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        profileTextLabel.textAlignment = .center
        profileTextLabel.font = UIFont.systemFont(ofSize: 10)
        view.addSubview(profileTextLabel)
        
        profileAdd = UIButton()
        profileAdd.frame = CGRect(x: 0, y: 0, width: 45, height: 45)
        profileAdd.layer.cornerRadius = 45
        profileAdd.layer.backgroundColor = UIColor(red: 0.946, green: 0.946, blue: 0.946, alpha: 1).cgColor
        profileAdd.translatesAutoresizingMaskIntoConstraints = false
        profileAdd.addTarget(self, action: #selector(presentPicker), for: .touchUpInside)
        view.addSubview(profileAdd)
        
        artistLabel = UILabel()
        artistLabel.text = "Artist's Name* "
        artistLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
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
        instaLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        instaLabel.translatesAutoresizingMaskIntoConstraints = false
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
        
        imageTextLabel  = UILabel()
        imageTextLabel.translatesAutoresizingMaskIntoConstraints = false
        imageTextLabel.text = "Add a Photo"
        imageTextLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        imageTextLabel.textAlignment = .center
        imageTextLabel.font = UIFont.systemFont(ofSize: 10)
        view.addSubview(imageTextLabel)
        
        imageAdd = UIButton()
        imageAdd.layer.cornerRadius = 10
        imageAdd.layer.backgroundColor = UIColor(red: 0.946, green: 0.946, blue: 0.946, alpha: 1).cgColor
        imageAdd.setTitle("  ", for: .normal)
        imageAdd.translatesAutoresizingMaskIntoConstraints = false
        imageAdd.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
        imageAdd.addTarget(self, action: #selector(presentPicker), for: .touchUpInside)
//        imageAdd.isSelected == false
        view.addSubview(imageAdd)
        
        setupConstraints()
        
    }
    
    @objc func dismissViewControllerAndAdd() {
        let artist = artistTextField.text!
        var url = [instaTextField.text]
        let profile = profileImage!
        let image = imageImage!
//        if (artist != "" || url != nil || profile != nil || image != nil){
            delegate?.addCelebrity(to: artist, to: url, to: profile, to: image)
            print(artist, url, profile, image )
            navigationController?.popViewController(animated: true)
//        }
//        else
    }
    
    @objc func presentPicker (sender: UIButton){
        self.present(pickerController, animated: true)
        sender.isSelected = true
        if sender == imageAdd{
            tappedImage = true
        }
        if sender == profileAdd{
            tappedProfile = true
        }
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
     
        dismiss(animated: true)
        
        if tappedImage{
            imageAdd.setImage(image, for: UIControl.State.selected)
            imageImage = image
            tappedImage = false
        }
        if tappedProfile{
            profileAdd.setImage(image, for: UIControl.State.selected)
            profileImage = image
            tappedProfile = false
        }
    }
    
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            profileAdd.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            profileAdd.heightAnchor.constraint(equalToConstant: 90),
            profileAdd.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -161),
            profileAdd.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 162)
        ])
        
        NSLayoutConstraint.activate([
            profileTextLabel.topAnchor.constraint(equalTo: profileAdd.bottomAnchor),
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
            imageAdd.topAnchor.constraint(equalTo: imageTextLabel.bottomAnchor, constant: 1),
            imageAdd.heightAnchor.constraint(equalToConstant: 120),
            imageAdd.trailingAnchor.constraint(equalTo: artistTextField.leadingAnchor, constant: 120),
            imageAdd.leadingAnchor.constraint(equalTo: artistTextField.leadingAnchor)
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

