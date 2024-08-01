//
//  LocationPermissionView.swift
//  TheFakeFactoty_SwiftUI
//
//  Created by lizbeth.alejandro on 31/07/24.
//

import SwiftUI

struct LocationPermissionView: View {
    var body: some View {
        VStack (spacing: 45) {
            Text("Esta aplicación necesita acceder a tu ubicación para ofrecerte una mejor experiencia. Por favor, concede acceso a la ubicación en los ajustes de la aplicación.")
                .multilineTextAlignment(.center)
                .foregroundStyle(.customGray)
                .padding(.horizontal, 65)
            buttomButtons
        }
        
    }
}

private extension LocationPermissionView {
    var buttomButtons: some View {
        HStack(spacing: 52) {
            Button("Cancelar") {
                
            }
            .roundedButtonStyle()
            Button("Dar Permiso") {
                
            }
            .roundedButtonStyle()
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    LocationPermissionView()
}
