//
//  LeftSideMenuView.swift
//  googlMapTutuorial2
//
//  Created by Girish on 17/12/19.
//  Copyright © 2019 akhil. All rights reserved.
//



import Foundation
import UIKit

//
//RestaurantPreviewView.swift

protocol NotificationProtocal {
    func updateContentOnView()
    func updateError()
    
    
}

class LeftSideMenuView: UIView {
    var delegate : NotificationProtocal?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor=UIColor.clear
        self.clipsToBounds=true
        self.layer.masksToBounds=true
        setupViews()
    }
    
    func setData(title: String, img: UIImage, price: String) {
//        lblTitle.text = title + ",  " + price
//        imgView.image = img
//        lblPrice.text = price
        
        
    }
    
    func setupViews() {
        
        addSubview(containerView)
        containerView.leftAnchor.constraint(equalTo: leftAnchor).isActive=true
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive=true
        containerView.rightAnchor.constraint(equalTo: rightAnchor).isActive=true
        //containerView.heightAnchor.constraint(equalToConstant: 40).isActive=true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive=true
        containerView.backgroundColor = UIColor.gray
        containerView.alpha = 0.7
        
        containerView.addSubview(imgView)
        imgView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20).isActive=true
        imgView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
       // imgView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20).isActive=true
       // imgView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 20).isActive=true
        imgView.heightAnchor.constraint(equalToConstant: 60).isActive=true
        imgView.widthAnchor.constraint(equalToConstant: 60).isActive=true
        

        imgView.makeRounded()
        
        containerView.addSubview(nameLabel)
         //nameLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive=true
         nameLabel.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 0).isActive=true
        nameLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
         //nameLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 20).isActive=true
         nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive=true
         //nameLabel.widthAnchor.constraint(equalToConstant: 200).isActive=true
         nameLabel.layer.cornerRadius =  5
        
        containerView.addSubview(lineView)
         lineView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0).isActive=true
         lineView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0).isActive=true
         lineView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive=true
         lineView.heightAnchor.constraint(equalToConstant: 3).isActive=true
         //nameLabel.widthAnchor.constraint(equalToConstant: 200).isActive=true
        // nameLabel.layer.cornerRadius =  5
        
        
//        containerView.addSubview(lblTitle)
//        lblTitle.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive=true
//        lblTitle.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive=true
//        lblTitle.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 10).isActive=true
//        lblTitle.heightAnchor.constraint(equalToConstant: 40).isActive=true
        
        containerView.addSubview(mapMenuButton)
        mapMenuButton.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive=true
        mapMenuButton.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 10).isActive=true
        //mapMenuButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 40).isActive=true
        mapMenuButton.heightAnchor.constraint(equalToConstant: 40).isActive=true
        mapMenuButton.widthAnchor.constraint(equalToConstant: 180).isActive=true

        containerView.addSubview(DashboardButton)
        DashboardButton.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive=true
        DashboardButton.topAnchor.constraint(equalTo: mapMenuButton.bottomAnchor, constant: 10).isActive=true
       // DashboardButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 20).isActive=true
        DashboardButton.heightAnchor.constraint(equalToConstant: 40).isActive=true
        DashboardButton.widthAnchor.constraint(equalToConstant: 180).isActive=true


        containerView.addSubview(settingButton)
        settingButton.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive=true
        settingButton.topAnchor.constraint(equalTo: DashboardButton.bottomAnchor, constant: 10).isActive=true
        //settingButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 20).isActive=true
        settingButton.heightAnchor.constraint(equalToConstant: 40).isActive=true
        settingButton.widthAnchor.constraint(equalToConstant: 180).isActive=true


        
