//
//  2023Solo.swift
//  PAX calculator
//
//  Created by Mike Ferchak on 11/18/22.
//

import Foundation


let solo2023: [SoloClassGroup: [SoloClass: Double]] = [
    .Street :[
        .SS: 0.833,
        .AS: 0.823,
        .BS: 0.818,
        .CS: 0.811,
        .DS: 0.808,
        .ES: 0.792,
        .FS: 0.813,
        .GS: 0.794,
        .HS: 0.786,
        .SSR: 0.846,
    ],
    .StreetTouring: [
        .STU: 0.830,
        .STR: 0.831,
        .STX: 0.817,
        .STS: 0.814,
        .STH: 0.812,
        .SST: 0.837
    ],
    .StreetPrepared: [
        .SSP: 0.855,
        .CSP: 0.860,
        .DSP: 0.844,
        .ESP: 0.840,
        .FSP: 0.828,
    ],
    .StreetModified: [
        .SSM: 0.879,
        .SM: 0.868,
        .SMF: 0.847,
    ],
    .Prepared: [
        .XP: 0.884,
        .CP: 0.858,
        .DP: 0.865,
        .EP: 0.856,
        .FP: 0.877,
    ],
    .Modified: [
        .AM: 1.000,
        .BM: 0.980,
        .CM: 0.896,
        .DM: 0.898,
        .EM: 0.911,
        .FM: 0.914,
    ],
    .Kart: [
        .KM: 0.933,
    ],
    .SoloSpecCoupe: [
        .SSC: 0.807,
    ],
    .Supplemental: [
        .CAMC: 0.827,
        .CAMT: 0.819,
        .CAMS: 0.845,
        .FSAE: 0.981,
        .XA: 0.842,
        .XB: 0.848,
        .XS: 0.851,
        .EVX: 0.832,
        .HCS: 0.793,
        .HCR: 0.815
    ]
]
