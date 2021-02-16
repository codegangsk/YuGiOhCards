//
//  ImageView+Extension.swift
//  YuGiOhCards
//
//  Created by Sophie Kim on 2021/02/16.
//

import UIKit
import Kingfisher

extension UIImageView {
    func loadImage(with url: URL?) {
        guard let url = url else {
            self.image = nil
            return
        }
        
        kf.setImage(with: url, options: [.transition(.fade(0.2))])
    }
}
