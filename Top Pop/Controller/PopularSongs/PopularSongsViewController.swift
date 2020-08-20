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
    private let service = PopularSongsService()
    private var cellData = [CellData]()
    private var songs = [SongData]() {
        didSet {
            fillCellData()
            fillDefaultCellData()
        }
    }
    private var currentlySelectedSort = "Normal"
    private var defaultCellData: [CellData] = []
    private var coordinator: Coordinator?
    
    override func viewDidLoad() {
        setUpPopularSongsView()
        getTracks()
        setUpPopularSongsTableView()
        setUpButtonsAction()
        setUpRefreshControl()
        sortDataWhenClicked()
    }
    
    init(coordinator: Coordinator) {
        super.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func getTracks() {
        service.fetchTracks(completion: { (songsData) in
            self.songs.append(contentsOf: songsData)
        })
    }
    
    private func fillDefaultCellData() {
        defaultCellData = cellData
    }
    
    private func fillCellData() {
        for song in songs {
            let card = CellData(popularity: song.position, songName: song.title, singer: song.artist.name, duration: song.duration, artistSmallPicture: song.artist.picture)
            self.cellData.append(card)
        }
        
        DispatchQueue.main.async {
            self.cellData = Utils.sortData(sortType: self.currentlySelectedSort, cards: self.cellData)
            self.popularSongsView.tableView.reloadData()
        }
    }
    
    private func sortDataWhenClicked() {
        popularSongsView.menu.selectionAction = { index, title in
            self.currentlySelectedSort = title
            self.cellData = Utils.sortData(sortType: title, cards: self.defaultCellData)
            
            DispatchQueue.main.async {
                self.popularSongsView.tableView.reloadData()
            }
        }
    }
    
    private func deleteCellData() {
        songs = []
        cellData = []
        defaultCellData = []
    }
    
    private func setUpRefreshControl() {
        popularSongsView.refreshControl.addTarget(self, action: #selector(self.pullToRefreshTableView(_:)), for: .valueChanged)
    }
    
    private func setUpButtonsAction(){
        popularSongsView.dropDownButton.addTarget(self, action: #selector(dropDownButtonPressed), for: .touchUpInside)
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
    
    @objc func dropDownButtonPressed(){
        popularSongsView.menu.show()
    }
    
    @objc func pullToRefreshTableView(_ sender: AnyObject) {
        self.deleteCellData()
        self.getTracks()
        self.popularSongsView.refreshControl.endRefreshing()
    }
}

extension PopularSongsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.pushDetailViewController(song: songs[indexPath.row])
        
    }
}

extension PopularSongsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = popularSongsView.tableView.dequeueReusableCell(withIdentifier: PopularSongsTableViewCell.identifier, for: indexPath) as! PopularSongsTableViewCell
        cell.setup(card: cellData[indexPath.row])
        
        cell.selectionStyle = .none
        return cell
    }
}
