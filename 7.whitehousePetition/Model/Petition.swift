//
//  Petition.swift
//  7.whitehousePetition
//
//  Created by Truong Nguyen on 9/2/20.
//  Copyright © 2020 Truong Nguyen. All rights reserved.
//

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}
