//
//  SoloClassGroup.swift
//  PAX calculator
//
//  Created by Mike Ferchak on 1/9/22.
//

import Foundation

enum SoloClassGroup: String, CaseIterable, Identifiable {
    case Street, StreetTouring = "Street Touring", StreetPrepared = "Street Prepared", StreetModified = "Street Modified", Prepared, Modified, Kart, SoloSpecCoupe = "Solo Spec Coupe", CAM, XtremeStreet = "XTreme Street", HeritageClassic = "Heritage Classic", FSAE = "Formula SAE", EVX = "Electric Vehicle Experimental", Supplemental, ClubSpec = "Club Spec"
    
    var id: String {
        get {
            rawValue
        }
    }
}
