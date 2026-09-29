//
//  ExperienceDetailView.swift
//  Travel
//
//  Created by Alessandro Contarini on 29/09/2026.
//


import SwiftUI

struct ExperienceDetailView: View {
    // La vista riceve l'esperienza specifica su cui l'utente ha cliccato
    let experience: Experience

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                if let url = experience.publicImageURL {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(width: 60, height: 60)
                        case .failure(_):
                            Image(systemName: "photo.fill")
                                .foregroundColor(.gray)
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .cornerRadius(8)
                        @unknown default:
                            EmptyView()
                        }
                    }
                } else{
                    Image(systemName: "map.fill")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                }

                // Titolo
                Text(experience.title)
                    .font(.largeTitle)
                    .bold()

                // Prezzo evidenziato
                Text("Prezzo: €\(experience.price, specifier: "%.2f")")
                    .font(.title2)
                    .foregroundColor(.green)
                    .bold()

                Divider()

                // Descrizione completa
                Text("Descrizione dell'esperienza")
                    .font(.headline)
                
                Text(experience.description)
                    .font(.body)
                    .foregroundColor(.primary)

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Dettaglio Viaggio")
    }
}
