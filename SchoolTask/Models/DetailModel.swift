//
//  DetailModel.swift
//  SchoolTask
//
//  Created by Ismayil Ismayilov on 3/9/24.
//

import Foundation

struct DetailModel: Codable {
    
    let schoolName, satCriticalReadingAvgScore: String
    let satMathAvgScore, satWritingAvgScore: String

    enum CodingKeys: String, CodingKey {
        case schoolName = "school_name"
        case satCriticalReadingAvgScore = "sat_critical_reading_avg_score"
        case satMathAvgScore = "sat_math_avg_score"
        case satWritingAvgScore = "sat_writing_avg_score"
    }
}
