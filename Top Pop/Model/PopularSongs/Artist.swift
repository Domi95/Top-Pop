//
//  Artist.swift
//  Top Pop
//
//  Created by Domagoj Beronic on 19/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

struct Artist: Decodable {
    let name: String
    let picture: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case picture = "picture_small"
    }
}
