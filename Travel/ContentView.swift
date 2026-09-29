//
//  ContentView.swift
//  Travel
//
//  Created by Alessandro Contarini on 28/09/2026.
//  ContentView è la view principale.
//

import SwiftUI
import Supabase
import PostgREST

struct ContentView: View {
    @State private var experiences: [Experience] = [] //State è una proprietà di stato reattiva
    @State private var errorMessage: String? = nil

    var body: some View {
        NavigationStack { //contenitore di navigazione std di iOS
            // Usiamo uno stack condizionale pulito per gestire gli stati della vista
            VStack { // contenitore verticale condizionale
                if let errorMessage { //verifica se è nil
                    Text("Errore: \(errorMessage)")
                        .foregroundColor(.red)
                        .padding()
                } else if experiences.isEmpty {
                    ProgressView("Caricamento esperienze...")
                } else {
                    List(experiences) { experience in
                        // Qui dentro puoi disporre gli elementi in orizzontale come preferisci!
                        NavigationLink(destination: ExperienceDetailView(experience: experience)) {
                            
                            HStack(alignment: .center, spacing: 18) {
                                Image(systemName: "map.fill")
                                    .font(.largeTitle)
                                    .foregroundColor(.blue)
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(experience.title)
                                        .font(.headline)
                                    Text(experience.description)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                    Text("Prezzo: €\(experience.price, specifier: "%.2f")")
                                        .font(.footnote)
                                        .bold()
                                }
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationTitle("Esplora Viaggi")
            .task {
                await fetchExperiences() // avvia l'esecuzione asincrona
            }
        }
    }

    func fetchExperiences() async { //funzione asincrona
        do {
            let response: [Experience] = try await SupabaseManager.shared.client
                .from("Experience")
                .select()
                .execute()
                .value
            
            await MainActor.run { //garantisce che l'assegnazione a experiences avvenga dal thread principale, perché le chiamate di rete avvengono in bg
                self.experiences = response
            }
        } catch {
            await MainActor.run {
                self.errorMessage = error.localizedDescription
            }
            print("Errore durante il fetch da Supabase: \(error)")
        }
    }
}
    

#Preview {
    ContentView()
}


