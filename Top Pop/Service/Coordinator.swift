//
//  Coordinator.swift
//  Top Pop
//
//  Created by Domagoj Beronic on 20/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit


class Coordinator {
    
    var navigationController: UINavigationController?
    var window: UIWindow?

    init(window: UIWindow) {
        self.window = window
    }
    
    func setRootViewController() {
        let popularSongsViewController = PopularSongsViewController(coordinator: self)
        navigationController = UINavigationController(rootViewController: popularSongsViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func pushDetailViewController(song: SongData) {
        let songDetailsViewController = SongDetailsViewController(song: song)
        navigationController?.pushViewController(songDetailsViewController, animated: true)
    }
}
