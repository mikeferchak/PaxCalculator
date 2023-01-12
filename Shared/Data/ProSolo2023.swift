//
//  ProSolo2023.swift
//  PAX calculator
//
//  Created by Mike Ferchak on 1/11/23.
//

import Foundation

let proSolo2023: [SoloClassGroup: [SoloClass: Double]] = [
    .Street :[
        .SS: 0.834,
        .AS: 0.824,
        .BS: 0.814,
        .CS: 0.804,
        .DS: 0.803,
        .ES: 0.787,
        .FS: 0.810,
        .GS: 0.785,
        .HS: 0.775,
        .SSR: 0.852,
    ],
    .StreetTouring: [
        .STU: 0.830,
        .STR: 0.828,
        .STX: 0.812,
        .STS: 0.808,
        .STH: 0.814,
        .SST: 0.832
    ],
    .StreetPrepared: [
        .SSP: 0.860,
        .CSP: 0.857,
        .DSP: 0.844,
        .ESP: 0.837,
        .FSP: 0.825,
    ],
    .StreetModified: [
        .SSM: 0.874,
        .SM: 0.869,
        .SMF: 0.853,
    ],
    .Prepared: [
        .XP: 0.886,
        .CP: 0.862,
        .DP: 0.860,
        .EP: 0.856,
        .FP: 0.870,
    ],
    .Modified: [
        .AM: 1.000,
        .BM: 0.988,
        .CM: 0.895,
        .DM: 0.916,
        .EM: 0.923,
        .FM: 0.923,
    ],
    .Kart: [
        .KM: 0.938,
    ],
    .SoloSpecCoupe: [
        .SSC: 0.798,
    ],
    .Supplemental: [
        .CAMC: 0.827,
        .CAMT: 0.816,
        .CAMS: 0.845,
        .FSAE: 0.980,
        .XA: 0.847,
        .XB: 0.855,
        .XS: 0.858,
        .EVX: 0.838,
    ]
]
