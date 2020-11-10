//
//  iTunesTableViewCell.swift
//  iTunesApp
//
//  Created by Sugat Nagavkar on 11/8/20.
//

import UIKit

class iTunesTableViewCell: UITableViewCell {
    
    var viewModel: Results? {
        didSet {
            albumName.text = viewModel?.name ?? "Album Name"
            artistName.text = viewModel?.artistName ?? "Artist Name"
            fetchAlbumImage(urlString: viewModel?.artworkUrl100 ?? "")
        }
    }
    
    let albumArtImageView: UIImageView = {
       let albumArt = UIImageView()
        albumArt.translatesAutoresizingMaskIntoConstraints = false
        albumArt.backgroundColor = .lightGray
        albumArt.layer.cornerRadius = 10
        albumArt.clipsToBounds = true
        albumArt.contentMode = .scaleToFill
        return albumArt
    }()
    
    let artistName: UILabel = {
       let album = UILabel()
        album.font = UIFont.systemFont(ofSize: 14, weight: .light)
        album.translatesAutoresizingMaskIntoConstraints = false
        return album
    }()
    
    let albumName: UITextView = {
        let artist = UITextView()
         artist.translatesAutoresizingMaskIntoConstraints = false
         artist.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
         artist.isEditable = false
         artist.textAlignment = .left
         artist.textContainer.lineFragmentPadding = 0
         artist.textContainerInset = .zero
         return artist
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        addSubview(albumArtImageView)
        addSubview(artistName)
        addSubview(albumName)
        
        NSLayoutConstraint.activate([
            albumArtImageView.widthAnchor.constraint(equalToConstant: 120),
            albumArtImageView.heightAnchor.constraint(equalToConstant: 90),
            albumArtImageView.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            albumArtImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 2),
        ])
        
        NSLayoutConstraint.activate([
            artistName.leftAnchor.constraint(equalTo: albumArtImageView.rightAnchor, constant: 8),
            artistName.topAnchor.constraint(equalTo: topAnchor),
            artistName.rightAnchor.constraint(equalTo: rightAnchor),
            artistName.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            albumName.leftAnchor.constraint(equalTo: albumArtImageView.rightAnchor, constant: 8),
            albumName.topAnchor.constraint(equalTo: artistName.bottomAnchor),
            albumName.rightAnchor.constraint(equalTo: rightAnchor),
            albumName.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func fetchAlbumImage(urlString: String) {
        
        Network().fetchData(urlString: urlString) { [weak self] (result) in
            switch result {
            case .success(let data):
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self?.albumArtImageView.image = image
                }
            case .failure(_ ):
                print("Error loading image")
            }
        }
    }
}
