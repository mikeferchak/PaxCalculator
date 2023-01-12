//
//  SoloClass.swift
//  PAX calculator
//
//  Created by Mike Ferchak on 1/9/22.
//

import Foundation

enum SoloClass: String, CaseIterable, Identifiable {
    case SS, AS, BS, CS, DS, ES, FS, GS, HS, HCS, SSC, STH, STS, STX, STR, STU, SST, SSP, ASP, BSP, CSP, DSP, ESP, FSP, SSR, CAMT = "CAM-T", CAMC = "CAM-C", CAMS = "CAM-S", XSA = "XS-A", XSB =  "XS-B", XP, CP, DP, EP, FP, HCR, SMF, SM, SSM, AM, BM, CM, DM, EM, FM, FSAE, KM, EVX, XA, XB, XS
    
    var id: String {
        get {
            rawValue
        }
    }
}
