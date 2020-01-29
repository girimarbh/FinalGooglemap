//
//  FirstViewController.swift
//  googlMapTutuorial2
//
//  Created by Girish on 17/12/19.
//  Copyright © 2019 akhil. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        self.view.backgroundColor = UIColor.blue
        
    }
    func setupViews()  {
        if let window = UIApplication.shared.windows.first {
           // window.rootViewController = nil
            let mainView = ViewController()
            let aObjNavi = UINavigationController(rootViewController: mainView)
            // use window here.
            window.rootViewController = aObjNavi
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
