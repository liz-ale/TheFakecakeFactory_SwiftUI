//
//  HomeView.swift
//  TheFakeFactoty_SwiftUI
//
//  Created by lizbeth.alejandro on 31/07/24.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel = HomeViewModel()
    
    var body: some View {
        
        ZStack {
            Color.customPink
                .ignoresSafeArea()
            content
        }
    }
}
private extension HomeView {
    
    var content: some View {
        VStack {
            carousel(images: FakeData.cakeImages)
                .frame(height: 200)
            Spacer()
            CircleCakeGridView()
                .frame(height: 300)
            carousel(images: FakeData.sponsorCakeImages)
                .frame(height: 100)
            contactButton {
                print("tapped")
                viewModel.userTappedContactUs()
            }
            Spacer()
        }
    }
    
    func carousel(images: [Image]?) -> some View {
        TabView {
            if let images = images {
                ForEach(images.indices, id: \.self) { index in
                    images[index]
                        .resizable()
                        .scaledToFill()
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
    
    func contactButton(action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            Label() {
                Text("Ven y visítanos")
                    .font(.system(size: 16, weight: .bold))
                    .tint(.customPurple)
            } icon: {
                Image(systemName: "location.circle.fill")
                    .foregroundColor(.white)
            }
        }
        .padding(.horizontal, 64)
        .padding(.vertical, 32)
        .frame(width: 300, height: 70)
        .background(
            RoundedRectangle(cornerRadius: 56)
                .foregroundColor(.palePink)
        )
        .overlay {
            RoundedRectangle(cornerRadius: 56)
                .stroke(.customPurple, lineWidth: 1)
        } .sheet(isPresented: $viewModel.showTermsAndConditions) {
            LocationPermissionView()
                .presentationDetents([.height(300)])
                .presentationDragIndicator(.visible)
        }
    }
}

//#Preview {
//    HomeView()
//}
