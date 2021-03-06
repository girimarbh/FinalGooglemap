

import UIKit
import GoogleMaps
import GooglePlaces

let baseURL = "https://azurewebapiwiprodevelopment.azurewebsites.net/api/central/CenGetHealthIndex?EmailID=mpddashboard@hotmail.com"
let kMapStyle = "[" +
"  {" +
"    \"featureType\": \"poi.business\"," +
"    \"elementType\": \"all\"," +
"    \"stylers\": [" +
"      {" +
"        \"visibility\": \"off\"" +
"      }" +
"    ]" +
"  }," +
"  {" +
"    \"featureType\": \"transit\"," +
"    \"elementType\": \"labels.icon\"," +
"    \"stylers\": [" +
"      {" +
"        \"visibility\": \"off\"" +
"      }" +
"    ]" +
"  }" +
"]"

enum APIRequestedStatus :String {
case map
case dashboard
    case none
}

struct MyPlace {
    var name: String
    var lat: Double
    var long: Double
}

class ViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate, GMSAutocompleteViewControllerDelegate, UITextFieldDelegate , NotificationProtocal {
    func updateError() {
        
    }
    
    var apirequesttype = APIRequestedStatus.none
    let currentLocationMarker = GMSMarker()
    var locationManager = CLLocationManager()
    var chosenPlace: MyPlace?
    
    let customMarkerWidth: Int = 250
    let customMarkerHeight: Int = 100
    var menuSelected = false
    
    let previewDemoData = [(title: "washington", img: #imageLiteral(resourceName: "restaurant1"), price: "wa"), (title: "Newyork", img: #imageLiteral(resourceName: "restaurant2"), price: "Nw"), (title: "Dallas", img: #imageLiteral(resourceName: "restaurant3"), price: "Da")]
    
    
    override func viewWillAppear(_ animated: Bool) {
        
       
    }
    @objc func add()  {
        leftmenu.delegate = self
        if !menuSelected {
            var v = DrilDownViewController()
            self.present(v, animated: true, completion: nil)
            
       // self.view.addSubview(Popupkpiview)
            menuSelected = true
        }
        else
        {
            //self.Popupkpiview.removeFromSuperview()
            menuSelected = false
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
         
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(add))
        
       
        self.title = "Home"
        self.view.backgroundColor = UIColor.white
        myMapView.delegate=self
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.startMonitoringSignificantLocationChanges()
        
        setupViews()
        
        initGoogleMaps()
        
        txtFieldSearch.delegate=self
        setupNavigation()
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        if self.leftmenu != nil {
        self.leftmenu.removeFromSuperview()
            menuSelected = false
        }
    }
    
    func updateContentOnView(){
        DispatchQueue.main.async{ [weak self] in
            guard let weakSelf = self else { return }
            // and then dismiss the control
             let mainView = SecondViewController()
            self?.navigationController?.pushViewController(mainView, animated:true)
            
        }
    }
    func retrieveAPIData() {
        var request: URLRequest = URLRequest(url: URL(string: baseURL)!)
        request.cachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalCacheData
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        // Request the data
        let session: URLSession = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
           // print(data!.count)
            // Did we get an error?
            guard error == nil else {
                print(error!)
                
                DispatchQueue.main.async{
                    //userCompletionHandler(nil , error as NSError?)
                }
                
                return
            }
            
            guard let json = data else {
                print("No data")
                return
            }
            
            guard json.count != 0 else {
                print("Zero bytes of data")
                return
            }
            
            print(String(decoding: json, as: UTF8.self))
            if let dict = self.convertToDictionary(text: String(decoding: json, as: UTF8.self)){
                //ObjectMapper.objectmapper.map(dict: dict)
                DispatchQueue.main.async{
                    //userCompletionHandler(ObjectMapper.objectmapper.productList , nil)
                }
            }
        }
        task.resume()
    }
    
    private func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    func setupNavigation()  {
        navigationController?.navigationBar.barTintColor = UIColor.darkGray
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    //MARK: textfield
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let autoCompleteController = GMSAutocompleteViewController()
        autoCompleteController.delegate = self
        
        let filter = GMSAutocompleteFilter()
        autoCompleteController.autocompleteFilter = filter
        
        self.locationManager.startUpdatingLocation()
        self.present(autoCompleteController, animated: true, completion: nil)
        return false
    }
    
    // MARK: GOOGLE AUTO COMPLETE DELEGATE
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        let lat = place.coordinate.latitude
        let long = place.coordinate.longitude
        
        showPartyMarkers(lat: lat, long: long)
        
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: 17.0)
        myMapView.camera = camera
        txtFieldSearch.text=place.formattedAddress
        chosenPlace = MyPlace(name: place.formattedAddress!, lat: lat, long: long)
        let marker=GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
        marker.title = "\(place.name)"
        marker.snippet = "\(place.formattedAddress!)"
        marker.map = myMapView
        
