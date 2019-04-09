//
//  RouteOverViewTests.swift
//  BayPassTests
//
//  Created by Ayesha Khan on 4/6/19.
//  Copyright © 2019 Tim Roesner. All rights reserved.
//

@testable import BayPass
import MapKit
import XCTest

class RouteOverViewTests: XCTestCase {
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSetupLineView() {
        let depTime = Date(timeIntervalSinceNow: 60)
        let arrTime = Date(timeIntervalSinceNow: 240)
        let polyline = MKPolyline(coordinates: [])
        let lines = [Line(name: "m", agency: Agency.ACE, destination: "n", color: #colorLiteral(red: 0.2901960784, green: 0.5647058824, blue: 0.8862745098, alpha: 1), transitMode: TransitMode.bart)]
        let firstStop = Station(name: "Santa Clara & 5th", code: 320, transitModes: [TransitMode.bus], lines: lines, location: CLLocation(latitude: 37.34, longitude: -121.89))
        let secondStop = Station(name: "Santa Clara & 3rd", code: 321, transitModes: [TransitMode.bus], lines: lines, location: CLLocation(latitude: 37.35, longitude: -121.90))
        let line = Line(name: "522", agency: Agency.ACE, destination: "Palo Alto", color: #colorLiteral(red: 0.2901960784, green: 0.5647058824, blue: 0.8862745098, alpha: 1), transitMode: TransitMode.bus)
        let waypoints = [firstStop, secondStop]
        let segment = RouteSegment(distanceInMeters: 3000, departureTime: depTime, arrivalTime: arrTime, polyline: polyline, travelMode: TravelMode.transit, line: line, price: 2.25, waypoints: waypoints)

        let route = Route(departureTime: depTime, arrivalTime: arrTime, segments: [segment])
        let subject = RouteOverView(with: route)
//        XCTAssertEqual(subject.durationLabel.text, String(depTime.duration(to: arrTime)))
        XCTAssertNotNil(subject)
    }

    func testSetupLineViewWalking() {
        let depTime = Date(timeIntervalSinceNow: 60)
        let arrTime = Date(timeIntervalSinceNow: 240)
        let polyline = MKPolyline(coordinates: [])
        let line = Line(name: "522", agency: Agency.ACE, destination: "Palo Alto", color: #colorLiteral(red: 0.2901960784, green: 0.5647058824, blue: 0.8862745098, alpha: 1), transitMode: TransitMode.bus)
        let firstStop = Station(name: "Santa Clara & 5th", code: 320, transitModes: [TransitMode.bus], lines: [line], location: CLLocation(latitude: 37.34, longitude: -121.89))
        let waypoints = [firstStop]
        let segment = RouteSegment(distanceInMeters: 3000, departureTime: depTime, arrivalTime: arrTime, polyline: polyline, travelMode: TravelMode.walking, line: line, price: 2.25, waypoints: waypoints)

        let route = Route(departureTime: depTime, arrivalTime: arrTime, segments: [segment])
        let subject = RouteOverView(with: route)
        XCTAssertNotNil(subject)
    }
}