//
//  TravelApp.swift
//  Travel
//
//  Created by Alessandro Contarini on 28/09/2026.
//

import SwiftUI

@main
struct TravelApp: App {
    @StateObject private var supabaseManager = SupabaseManager.shared

    var body: some Scene {
        WindowGroup {
            Group {
                if supabaseManager.isAuthenticated {
                    ContentView()
                } else {
                    AuthView()
                }
            }
        }
    }
}
