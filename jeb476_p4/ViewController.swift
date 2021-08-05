//
//  ViewController.swift
//  jeb476_p4
//
//  Created by Julia Bernstein on 4/10/20.
//  Copyright © 2020 Julia Bernstein. All rights reserved.
//

import UIKit

protocol SaveNewSongDelegate: class {

    func saveNewSong(newSongName: String, newArtistName: String, newAlbumName: String, item: Int, newAlbumImageName: String)

}


class ViewController: UIViewController {

    var tableView: UITableView!

    let reuseIdentifier = "songCellReuse"
    let cellHeight: CGFloat = 50
    var songs: [Song]!

    override func viewDidLoad() {
        super.viewDidLoad()
        let col1 = UIColor(red: 0.0314, green: 0.0157, blue: 0.9686, alpha: 1)
        let col2 = UIColor(red: 0.149, green: 0.0784, blue: 0.6078, alpha: 1)

        title = "My Playlist"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: col2]
        view.backgroundColor = col1
        
        let dani = Song(songName: "Dani California", artistName: "Red Hot Chili Peppers", albumName: "Stadium Arcadium", albumImageName: "red")
        let livin = Song(songName: "Livin' Thing", artistName: "Electric Light Orchestra", albumName: "A New World Record", albumImageName: "elo")
        let everlong = Song(songName: "Everlong", artistName: "Foo Fighters", albumName: "The Colour And The Shape", albumImageName: "foo")
        let jigsaw = Song(songName: "Jigsaw Falling Into Place", artistName: "Radiohead", albumName: "In Rainbows", albumImageName: "radiohead")
        let taxman = Song(songName: "Taxman", artistName: "The Beatles", albumName: "Revolver", albumImageName: "beatles" )
        let politik = Song(songName: "Politik", artistName: "Coldplay", albumName: "A Rush of Blood to the Head", albumImageName: "coldplay")
        let shoplifters = Song(songName: "Shoplifters of the World Unite", artistName: "The Smiths", albumName: "Louder Than Bombs", albumImageName: "smiths")
        let lithium = Song(songName: "Lithium", artistName: "Nirvana", albumName: "Nevermind", albumImageName: "nirvana")
        let four = Song(songName: "Four Out Of Five", artistName: "Arctic Monkeys", albumName: "Tranquility Base Hotel and Casino", albumImageName: "arctic")
        let gold = Song(songName: "Gold Dust Woman", artistName: "Fleetwood Mac", albumName: "Rumours", albumImageName: "fleetwood")
        let finally = Song(songName: "Finally Alone", artistName: "Mac DeMarco", albumName: "Here Comes The Cowboy", albumImageName: "mac")
        let cause = Song(songName: "'Cause I'm A Man", artistName: "Tame Impala", albumName: "Currents", albumImageName: "tame")
        let machu = Song(songName: "Machu Picchu", artistName: "The Strokes", albumName: "Angles", albumImageName: "strokes")
        let plush = Song(songName: "Plush", artistName: "Stone Temple Pilots", albumName: "Core", albumImageName: "stone")
        let shiny = Song(songName: "Shiny Happy People", artistName: "R.E.M.", albumName: "Out Of Time", albumImageName: "rem")
        let gig = Song(songName: "The Great Gig in the Sky", artistName: "Pink Floyd", albumName: "Dark Side of the Moon", albumImageName: "pink")
        let sultans = Song(songName: "Sultans of Swing", artistName: "Dire Straits", albumName: "Dire Straits", albumImageName: "dire")
        let magic = Song(songName: "Magic Man", artistName: "Heart", albumName: "Dreamboat Annie", albumImageName: "heart")
        songs = [dani, livin, everlong, jigsaw, taxman, politik, shoplifters, lithium, four, gold, finally, cause, machu, plush, shiny, gig, sultans, magic]

        // Initialize tableView!
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        // tableView setup
        tableView.register(SongTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)

        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as!SongTableViewCell
        let song = songs[indexPath.row]
        cell.selectionStyle = .none
        cell.configure(for: song)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.songs[indexPath.row]
        let detailVC = DetailVC(delegate: self, song: item, index: indexPath.row)
        detailVC.song = item
        self.present(detailVC, animated: false)
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    



}

extension ViewController: SaveNewSongDelegate {
    func saveNewSong(newSongName: String, newArtistName: String, newAlbumName: String, item: Int, newAlbumImageName: String) {
        var newSong = Song(songName: newSongName, artistName: newArtistName, albumName: newAlbumName, albumImageName: newAlbumImageName)
        songs[item] = newSong
        tableView.reloadData()
    }
    

}