//        containerView.addSubview(lblPrice)
//        lblPrice.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive=true
//        lblPrice.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 0).isActive=true
//        lblPrice.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 10).isActive=true
//        lblPrice.heightAnchor.constraint(equalToConstant: 20).isActive=true
//
//
//        containerView.addSubview(progressView)
//
//        progressView.topAnchor.constraint(equalTo: lblPrice.bottomAnchor, constant: 10).isActive=true
//        progressView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive=true
//        progressView.heightAnchor.constraint(equalToConstant: 10).isActive=true
//        progressView.widthAnchor.constraint(equalToConstant: 350).isActive=true
//
//        containerView.addSubview(percentageLabel)
//        percentageLabel.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 10).isActive=true
//        percentageLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive=true
//        //percentageLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 10).isActive=true
//        percentageLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 50).isActive=true
//        percentageLabel.heightAnchor.constraint(equalToConstant: 25).isActive=true
    }
    
    let containerView: UIView = {
        let v=UIView()
        v.backgroundColor = UIColor.gray
        v.translatesAutoresizingMaskIntoConstraints=false
        
        v.layer.borderWidth  = 2.0
        //  v.layer.borderColor = (UIColor.red as! CGColor)
        v.layer.cornerRadius = 0.25
        
        
        return v
    }()
    
    let lineView: UIView = {
           let v=UIView()
           v.backgroundColor = UIColor.lightGray
           v.translatesAutoresizingMaskIntoConstraints=false
           //v.layer.borderWidth  = 2.0
           //  v.layer.borderColor = (UIColor.red as! CGColor)
          // v.layer.cornerRadius = 0.25
           
           
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
        lbl.font=UIFont.boldSystemFont(ofSize: 24)
        lbl.textColor = UIColor(hexString: "#1e91ca")
        lbl.backgroundColor = UIColor.clear
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    
    let nameLabel: UILabel = {
        let lbl=UILabel()
        lbl.text = "Girish@wipro.com "
        lbl.font=UIFont.boldSystemFont(ofSize: 14)
        lbl.textColor = UIColor.black
        lbl.backgroundColor = UIColor.clear
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    
    
    let lblPrice: UILabel = {
        let lbl=UILabel()
        lbl.text = "Name"
        lbl.font=UIFont.boldSystemFont(ofSize: 18)
        lbl.textColor = UIColor.white
        lbl.backgroundColor = UIColor.clear
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    let percentageLabel: UILabel = {
        let lbl=UILabel()
        lbl.text = "54% healthy"
        lbl.font=UIFont.boldSystemFont(ofSize:20)
        lbl.textColor = UIColor.green
        lbl.backgroundColor = UIColor.clear
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    let mapMenuButton : UIButton = {
        let btn = UIButton()
//        btn.titleLabel?.text = "MAP"
//        btn.backgroundColor = UIColor.gray
      btn.titleLabel?.textColor = UIColor.green
        
        btn.backgroundColor = UIColor.lightGray
        btn.setTitle("MAP", for: .normal)
        
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.addTarget(self, action: #selector(handleButton(_:)), for: .touchUpInside)
        return btn
        
    }()
    let DashboardButton : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.lightGray
        btn.setTitle("Dashboard", for: .normal)
        btn.titleLabel?.textColor = UIColor.green
        btn.translatesAutoresizingMaskIntoConstraints=false
        return btn
        
    }()
    let settingButton : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.lightGray
        btn.setTitle("Settings", for: .normal)
         btn.titleLabel?.textColor = UIColor.green
        
        btn.translatesAutoresizingMaskIntoConstraints=false
        return btn
        
    }()
    let progressView : UIProgressView = {
        
        let progess = UIView()
        progess.backgroundColor = UIColor.red
        let progressview = UIProgressView(progressViewStyle: .bar)
        progressview.center = progess.center
        progressview.setProgress(0.5, animated: true)
        progressview.trackTintColor = UIColor.white
        progressview.tintColor = UIColor.green
        progressview.backgroundColor = UIColor.green
        progressview.progress = 0.5
        progressview.clipsToBounds = true
        progressview.layer.cornerRadius = 5
        progressview.translatesAutoresizingMaskIntoConstraints=false
        return progressview
        
    }()
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    // Handle Action

        @objc func handleButton(_ sender: AnyObject) {

         delegate?.updateContentOnView()
    }
}

extension UIImageView {

    func makeRounded() {

        self.layer.borderWidth = 0
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 70 / 2
        self.clipsToBounds = true
        self.contentMode = UIViewContentMode.scaleAspectFill
    }
}

