//
//  AlbumAPIService.swift
//  Top Pop
//
//  Created by Domagoj Beronic on 20/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

class SongDetailsService {
    
    private var albumURL = "https://api.deezer.com/album/"
    
    func fetchAlbumSongs(albumId: String, completion: @escaping([AlbumSong]) -> ()) {
        self.albumURL = albumURL + albumId
        guard let url = URL(string: albumURL) else { return }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("Error while fetching data.")
                return
            }
            guard let safeData = data else { return }
            
            guard let albumData = self.parseJSON(safeData) else { return }
            
            completion(albumData.tracks.albumSongs)
        }
        task.resume()
    }
    
    private func parseJSON(_ albumData: Data) -> AlbumData? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(AlbumData.self, from: albumData)
            return decodedData
        } catch {
            print("Error while parsing.")
            return nil
        }
    }
}
