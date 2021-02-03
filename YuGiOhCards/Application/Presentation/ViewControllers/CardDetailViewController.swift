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
    var detailLabel = UILabel()
}

extension CardDetailViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.view.addSubview(imageView)
        self.view.addSubview(nameLabel)
        self.view.addSubview(atkLabel)
        self.view.addSubview(defLabel)
        self.view.addSubview(detailLabel)
    }
}
