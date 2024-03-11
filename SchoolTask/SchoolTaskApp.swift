//
//  SchoolTaskApp.swift
//  SchoolTask
//
//  Created by Ismayil Ismayilov on 3/9/24.
//

import SwiftUI

@main
struct SchoolTaskApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HighSchoolListView(Dependencies.init(service: HighSchoolService()))
            }
        }
    }
}
