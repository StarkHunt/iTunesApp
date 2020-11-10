//
//  DetailViewTests.swift
//  iTunesAppTests
//
//  Created by Sugat Nagavkar on 11/9/20.
//

import XCTest
@testable import iTunesApp

class DetailViewModelTests: XCTestCase {

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDetailViewModel_WithValues() {
        let genre = Genres(genreId: "15", name: "R&B/Soul", url: "https://itunes.apple.com/us/genre/id15")
        let result = Results(artistName: "Tylor Swift", id: "12345", releaseDate: "2016-01-29", name: "Blank Spaces", kind: "Pop", copyright: "℗ 2021 Arlo Parks under exclusive license to Transgressive Records Ltd.", artistId: "1291875084", contentAdvisoryRating: "Explicit", artistUrl: "https://music.apple.com/us/artist/arlo-parks/1291875084?app=music", artworkUrl100: "https://is2-ssl.mzstatic.com/image/thumb/Music114/v4/da/95/39/da9539f9-2a33-b8be-6945-abe46dfb1932/5400863040963_cover.jpg/200x200bb.png", genres: [genre], url: "https://music.apple.com/us/album/collapsed-in-sunbeams/1534718812?app=music")
        let detailViewModel = DetailViewModel(result: result)
        
        XCTAssertEqual(detailViewModel.result.artistName, "Tylor Swift")
        XCTAssertEqual(detailViewModel.result.id, "12345")
        XCTAssertEqual(detailViewModel.result.releaseDate, "2016-01-29")
        XCTAssertEqual(detailViewModel.result.name, "Blank Spaces")
        XCTAssertEqual(detailViewModel.result.kind, "Pop")
        XCTAssertEqual(detailViewModel.result.copyright, "℗ 2021 Arlo Parks under exclusive license to Transgressive Records Ltd.")
        XCTAssertEqual(detailViewModel.result.artistId, "1291875084")
        XCTAssertEqual(detailViewModel.result.contentAdvisoryRating, "Explicit")
        XCTAssertEqual(detailViewModel.result.artworkUrl100, "https://is2-ssl.mzstatic.com/image/thumb/Music114/v4/da/95/39/da9539f9-2a33-b8be-6945-abe46dfb1932/5400863040963_cover.jpg/200x200bb.png")
        XCTAssertEqual(detailViewModel.result.genres.count, 1)
        XCTAssertEqual(detailViewModel.result.url, "https://music.apple.com/us/album/collapsed-in-sunbeams/1534718812?app=music")
    }

}
