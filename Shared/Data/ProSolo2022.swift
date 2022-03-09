//
//  ProSolo2022.swift
//  PAX calculator
//
//  Created by Mike Ferchak on 1/9/22.
//

import Foundation

let proSolo2022: [SoloClassGroup: [SoloClass: Double]] = [
    .Street :[
        .SS: 0.831,
        .AS: 0.822,
        .BS: 0.814,
        .CS: 0.803,
        .DS: 0.803,
        .ES: 0.787,
        .FS: 0.809,
        .GS: 0.785,
        .HS: 0.772,
        .SSR: 0.850,
    ],
    .StreetTouring: [
        .STU: 0.826,
        .STR: 0.826,
        .STX: 0.812,
        .STS: 0.806,
        .STH: 0.813,
        .SST: 0.833
    ],
    .StreetPrepared: [
        .SSP: 0.858,
        .ASP: 0.856,
        .BSP: 0.855,
        .CSP: 0.857,
        .DSP: 0.842,
        .ESP: 0.837,
        .FSP: 0.821,
    ],
    .StreetModified: [
        .SSM: 0.877,
        .SM: 0.869,
        .SMF: 0.851,
    ],
    .Prepared: [
        .XP: 0.887,
        .CP: 0.855,
        .DP: 0.858,
        .EP: 0.848,
        .FP: 0.868,
    ],
    .Modified: [
        .AM: 1.000,
        .BM: 0.988,
        .CM: 0.892,
        .DM: 0.914,
        .EM: 0.926,
        .FM: 0.913,
    ],
    .Kart: [
        .KM: 0.931,
    ],
    .SoloSpecCoupe: [
        .SSC: 0.801,
    ],
    .Supplemental: [
        .CAMC: 0.817,
        .CAMT: 0.810,
        .CAMS: 0.841,
        .FSAE: 0.980,
        .XSA: 0.846,
        .XSB: 0.857,
        .EVX: 0.834,
        .HCS: 0.793,
        .HCR: 0.815
    ]
]
