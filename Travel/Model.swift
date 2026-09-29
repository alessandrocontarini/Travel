//
//  Model.swift
//  Travel
//
//  Created by Alessandro Contarini on 28/09/2026.
// Alebilly3?12!

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
// 1) Collegarci un DB reale (docker o online ad uso gratuito o roba fornita da gh) => uso Supabase
// 2) Proseguire aggiungendo dettagli grafici e funzionalità
// 3) collega Gemini su XCode



