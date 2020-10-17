//
//  MApViewController.swift
//  WorldTrotter
//
//  Created by Waleed Alassaf on 14/10/2020.
//
import UIKit
import MapKit


class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var mapView: MKMapView!
    fileprivate var locationManeger:CLLocationManager = CLLocationManager()
    
    
    override func loadView() {
        mapView = MKMapView()
        
        view = mapView
        
        let segmentedControl = UISegmentedControl(items: ["Standard","Hybrid","Satellite"])
        segmentedControl.backgroundColor = UIColor.systemBackground
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged(_:)), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        let margin = view.layoutMarginsGuide
        let LeadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margin.leadingAnchor)
        let TrailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margin.trailingAnchor)
        
        topConstraint.isActive = true
        LeadingConstraint.isActive = true
        TrailingConstraint.isActive = true
        
        let PONLable = UILabel()
        self.view.addSubview(PONLable)
        PONLable.text = "Point of Intrest"
        let PONTopConstraint = PONLable.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10)
        let PONLeadingConstraint = PONLable.leadingAnchor.constraint(equalTo: margin.leadingAnchor, constant: 1)
        PONTopConstraint.isActive = true
        PONLeadingConstraint.isActive = true
        PONLable.translatesAutoresizingMaskIntoConstraints = false
        
        let PONSwitch = UISwitch()
        self.view.addSubview(PONSwitch)
        let PONSwitchTopConstraint = PONSwitch.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 5)
        let PONSwitchLeadingConstraint = PONSwitch.leadingAnchor.constraint(equalTo: PONLable.trailingAnchor, constant: 4)
        PONSwitch.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
        PONSwitchTopConstraint.isActive = true
        PONSwitchLeadingConstraint.isActive = true
        PONSwitch.translatesAutoresizingMaskIntoConstraints = false
        PONSwitch.addTarget(self, action: #selector(PoinOFIntrests(_:)), for: .valueChanged)

    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.mapView.showsUserLocation = true
        self.mapView.userTrackingMode = .follow
        self.mapView.delegate = self
    
       
        print("MapViewController loaded it self")
       
        locationManeger.delegate = self
        locationManeger.requestWhenInUseAuthorization()
        locationManeger.desiredAccuracy = kCLLocationAccuracyBest
        locationManeger.distanceFilter = kCLDistanceFilterNone
        locationManeger.startUpdatingLocation()
        
        mapView.showsUserLocation = true
        
        
    }
    
    func zoomInmap(){
        if let userLocation = locationManeger.location?.coordinate {
            let viewRegion = MKCoordinateRegion(center: userLocation, latitudinalMeters: 800, longitudinalMeters: 800)
            mapView.setRegion(viewRegion, animated: false)
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        zoomInmap()
    }
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl){
        switch segControl.selectedSegmentIndex {
            case 0:
                mapView.mapType = .standard
            case 1:
                mapView.mapType = .hybrid
            case 2:
                mapView.mapType = .satellite
            default:
                break
        }
    }
    @objc func PoinOFIntrests(_ PONSwitch: UISwitch){
        
        switch PONSwitch.isOn{
            case true:
                mapView.pointOfInterestFilter = .excludingAll
            case false:
                mapView.pointOfInterestFilter = .includingAll
        }
    }
}
