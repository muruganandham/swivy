//
//  WGViewController.swift
//  Runner
//
//  Created by Muruganandham.Kuppan on 04/04/19.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

import UIKit

class WGViewController: UIViewController {
    
    private var theViewC: MaplyBaseViewController?
    private var globeViewC: WhirlyGlobeViewController?
    private var mapViewC: MaplyViewController?
    
    private let doGlobe = !true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if doGlobe {
            globeViewC = WhirlyGlobeViewController()
            theViewC = globeViewC
        }
        else {
            mapViewC = MaplyViewController(mapType: .typeFlat)
            theViewC = mapViewC
        }
        
        self.view.addSubview(theViewC!.view)
        theViewC!.view.frame = self.view.bounds
        addChildViewController(theViewC!)
        
        // we want a black background for a globe, a white background for a map.
        theViewC!.clearColor = (globeViewC != nil) ? UIColor.black : UIColor.white
        
        // and thirty fps if we can get it ­ change this to 3 if you find your app is struggling
        theViewC!.frameInterval = 2
        
        // set up the data source
        guard let tileSource = MaplyMBTileSource(mbTiles: "geography-class_medres"),
            let layer = MaplyQuadImageTilesLayer(tileSource: tileSource)
            else {
                print("Can't load 'geography-class_medres' mbtiles")
                return
        }
        
        layer.handleEdges = (globeViewC != nil)
        layer.coverPoles = (globeViewC != nil)
        layer.requireElev = false
        layer.waitLoad = false
        layer.drawPriority = 0
        layer.singleLevelLoading = false
        theViewC!.add(layer)
        
        // start up over Madrid, center of the old-world
        if let globeViewC = globeViewC {
            globeViewC.height = 0.8
            globeViewC.animate(toPosition: MaplyCoordinateMakeWithDegrees(-3.6704803,40.5023056), time: 1.0)
        }
        else if let mapViewC = mapViewC {
            mapViewC.height = 1.0
            mapViewC.animate(toPosition: MaplyCoordinateMakeWithDegrees(-3.6704803,40.5023056), time: 1.0)
        }
        
    }
}
