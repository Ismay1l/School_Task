//
//  DetailView.swift
//  SchoolTask
//
//  Created by Ismayil Ismayilov on 3/11/24.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var viewModel: HighSchoolViewModel
    
    init(viewModel: HighSchoolViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text("Name: ")
                            .foregroundColor(.gray)
                            .fontWeight(.medium)
                            .font(.system(size: 20))
                        Text(viewModel.detail.schoolName)
                            .fontWeight(.bold)
                    }
                    
                    HStack {
                        Text("Reading Average: ")
                            .foregroundColor(.gray)
                            .fontWeight(.medium)
                            .font(.system(size: 20))
                        Text(viewModel.detail.satCriticalReadingAvgScore)
                            .fontWeight(.bold)
                    }
                    
                    HStack {
                        Text("SAT Math Average: ")
                            .foregroundColor(.gray)
                            .fontWeight(.medium)
                            .font(.system(size: 20))
                        Text(viewModel.detail.satMathAvgScore)
                            .fontWeight(.bold)
                    }
                    
                    HStack {
                        Text("SAT Writing Average: ")
                            .foregroundColor(.gray)
                            .fontWeight(.medium)
                            .font(.system(size: 20))
                        Text(viewModel.detail.satWritingAvgScore)
                            .fontWeight(.bold)
                    }
                }
                .padding(.top, 30)
                Spacer()
            }
            .padding(.leading, 20)
        }
        Spacer()
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: HighSchoolViewModel(highSchoolService: Dependencies.init(service: HighSchoolService())))
    }
}
