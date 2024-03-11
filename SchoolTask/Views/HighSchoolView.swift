//
//  HighSchoolView.swift
//  SchoolTask
//
//  Created by Ismayil Ismayilov on 3/11/24.
//

import SwiftUI

struct HighSchoolView: View {
    
    var highScool: HighScoolModel
    var onSelected: () -> Void
    
    var body: some View {
        Button {
            onSelected()
        } label: {
            HStack {
                Text("School name: ")
                    .font(.italic(.system(size: 14))())
                Text(highScool.school_name)
                    .bold()
                    .font(.system(size: 16))
            }
            .foregroundColor(.black)
        }
    }
}

struct HighSchoolView_Previews: PreviewProvider {
    static var previews: some View {
        HighSchoolView(
            highScool: HighScoolModel(
                school_name: "",
                boro: "",
                overview_paragraph: "",
                ell_programs: "",
                neighborhood: "",
                location: "",
                phone_number: ""
            )
        ){ }
    }
}
