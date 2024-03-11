//
//  HighScoolModel.swift
//  SchoolTask
//
//  Created by Ismayil Ismayilov on 3/9/24.
//

import Foundation

struct HighScoolModel: Hashable, Decodable {
    
    let school_name: String
    let boro: String
    let overview_paragraph: String
    let ell_programs: String
    let neighborhood: String
    let location: String
    let phone_number: String
}
