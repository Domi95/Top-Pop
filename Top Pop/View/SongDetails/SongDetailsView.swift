//
//  SongDetailsView.swift
//  Top Pop
//
//  Created by Domagoj Beronic on 19/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

class SongDetailsView: UIView {
    
    private let songNameLabel = UILabel()
    private let artistNameLabel = UILabel()
    private let albumNameLabel = UILabel()
    private let albumImageView = UIImageView()
    let albumSongsLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        setUpElements()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setSong(with song: SongData) {
        songNameLabel.text = song.title
        artistNameLabel.text = song.artist.name
        albumImageView.image = Utils.getImage(imageString: song.album.coverPicture)
        albumNameLabel.text = song.album.title
        
    }
    
    func setAlbumSongsLabel(_ albumSongs: [AlbumSong]) {
        var songsTitles = ""
        for song in albumSongs {
            songsTitles = songsTitles + song.title
        }
        DispatchQueue.main.async {
            self.albumSongsLabel.text = songsTitles
        }
    }
    
    private func setUpElements() {
        addSubview(albumImageView)
        albumImageView.styleView(cornerRadius: 0)
        
        addSubview(albumNameLabel)
        albumNameLabel.style(size: 16, textColor: .white)
        
        addSubview(songNameLabel)
        songNameLabel.style(size:20, textColor: .white)
        
        addSubview(artistNameLabel)
        artistNameLabel.style(size:18, textColor: .gray)
        
        addSubview(albumSongsLabel)
        albumSongsLabel.style(size: 16, textColor: .white)
    }
    
    private func setUpConstraints() {
        let margin: CGFloat = 20
        
        songNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        songNameLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        songNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        songNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        albumImageView.topAnchor.constraint(equalTo: songNameLabel.bottomAnchor).isActive = true
        albumImageView.widthAnchor.constraint(equalToConstant: 230).isActive = true
        albumImageView.heightAnchor.constraint(equalToConstant: 230).isActive = true
        albumImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        albumNameLabel.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 5).isActive = true
        albumNameLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        albumNameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        albumNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        artistNameLabel.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor).isActive = true
        artistNameLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        artistNameLabel.heightAnchor.constraint(equalToConstant: margin).isActive = true
        artistNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        albumSongsLabel.topAnchor.constraint(equalTo: self.artistNameLabel.bottomAnchor, constant: margin).isActive = true
        albumSongsLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -margin).isActive = true
        albumSongsLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: margin).isActive = true
        albumSongsLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -margin).isActive = true
    }
}
