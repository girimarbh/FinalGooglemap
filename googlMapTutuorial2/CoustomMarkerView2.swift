

//
//  RestaurantPreviewView.swift
//  googlMapTutuorial2
//
//  Created by Muskan on 12/17/17.
//  Copyright © 2017 akhil. All rights reserved.
//

import Foundation
import UIKit

//
//RestaurantPreviewView.swift

class InfoPreviewView2: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor=UIColor.clear
        self.clipsToBounds=true
        self.layer.masksToBounds=true
        setupViews()
    }
    
    func setData(title: String, img: UIImage, price: String) {
        lblTitle.text = title
        imgView.image = img
        lblPrice.text = "$\(price)"
        
        
    }
    
    func setupViews() {
        
        addSubview(containerView)
        containerView.leftAnchor.constraint(equalTo: leftAnchor).isActive=true
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive=true
        containerView.rightAnchor.constraint(equalTo: rightAnchor).isActive=true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive=true
        containerView.backgroundColor = UIColor.black
        
        
        containerView.addSubview(lblTitle)
        lblTitle.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive=true
        lblTitle.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive=true
        lblTitle.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 10).isActive=true
        lblTitle.heightAnchor.constraint(equalToConstant: 55).isActive=true

        
        
        containerView.addSubview(progressView)
        
        progressView.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 10).isActive=true
        progressView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive=true
        progressView.heightAnchor.constraint(equalToConstant: 20).isActive=true
        progressView.widthAnchor.constraint(equalToConstant: 350).isActive=true
        
        
        
        containerView.addSubview(lblPrice)
        lblPrice.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive=true
        lblPrice.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 20).isActive=true
        lblPrice.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 50).isActive=true
        lblPrice.heightAnchor.constraint(equalToConstant: 35).isActive=true
        
        containerView.addSubview(percentageLabel)
        percentageLabel.topAnchor.constraint(equalTo: lblPrice.bottomAnchor, constant: 10).isActive=true
        percentageLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive=true
        //percentageLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 10).isActive=true
        percentageLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 50).isActive=true
        percentageLabel.heightAnchor.constraint(equalToConstant: 25).isActive=true
    }
    
    let containerView: UIView = {
        let v=UIView()
        v.backgroundColor = UIColor.black
        v.translatesAutoresizingMaskIntoConstraints=false
        
        v.layer.borderWidth  = 5.0
        //  v.layer.borderColor = (UIColor.red as! CGColor)
        v.layer.cornerRadius = 0.25
        
        
        return v
    }()
    
    let imgView: UIImageView = {
        let v=UIImageView()
        v.image=#imageLiteral(resourceName: "restaurant1")
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()
    
    let lblTitle: UILabel = {
        let lbl=UILabel()
        lbl.text = "     Name"
        lbl.font=UIFont.boldSystemFont(ofSize: 44)
        lbl.textColor = UIColor.green
        lbl.backgroundColor = UIColor.clear
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    
    let lblPrice: UILabel = {
        let lbl=UILabel()
        lbl.text = "Name"
        lbl.font=UIFont.boldSystemFont(ofSize: 38)
        lbl.textColor = UIColor.white
        lbl.backgroundColor = UIColor.clear
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    let percentageLabel: UILabel = {
        let lbl=UILabel()
        lbl.text = "54 percent healthy"
        lbl.font=UIFont.boldSystemFont(ofSize:20)
        lbl.textColor = UIColor.green
        lbl.backgroundColor = UIColor.clear
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    
    let progressView : UIProgressView = {
        
        let progess = UIView()
        progess.backgroundColor = UIColor.red
        
        
        let progressview = UIProgressView(progressViewStyle: .bar)
        progressview.center = progess.center
        progressview.setProgress(0.5, animated: true)
        progressview.trackTintColor = UIColor.lightGray
        progressview.tintColor = UIColor.green
        progressview.backgroundColor = UIColor.green
        progressview.progress = 0.5
        progressview.clipsToBounds = true
        progressview.layer.cornerRadius = 10
       // progressview.layer.cornerRadius = 5
        //progressview.progressTintColor = UIColor.red
        
        //progess.addSubview(progressview)
        progressview.translatesAutoresizingMaskIntoConstraints=false
        return progressview
        
    }()
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
