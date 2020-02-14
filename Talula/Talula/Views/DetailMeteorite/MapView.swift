//
//  MapView.swift
//  Talula
//
//  Created by Diana Brnovik on 14/02/2020.
//  Copyright © 2020 Diana Brnovik. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var latitude: CLLocationDegrees
    var longitude: CLLocationDegrees
    var annotationTitle: String
    var annotationSubtitle: String
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        let location = CLLocationCoordinate2DMake(latitude, longitude)
        let span = MKCoordinateSpan(
            latitudeDelta: Map.latitudeDelta,
            longitudeDelta: Map.longitudeDelta
        )
        let region = MKCoordinateRegion(center: location, span: span)
        let newAnnotation = MKPointAnnotation()
        newAnnotation.coordinate = location
        newAnnotation.title = annotationTitle
        newAnnotation.subtitle = annotationSubtitle
        view.setRegion(region, animated: true)
        view.removeAnnotations(view.annotations)
        view.addAnnotations([newAnnotation])
    }
}

struct MapView_Preview: PreviewProvider {
    static var previews: some View {
        MapView(latitude: 49.9, longitude: 16.6, annotationTitle: "Annotation title", annotationSubtitle: "Annotation subtitle")
    }
}
