//
//  DetailVC.swift
//  jeb476_p4
//
//  Created by Julia Bernstein on 4/10/20.
//  Copyright © 2020 Julia Bernstein. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    weak var delegate: SaveNewSongDelegate?
    
    var song: Song!
    var songTitleString: String?
    var artistNameString: String?
    var albumNameString: String?
    var songNameLabel: UITextField!
    var artistNameLabel: UITextField!
    var albumNameLabel: UITextField!
    let color2 = UIColor(red: 0.6549, green: 0.6, blue: 0.898, alpha: 1)
    var albumImageView: UIImageView!
    var saveButton: UIButton!
    var index: Int!
    
    init(delegate: SaveNewSongDelegate, song: Song, index: Int) {
        super.init(nibName: nil, bundle: nil)

        self.delegate = delegate
        self.index = index
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = color2
        
        song = Song(songName: song.songName, artistName: song.artistName, albumName: song.albumName, albumImageName: song.albumImageName)
        
        songNameLabel = UITextField()
        songNameLabel.text = song.songName
        songNameLabel.font = UIFont.boldSystemFont(ofSize: 25)
        songNameLabel.textColor = .white
        songNameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(songNameLabel)
        
        artistNameLabel = UITextField()
        artistNameLabel.text = song.artistName
        artistNameLabel.font = UIFont.systemFont(ofSize: 20)
        artistNameLabel.textColor = .white
        artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(artistNameLabel)
        
        albumNameLabel = UITextField()
        albumNameLabel.text = song.albumName
        albumNameLabel.font = UIFont.systemFont(ofSize: 25)
        albumNameLabel.textColor = .white
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(albumNameLabel)
        
        
        albumImageView = UIImageView()
        albumImageView.image = UIImage.init(named: song.albumImageName)
        albumImageView.contentMode = .scaleAspectFit
        albumImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(albumImageView)
        
        saveButton = UIButton()
        saveButton.setTitle("Save and dismiss", for: .normal)
        saveButton.backgroundColor = .white
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.backgroundColor = .lightGray
        saveButton.addTarget(self, action: #selector(dismissViewControllerAndSaveText), for: .touchUpInside)
        view.addSubview(saveButton)
        
        setupConstraints()
        
    }
    
    func setupConstraints() {
        
        let padding: CGFloat = 5
        let imageLength: CGFloat = 50
        
        
        NSLayoutConstraint.activate([
            albumNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 2*imageLength),
            albumNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            albumNameLabel.heightAnchor.constraint(equalToConstant: imageLength)
        ])
        
        NSLayoutConstraint.activate([
            albumImageView.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: padding),
            albumImageView.heightAnchor.constraint(equalToConstant: imageLength*6),
            albumImageView.widthAnchor.constraint(equalToConstant: imageLength*6),
            albumImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            songNameLabel.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: padding),
            songNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            songNameLabel.heightAnchor.constraint(equalToConstant: imageLength)
        ])
        
        NSLayoutConstraint.activate([
            artistNameLabel.topAnchor.constraint(equalTo: songNameLabel.bottomAnchor, constant: padding),
            artistNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: artistNameLabel.bottomAnchor, constant: imageLength),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
    }
    
    @objc func dismissViewControllerAndSaveText() {
        let songName = songNameLabel.text
        let artistName = artistNameLabel.text
        let albumName = albumNameLabel.text
        if songName != "" && artistName != "" && albumName != "" {
            if let songName = songName, let artistName = artistName, let albumName = albumName {
            delegate?.saveNewSong(newSongName: songName, newArtistName: artistName, newAlbumName: albumName, item: index, newAlbumImageName: song.albumImageName)
            }
        }
        if songName == "" {
            let alert2 = UIAlertController(title: "Error", message: "Please type a name", preferredStyle: .alert)
            alert2.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert2, animated: true, completion: nil)
    }
    dismiss(animated: true, completion: nil)
}
    
}
