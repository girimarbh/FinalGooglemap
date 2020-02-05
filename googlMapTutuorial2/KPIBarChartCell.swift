//
//  KPIBarChartCell.swift
//  googlMapTutuorial2
//
//  Created by Girish on 05/02/20.
//  Copyright © 2020 akhil. All rights reserved.
//

import UIKit
import Charts

class KPIBarChartCell: UITableViewCell {

//     var colors = [UIColor.init(hexString: "#138b4a"),UIColor.init(hexString: "#f54450"),UIColor.init(hexString: "#e49e0d")]

let containerView: UIView = {
       let v=UIView()
       v.backgroundColor = UIColor.white
       v.translatesAutoresizingMaskIntoConstraints=false
       //v.layer.borderWidth  = 2.0
       //  v.layer.borderColor = (UIColor.red as! CGColor)
       v.layer.cornerRadius = 0.25
       
       
       return v
   }()
    
    let containerview2: UIView = {
        let v=UIView()
        v.backgroundColor = UIColor.gray
        v.translatesAutoresizingMaskIntoConstraints=false
        //v.layer.borderWidth  = 2.0
        //  v.layer.borderColor = (UIColor.red as! CGColor)
        v.layer.cornerRadius = 0.25
        
        
        return v
    }()
    
    let barchartcontainerView: UIView = {
        let v=UIView()
        v.backgroundColor = UIColor.black
        v.translatesAutoresizingMaskIntoConstraints=false
        //v.layer.borderWidth  = 2.0
        //  v.layer.borderColor = (UIColor.red as! CGColor)
        v.layer.cornerRadius = 0.25
        
        
        return v
    }()
    
public let KpiNameLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = UIFont.systemFont(ofSize: 8)
        lbl.textAlignment = .center
        lbl.layer.cornerRadius = 0.5
        lbl.backgroundColor = UIColor.init(hexString: "#2AC1C9")
        lbl.text = "KPI Name"
        return lbl
    }()
public let dailyLabelbtn : UIButton = {
    let btn = UIButton()
    btn.titleLabel?.text = "Daily"
    btn.layer.cornerRadius = 0.5
    btn.backgroundColor = UIColor.lightGray
    
    return btn
}()

public let monthlyLabelbtn : UIButton = {
    let btn = UIButton()
    btn.titleLabel?.text = "Monthly"
    btn.layer.cornerRadius = 0.5
    btn.backgroundColor = UIColor.purple
    
    return btn
}()
public let weeklyLabelbtn : UIButton = {
    let btn = UIButton()
    btn.titleLabel?.text = "Weekly"
    btn.layer.cornerRadius = 0.5
    btn.backgroundColor = UIColor.orange
    
    return btn
}()

public let scnearioDateLabel : UILabel = {
    let lbl = UILabel()
    lbl.textColor = .white
    lbl.font = UIFont.systemFont(ofSize: 8)
    lbl.textAlignment = .center
    lbl.layer.cornerRadius = 0.5
    lbl.backgroundColor = UIColor.init(hexString: "#2AC1C9")
    lbl.text = "Scenario Date"
    return lbl
}()
    
    public let scnearioDatevalueLabel : UILabel = {
         let lbl = UILabel()
         lbl.textColor = .white
         lbl.font = UIFont.systemFont(ofSize: 14)
         lbl.textAlignment = .center
         lbl.translatesAutoresizingMaskIntoConstraints = false
         lbl.backgroundColor = UIColor.init(hexString: "#e49e0d")
         lbl.text = "09/09/2020"
         return lbl
    }()
    
    public let targetLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = UIFont.systemFont(ofSize: 8)
        lbl.textAlignment = .center
        lbl.layer.cornerRadius = 0.5
        lbl.backgroundColor = UIColor.init(hexString: "#2AC1C9")
        lbl.text = "Scenario Date"
        return lbl
    }()
        
        public let targetValueLabel : UILabel = {
             let lbl = UILabel()
             lbl.textColor = .white
             lbl.font = UIFont.systemFont(ofSize: 14)
             lbl.textAlignment = .center
             lbl.translatesAutoresizingMaskIntoConstraints = false
             lbl.backgroundColor = UIColor.init(hexString: "#e49e0d")
             lbl.text = "09/09/2020"
             return lbl
        }()

    public let actualLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = UIFont.systemFont(ofSize: 8)
        lbl.textAlignment = .center
        lbl.layer.cornerRadius = 0.5
        lbl.backgroundColor = UIColor.init(hexString: "#2AC1C9")
        lbl.text = "Scenario Date"
        return lbl
    }()
        
        public let actualValueLabel : UILabel = {
             let lbl = UILabel()
             lbl.textColor = .white
             lbl.font = UIFont.systemFont(ofSize: 14)
             lbl.textAlignment = .center
             lbl.translatesAutoresizingMaskIntoConstraints = false
             lbl.backgroundColor = UIColor.init(hexString: "#e49e0d")
             lbl.text = "09/09/2020"
             return lbl
        }()

    


