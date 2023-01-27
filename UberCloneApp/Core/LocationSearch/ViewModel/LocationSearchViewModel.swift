//
//  LocationSearchViewModel.swift
//  UberCloneApp
//
//  Created by Kinney Kare on 1/25/23.
//

import MapKit
import Foundation

class LocationSearchViewModel: NSObject, ObservableObject {
    
    //MARK: Properties
    @Published var results = [MKLocalSearchCompletion]()
    private let searchCompleter = MKLocalSearchCompleter()
    var queryFragment: String = "" {
        didSet {
            searchCompleter.queryFragment = queryFragment
        }
    }
    
    override init() {
        super.init()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
    }
}

extension LocationSearchViewModel: MKLocalSearchCompleterDelegate {
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
    
}
