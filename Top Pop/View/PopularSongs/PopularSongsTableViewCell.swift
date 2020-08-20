//
//  PopularSongsTableViewCell.swift
//  Top Pop
//
//  Created by Domagoj Beronic on 19/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

class PopularSongsTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var singerImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    static let identifier = "PopularSongsReusableCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.setContainerView()
        backgroundColor = .black
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(card: CellData) {
        popularityLabel.style(size: 17, text: "\(card.popularity)")
        artistNameLabel.style(size: 14, text: card.singer, textColor: .systemGray)
        songNameLabel.style(size: 18, text: card.songName)
        durationLabel.style(size: 14, text: Utils.parseSongDuration(seconds: card.duration))
        singerImageView.image = Utils.getImage(imageString: card.artistSmallPicture)
        singerImageView.styleView()
    }
}
