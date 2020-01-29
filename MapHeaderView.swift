    //
    //  MapHeaderView.swift
    //  googlMapTutuorial2
    //
    //  Created by Girish on 17/12/19.
    //  Copyright © 2019 akhil. All rights reserved.
    //



    import Foundation
    import UIKit

    class MapHeaderView: UIView {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.backgroundColor=UIColor.clear
            self.clipsToBounds=true
            self.layer.masksToBounds=true
            setupViews()
        }
        
        func setData(title: String, img: UIImage, price: String) {
            lblTitle.text = title + ",  " + price
            imgView.image = img
            lblPrice.text = price
        }
        
        func setupViews() {
            addSubview(containerView)
            containerView.leftAnchor.constraint(equalTo: leftAnchor).isActive=true
            containerView.topAnchor.constraint(equalTo: topAnchor).isActive=true
            containerView.rightAnchor.constraint(equalTo: rightAnchor).isActive=true
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive=true
            containerView.backgroundColor = UIColor.black
            
            containerView.addSubview(plantTypeView4)
            plantTypeView4.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive=true
            plantTypeView4.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive=true
            plantTypeView4.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 30).isActive=true
            plantTypeView4.widthAnchor.constraint(equalToConstant: 70).isActive=true
            plantTypeView4.backgroundColor = UIColor.gray
            
            plantTypeView1.blink2()
            containerView.addSubview(plantTypeView1)
            plantTypeView1.leftAnchor.constraint(equalTo: plantTypeView4.rightAnchor, constant: 40).isActive=true
            plantTypeView1.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30).isActive=true
            plantTypeView1.widthAnchor.constraint(equalToConstant: 10).isActive=true
            plantTypeView1.heightAnchor.constraint(equalToConstant: 10).isActive=true
            plantTypeView1.makeRounded2()
            
            containerView.addSubview(plantTypeView1lbl)
            plantTypeView1lbl.leftAnchor.constraint(equalTo: plantTypeView4.rightAnchor, constant: 30).isActive=true
            plantTypeView1lbl.topAnchor.constraint(equalTo: plantTypeView1.bottomAnchor, constant: 0).isActive=true
            plantTypeView1lbl.widthAnchor.constraint(equalToConstant: 70).isActive=true
            plantTypeView1lbl.heightAnchor.constraint(equalToConstant: 20).isActive=true
            
            containerView.addSubview(plantTypeView2)
            plantTypeView2.leftAnchor.constraint(equalTo: plantTypeView1.rightAnchor, constant: 60).isActive=true
            plantTypeView2.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30).isActive=true
            // plantTypeView.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive=true
            plantTypeView2.widthAnchor.constraint(equalToConstant: 10).isActive=true
            plantTypeView2.heightAnchor.constraint(equalToConstant: 10).isActive=true
            plantTypeView2.makeRounded2()
            
            containerView.addSubview(plantTypeView2lbl)
            plantTypeView2lbl.leftAnchor.constraint(equalTo: plantTypeView1lbl.rightAnchor, constant: 0).isActive=true
            plantTypeView2lbl.topAnchor.constraint(equalTo: plantTypeView2.bottomAnchor, constant: 0).isActive=true
            plantTypeView2lbl.widthAnchor.constraint(equalToConstant: 80).isActive=true
            plantTypeView2lbl.heightAnchor.constraint(equalToConstant: 20).isActive=true
            
            containerView.addSubview(plantTypeView3)
            plantTypeView3.leftAnchor.constraint(equalTo: plantTypeView2.rightAnchor, constant: 60).isActive=true
            plantTypeView3.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30).isActive=true
            // plantTypeView.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive=true
            plantTypeView3.widthAnchor.constraint(equalToConstant: 10).isActive=true
            plantTypeView3.heightAnchor.constraint(equalToConstant: 10).isActive=true
            plantTypeView3.makeRounded2()
            
            
            containerView.addSubview(plantTypeView3lbl)
            plantTypeView3lbl.leftAnchor.constraint(equalTo: plantTypeView2lbl.rightAnchor, constant: 0).isActive=true
            plantTypeView3lbl.topAnchor.constraint(equalTo: plantTypeView3.bottomAnchor, constant: 0).isActive=true
            plantTypeView3lbl.widthAnchor.constraint(equalToConstant: 130).isActive=true
            plantTypeView3lbl.heightAnchor.constraint(equalToConstant: 20).isActive=true
        }
        
        let containerView: UIView = {
            let v=UIView()
            v.backgroundColor = UIColor.gray
            v.translatesAutoresizingMaskIntoConstraints=false
            //v.alpha = 0.5
            
            v.layer.borderWidth  = 2.0
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
            lbl.font=UIFont.boldSystemFont(ofSize: 24)
            lbl.textColor = UIColor(hexString: "#1e91ca")
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
        let plantTypeView1: UIView = {
            let v=UIView()
            v.backgroundColor = UIColor.orange
            v.translatesAutoresizingMaskIntoConstraints=false
            v.layer.borderWidth  = 2.0
            v.layer.cornerRadius = 0.25
            v.blink2()
            return v
        }()
        let plantTypeView1lbl: UILabel = {
            let lbl=UILabel()
            lbl.text = "Factory"
            lbl.font=UIFont.boldSystemFont(ofSize: 10)
            lbl.textColor = UIColor(hexString: "#1e91ca")
            lbl.backgroundColor = UIColor.clear
            lbl.textAlignment = .left
            lbl.translatesAutoresizingMaskIntoConstraints=false
            return lbl
        }()
        let plantTypeView2: UIView = {
            let v=UIView()
            v.backgroundColor = UIColor.blue
            v.translatesAutoresizingMaskIntoConstraints=false
            v.layer.borderWidth  = 2.0
            v.layer.cornerRadius = 0.25
            v.blink()
            return v
        }()
        let plantTypeView2lbl: UILabel = {
            let lbl=UILabel()
            lbl.text = "Warehouse"
            lbl.font=UIFont.boldSystemFont(ofSize: 10)
            lbl.textColor = UIColor(hexString: "#1e91ca")
            lbl.backgroundColor = UIColor.clear
            lbl.textAlignment = .left
            lbl.translatesAutoresizingMaskIntoConstraints=false
            return lbl
        }()
        let plantTypeView3: UIView = {
            let v=UIView()
            v.backgroundColor = UIColor.yellow
            v.translatesAutoresizingMaskIntoConstraints=false
            v.layer.borderWidth  = 2.0
            v.layer.cornerRadius = 0.25
            v.blink()
            return v
        }()
        let plantTypeView4: UIView = {
            let v=UIView()
            v.backgroundColor = UIColor.yellow
            v.translatesAutoresizingMaskIntoConstraints=false
            v.layer.borderWidth  = 2.0
            v.layer.cornerRadius = 0.25
            
            //        var path : String = Bundle.main.path(forResource: "logos", ofType: "svg") ?? "a"
            //       // var path: String = Bundle.mainBundle.path(forResource: "nameOfFile", ofType: "svg")!
            //        var url: NSURL = NSURL.fileURL(withPath: path) as NSURL //Creating a URL which points towards our path
            //
            //              //Creating a page request which will load our URL (Which points to our path)
            //        var request: NSURLRequest = NSURLRequest(url: url as URL)
            //        v.loadRequest(request as URLRequest)
            v.blink()
            return v
        }()
        let plantTypeView3lbl: UILabel = {
            let lbl=UILabel()
            lbl.text = "Regional distribution centre"
            lbl.font=UIFont.boldSystemFont(ofSize: 10)
            lbl.textColor = UIColor(hexString: "#1e91ca")
            lbl.backgroundColor = UIColor.clear
            lbl.textAlignment = .left
            lbl.translatesAutoresizingMaskIntoConstraints=false
            return lbl
        }()
        let img: UIImageView = {
            var img = UIImageView()
            img.translatesAutoresizingMaskIntoConstraints=false
            var image: UIImage = UIImage(named: "AppIcon")!
            img = UIImageView(image: image)
            img.contentMode = .scaleAspectFill
            return img
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
    }


    extension UIView {
        
        func makeRounded2() {
            self.layer.borderWidth = 1
            self.layer.masksToBounds = false
            self.layer.borderColor = UIColor.lightGray.cgColor
            self.layer.cornerRadius = 10 / 2
            self.clipsToBounds = true
            self.contentMode = UIViewContentMode.scaleAspectFill
        }
    }
    extension UIView {
        func blink2(duration: Double=0.5, repeatCount: Int=100000) {
            self.alpha = 0.0;
            UIView.animate(withDuration: duration,
                delay: 0.0,
                options: [.curveEaseInOut, .autoreverse, .repeat],
                animations: { [weak self] in
                    UIView.setAnimationRepeatCount(Float(repeatCount) + 0.5)
                    self?.alpha = 1.0
                }
            )
        }
    }
