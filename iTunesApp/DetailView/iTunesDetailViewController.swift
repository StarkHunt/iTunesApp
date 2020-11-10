//
//  iTunesDetailViewController.swift
//  iTunesApp
//
//  Created by Sugat Nagavkar on 11/8/20.
//

import UIKit

class iTunesDetailViewController: UIViewController {
    
    var result: Results?
    
    let detailView: DetailView = {
        let view = DetailView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setUpDetailView()
    }
    
    func setUpViews() {
        
        view.addSubview(detailView)
        view.backgroundColor = .black
        NSLayoutConstraint.activate([
            detailView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            detailView.widthAnchor.constraint(equalTo: view.widthAnchor),
            detailView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor)
        ])
        
        detailView.iTunesStoreButton.addTarget(self, action: #selector(switchToiTunesApp), for: .touchUpInside)
    }
    
    func setUpDetailView() {
        
        let defaultResult = Results(artistName: "??", id: "??", releaseDate: "??", name: "??", kind: "??", copyright: "??", artistId: "??", contentAdvisoryRating: "??", artistUrl: "??", artworkUrl100: "??", genres: [], url: "??")
        detailView.detailViewModel = DetailViewModel(result: result ?? defaultResult)
    }
    
    @objc func switchToiTunesApp() {
        
        let ids = result?.id ?? ""
        let itmsString = "itms://itunes.apple.com/us/album/id\(ids)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        guard let itmsurlString = itmsString, let url = URL(string: itmsurlString) else {
            return
        }

        if UIApplication.shared.canOpenURL(url as URL) {
           UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
