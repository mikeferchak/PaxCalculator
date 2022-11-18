//
//  2020Solo.swift
//  PAX calculator
//
//  Created by Mike Ferchak on 1/8/22.
//

import Foundation


let solo2022: [SoloClassGroup: [SoloClass: Double]] = [
    .Street :[
        .SS: 0.830,
        .AS: 0.821,
        .BS: 0.818,
        .CS: 0.810,
        .DS: 0.807,
        .ES: 0.792,
        .FS: 0.814,
        .GS: 0.794,
        .HS: 0.786,
        .SSR: 0.846,
    ],
    .StreetTouring: [
        .STU: 0.829,
        .STR: 0.828,
        .STX: 0.817,
        .STS: 0.813,
        .STH: 0.812,
        .SST: 0.841
    ],
    .StreetPrepared: [
        .SSP: 0.853,
        .ASP: 0.849,
        .BSP: 0.852,
        .CSP: 0.864,
        .DSP: 0.844,
        .ESP: 0.840,
        .FSP: 0.824,
    ],
    .StreetModified: [
        .SSM: 0.883,
        .SM: 0.868,
        .SMF: 0.845,
    ],
    .Prepared: [
        .XP: 0.885,
//        .BP: 0.867,
        .CP: 0.854,
        .DP: 0.865,
        .EP: 0.850,
        .FP: 0.874,
    ],
    .Modified: [
        .AM: 1.000,
        .BM: 0.988,
        .CM: 0.895,
        .DM: 0.898,
        .EM: 0.909,
        .FM: 0.908,
    ],
    .Kart: [
        .KM: 0.931,
    ],
    .SoloSpecCoupe: [
        .SSC: 0.809,
    ],
    .Supplemental: [
        .CAMC: 0.819,
        .CAMT: 0.816,
        .CAMS: 0.838,
        .FSAE: 0.989,
        .XSA: 0.842,
        .XSB: 0.851,
        .EVX: 0.835,
        .HCS: 0.793,
        .HCR: 0.815
    ]
]
