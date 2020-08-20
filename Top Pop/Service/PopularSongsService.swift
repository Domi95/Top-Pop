//
//  Service.swift
//  Top Pop
//
//  Created by Domagoj Beronic on 19/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

class PopularSongsService {
    
    private let popularSongsURL = "https://api.deezer.com/chart"
    
    func fetchTracks(completion: @escaping([SongData]) -> ()) {
        guard let url = URL(string: popularSongsURL) else { return }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("Error while fetching data.")
                return
            }
            guard let safeData = data else { return }
            
            guard let tracksData = self.parseJSON(safeData) else { return }
            
            completion(tracksData.tracks.data)
        }
        task.resume()
    }
    
    private func parseJSON(_ tracksData: Data) -> TracksData? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(TracksData.self, from: tracksData)
            return decodedData
        } catch {
            print("Error while parsing.")
            return nil
        }
    }
}
