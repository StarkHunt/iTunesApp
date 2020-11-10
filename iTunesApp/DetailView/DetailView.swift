//
//  DetailView.swift
//  iTunesApp
//
//  Created by Sugat Nagavkar on 11/8/20.
//

import UIKit

class DetailView: UIView {
    
    var detailViewModel: DetailViewModel? {
        didSet {
            artistName.text = "Artist: " + (detailViewModel?.result.artistName ?? "Artist Name")
            albumName.text = "Album: " + (detailViewModel?.result.name ?? "Album Name")
            genre.text = "Genre: " + (detailViewModel?.result.genres.first?.name ?? "Genre")
            releaseDate.text = "Release Date: " + (detailViewModel?.result.releaseDate ?? "Release Date")
            copyright.text = "Copyright: " + (detailViewModel?.result.copyright ?? "Copyright")
            
            fetchImage(urlString: detailViewModel?.result.artworkUrl100 ?? "")
        }
    }
    
    let albumImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.white.cgColor
        return imageView
    }()
    
    let stackView: UIStackView = {
       let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .fillProportionally
        view.axis = .vertical
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.darkGray.cgColor
        view.layoutMargins = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 20)
        view.isLayoutMarginsRelativeArrangement = true
        return view
    }()
    
    let artistName: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = .white
        return name
    }()
    
    let albumName: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.numberOfLines = 0
        name.lineBreakMode = .byWordWrapping
        name.textColor = .white
        return name
    }()
    
    let genre: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = .white
        return name
    }()
    
    let releaseDate: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = .white
        return name
    }()
    
    let copyright: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.numberOfLines = 0
        name.lineBreakMode = .byWordWrapping
        name.textColor = .white
        return name
    }()
    
    let iTunesStoreButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("iTunes Store", for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 25
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        
        stackView.addArrangedSubview(artistName)
        stackView.addArrangedSubview(albumName)
        stackView.addArrangedSubview(genre)
        stackView.addArrangedSubview(releaseDate)
        stackView.addArrangedSubview(copyright)
        
        addSubview(albumImageView)
        addSubview(stackView)
        addSubview(iTunesStoreButton)
        
        NSLayoutConstraint.activate([
            albumImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            albumImageView.heightAnchor.constraint(equalToConstant: 200),
            albumImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 8),
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            stackView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            iTunesStoreButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 20),
            iTunesStoreButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            iTunesStoreButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            iTunesStoreButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            iTunesStoreButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func fetchImage(urlString: String) {
        Network().fetchData(urlString: urlString) { [weak self] (result) in
            switch result {
                case .success(let data):
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self?.albumImageView.image = image
                    }
                case .failure(_):
                    print("Error downloading image")
            }
        }
    }
}
