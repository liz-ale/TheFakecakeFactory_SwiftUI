//
//  HomeViewModel.swift
//  TheFakeFactoty_SwiftUI
//
//  Created by lizbeth.alejandro on 01/08/24.
//

import Observation

@Observable
class HomeViewModel {
    var showTermsAndConditions: Bool = false

    func userTappedContactUs() {
        showTermsAndConditions.toggle()
    }
}
