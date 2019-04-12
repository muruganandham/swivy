//
//  FView.swift
//  Runner
//
//  Created by Muruganandham.Kuppan on 20/02/19.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

import UIKit
import Flutter
import MapKit
import OpenTok
import Mapbox

class FView: NSObject, FlutterPlatformView, MGLMapViewDelegate {
    
    let frame: CGRect
    let viewId: Int64
    let maplyView: MaplyViewController = MaplyViewController.init(mapType: MaplyMapType.typeFlat)
    
    
    func view() -> UIView {
        
        // let mapObj = WGViewController()
        // let baseView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 300, height: 150))
        // baseView .addSubview(mapObj.view)
        // return baseView
        
        return getMapboxMap()
    }
    
    func getMapboxMap() -> UIView
    {
        let baseView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 300, height: 150))
        
        let url = URL(string: "mapbox://styles/mapbox/streets-v11")
        let mapView = MGLMapView(frame: baseView.bounds, styleURL: url)
        mapView.delegate = self
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.setCenter(CLLocationCoordinate2D(latitude: 40.7326808, longitude: -73.9843407), zoomLevel: 9, animated: true)
        baseView.addSubview(mapView)
        
        let hello = MGLPointAnnotation()
        hello.coordinate = CLLocationCoordinate2D(latitude: 40.7326808, longitude: -73.9843407)
        hello.title = "Hello world!"
        hello.subtitle = "Welcome to my marker"
        
        // Add marker `hello` to the map.
        mapView.addAnnotation(hello)
        
        return baseView

    }
    
    func getAppleMap() -> UIView {
        
        let mapView = MKMapView.init(frame: CGRect(x: 0.0, y: 0.0, width: 300, height: 150))
        mapView.mapType = .standard
        mapView.showsUserLocation = true
        if #available(iOS 9.0, *) {
            mapView.showsScale = true
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 9.0, *) {
            mapView.showsCompass = true
        } else {
            // Fallback on earlier versions
        }
        return mapView;
    }
    
    init(_ frame:CGRect, viewId: Int64, args:Any?) {
        self.frame = frame
        self.viewId = viewId
    }
    
    // Use the default marker. See also: our view annotation or custom marker examples.
    func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
        return nil
    }

    // Allow callout view to appear when an annotation is tapped.
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        return true
    }
}
