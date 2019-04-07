//
//  KMLViewerViewController.swift
//  KMLViewer
//
//  Translated by OOPer in cooperation with shlab.jp, on 2015/10/17.
//
//
/*
 Copyright (C) 2015 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information

 Abstract:
 Displays an MKMapView and demonstrates how to use the included KMLParser class to place annotations and overlays from a parsed KML file on top of the MKMapView.
*/
import UIKit
import MapKit

@objc(KMLViewerViewController)
class KMLViewerViewController: UIViewController, MKMapViewDelegate {
    
    
    @IBOutlet private weak var map: MKMapView!
    private var kmlParser: KMLParser!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Locate the path to the   file in the application's bundle
        // and parse it with the KMLParser.
        let url = Bundle.main.url(forResource: "KML_Sample", withExtension: "kml")!
        self.kmlParser = KMLParser(url: url)
        self.kmlParser.parseKML()
        
        // Add all of the MKOverlay objects parsed from the KML file to the map.
        let overlays = self.kmlParser.overlays
        self.map.addOverlays(overlays)
        
        // Add all of the MKAnnotation objects parsed from the KML file to the map.
        let annotations = self.kmlParser.points
        self.map.addAnnotations(annotations)
        
        // Walk the list of overlays and annotations and create a MKMapRect that
        // bounds all of them and store it into flyTo.
        var flyTo = MKMapRect.null
        for overlay in overlays {
            if flyTo.isNull {
                flyTo = overlay.boundingMapRect
            } else {
                flyTo = flyTo.union(overlay.boundingMapRect)
            }
        }
        
        for annotation in annotations {
            let annotationPoint = MKMapPoint(annotation.coordinate)
            let pointRect = MKMapRect(x: annotationPoint.x, y: annotationPoint.y, width: 0, height: 0)
            if flyTo.isNull {
                flyTo = pointRect
            } else {
                flyTo = flyTo.union(pointRect)
            }
        }
        
        // Position the map so that all overlays and annotations are visible on screen.
        self.map.visibleMapRect = flyTo
    }
    
    //MARK: MKMapViewDelegate
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        return self.kmlParser.rendererForOverlay(overlay)!
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        return self.kmlParser.viewForAnnotation(annotation)
    }
    
}
