//
//  CardDetailViewController.swift
//  YuGiOhCards
//
//  Created by Sophie Kim on 2021/02/03.
//

import UIKit
import SnapKit
import Kingfisher

class CardDetailViewController: UIViewController {
    var card: Card?
    
    var imageView = UIImageView()
    var nameLabel = UILabel()
    var typeLabel = UILabel()
    var atkLabel = UILabel()
    var defLabel = UILabel()
    var raceLabel = UILabel()
    var descriptionLabel = UILabel()
}

extension CardDetailViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(imageView)
        self.view.addSubview(nameLabel)
        self.view.addSubview(typeLabel)
        self.view.addSubview(atkLabel)
        self.view.addSubview(defLabel)
        self.view.addSubview(raceLabel)
        self.view.addSubview(descriptionLabel)
        
        configureImageView()
        configureNameLabel()
        configureTypeLabel()
        configureAtkLabel()
        configureDefLabel()
        configureRaceLabel()
        configureDescriptionLabel()
        
        updateUI()
    }
}

extension CardDetailViewController {
    func configureImageView() {
        self.imageView.addConstraint(
            NSLayoutConstraint(
                item: self.imageView,
                attribute: NSLayoutConstraint.Attribute.height,
                relatedBy: NSLayoutConstraint.Relation.equal,
                toItem: self.imageView, attribute: NSLayoutConstraint.Attribute.width,
                multiplier: 10/17, constant: 0
            )
        )
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints { make in
            make.top.equalTo(105)
            make.leading.equalTo(8)
            make.trailing.equalTo(-8)
        }
    }
    
    func configureNameLabel() {
        nameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18.0)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.leading.equalTo(8)
        }
    }
    
    func configureTypeLabel() {
        typeLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.leading.equalTo(8)
        }
    }
    
    func configureAtkLabel() {
        atkLabel.snp.makeConstraints { make in
            make.top.equalTo(typeLabel.snp.bottom).offset(8)
            make.leading.equalTo(8)
        }
    }
    
    func configureDefLabel() {
        defLabel.snp.makeConstraints { make in
            make.top.equalTo(atkLabel.snp.bottom).offset(8)
            make.leading.equalTo(8)
        }
    }
    
    func configureRaceLabel() {
        raceLabel.snp.makeConstraints { make in
            make.top.equalTo(defLabel.snp.bottom).offset(8)
            make.leading.equalTo(8)
        }
    }
    
    func configureDescriptionLabel() {
        descriptionLabel.numberOfLines = 20
        descriptionLabel.textAlignment = .justified
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(raceLabel.snp.bottom).offset(8)
            make.leading.equalTo(8)
            make.trailing.equalTo(-8)
        }
    }
}

extension CardDetailViewController {
    func updateUI() {
        guard let card = card else { return }
        
        nameLabel.text = card.name
        typeLabel.text = "Type: \(card.type!)"
        descriptionLabel.text = card.desc
        
        if card.atk != nil && card.def != nil && card.race != nil {
            atkLabel.text = "ATK: \(card.atk!)"
            defLabel.text = "DEF: \(card.def!)"
            raceLabel.text = "Race: \(card.race!)"
        } else {
            atkLabel.text = "ATK: N/A"
            defLabel.text = "DEF: N/A"
            raceLabel.text = "Race: N/A"
        }
        
        guard let url = (card.card_images[0]?.image_url) else { return }
        
        imageView.loadImage(with: url)
    }
}
