//
//  AlbumTracks.swift
//  Top Pop
//
//  Created by Domagoj Beronic on 20/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

struct AlbumTracks: Decodable {
    let albumSongs: [AlbumSong]
    
    enum CodingKeys: String, CodingKey {
        case albumSongs = "data"
    }
}
