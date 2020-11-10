//
//  iTunesAppTests.swift
//  iTunesAppTests
//
//  Created by Sugat Nagavkar on 11/8/20.
//

import XCTest
@testable import iTunesApp

class iTunesAppTests: XCTestCase {
    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func test_viewModelFetchRequestSuccess() {
        
        let mockRequest = MockFetchRequestSuccess()
        let viewModel = iTunesViewModel(fetchProtocol: mockRequest, result: [])
        
        viewModel.fetchProtocol.fetchRecords { (result) in
            
            switch result {
            case .success(let results):
                XCTAssertEqual(results.count, 1)
            case .failure(_ ):
                break
            }
        }
    }
    
    func test_viewModelFetchRequestFailure() {
        
        let mockRequest = MockFetchRequestFailure()
        let viewModel = iTunesViewModel(fetchProtocol: mockRequest, result: [])
        
        viewModel.fetchProtocol.fetchRecords { (result) in
            
            switch result {
            case .success(_ ):
                break
            case .failure(let error):
                let anotherError = error as NSError
                XCTAssertEqual(anotherError.domain, "HTTPError")
                XCTAssertEqual(anotherError.code, 404)
            }
        }
    }
    
    func testiTunesViewModel_Empty() {
        let viewModel = iTunesViewModel(result: [])
        XCTAssertEqual(viewModel.result?.count, 0)
    }
    
    func testiTunesViewModel_Count() {
        let genre = Genres(genreId: "15", name: "R&B/Soul", url: "https://itunes.apple.com/us/genre/id15")
        let result = Results(artistName: "Tylor Swift", id: "12345", releaseDate: "2016-01-29", name: "Blank Spaces", kind: "Pop", copyright: "℗ 2021 Arlo Parks under exclusive license to Transgressive Records Ltd.", artistId: "1291875084", contentAdvisoryRating: "Explicit", artistUrl: "https://music.apple.com/us/artist/arlo-parks/1291875084?app=music", artworkUrl100: "https://is2-ssl.mzstatic.com/image/thumb/Music114/v4/da/95/39/da9539f9-2a33-b8be-6945-abe46dfb1932/5400863040963_cover.jpg/200x200bb.png", genres: [genre], url: "https://music.apple.com/us/album/collapsed-in-sunbeams/1534718812?app=music")
        let viewModel = iTunesViewModel(result: [result])
        XCTAssertEqual(viewModel.result?.count, 1)
    }

    func testViewModel_VerifyModel() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let genre = Genres(genreId: "15", name: "R&B/Soul", url: "https://itunes.apple.com/us/genre/id15")
        let result = Results(artistName: "Tylor Swift", id: "12345", releaseDate: "2016-01-29", name: "Blank Spaces", kind: "Pop", copyright: "℗ 2021 Arlo Parks under exclusive license to Transgressive Records Ltd.", artistId: "1291875084", contentAdvisoryRating: "Explicit", artistUrl: "https://music.apple.com/us/artist/arlo-parks/1291875084?app=music", artworkUrl100: "https://is2-ssl.mzstatic.com/image/thumb/Music114/v4/da/95/39/da9539f9-2a33-b8be-6945-abe46dfb1932/5400863040963_cover.jpg/200x200bb.png", genres: [genre], url: "https://music.apple.com/us/album/collapsed-in-sunbeams/1534718812?app=music")
        let model = iTunesViewModel(result: [result])
        
        XCTAssertEqual(model.result?.first?.artistName, "Tylor Swift")
        XCTAssertEqual(model.result?.first?.id, "12345")
        XCTAssertEqual(model.result?.first?.releaseDate, "2016-01-29")
        XCTAssertEqual(model.result?.first?.name, "Blank Spaces")
        XCTAssertEqual(model.result?.first?.kind, "Pop")
        XCTAssertEqual(model.result?.first?.copyright, "℗ 2021 Arlo Parks under exclusive license to Transgressive Records Ltd.")
        XCTAssertEqual(model.result?.first?.artistId, "1291875084")
        XCTAssertEqual(model.result?.first?.contentAdvisoryRating, "Explicit")
        XCTAssertEqual(model.result?.first?.artworkUrl100, "https://is2-ssl.mzstatic.com/image/thumb/Music114/v4/da/95/39/da9539f9-2a33-b8be-6945-abe46dfb1932/5400863040963_cover.jpg/200x200bb.png")
        XCTAssertEqual(model.result?.first?.genres.count, 1)
        XCTAssertEqual(model.result?.first?.url, "https://music.apple.com/us/album/collapsed-in-sunbeams/1534718812?app=music")
    }
}


//MARK:- Mock Service Data
class MockFetchRequestSuccess: FetchProtocol {
    func fetchRecords(completion: @escaping (Result<[Results], Error>) -> ()) {
        
        let genre = Genres(genreId: "15", name: "R&B/Soul", url: "https://itunes.apple.com/us/genre/id15")
        let result = Results(artistName: "Tylor Swift", id: "12345", releaseDate: "2016-01-29", name: "Blank Spaces", kind: "Pop", copyright: "℗ 2021 Arlo Parks under exclusive license to Transgressive Records Ltd.", artistId: "1291875084", contentAdvisoryRating: "Explicit", artistUrl: "https://music.apple.com/us/artist/arlo-parks/1291875084?app=music", artworkUrl100: "https://is2-ssl.mzstatic.com/image/thumb/Music114/v4/da/95/39/da9539f9-2a33-b8be-6945-abe46dfb1932/5400863040963_cover.jpg/200x200bb.png", genres: [genre], url: "https://music.apple.com/us/album/collapsed-in-sunbeams/1534718812?app=music")
        completion(.success([result]))
    }
}

class MockFetchRequestFailure: FetchProtocol {
    func fetchRecords(completion: @escaping (Result<[Results], Error>) -> ()) {
        let error = NSError(domain: "HTTPError", code: 404, userInfo: nil)
        completion(.failure(error))
    }
}
