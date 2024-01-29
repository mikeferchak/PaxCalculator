//
//  Solo2024.swift
//  PAX calculator
//
//  Created by Mike Ferchak on 1/22/24.
//

import Foundation


let solo2024: [SoloClassGroup: [SoloClass: Double]] = [
    .Street :[
        .SS: 0.835,
        .AS: 0.824,
        .BS: 0.818,
        .CS: 0.813,
        .DS: 0.810,
        .ES: 0.792,
        .FS: 0.814,
        .GS: 0.796,
        .HS: 0.786,
    ],
    .StreetTouring: [
        .STU: 0.833,
        .STR: 0.832,
        .STX: 0.819,
        .STS: 0.816,
        .STH: 0.812,
        .SST: 0.836
    ],
    .StreetPrepared: [
        .SSP: 0.857,
        .CSP: 0.860,
        .DSP: 0.847,
        .ESP: 0.840,
        .FSP: 0.831,
    ],
    .StreetModified: [
        .SSM: 0.879,
        .SM: 0.868,
        .SMF: 0.850,
    ],
    .Prepared: [
        .XP: 0.887,
        .CP: 0.856,
        .DP: 0.865,
        .EP: 0.858,
        .FP: 0.877,
    ],
    .Modified: [
        .AM: 1.000,
        .BM: 0.978,
        .CM: 0.898,
        .DM: 0.904,
        .EM: 0.910,
        .FM: 0.917,
        .KM: 0.937,
    ],
    .Spec: [
        .CSM: 0.808,
        .CSX: 0.811,
        .SSC: 0.805,
    ],
    .Supplemental: [
        .CAMC: 0.826,
        .CAMT: 0.820,
        .CAMS: 0.848,
        .FSAE: 0.980,
        .XA: 0.844,
        .XB: 0.849,
        .XU: 0.869,
        .EVX: 0.834,
        .HCS: 0.793,
        .HCR: 0.815
    ]
]

