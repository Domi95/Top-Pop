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
    private let singerImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUpElements(song: SongData) {
        addSubview(albumImageView)
        albumImageView.styleView(cornerRadius: 0)
        albumImageView.image = Utils.getImage(imageString: song.album.coverPicture)
        
        addSubview(albumNameLabel)
        albumNameLabel.style(size: 16, text: song.album.title, color: .white)
        
        addSubview(singerImageView)
        singerImageView.styleView(cornerRadius: 0)
        singerImageView.image = Utils.getImage(imageString: song.artist.picture)
        
        addSubview(songNameLabel)
        songNameLabel.style(size:20, text: song.title, color: .white)
        
        addSubview(artistNameLabel)
        artistNameLabel.style(size:18, text: song.artist.name, color: .gray)
        
    }
    
    func setUpConstraints() {
        albumImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        albumImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        albumImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        albumImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        albumNameLabel.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 5).isActive = true
        albumNameLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        albumNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        albumNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        singerImageView.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: 35).isActive = true
        singerImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        singerImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        singerImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        
        songNameLabel.topAnchor.constraint(equalTo: singerImageView.topAnchor).isActive = true
        songNameLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        songNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        songNameLabel.leftAnchor.constraint(equalTo: self.singerImageView.rightAnchor, constant: 10).isActive = true
        
        artistNameLabel.topAnchor.constraint(equalTo: songNameLabel.bottomAnchor, constant: 8).isActive = true
        artistNameLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        artistNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        artistNameLabel.leftAnchor.constraint(equalTo: self.singerImageView.rightAnchor, constant: 10).isActive = true
    }
}
