//
//  NetworkManager.swift
//  RickaAndMortyCoreData
//
//  Created by Ибрагим Габибли on 20.10.2024.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    let urlString = "https://rickandmortyapi.com/api/character"

    func getCharacters(completion: @escaping (Result<[Character], Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion(.failure(NetworkError.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error {
                print("Error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }

            guard let data else {
                print("No data")
                completion(.failure(NetworkError.noData))
                return
            }

            do {
                let character = try JSONDecoder().decode(PostCharacters.self, from: data)
                completion(.success(character.results))
            } catch {
                print("Decoding error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }.resume()
    }
}
