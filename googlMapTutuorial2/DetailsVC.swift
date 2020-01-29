//
//  DetailsVC.swift
//  googlMapTutuorial2
//
//  googlMapTutuorial2
//
//  Created by Girish on 03/01/20.


import UIKit

class DetailsVC : UIViewController, UITableViewDelegate, UITableViewDataSource {
    var properties = [String]()
    var values = [Double]()
    var passdata : String?

    private let myArray: NSArray = ["First","Second","Third"]
    private var myTableView: UITableView!
    let cellId = "cellId"
     let cellId2 = "cellId2"
    let cellId3 = "cellId3"
    
    var headerView: DashboardHeaderView = {
        let v = DashboardHeaderView()
     
        return v
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        properties = ["","",""]
               values = [1000.0,2000.0,3000.0]

        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height

        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight , width: displayWidth, height: displayHeight - barHeight))
        myTableView.register(PieChartCell.self, forCellReuseIdentifier: cellId)
        myTableView.register(PlantStatusCell.self, forCellReuseIdentifier: cellId2)
        myTableView.register(KPIStstusCell.self, forCellReuseIdentifier: cellId3)
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.showsVerticalScrollIndicator = false
        self.view.addSubview(myTableView)
         headerView  = DashboardHeaderView(frame: CGRect(x: 0.0, y: 0.0, width: 200, height: 50 ))
        
    }
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        if indexPath.row == 0 {
                   let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PieChartCell
                           cell.properties = ["United States","Mexico","Canada","Chile"]
                           cell.values = [1000.0,2000.0,3000.0,4000.0]
                   cell.updateCellContentt(property:properties , value: values)
                           return cell
               }
            
            if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: cellId2, for: indexPath) as! PlantStatusCell
                        cell.properties = ["United States","Mexico","Canada","Chile"]
                        cell.values = [1000.0,2000.0,3000.0,4000.0]
                cell.updateCellContentt(property:properties , value: values)
                        return cell
            }
               else   {
                   let cell = tableView.dequeueReusableCell(withIdentifier: cellId3, for: indexPath) as! KPIStstusCell
                           cell.properties = ["United States","Mexico","Canada","Chile"]
                           cell.values = [1000.0,2000.0,3000.0,4000.0]
                   cell.updateCellContentt(property:properties , value: values)
                           return cell
               }
        
//                 let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PieChartCell
//                cell.properties = ["United States","Mexico","Canada","Chile"]
//                cell.values = [1000.0,2000.0,3000.0,4000.0]
//        cell.updateCellContentt(property:properties , value: values)
//                return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Num: \(indexPath.row)")
//        print("Value: \(myArray[indexPath.row])")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
        
        
    }
    
   
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 || indexPath.row == 1{
      return  400
    }
        else{
        
         return   270
        }
    
}
}
