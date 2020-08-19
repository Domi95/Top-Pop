//
//  Data.swift
//  Top Pop
//
//  Created by Domagoj Beronic on 19/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

struct SongData: Decodable {    
    let title: String
    let duration: Int
    let position: Int
    let artist: Artist
    let album: Album
}
