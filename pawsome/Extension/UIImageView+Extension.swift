//
//  UIImageView+Extension.swift
//  Pawsome
//
//  Created by Roch on 3/31/22.
//

import Foundation
import AlamofireImage

extension UIImageView {
    
    func setImage(urlString: String?, placeHolderImage: UIImage? = UIImage(named: "placeholderImage"), completion: (() -> ())? = nil ) {
        if let urlString = urlString,
           let encodedURLString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let url = URL(string: encodedURLString) {
            self.af.setImage(withURL: url, placeholderImage: placeHolderImage, completion: { imageResponse in
                completion?()
            })
        } else {
            self.image = placeHolderImage
        }
    }
    
    func makeBlurImage() {
        let imageView = self
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = imageView.bounds
        
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        imageView.addSubview(blurEffectView)
    }
    
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
    
}
