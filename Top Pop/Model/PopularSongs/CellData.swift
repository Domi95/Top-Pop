//
//  Card.swift
//  Top Pop
//
//  Created by Domagoj Beronic on 19/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

struct CellData: Comparable  {
    
    let popularity: Int
    let songName: String
    let singer: String
    let duration: Int
    let artistSmallPicture: String

    static func < (lhs: CellData, rhs: CellData) -> Bool {
        return lhs.duration < rhs.duration
    }
}
