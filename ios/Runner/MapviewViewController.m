//
//  MapviewViewController.m
//  Runner
//
//  Created by Muruganandham.Kuppan on 21/02/19.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "MapviewViewController.h"

#define RASTER_MBTILES @"geography-class_medres"

@interface MapviewViewController ()

@end

@implementation MapviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   // [self loadMapView];
}

/*
-(void)loadMapView {
    
    // Create an empty globe and add it to the view
    mapViewController = [[MaplyViewController alloc] initWithMapType:MaplyMapTypeFlat];
    [self.view addSubview:mapViewController.view];
    mapViewController.view.frame = self.view.bounds;
    [self addChildViewController:mapViewController];
    
    mapViewController.clearColor = [UIColor whiteColor];
    
    // and thirty fps if we can get it ­ change this to 3 if you find your app is struggling
    mapViewController.frameInterval = 2;
    
    MaplyMBTileSource *tileSource = [[MaplyMBTileSource alloc] initWithMBTiles:@"geography-class_medres"];
    MaplyQuadImageTilesLayer *layer = [[MaplyQuadImageTilesLayer alloc] initWithCoordSystem:tileSource.coordSys tileSource:tileSource];
    
    
    layer.handleEdges = false;
    
    layer.coverPoles =  true;
    
    layer.drawPriority = 0;
    
    layer.singleLevelLoading = false;
    
    [mapViewController addLayer:layer];
}
*/

@end
