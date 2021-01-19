//
//  RocketDetailsViewModelTests.swift
//  RocketsListTests
//
//  Created by Svetlana Matusova on 18.01.21.
//

import XCTest
@testable import RocketsList

class RocketDetailsViewModelTests: XCTestCase {
    
    var sut: RocketDetailsViewModel!
    var rocket: Rocket!

    override func setUp() {
        
    }

    override func tearDown() {
        rocket = nil
        sut = nil
    }

    func testName() {
        rocket = Rocket(id: "rew435rew4", name: "Falcon", active: true, country: "", description: "", successRate: 50, firstFlight: "", cost: 432134, wikipedia: "", images: [""])

        sut = RocketDetailsViewModel(rocket: rocket)
        
        XCTAssertEqual(sut.name, rocket.name)
    }
    
    func testDate() {
        rocket = Rocket(id: "rew435rew4", name: "Falcon", active: true, country: "", description: "", successRate: 30, firstFlight: "2007-10-15", cost: 432134, wikipedia: "", images: [""])

        sut = RocketDetailsViewModel(rocket: rocket)
        
        XCTAssertEqual(sut.date, "15 Oct, 2007")
    }
    
    func testImage() {
        rocket = Rocket(id: "rew435rew4", name: "Falcon", active: true, country: "", description: "", successRate: 342342, firstFlight: "", cost: 432134, wikipedia: "", images: ["https://farm1.staticflickr.com/929/28787338307_3453a11a77_b.jpg",                  "https://farm4.staticflickr.com/3955/32915197674_eee74d81bb_b.jpg"])

        sut = RocketDetailsViewModel(rocket: rocket)
        
        XCTAssertEqual(sut.image, rocket.images![0])
    }
    
    func testColorRed() {
        rocket = Rocket(id: "rew435rew4", name: "Falcon", active: true, country: "", description: "", successRate: 10, firstFlight: "", cost: 432134, wikipedia: "", images: [""])

        sut = RocketDetailsViewModel(rocket: rocket)
        
        XCTAssertEqual(sut.badgeColor, UIColor.red)
    }
    
    func testColorOrange() {
        rocket = Rocket(id: "rew435rew4", name: "Falcon", active: true, country: "", description: "", successRate: 50, firstFlight: "", cost: 432134, wikipedia: "", images: [""])

        sut = RocketDetailsViewModel(rocket: rocket)
        
        XCTAssertEqual(sut.badgeColor, UIColor.orange)
    }
    
    func testNameGreen() {
        rocket = Rocket(id: "rew435rew4", name: "Falcon", active: true, country: "", description: "", successRate: 80, firstFlight: "", cost: 432134, wikipedia: "", images: [""])

        sut = RocketDetailsViewModel(rocket: rocket)
        
        XCTAssertEqual(sut.badgeColor, Colors.greenBadge)
    }
    
    func testCountry() {
        rocket = Rocket(id: "rew435rew4", name: "Falcon", active: true, country: "USA", description: "", successRate: 50, firstFlight: "", cost: 432134, wikipedia: "", images: [""])

        sut = RocketDetailsViewModel(rocket: rocket)
        
        XCTAssertEqual(sut.country, rocket.country)
    }
    
    func testDescription() {
        rocket = Rocket(id: "rew435rew4", name: "Falcon", active: true, country: "", description: "The Falcon 1 was an expendable launch system privately developed and manufactured by SpaceX during 2006-2009. On 28 September 2008, Falcon 1 became the first privately-developed liquid-fuel launch vehicle to go into orbit around the Earth.", successRate: 50, firstFlight: "", cost: 432134, wikipedia: "", images: [""])

        sut = RocketDetailsViewModel(rocket: rocket)
        
        XCTAssertEqual(sut.description, rocket.description)
    }
    
    func testActive() {
        rocket = Rocket(id: "rew435rew4", name: "Falcon", active: true, country: "", description: "", successRate: 50, firstFlight: "", cost: 432134, wikipedia: "", images: [""])

        sut = RocketDetailsViewModel(rocket: rocket)
        
        XCTAssertEqual(sut.activity, "(active)")
    }
    
    func testInactive() {
        rocket = Rocket(id: "rew435rew4", name: "Falcon", active: false, country: "", description: "", successRate: 50, firstFlight: "", cost: 432134, wikipedia: "", images: [""])

        sut = RocketDetailsViewModel(rocket: rocket)
        
        XCTAssertEqual(sut.activity, "(inactive)")
    }
    
    func testCost() {
        rocket = Rocket(id: "rew435rew4", name: "Falcon", active: true, country: "", description: "", successRate: 50, firstFlight: "", cost: 67000000, wikipedia: "", images: [""])

        sut = RocketDetailsViewModel(rocket: rocket)
        
        XCTAssertEqual(sut.costInDollars, "67m $")
    }
    
    func testWiki() {
        rocket = Rocket(id: "rew435rew4", name: "Falcon", active: true, country: "", description: "", successRate: 50, firstFlight: "", cost: 432134, wikipedia: "https://en.wikipedia.org/wiki/Falcon_1", images: [""])

        sut = RocketDetailsViewModel(rocket: rocket)
        
        XCTAssertEqual(sut.wikiUrl, rocket.wikipedia)
    }
    
    func testImageUrl() {
        rocket = Rocket(id: "rew435rew4", name: "Falcon", active: true, country: "", description: "", successRate: 342342, firstFlight: "", cost: 432134, wikipedia: "", images: ["https://farm1.staticflickr.com/929/28787338307_3453a11a77_b.jpg",                  "https://farm4.staticflickr.com/3955/32915197674_eee74d81bb_b.jpg"])

        sut = RocketDetailsViewModel(rocket: rocket)
        
        XCTAssertEqual(sut.imageUrl, URL(string: rocket.images![0]))
    }
}
