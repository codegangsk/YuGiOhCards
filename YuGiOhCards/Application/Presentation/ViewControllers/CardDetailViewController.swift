//
//  CardDetailViewController.swift
//  YuGiOhCards
//
//  Created by Sophie Kim on 2021/02/03.
//

import UIKit
import SnapKit

class CardDetailViewController: UIViewController {
    var card: Card?
    
    var imageView = UIImageView()
    var nameLabel = UILabel()
    var atkLabel = UILabel()
    var defLabel = UILabel()
    var descriptionLabel = UILabel()
}

extension CardDetailViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(imageView)
        self.view.addSubview(nameLabel)
        self.view.addSubview(atkLabel)
        self.view.addSubview(defLabel)
        self.view.addSubview(descriptionLabel)
        
        makeImageViewLayout()
        makeNameLableLayout()
        makeAtkLabelLayout()
        makeDefLabelLayout()
        makeDescriptionLabelLayout()
        
        updateUI()
    }
}

extension CardDetailViewController {
    func makeImageViewLayout() {
        self.imageView.addConstraint(NSLayoutConstraint(item: self.imageView,
                                                        attribute: NSLayoutConstraint.Attribute.height,
                                                        relatedBy: NSLayoutConstraint.Relation.equal,
                                                        toItem: self.imageView, attribute: NSLayoutConstraint.Attribute.width,
                                                        multiplier: 10/17, constant: 0))
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints { make in
            make.top.equalTo(105)
            make.leading.equalTo(8)
            make.trailing.equalTo(-8)
        }
    }
    
    func makeNameLableLayout() {
        nameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18.0)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.leading.equalTo(8)
        }
    }
    
    func makeAtkLabelLayout() {
        atkLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.leading.equalTo(8)
        }
    }
    
    func makeDefLabelLayout() {
        defLabel.snp.makeConstraints { make in
            make.top.equalTo(atkLabel.snp.bottom).offset(8)
            make.leading.equalTo(8)
        }
    }
    
    func makeDescriptionLabelLayout() {
        descriptionLabel.numberOfLines = 20
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(defLabel.snp.bottom).offset(8)
            make.leading.equalTo(8)
            make.trailing.equalTo(-8)
        }
    }
}

extension CardDetailViewController {
    func updateUI() {
        guard let card = card else { return }
        nameLabel.text = card.name
        descriptionLabel.text = card.desc
        
        if card.atk != nil && card.def != nil {
            atkLabel.text = "ATK: \(card.atk!)"
            defLabel.text = "DEF: \(card.def!)"
        } else {
            atkLabel.text = "ATK: N/A"
            defLabel.text = "DEF: N/A"
        }
    
        let url = (card.card_images[0]?.image_url)!
        if let data = try? Data(contentsOf: url) {
            imageView.image = UIImage(data: data)
        }
    }
    
}


