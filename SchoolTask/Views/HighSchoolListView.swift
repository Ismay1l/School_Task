//
//  HighSchoolListView.swift
//  SchoolTask
//
//  Created by Ismayil Ismayilov on 3/9/24.
//

import SwiftUI

struct HighSchoolListView: View {
    
    @StateObject private var highSchoolViewModel: HighSchoolViewModel
    @State private var showingDetailView = false
    
    init(_ service: Dependencies) {
        _highSchoolViewModel = StateObject(wrappedValue: HighSchoolViewModel(highSchoolService: service))
    }
    
    var body: some View {
        List {
            ForEach(highSchoolViewModel.highSchoolList, id: \.self) {
                highSchool in
                HighSchoolView(highScool: highSchool) {
                    highSchoolViewModel.fetchDetail(highSchool.school_name)
                    showingDetailView.toggle()
                }
            }
        }
        .sheet(isPresented: $showingDetailView, content: {
            DetailView(viewModel: highSchoolViewModel)
        })
        .padding(.top)
        .navigationTitle("Highschools")
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HighSchoolListView(Dependencies.init(service: HighSchoolService()))
        }
    }
}




