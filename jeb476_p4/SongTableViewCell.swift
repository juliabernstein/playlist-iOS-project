//
//  SongTableViewCell.swift
//  jeb476_p4
//
//  Created by Julia Bernstein on 4/10/20.
//  Copyright © 2020 Julia Bernstein. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {

    var songNameLabel: UILabel!
    var artistNameLabel: UILabel!
    var albumNameLabel: UILabel!
    let color2 = UIColor(red: 0.149, green: 0.0784, blue: 0.6078, alpha: 1)
    var albumImageView: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        songNameLabel = UILabel()
        songNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        songNameLabel.textColor = color2
        songNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(songNameLabel)
        
        artistNameLabel = UILabel()
        artistNameLabel.font = UIFont.systemFont(ofSize: 13)
        artistNameLabel.textColor = color2
        artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(artistNameLabel)
        
        albumNameLabel = UILabel()
        albumNameLabel.font = UIFont.systemFont(ofSize: 13)
        albumNameLabel.textColor = color2
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(albumNameLabel)
        
        
        albumImageView = UIImageView()
        //albumImageView.image = UIImage.init(named: "heart")
        albumImageView.contentMode = .scaleAspectFit
        albumImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(albumImageView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        let padding: CGFloat = 7
        let labelHeight: CGFloat = 18
        let imageLength: CGFloat = 50
        
        NSLayoutConstraint.activate([
            songNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            songNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: imageLength+5),
            songNameLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        
        
        NSLayoutConstraint.activate([
            artistNameLabel.topAnchor.constraint(equalTo: songNameLabel.bottomAnchor, constant: padding),
            artistNameLabel.leadingAnchor.constraint(equalTo: songNameLabel.leadingAnchor),
            artistNameLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        
        NSLayoutConstraint.activate([
            albumNameLabel.topAnchor.constraint(equalTo: songNameLabel.bottomAnchor, constant: padding),
            albumNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            albumNameLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        NSLayoutConstraint.activate([
            albumImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            albumImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            albumImageView.heightAnchor.constraint(equalToConstant: imageLength),
            albumImageView.widthAnchor.constraint(equalToConstant: imageLength)
        ])
        
        
    }
    
    func configure(for song: Song) {
        songNameLabel.text = song.songName
        artistNameLabel.text = song.artistName
        albumNameLabel.text = song.albumName
        albumImageView.image = UIImage.init(named: song.albumImageName)

        
    }
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
