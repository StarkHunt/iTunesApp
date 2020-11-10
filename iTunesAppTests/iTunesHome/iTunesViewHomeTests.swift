//
//  iTunesTableViewHomeTests.swift
//  iTunesAppTests
//
//  Created by Sugat Nagavkar on 11/9/20.
//

import XCTest
@testable import iTunesApp

class iTunesViewHomeTests: XCTestCase {

    var iController: iTunesViewController?
    
    let result = Results(artistName: "Tylor Swift", id: "12345", releaseDate: "2016-01-29", name: "Blank Spaces", kind: "Pop", copyright: "℗ 2021 Arlo Parks under exclusive license to Transgressive Records Ltd.", artistId: "1291875084", contentAdvisoryRating: "Explicit", artistUrl: "https://music.apple.com/us/artist/arlo-parks/1291875084?app=music", artworkUrl100: "https://is2-ssl.mzstatic.com/image/thumb/Music114/v4/da/95/39/da9539f9-2a33-b8be-6945-abe46dfb1932/5400863040963_cover.jpg/200x200bb.png", genres: [Genres(genreId: "15", name: "R&B/Soul", url: "https://itunes.apple.com/us/genre/id15")], url: "https://music.apple.com/us/album/collapsed-in-sunbeams/1534718812?app=music")
    
    override func setUpWithError() throws {
        iController = iTunesViewController()
        _ = iController?.view
    }

    override func tearDownWithError() throws {
    }

    func test_Title() {
        XCTAssertEqual(iController?.title, "Itunes Albums")
    }
    
    func test_numberOfSection() {
        let numberOfSections = iController?.tableView.numberOfSections
        XCTAssertEqual(numberOfSections, 1)
    }
    
    func test_numberOfRows_Zero() {
        iController?.viewModel?.result = []
        let numberOfRows = iController?.tableView.numberOfRows(inSection: 0)
        XCTAssertEqual(numberOfRows, 0)
    }
    
    func test_numberOfRows_Count() {
        
        iController?.viewModel?.result = [result]
        let numberOfRows = iController?.tableView.numberOfRows(inSection: 0)
        XCTAssertEqual(numberOfRows, 1)
    }
    
    func test_cellForRow_CellIdentifier() {
        
        iController?.viewModel?.result = [result]
        iController?.tableView.reloadData()
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = iController?.tableView.cellForRow(at: indexPath) as? iTunesTableViewCell
        
        XCTAssertEqual(cell?.reuseIdentifier, "iTunesCellID")
    }
}
