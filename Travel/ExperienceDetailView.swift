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
    
    @Environment(\.openURL) private var openURL 

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
                                .onTapGesture{
                                    if let url = experience.mapsURL {
                                        print("LINK TROVATO: \(url)")
                                        openURL(url) { accepted in
                                            print("L'apertura del link è riuscita? \(accepted)")
                                        }
                                    }
                                }
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
                
                VStack(alignment: .leading, spacing: 6){
                    Text("Partenza: \(experience.partenza)")
                    
                    Text("Lunghezza: \(experience.km, specifier: "%.1f") km")
                    
                    Text("Durata totale: \(experience.durata, specifier: "%.2f") h")
                }
                    
                Divider()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Principali tappe:")
                        .font(.headline)
                    
                    // id: \.self dice a SwiftUI di usare la stringa stessa come identificatore univoco
                    ForEach(Array(experience.steps.prefix(5)), id: \.self) { step in
                        HStack(alignment: .top, spacing: 8) {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.blue)
                                .font(.subheadline)
                            
                            Text(step)
                                .font(.body)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .padding(.horizontal)
                

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Dettaglio Viaggio")
    }
}
