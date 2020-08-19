//
//  Album.swift
//  Top Pop
//
//  Created by Domagoj Beronic on 19/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

struct Album: Decodable {
    let title: String
    let coverPicture: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case coverPicture = "cover_medium"
    }
}
