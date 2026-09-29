//
//  Model.swift
//  Travel
//
//  Created by Alessandro Contarini on 28/09/2026.
// PW db supabase Alebilly3?12! => Account GH

import Foundation
import Storage
import Supabase
import PostgREST

struct Experience: Identifiable, Codable { // ogni experience è unica, Codable = traduce obj Swift in JSON
    let id: UUID // il DB assegnerà un ID (stringa o UUID), per ora va benissimo UUID
    let title: String
    let description: String
    let price: Double
    let image_name: String
    
    
    var publicImageURL: URL? {
        guard !image_name.isEmpty else { return nil }
        
        let url = try? SupabaseManager.shared.client.storage
            .from("experience-images") // Sostituisci con il nome esatto del tuo bucket su Supabase
            .getPublicURL(path: image_name)
            
        return url
    }
    
    
}





// next step:
// 1) aggiungi bottone per aggiungere istanze
// 2) bottone per i dettagli ecc. di ciascuna experience



