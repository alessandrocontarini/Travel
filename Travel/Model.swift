//
//  Model.swift
//  Travel
//
//  Created by Alessandro Contarini on 28/09/2026.
// PW db supabase Alebilly3?12! => Account GH

import Foundation

struct Experience: Identifiable, Codable { // ogni experience è unica, Codable = traduce obj Swift in JSON
    let id: UUID // il DB assegnerà un ID (stringa o UUID), per ora va benissimo UUID
    let title: String
    let description: String
    let price: Double
    let image_name: String
}

/*
struct TravelData{
    static let someExperiences: [Experience] = [
        Experience(id: UUID(), title: "Strada delle 52 gallerie", description: "Difficoltà media", price: 6, imageName: "img1"),
        Experience(id: UUID(), title: "Parco di Kamenjack ", description: "Difficoltà facile", price: 18, imageName: "img2"),
        ]
}
*/

// next step:
// 1) aggiungi bottone per aggiungere istanze
// 2) bottone per i dettagli ecc. di ciascuna experience



