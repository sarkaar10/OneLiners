//
//  AudioCell.swift
//  One Liners
//
//  Created by Ajit Sarkaar on 01/11/17.
//  Copyright © 2017 Ajit Sarkaar. All rights reserved.
//

import Foundation
import UIKit

class AudioCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        addSubview(imageView);
        addSubview(nameLabel);
        
        imageView.translatesAutoresizingMaskIntoConstraints = false;
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true;
        imageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true;
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true;
        imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true;
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false;
        nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4).isActive = true;
        nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true;
        nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true;
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true;

        
        let quarterScreenWidth = UIScreen.main.bounds.width/4;
        
        imageView.layer.cornerRadius = (quarterScreenWidth - 32)/2;
        imageView.layer.masksToBounds = true;
        
        
        
    }
    
    var snippet: Snippet? {
        didSet {
            self.imageView.image = snippet?.image;
            self.nameLabel.text = snippet?.name;
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    let imageView: UIImageView = {
        let view = UIImageView();
        view.contentMode = .scaleAspectFill;
        view.backgroundColor = UIColor(red: 235, green: 235, blue: 235, alpha: 1);
        return view;
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel();
        //label.backgroundColor = .blue;
        label.textAlignment = .center;
        label.font = UIFont.boldSystemFont(ofSize: 12);
        return label;
    }()
    
}
