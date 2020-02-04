//
//  RatingView.swift
//  WayMovies
//
//  Created by Hersh Nagpal on 2/4/20.
//  Copyright © 2020 Hersh Nagpal. All rights reserved.
//

import UIKit

class RatingView: UIView {
    
    // List which holds the 5 star images
    var starList:[UIImageView] = []
    
    // Width of each star
    let starWidth:CGFloat = 40
    
    // Height of each star
    let starHeight:CGFloat = 40
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createElementsAndConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     Adds all elements to the subview and calls constraining helper methods.
     */
    private func createElementsAndConstraints() {
        createRatingStars()
    }
    
    /**
     Creates and constrains the rating stars
     */
    private func createRatingStars() {
        
        for i in 0...4 {
            let star:UIImageView = {
                let image = UIImageView()
                image.image = UIImage(named: "star.png")
                image.clipsToBounds = true
                image.image = image.image?.withTintColor(yellow)
                image.translatesAutoresizingMaskIntoConstraints = false
                return image
            }()
//            self.addSubview(star)
            starList.append(star)
            self.addSubview(starList[i])
            if i == 0 {
                NSLayoutConstraint.activate([
                    star.leftAnchor.constraint(equalTo: self.leftAnchor),
                    star.heightAnchor.constraint(equalToConstant: starHeight),
                    star.widthAnchor.constraint(equalToConstant: starWidth)
                ])
            } else {
                NSLayoutConstraint.activate([
                    star.leftAnchor.constraint(equalTo: starList[i-1].rightAnchor),
                    star.heightAnchor.constraint(equalToConstant: starHeight),
                    star.widthAnchor.constraint(equalToConstant: starWidth)
                ])
            }
            self.addSubview(star)
        }
    }

}
