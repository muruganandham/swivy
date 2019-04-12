//
//  FViewFactory.swift
//  Runner
//
//  Created by Muruganandham.Kuppan on 20/02/19.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

import UIKit

class FViewFactory: NSObject, FlutterPlatformViewFactory {
    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return FView(frame, viewId: viewId, args: args)
    }
}
