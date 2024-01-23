//
//  ProSolo2024.swift
//  PAX calculator
//
//  Created by Mike Ferchak on 1/22/24.
//

import Foundation

let proSolo2024: [SoloClassGroup: [SoloClass: Double]] = [
    .Street :[
        .SS: 0.842,
        .SS4: 0.842,
        .AS: 0.829,
        .AS4: 0.830,
        .BS: 0.819,
        .BS4: 0.824,
        .CS: 0.806,
        .DS: 0.805,
        .DS4: 0.809,
        .ES: 0.787,
        .FS: 0.811,
        .GS: 0.787,
        .HS: 0.777,
    ],
    .StreetTouring: [
        .STU: 0.830,
        .STU4: 0.836,
        .STR: 0.830,
        .STX: 0.813,
        .STS: 0.810,
        .STH: 0.811,
        .STH4: 0.815,
        .SST: 0.834,
        .SST4: 0.838
    ],
    .StreetPrepared: [
        .SSP: 0.863,
        .SSP4: 0.865,
        .CSP: 0.857,
        .DSP: 0.844,
        .ESP: 0.837,
        .FSP: 0.826,
    ],
    .StreetModified: [
        .SSM: 0.878,
        .SSM4: 0.880,
        .SM: 0.871,
        .SM4: 0.878,
        .SMF: 0.855,
    ],
    .Prepared: [
        .XP: 0.889,
        .XP4: 0.890,
        .CP: 0.861,
        .DP: 0.860,
        .EP: 0.857,
        .FP: 0.872,
        .FP4: 0.876
    ],
    .Modified: [
        .AM: 1.000,
        .BM: 0.984,
        .CM: 0.896,
        .DM: 0.920,
        .EM: 0.930,
        .FM: 0.928,
    ],
    .Kart: [
        .KM: 0.943,
    ],
    .SoloSpecCoupe: [
        .SSC: 0.798,
    ],
    .ClubSpec: [
        .CSM: 0.809,
        .CSX: 0.806
    ],
    .Supplemental: [
        .CAMC: 0.828,
        .CAMT: 0.819,
        .CAMS: 0.850,
        .FSAE: 0.980,
        .XA: 0.848,
        .XA4: 0.854,
        .XB: 0.857,
        .XB4: 0.863,
        .XU: 0.867,
        .XU4: 0.873,
        .EVX: 0.854,
    ]
]


