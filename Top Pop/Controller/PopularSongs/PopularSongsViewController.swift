//
//  PopularSongsViewController.swift
//  Top Pop
//
//  Created by Domagoj Beronic on 19/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//
import UIKit

class PopularSongsViewController: UIViewController {
    
    private var window: UIWindow?
    private let popularSongsView = PopularSongsView()
    private let service = SongsAPIService()
    private var cards: [Card] = []
    private var songs: [SongData] = [] {
        didSet {
            fillCards()
        }
    }
    
    override func viewDidLoad() {
        setUpPopularSongsView()
        getTracks()
        setUpPopularSongsTableView()
    }
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func getTracks() {
        service.fetchTracks(completion: { (songsData) in
            self.songs.append(contentsOf: songsData)
        })
    }
    
    private func fillCards() {
        for song in songs {
            let card = Card(popularity: song.position, songName: song.title, singer: song.artist.name, duration: song.duration, artistSmallPicture: song.artist.picture)
            self.cards.append(card)
        }
        DispatchQueue.main.async {
            self.popularSongsView.tableView.reloadData()
        }
    }
    
    private func setUpPopularSongsTableView() {
        popularSongsView.tableView.dataSource = self
        popularSongsView.tableView.delegate = self
        popularSongsView.tableView.register(UINib(nibName: "PopularSongsTableViewCell", bundle: nil), forCellReuseIdentifier: PopularSongsTableViewCell.identifier)
    }

    private func setUpPopularSongsView() {
        view.addSubview(popularSongsView)
        popularSongsView.translatesAutoresizingMaskIntoConstraints = false
        popularSongsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        popularSongsView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        popularSongsView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        popularSongsView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension PopularSongsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let songDetailsViewController = SongDetailsViewController(song: songs[indexPath.row])
        self.navigationController?.pushViewController(songDetailsViewController, animated: true)
    }
}

extension PopularSongsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = popularSongsView.tableView.dequeueReusableCell(withIdentifier: PopularSongsTableViewCell.identifier, for: indexPath) as! PopularSongsTableViewCell
        cell.setup(card: cards[indexPath.row])
        
        cell.selectionStyle = .none
        return cell
    }
}
