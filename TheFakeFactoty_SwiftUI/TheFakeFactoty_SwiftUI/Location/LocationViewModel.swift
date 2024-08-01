//
//  LocationViewModel.swift
//  TheFakeFactoty_SwiftUI
//
//  Created by lizbeth.alejandro on 01/08/24.
//

import SwiftUI
import MapKit
import CoreData

class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 19.4326, longitude: -99.1332),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    @Published var region2: MKCoordinateRegion = .init(center: CLLocationCoordinate2D(latitude: 19.4326, longitude: -99.1332), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    @Published var annotations: [MKPointAnnotation] = []
    private var locationManager: CLLocationManager?
    
    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
    }
    
    func checkLocationAuthorization() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager?.startUpdatingLocation()
        } else {
            // Manejo cuando los servicios de ubicación no están habilitados
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        // Actualizar la región para centrarse en la ubicación del usuario
        region = MKCoordinateRegion(
            center: location.coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
        
        // Añadir anotación para el Zócalo de la Ciudad de México
        let zocaloAnnotation = MKPointAnnotation()
        zocaloAnnotation.coordinate = CLLocationCoordinate2D(latitude: 19.4326, longitude: -99.1332)
        zocaloAnnotation.title = "Zócalo de la Ciudad de México"
        annotations.append(zocaloAnnotation)
    }
}
