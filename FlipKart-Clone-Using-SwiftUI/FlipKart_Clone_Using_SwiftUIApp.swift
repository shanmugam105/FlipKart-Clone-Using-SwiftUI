//
//  FlipKart_Clone_Using_SwiftUIApp.swift
//  FlipKart-Clone-Using-SwiftUI
//
//  Created by Mac on 30/04/22.
//

import SwiftUI

@main
struct FlipKart_Clone_Using_SwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeContentView()
        }
    }
}
