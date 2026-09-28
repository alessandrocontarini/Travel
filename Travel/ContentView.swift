//
//  ContentView.swift
//  Travel
//
//  Created by Alessandro Contarini on 28/09/2026.
//  ContentView è la view principale.
//

import SwiftUI

struct ContentView: View {
    
    let experiences = TravelData.someExperiences
    
    // body è il cuore di ogni vista in SwiftUI
    // restituisce il contenuto visivo
    
    var body: some View {
        NavigationStack { //contenitore che gestisce la navigazione
            List(experiences) { experiences in
                HStack(spacing: 12){
                    Image(systemName: "map.fill")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                    VStack(alignment: .leading, spacing: 4){
                        Text(experiences.title).font(.headline)
                        Text(experiences.description)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Text("€\(String(format: "%.2f", experiences.price))").bold().foregroundColor(.accentColor)

                        }
                    }
                .padding(.vertical, 4)
                }
            .navigationTitle ("Esperienze di Viaggio")
            }
        }
    }
    
    

#Preview {
    ContentView()
}


