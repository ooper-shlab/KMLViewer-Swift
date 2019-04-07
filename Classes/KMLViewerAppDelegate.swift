//
//  KMLViewerAppDelegate.swift
//  KMLViewer
//
//  Translated by OOPer in cooperation with shlab.jp, on 2015/10/17.
//
//
/*
 Copyright (C) 2015 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information

 Abstract:
 Delegate for the application.  Simply sets up the KMLViewerViewController in a window.
*/

import UIKit

@UIApplicationMain
@objc(KMLViewerAppDelegate)
class KMLViewerAppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // Override point for customization after application launch.
        
        return true
    }
    
}
