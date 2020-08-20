//
//  SongDetailsViewController.swift
//  Top Pop
//
//  Created by Domagoj Beronic on 19/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import Foundation
import UIKit

class SongDetailsViewController: UIViewController {
    
    let songDetailsView = SongDetailsView()
    var song: SongData!
    let service = SongDetailsService()
    var albumSongs: [AlbumSong] = [] {
        didSet {
            songDetailsView.setAlbumSongsLabel(albumSongs)
        }
    }
    
    override func viewDidLoad() {
        setUpPopularSongsView()
        setUpNavigationBar()
        fetchAlbumSongs()
    }
    
    init(song: SongData){
        super.init(nibName: nil, bundle: nil)
        self.song = song
        songDetailsView.setSong(with: song)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func fetchAlbumSongs() {
        service.fetchAlbumSongs(albumId: "\(song.album.id)", completion: { (albumSong) in
            self.albumSongs.append(contentsOf: albumSong)
        })
    }
    
    private func setUpNavigationBar(){
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    private func setUpPopularSongsView() {
        view.addSubview(songDetailsView)
        songDetailsView.translatesAutoresizingMaskIntoConstraints = false
        songDetailsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        songDetailsView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        songDetailsView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        songDetailsView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
