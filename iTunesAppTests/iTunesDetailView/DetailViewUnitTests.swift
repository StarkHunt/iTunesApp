//
//  DetailViewUnitTests.swift
//  iTunesAppTests
//
//  Created by Sugat Nagavkar on 11/9/20.
//

import XCTest
@testable import iTunesApp

class DetailViewUnitTests: XCTestCase {
    
    let detailViewController = iTunesDetailViewController()
    let result = Results(artistName: "Tylor Swift", id: "12345", releaseDate: "2016-01-29", name: "Blank Spaces", kind: "Pop", copyright: "℗ 2021 Arlo Parks under exclusive license to Transgressive Records Ltd.", artistId: "1291875084", contentAdvisoryRating: "Explicit", artistUrl: "https://music.apple.com/us/artist/arlo-parks/1291875084?app=music", artworkUrl100: "https://is2-ssl.mzstatic.com/image/thumb/Music114/v4/da/95/39/da9539f9-2a33-b8be-6945-abe46dfb1932/5400863040963_cover.jpg/200x200bb.png", genres: [Genres(genreId: "15", name: "R&B/Soul", url: "https://itunes.apple.com/us/genre/id15")], url: "https://music.apple.com/us/album/collapsed-in-sunbeams/1534718812?app=music")
    
    override func setUpWithError() throws {
        _ = detailViewController.view
    }

    override func tearDownWithError() throws {
        
    }

    func test_detailViews_NotNil() {
        
        XCTAssertNotNil(detailViewController.detailView.albumImageView)
        XCTAssertNotNil(detailViewController.detailView.stackView)
        XCTAssertNotNil(detailViewController.detailView.albumName)
        XCTAssertNotNil(detailViewController.detailView.artistName)
        XCTAssertNotNil(detailViewController.detailView.copyright)
        XCTAssertNotNil(detailViewController.detailView.genre)
        XCTAssertNotNil(detailViewController.detailView.releaseDate)
        XCTAssertNotNil(detailViewController.detailView.iTunesStoreButton)
    }
    
    func test_detailView_ButtonTitle() {
        let title = detailViewController.detailView.iTunesStoreButton.currentTitle
        XCTAssertEqual(title, "iTunes Store")
    }
    
    func test_StackNumberofViews() {
        let count = detailViewController.detailView.stackView.arrangedSubviews.count
        XCTAssertEqual(count, 5)
    }
    
    func test_validateString() {
        detailViewController.detailView.detailViewModel = DetailViewModel(result: result)
        
        XCTAssertEqual(detailViewController.detailView.albumName.text, "Album: Blank Spaces")
        XCTAssertEqual(detailViewController.detailView.artistName.text, "Artist: Tylor Swift")
        XCTAssertEqual(detailViewController.detailView.copyright.text, "Copyright: ℗ 2021 Arlo Parks under exclusive license to Transgressive Records Ltd.")
        XCTAssertEqual(detailViewController.detailView.genre.text, "Genre: R&B/Soul")
        XCTAssertEqual(detailViewController.detailView.releaseDate.text, "Release Date: 2016-01-29")
    }
}
