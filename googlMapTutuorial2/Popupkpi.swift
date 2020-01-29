    //
    //  Popupkpi.swift
    //  googlMapTutuorial2
    //
    //  Created by Girish on 21/01/20.
    //  Copyright © 2020 akhil. All rights reserved.
    //



    import Foundation
    import UIKit

    struct Category {
        var kpiName: String?
        var actualValue : Int?
        var targetValue : Int?
        var KpiStatus : Int?
    }

    class Popupkpi: UIView , UITableViewDelegate , UITableViewDataSource {
        let cellId = "cellId"

        override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor=UIColor.clear
        self.clipsToBounds=true
        self.layer.masksToBounds=true
        setupViews()
        
    }

    //    func setData(title: String, img: UIImage, price: String) {
    //        lblTitle.text = title + ",  " + price
    //        imgView.image = img
    //        lblPrice.text = price
    //
    //
    //    }

    @objc func close()  {
        self.removeFromSuperview()
    }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 2
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PopupCell
            cell.updateCellContentt()
            return cell
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 80
        }

    func setupViews() {
        
        addSubview(containerView)
        containerView.leftAnchor.constraint(equalTo: leftAnchor).isActive=true
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive=true
        containerView.rightAnchor.constraint(equalTo: rightAnchor).isActive=true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive=true
        containerView.backgroundColor = UIColor.clear
        
        containerView.addSubview(table)
        table.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 30).isActive=true
        table.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30).isActive=true
        table.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 10).isActive=true
        table.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive=true
        table.dataSource = self
        table.delegate = self
        table.register(PopupCell.self, forCellReuseIdentifier: cellId)
        
        
        containerView.addSubview(leftview)
        leftview.anchor(top: containerView.topAnchor, left: containerView.leftAnchor , bottom: containerView.bottomAnchor, right: nil, paddingTop: 30, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: 10, height: 0, enableInsets: true)
        
        containerView.addSubview(imgView)
        imgView.topAnchor.constraint(equalTo: table.topAnchor, constant: 30).isActive=true
        imgView.leftAnchor.constraint(equalTo: table.leftAnchor, constant: -30).isActive=true
        imgView.heightAnchor.constraint(equalToConstant: 70).isActive=true
        imgView.widthAnchor.constraint(equalToConstant: 70).isActive=true
        imgView.makeRounded()
        
//       containerView.addSubview(closebutton)
//        closebutton.anchor(top: containerView.topAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 30, height: 20, enableInsets: true)
//
//        closebutton.layer.cornerRadius = 9 // this value vary as per your desire
//           closebutton.clipsToBounds = true
//
//        closebutton.addTarget(self, action:  #selector(close), for: .touchUpInside)
    }


    let containerView: UIView = {
        let v=UIView()
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()

    let leftview: UIView = {
        let v=UIView()
        v.backgroundColor = UIColor(red: 18/255, green: 133/255, blue: 75/255, alpha: 1.0)
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()
    let closebutton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.gray
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle(" close ", for: .normal)
          btn.setImage(UIImage(named: "close"), for: .normal)
        return btn
    }()
    let table : UITableView = {
        var table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints=false
        return table
        
    }()

    let imgView: UIImageView = {
        let v=UIImageView()
        v.image=#imageLiteral(resourceName: "cost_icon")
        v.contentMode = .scaleAspectFill
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()

required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    }
    
    
    class PopupCell: UITableViewCell {

        let CalenderimgView: UIImageView = {
            let v=UIImageView()
            v.image=#imageLiteral(resourceName: "calendar")
            v.translatesAutoresizingMaskIntoConstraints=false
            return v
        }()
        
    let containerView: UIView = {
        let v=UIView()
        v.backgroundColor = UIColor.white
        v.translatesAutoresizingMaskIntoConstraints=false
        v.layer.cornerRadius = 0.25
        return v
    }()


    private let KPILabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 18)
        lbl.textAlignment = .center
        lbl.backgroundColor = UIColor.clear
        return lbl
    }()
        
        
        private let KPILabelButton : UIButton = {
            let lblbtn = UIButton()
            lblbtn.titleLabel?.textColor = UIColor.black
            lblbtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            lblbtn.titleLabel?.textAlignment = .left
            lblbtn.backgroundColor = UIColor.white
            lblbtn.setTitleColor(UIColor.black, for: .normal)
            return lblbtn
            }()
        
        
        
    private let KPIDate : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 15)
        lbl.textAlignment = .center
        lbl.text = "22"
        lbl.backgroundColor = UIColor.clear
        return lbl
        
    }()

    private let KPITargetLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.layer.cornerRadius = 5
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textAlignment = .center
        lbl.layer.backgroundColor = UIColor(red: 43/255, green: 194/255, blue: 198/255, alpha: 1.0).cgColor
        return lbl
    }()
    private let KPIActualLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.layer.cornerRadius = 5
        lbl.font = UIFont.boldSystemFont(ofSize: 12)
        lbl.textAlignment = .center
        lbl.text = "22"
        lbl.layer.backgroundColor = UIColor(red: 18/255, green: 133/255, blue: 75/255, alpha: 1.0).cgColor
        return lbl
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
        containerView.addSubview(KPILabelButton)
        containerView.addSubview(KPIDate)
        containerView.addSubview(CalenderimgView)
        containerView.addSubview(KPITargetLabel)
        containerView.addSubview(KPIActualLabel)
        updateUII()
        }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func updateCellContentt()
    {
        KPITargetLabel.text = " T  100"
        KPIDate.text = "26/03/87"
        KPIActualLabel.text = "A   105"
        KPILabelButton.setTitle("Labour Cost", for: .normal)
        KPILabelButton.addTarget(self, action: #selector(self.pressed), for: .touchUpInside)
    }

        @objc func pressed()  {
            print("Button is pressed")
        }


    func updateUII(){
        containerView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: self.frame.width, height: self.frame.height, enableInsets: true)
        
        KPILabelButton.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 10, paddingRight: 20, width: 170, height: 30, enableInsets: true)
        
        KPITargetLabel.anchor(top: containerView.topAnchor, left: KPILabelButton.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 10, paddingRight: 0, width: 140, height: 30, enableInsets: true)
        
        CalenderimgView.anchor(top: KPILabelButton.bottomAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: nil, paddingTop: 10, paddingLeft: 37, paddingBottom: 10, paddingRight: 0, width: 25, height: 25, enableInsets: true)
        
        KPIDate.anchor(top: KPILabelButton.bottomAnchor, left: CalenderimgView.leftAnchor, bottom: containerView.bottomAnchor, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 10, paddingRight: 20, width: 133, height: 40, enableInsets: true)
        
        KPIActualLabel.anchor(top: KPITargetLabel.bottomAnchor, left: KPIDate.rightAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 10, paddingRight: 0, width: 140, height: 30, enableInsets: true)
        }

    }



