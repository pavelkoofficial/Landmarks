//
//  LandsmarksApp.swift
//  Landsmarks
//
//  Created by Александр Павелко on 19.06.2024.
//

import SwiftUI

@main
struct LandsmarksApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(ModelData())
        }
    }
}
