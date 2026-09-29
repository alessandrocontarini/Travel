//
//  SupabaseManager.swift
//  Travel
//
//  Created by Alessandro Contarini on 29/09/2026.
//


import Foundation
import Supabase

final class SupabaseManager {
    static let shared = SupabaseManager()

    let client: SupabaseClient

    private init() {
        let supabaseURL = URL(string: "https://shzxofnfwpsamouvtblh.supabase.co")!
        let supabaseKey = "sb_publishable_Fs5X0Rzqy3DNfaqkW7u0BQ_RDs-FvMF"
        
        client = SupabaseClient(supabaseURL: supabaseURL, supabaseKey: supabaseKey)
    }
}


// usiamo supabase per fare richieste GET (più sicure)
// supabase verifica che la chiave pubblica sia valida e che l'utente abbia i permessi per leggere quella tabella
// Supabase esegue la query in sicurezza e restituisce i dati in JSON
