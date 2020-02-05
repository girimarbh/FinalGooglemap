//
//  OperationCell.swift
//  googlMapTutuorial2
//
//  Created by Girish on 05/02/20.
//  Copyright © 2020 akhil. All rights reserved.
//

import UIKit

class OperationCell: UITableViewCell {

//     var colors = [UIColor.init(hexString: "#138b4a"),UIColor.init(hexString: "#f54450"),UIColor.init(hexString: "#e49e0d")]

let containerView: UIView = {
       let v=UIView()
       v.backgroundColor = UIColor.black
       v.translatesAutoresizingMaskIntoConstraints=false
       //v.layer.borderWidth  = 2.0
       //  v.layer.borderColor = (UIColor.red as! CGColor)
       v.layer.cornerRadius = 0.25
       return v
   }()
    
    
    



var properties = ["United States","Mexico","Canada"]
var values = [1000.0,2000.0,3000.0]

override func awakeFromNib() {
    super.awakeFromNib()
    
    // Initialization code
}
override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.backgroundColor = UIColor.white
    
    addSubview(containerView)
    

    
    updateUII()
    

  // createPieChart(chart: dietChart,property: properties, value: values)

}

required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }





func updateUII(){
    containerView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: self.frame.width, height: 300, enableInsets: true)
    
   
    
    
    
   }

}