public let chart2 : BarChartView = {
    let barchart = BarChartView()
    return barchart
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
    addSubview(containerview2)
    addSubview(barchartcontainerView)
    addSubview(KpiNameLabel)
    addSubview(dailyLabelbtn)
    addSubview(weeklyLabelbtn)
    addSubview(monthlyLabelbtn)
    addSubview(KpiNameLabel)
    addSubview(scnearioDateLabel)
    addSubview(scnearioDatevalueLabel)
    addSubview(targetLabel)
    addSubview(targetValueLabel)
    addSubview(actualLabel)
    addSubview(actualValueLabel)
    barchartcontainerView.addSubview(chart2)
    
    updateUII()
    setChart()
    var dietChart = PieChartView(frame: CGRect(x:0,y:0,width:400,height:400))
    dietChart.backgroundColor = .black

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
    func setChart() {

         let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
         
         let test = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
         
         
         var dataEntries: [BarChartDataEntry] = []
    var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
         
         for i in 0..<months.count {
             
             let dataEntry = BarChartDataEntry(x: Double(test[i]), y: Double(unitsSold[i]))
             
             dataEntries.append(dataEntry)
         }
         
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Visitor count")
         
         let chartData = BarChartData(dataSet: chartDataSet)
         
         chart2.data = chartData
         
     }
    
//func updateCellContentt(property:[String],value :[Double])
//{
//    var entries = [PieChartDataEntry]()
//           for (index, value) in value.enumerated() {
//               let entry = PieChartDataEntry()
//               entry.y = value
//               entry.label = property[index]
//               entries.append( entry)
//           }
//
//           let set = PieChartDataSet( entries: entries, label: nil)
//    var colors = [UIColor.init(hexString: "#138b4a"),UIColor.init(hexString: "#f54450"),UIColor.init(hexString: "#e49e0d")]
//    set.colors = colors as! [NSUIColor]
//           let data = PieChartData(dataSet: set)
//           chart2.data = data
//           chart2.noDataText = "No data available"
//           chart2.isUserInteractionEnabled = true
//           chart2.backgroundColor = .clear
//           let d = Description()
//           d.text = ""
//           chart2.chartDescription = d
//           //chart2.centerText = "MIQ"
//    
//    
//    let greenColor = UIColor(red: 10/255, green: 190/255, blue: 50/255, alpha: 1)
//    // create the attributed colour
//    let attributedStringColor = [NSAttributedStringKey.foregroundColor : UIColor.white];
//    // create the attributed string
//    let attributedString = NSAttributedString(string: "22 KPI", attributes: attributedStringColor)
//    // Set the label
//    //chart2.centerAttributedText = attributedString
//    
//    
//    
//    
//    let circleColor = UIColor.black
//    let textColor = UIColor.white
//
//   
//    
//    
//    //
//    
//  
//           
////                   let attachment = NSTextAttachment()
////                   attachment.image = UIImage(named: "download.jpeg")
////                   let attachmentString = NSAttributedString(attachment: attachment)
////                   let labelImg = NSMutableAttributedString(string: "")
////                   labelImg.append(attachmentString)
////               chart2.centerAttributedText = labelImg
//  //  chart2.holeColor = UIColor.init(hexString: "#070806")
//           
//}



func updateUII(){
    containerView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 5, paddingLeft: 20, paddingBottom: 5, paddingRight: 5, width: self.frame.width, height: 200, enableInsets: true)
    
    KpiNameLabel.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom:  nil, right: containerView.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 10, paddingRight: 10, width: self.frame.width - 20, height: 40, enableInsets: true)
    
    dailyLabelbtn.anchor(top: KpiNameLabel.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: -5, paddingBottom: 10, paddingRight: 10, width: 160, height: 30, enableInsets: true)
    
     weeklyLabelbtn.anchor(top: dailyLabelbtn.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: -5, paddingBottom: 10, paddingRight: 10, width: 160, height: 30, enableInsets: true)
    
    monthlyLabelbtn.anchor(top: weeklyLabelbtn.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: -5, paddingBottom: 10, paddingRight: 10, width: 160, height: 30, enableInsets: true)
    
    
      containerview2.anchor(top: containerView.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: self.frame.width, height: 250, enableInsets: true)
    
    
   scnearioDateLabel.anchor(top: containerview2.topAnchor, left: containerview2.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 0, width: 150, height: 60, enableInsets: true)

    scnearioDatevalueLabel.anchor(top: containerview2.topAnchor, left: scnearioDateLabel.rightAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 10, paddingRight: 0, width: 150, height: 60, enableInsets: true)
    
    targetLabel.anchor(top: scnearioDateLabel.bottomAnchor, left: containerview2.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 0, width: 150, height: 60, enableInsets: true)
    
    targetValueLabel.anchor(top: scnearioDatevalueLabel.bottomAnchor, left: targetLabel.rightAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 10, paddingRight: 0, width: 150, height: 60, enableInsets: true)
    
    
    actualLabel.anchor(top: targetLabel.bottomAnchor, left: containerview2.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 150, height: 60, enableInsets: true)
    
    actualValueLabel.anchor(top: targetValueLabel.bottomAnchor, left: actualLabel.rightAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 150, height: 60, enableInsets: true)
    
    
    barchartcontainerView.anchor(top: containerview2.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: self.frame.width, height: 300, enableInsets: true)
    
    chart2.anchor(top: barchartcontainerView.topAnchor, left: barchartcontainerView.leftAnchor, bottom: barchartcontainerView.bottomAnchor, right: barchartcontainerView.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 10, width: 300, height: 300, enableInsets: true)
    
    
    
   }

}
