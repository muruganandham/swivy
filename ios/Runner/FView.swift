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
//import WhirlyGlobe

class FView: NSObject, FlutterPlatformView, MKMapViewDelegate {
    
    let frame: CGRect
    let viewId: Int64
    
    func view() -> UIView {
        
        let mapView = MKMapView.init(frame: CGRect(x: 0.0, y: 0.0, width: 300, height: 300))
        mapView.delegate = self as MKMapViewDelegate
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
        
        //        let baseView = MapviewViewController()
        //        return baseView.view
        
    }

    init(_ frame:CGRect, viewId: Int64, args:Any?) {
        self.frame = frame
        self.viewId = viewId
    }
}
