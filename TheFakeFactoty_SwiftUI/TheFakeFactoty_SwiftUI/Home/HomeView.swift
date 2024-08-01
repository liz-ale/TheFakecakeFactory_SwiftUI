//
//  HomeView.swift
//  TheFakeFactoty_SwiftUI
//
//  Created by lizbeth.alejandro on 31/07/24.
//

import SwiftUI

struct HomeView: View {
    @State private var termsAndConditions = true
    
    var body: some View {
        VStack {
            carousel(images: FakeData.cakeImages)
                .frame(height: 260)
            Spacer()
        }
        .sheet(isPresented: $termsAndConditions) {
            LocationPermissionView()
                .presentationDetents([.height(300)])
                .presentationDragIndicator(.visible)
        }
    }
}
private extension HomeView {
    func carousel(images: [Image]?) -> some View {
        TabView {
            if let images = images {
                ForEach(images.indices, id: \.self) { index in
                    images[index]
                        .resizable()
                        .scaledToFit()
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

#Preview {
    HomeView()
}