        self.dismiss(animated: true, completion: nil) // dismiss after place selected
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        print("ERROR AUTO COMPLETE \(error)")
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func initGoogleMaps() {
        let camera = GMSCameraPosition.camera(withLatitude: 28.7041, longitude: 77.1025, zoom: 17.0)
        self.myMapView.camera = camera
        self.myMapView.delegate = self
        self.myMapView.isMyLocationEnabled = true
        //self.myMapView.mapType = .hybrid
        do {
          // Set the map style by passing a valid JSON string.
            if let styleURL = Bundle.main.url(forResource: "style", withExtension: "json") {
            myMapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
                
            }
            
        } catch {
          NSLog("One or more of the map styles failed to load. \(error)")
        }
    }
    
    // MARK: CLLocation Manager Delegate
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error while getting location \(error)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.delegate = nil
        locationManager.stopUpdatingLocation()
        let location = locations.last
        let lat = (location?.coordinate.latitude)!
        let long = (location?.coordinate.longitude)!
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: 17.0)
        
        self.myMapView.animate(to: camera)
        
        showPartyMarkers(lat: lat, long: long)
    }
    
    // MARK: GOOGLE MAP DELEGATE
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
//        guard let customMarkerView = marker.iconView as? CustomMarkerView else { return false }
//        let img = customMarkerView.img!
//        let customMarker = CustomMarkerView(frame: CGRect(x: 0, y: 0, width: customMarkerWidth, height: customMarkerHeight), image: img, borderColor: UIColor.white, tag: customMarkerView.tag)
//
//        marker.iconView = customMarker
        
        return false
    }
    
    func mapView(_ mapView: GMSMapView, markerInfoContents marker: GMSMarker) -> UIView? {
        guard let customMarkerView = marker.iconView as? CustomMarkerView else { return nil }
        let data = previewDemoData[customMarkerView.tag]
        infoPreviewView.setData(title: data.title, img: data.img, price: data.price)
        return infoPreviewView
    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        guard let customMarkerView = marker.iconView as? CustomMarkerView else { return }
        let tag = customMarkerView.tag
        restaurantTapped(tag: tag)
    }
    
    func mapView(_ mapView: GMSMapView, didCloseInfoWindowOf marker: GMSMarker) {
        guard let customMarkerView = marker.iconView as? CustomMarkerView else { return }
        let img = customMarkerView.img!
        let customMarker = CustomMarkerView(frame: CGRect(x: 0, y: 0, width: customMarkerWidth, height: customMarkerHeight), image: img, borderColor: UIColor.darkGray, tag: customMarkerView.tag , title : customMarkerView.title)
        marker.iconView = customMarker
    }
    
    func showPartyMarkers(lat: Double, long: Double) {
        myMapView.clear()
        for i in 0..<3 {
            let randNum=Double(arc4random_uniform(30))/10000
            let marker=GMSMarker()
            let customMarker = CustomMarkerView(frame: CGRect(x: 0, y: 0, width: customMarkerWidth, height: customMarkerHeight), image: previewDemoData[i].img, borderColor: UIColor.darkGray, tag: i , title : previewDemoData[i].title )
            marker.iconView=customMarker
            let randInt = arc4random_uniform(4)
            if randInt == 0 {
                marker.position = CLLocationCoordinate2D(latitude: lat+randNum, longitude: long-randNum)
            } else if randInt == 1 {
                marker.position = CLLocationCoordinate2D(latitude: lat-randNum, longitude: long+randNum)
            } else if randInt == 2 {
                marker.position = CLLocationCoordinate2D(latitude: lat-randNum, longitude: long-randNum)
            } else {
                marker.position = CLLocationCoordinate2D(latitude: lat+randNum, longitude: long+randNum)
            }
            marker.map = self.myMapView
        }
    }
    
    @objc func btnMyLocationAction() {
        let location: CLLocation? = myMapView.myLocation
        if location != nil {
            myMapView.animate(toLocation: (location?.coordinate)!)
        }
    }
    
    @objc func restaurantTapped(tag: Int) {
        let v=DetailsVC()
        v.passdata = "aaa"
      //  v.passedData = previewDemoData[tag]
        self.navigationController?.pushViewController(v, animated: true)
        //self.present(v, animated: true, completion: nil)
    }
    
    func setupTextField(textField: UITextField, img: UIImage){
        textField.leftViewMode = UITextFieldViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 5, y: 5, width: 20, height: 20))
        imageView.image = img
        let paddingView = UIView(frame:CGRect(x: 0, y: 0, width: 30, height: 30))
        paddingView.addSubview(imageView)
        textField.leftView = paddingView
    }
    
    func setupViews() {
        view.addSubview(myMapView)
         //myMapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive=true
        myMapView.topAnchor.constraint(equalTo: view.topAnchor).isActive=true
        myMapView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive=true
        myMapView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive=true
        myMapView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 60).isActive=true
        
        
        self.view.addSubview(txtFieldSearch)
        txtFieldSearch.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive=true
        txtFieldSearch.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive=true
        txtFieldSearch.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive=true
        txtFieldSearch.heightAnchor.constraint(equalToConstant: 35).isActive=true
        setupTextField(textField: txtFieldSearch, img: #imageLiteral(resourceName: "map_Pin"))
        
        infoPreviewView=InfoPreviewView(frame: CGRect(x: 10.0, y: 10.0, width: self.view.frame.width - 10, height: 150))
        Popupkpiview = Popupkpi(frame: CGRect(x: 10.0, y: 300.0, width: 350, height: 200 ))
        leftmenu=LeftSideMenuView(frame: CGRect(x: 0.0, y: 86.0, width: 200, height: self.view.frame.size.height ))
        headerView = MapHeaderView(frame: CGRect(x: 0.0, y: ((self.navigationController?.navigationBar.frame.size.height)!+40 ) , width: self.view.frame.size.width, height: 70))
        
        
        self.view.addSubview(btnMyLocation)
        btnMyLocation.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive=true
        btnMyLocation.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive=true
        btnMyLocation.widthAnchor.constraint(equalToConstant: 50).isActive=true
        btnMyLocation.heightAnchor.constraint(equalTo: btnMyLocation.widthAnchor).isActive=true
    }
    
    let myMapView: GMSMapView = {
        let v=GMSMapView()
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()
    
    let txtFieldSearch: UITextField = {
        let tf=UITextField()
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .white
        tf.layer.borderColor = UIColor.darkGray.cgColor
        tf.placeholder="Search for a location"
        tf.translatesAutoresizingMaskIntoConstraints=false
        return tf
    }()
    
    let btnMyLocation: UIButton = {
        let btn=UIButton()
        btn.backgroundColor = UIColor.white
        btn.setImage(#imageLiteral(resourceName: "my_location"), for: .normal)
        btn.layer.cornerRadius = 25
        btn.clipsToBounds=true
        btn.tintColor = UIColor.gray
        btn.imageView?.tintColor=UIColor.gray
        //btn.addTarget(self, action: #selector(btnMyLocationAction), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints=false
        return btn
    }()
    
    var infoPreviewView: InfoPreviewView = {
        let v=InfoPreviewView()
        return v
    }()
    
    var leftmenu: LeftSideMenuView = {
           let v=LeftSideMenuView()
        
           return v
       }()
    
    var Popupkpiview: Popupkpi = {
        let v=Popupkpi()
     
        return v
    }()
    
    var headerView: MapHeaderView = {
        let v = MapHeaderView()
     
        return v
    }()
}




