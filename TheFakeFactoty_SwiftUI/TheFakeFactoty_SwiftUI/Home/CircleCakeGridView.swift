//
//  CircleCakeGridView.swift
//  TheFakeFactoty_SwiftUI
//
//  Created by lizbeth.alejandro on 31/07/24.
//

import SwiftUI

struct CircleCakeGridView: View {
    private let images = FakeData.circularCakeImages
    
    var body: some View {
        ZStack {
            Color.customPink
                .ignoresSafeArea()
            Grid {
                GridRow {
                    ForEach(cakeRows.upper, id: \.self) { image in
                        circularCake(with: Image(image))
                        
                    }
                }
                GridRow {
                    ForEach(cakeRows.bottom, id: \.self) { image in
                        circularCake(with: Image(image))
                        
                    }
                }
            }
        }
    }
}

private extension CircleCakeGridView {
    
    var cakeRows: (upper: [String], bottom: [String]) {
        let mid = images.count / 2
        let firstHalf = images[0..<mid]
        let secondHalf = images[mid..<images.count]
        return (Array(firstHalf), Array(secondHalf))
        
    }
    
    var cakeGrid: some View {
        Grid() {
            
        }
    }
    
    func circularCake(with image: Image) -> some View {
        image
            .resizable()
            .frame(width: 100, height: 100)
            .scaledToFit()
            .overlay(
                Circle()
                    .stroke(.customPurple, lineWidth: 3)
            )
            .clipShape(Circle())
    }
}

#Preview {
    CircleCakeGridView()
}
