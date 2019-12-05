//
//  ArtistHeader.swift
//  CelebMedia
//
//  Created by Gabriella Smith on 11/17/19.
//  Copyright © 2019 Gabriella Smith. All rights reserved.
//
import UIKit

class ArtistHeader: UITableViewHeaderFooterView {
    var artistLabel: UILabel!
    var artistCountLabel: UILabel!

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        artistLabel = UILabel()
        artistLabel.text = "Artists"
        artistLabel.addCharacterSpacing(kernValue: 1.8)
        artistLabel.frame = CGRect(x: 0, y: 0, width: 106, height: 36)
        artistLabel.font = UIFont(name: "Verdana", size: 30)
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(artistLabel)
        
        artistCountLabel = UILabel()
        artistCountLabel.addCharacterSpacing(kernValue: 0.68)
        artistCountLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        artistCountLabel.font = UIFont(name: "Verdana", size: 17)
        artistCountLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(artistCountLabel)
        
        NSLayoutConstraint.activate([
            artistLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            artistLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 21),
        ])
        NSLayoutConstraint.activate([
            artistCountLabel.heightAnchor.constraint(equalToConstant: 20),
            artistCountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            artistCountLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 57),
          ])
    }
}

extension UILabel {
    func addCharacterSpacing(kernValue: CGFloat) {
    if let labelText = text, labelText.count > 0 {
      let attributedString = NSMutableAttributedString(string: labelText)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: attributedString.length - 1))
      attributedText = attributedString
    }
  }
}
