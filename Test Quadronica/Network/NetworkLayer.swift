//
//  NetworkLayer.swift
//  Test Quadronica
//
//  Created by Lucio Botteri on 28/11/23.
//

import Foundation

final class NetworkLayer {
    
    private let endpoint = "https://content.fantacalcio.it/test/"

    func fetchPlayers(completion: @escaping (Result<[Player], Error>) -> Void) {
        guard let url = URL(string: endpoint+"test.json") else {
            completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "URL non valido"])))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                completion(.failure(error))
                return
            }
            
            guard let data else {
                completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Dati non trovati"])))
                return
            }
            
            do {
                let players = try JSONDecoder().decode([Player].self, from: data)
                completion(.success(players))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    func fetchImageData(from url: URL) async -> Data? {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        } catch {
            print("Errore durante il caricamento dei dati dell'immagine: \(error)")
            return nil
        }
    }
}
