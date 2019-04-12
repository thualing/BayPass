//
//  RouteOverViewTests.swift
//  BayPassTests
//
//  Created by Tim Roesner on 4/11/19.
//  Copyright © 2019 Tim Roesner. All rights reserved.
//

@testable import BayPass
import XCTest
import MapKit

class RouteOverViewTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testView() {
        let line323 = Line(name: "323", code: 323, destination: "De Anza College", stops: [])
        let segment1 = RouteSegment(distanceInMeters: 800, durationInMinutes: 3, polyline: MKPolyline(), travelMode: .walking)
        let segment2 = RouteSegment(distanceInMeters: 16000, departureTime: Date().addingTimeInterval(3600), arrivalTime: Date().addingTimeInterval(5600), polyline: MKPolyline(), travelMode: .transit, line: line323, price: 2.50, waypoints: [])
        let segment3 = RouteSegment(distanceInMeters: 6000, durationInMinutes: 15, polyline: MKPolyline(), travelMode: .scooter)
        let testRoute = Route(departureTime: Date().addingTimeInterval(1600), arrivalTime: Date().addingTimeInterval(5600), segments: [segment1, segment2, segment3])
        
        let view = RouteOverView(with: testRoute)
    }

}
