

    import Foundation
    import UIKit


    

    class CustomMarkerView: UIView {

        var img: UIImage!
        var borderColor: UIColor!
        var title : String!
        
        init(frame: CGRect, image: UIImage, borderColor: UIColor, tag: Int , title:String ) {
            super.init(frame: frame)
            self.img=image
            self.borderColor=borderColor
            self.tag = tag
            self.title =  title
            
            
            
            setupViews()
        }
        
        func setupViews() {
            
            var image = UIImage(named:"triangle.png")
            let imgView = UIImageView(image: image)
            imgView.frame=CGRect(x: 40, y: 45, width: 25, height: 25)
            imgView.layer.borderColor=borderColor?.cgColor
            imgView.layer.borderWidth=2
            imgView.clipsToBounds=true
            
            let lbl = UILabel()
            let lbl2 = UILabel()
            
            
            //imgView.frame=CGRect(x: 0, y: 150, width: 100, height: 50)
            lbl.frame  = CGRect(x: 0, y: 20,width: 100,height: 20)
            lbl.text = title
            lbl.font=UIFont.boldSystemFont(ofSize: 16)
            lbl.textColor=UIColor.white
            lbl.backgroundColor=UIColor.black
            lbl.layer.borderColor = UIColor.green.cgColor;
            lbl.layer.borderWidth = 1.0;
            
            lbl.textAlignment = .center
            lbl.layer.cornerRadius = 5
            lbl.clipsToBounds=true
           // lbl.translatesAutoresizingMaskIntoConstraints=false
            // self.addSubview(imgView)
            self.addSubview(lbl)
            
            lbl2.frame  = CGRect(x: 40, y: 0,width: 25,height: 25)
            lbl2.text = "65"
            lbl2.font=UIFont.boldSystemFont(ofSize: 16)
            lbl2.textColor=UIColor.white
            lbl2.backgroundColor=UIColor.black
            lbl2.layer.borderColor = UIColor.green.cgColor
            lbl2.layer.borderWidth = 1.0;
            
            lbl2.textAlignment = .center
            lbl2.layer.cornerRadius =  lbl2.frame.height/2
           // lbl2.layer.masksToBounds = true
            //lbl2.layer.cornerRadius = lbl2.frame.width/2
            //lbl2.layer.cornerRadius = 10
            lbl2.clipsToBounds=true
            //lbl2.layer.animateBorderColor(from: UIColor.green, to: UIColor.red, withDuration: 1.0)
            lbl2.blink()
           
            //lbl2.translatesAutoresizingMaskIntoConstraints=false
            
            self.addSubview(lbl)
            self.addSubview(lbl2)
        
            //self.addSubview(imgView)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }
    extension UIView {
        func blink(duration: Double=0.5, repeatCount: Int=100000) {
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
    extension UIView {
      func animateBorderWidth(toValue: CGFloat, duration: Double) {
        let animation:CABasicAnimation = CABasicAnimation(keyPath: "borderWidth")
        animation.fromValue = layer.borderWidth
        animation.toValue = toValue
        animation.duration = duration
        layer.add(animation, forKey: "Width")
        layer.borderWidth = toValue
      }
    }
    extension CALayer {
        
        

    func animateBorderColor(from startColor: UIColor, to endColor: UIColor, withDuration duration: Double) {
        let colorAnimation = CABasicAnimation(keyPath: "borderColor")
        colorAnimation.fromValue = startColor.cgColor
        colorAnimation.toValue = endColor.cgColor
        colorAnimation.duration = duration
        self.borderColor = endColor.cgColor
        self.add(colorAnimation, forKey: "borderColor")
    }
    }







