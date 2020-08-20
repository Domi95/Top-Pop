//
//  Tracks.swift
//  Top Pop
//
//  Created by Domagoj Beronic on 19/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

struct Tracks: Decodable {
    var data: [SongData]
    var total: Int
}
