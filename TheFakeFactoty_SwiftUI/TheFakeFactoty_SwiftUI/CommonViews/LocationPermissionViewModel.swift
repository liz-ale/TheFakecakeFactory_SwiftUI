//
//  LocationPermissionViewModel.swift
//  TheFakeFactoty_SwiftUI
//
//  Created by lizbeth.alejandro on 01/08/24.
//
import Foundation
import CoreLocation
import SwiftUI
import Combine

class LocationPermissionViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var isAuthorized = false
    @Published var showLocationView = false
    
    private var locationManager: CLLocationManager?
    
    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
    }
    
    func requestLocationAccess() {
        locationManager?.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            isAuthorized = true
            showLocationView = true
        } else {
            isAuthorized = false
        }
    }
}
