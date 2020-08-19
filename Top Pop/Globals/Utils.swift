//
//  Utils.swift
//  Top Pop
//
//  Created by Domagoj Beronic on 19/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

class Utils {
    
    static func parseSongDuration(seconds: Int) -> String {
        let min = seconds / 60
        let sec = seconds % 60
        
        return sec < 10 ? "\(min):0\(sec)" : "\(min):\(sec)"
    }
    
    static func getImage(imageString: String) -> UIImage {
        if let url = URL(string: imageString){
            do {
                let data = try Data(contentsOf: url)
                return UIImage(data: data)!
            } catch let err{
                print("Error: \(err.localizedDescription)")
            }
        }
        return UIImage()
    }
}
