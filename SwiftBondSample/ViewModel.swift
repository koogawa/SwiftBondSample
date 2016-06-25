//
//  ViewModel.swift
//  SwiftBondSample
//
//  Created by Kosuke Ogawa on 2016/06/12.
//  Copyright © 2016 koogawa. All rights reserved.
//

import UIKit
import Bond
import SwiftyJSON
import FoursquareAPIClient

public final class ViewModel {

    private(set) var venues = ObservableArray<Venue>([])
    let disposeBag = DisposeBag()

    init() {
        // NOOP
    }

    // MARK: - Public

    public func fetch() {
        self.send()
    }

    // MARK: - Private

    private func send() {
        let client = FoursquareAPIClient(accessToken: "YOUR_TOKEN")
        let parameter: [String: String] = [
            "ll": "40.7,-74",
            ];
        client.requestWithPath("venues/search", parameter: parameter) {
            [weak self] (data, error) in
            guard error == nil else {
                print("error guard")
                return
            }

            let json = JSON(data: data!)
            let venues = (self?.parseVenues(json["response"]["venues"])) ?? [Venue]()
            self?.venues.array = venues
        }
    }

    func parseVenues(venuesJSON: JSON) -> [Venue] {
        var venues = [Venue]()
        for (key: _, venueJSON: JSON) in venuesJSON {
            venues.append(Venue(json: JSON))
        }
        return venues
    }
}
