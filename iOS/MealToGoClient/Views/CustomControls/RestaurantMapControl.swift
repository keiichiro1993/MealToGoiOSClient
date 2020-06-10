//
//  RestaurantMapControl.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/10.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import SwiftUI
import MapKit

struct RestaurantMapControl: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(
            latitude: 34.011286, longitude: -116.166868)
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}

struct RestaurantMapControl_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantMapControl()
    }
}
