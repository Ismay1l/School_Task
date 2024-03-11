//
//  HighSchoolViewModel.swift
//  SchoolTask
//
//  Created by Ismayil Ismayilov on 3/9/24.
//

import Foundation
import Combine

final class HighSchoolViewModel: ObservableObject {
    
    @Published var highSchoolList: [HighScoolModel] = []
    @Published var detail: DetailModel = DetailModel(
        schoolName: "",
        satCriticalReadingAvgScore: "",
        satMathAvgScore: "",
        satWritingAvgScore: ""
    )
    
    private var cancellables = Set<AnyCancellable>()
    private let highSchoolService: Dependencies
    
    init(highSchoolService: Dependencies) {
        self.highSchoolService = highSchoolService
        fetchHighSchoolList()
    }
    
    private func fetchHighSchoolList() {
        guard let url = URL(string: URLS.highSchoolList.urlString) else { return }
        let highSchoolListPublisher: AnyPublisher<[HighScoolModel], Error> = highSchoolService.service.fetchData(url, parameters: nil)
        highSchoolListPublisher
            .sink { completion in
                switch completion{
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    break
                }
            } receiveValue: { [weak self] model in
                self?.highSchoolList = model
            }
            .store(in: &cancellables)
    }
    
    func fetchDetail(_ schoolName: String) {
        guard let url = URL(string: URLS.detail.urlString) else { return }
        let parameters = ["school_name": "HENRY STREET SCHOOL FOR INTERNATIONAL STUDIES"]
        let detailPublisher: AnyPublisher<DetailModel, Error> = highSchoolService.service.fetchData(url, parameters: parameters)
        detailPublisher
            .sink { completion in
                switch completion{
                case .failure(let error):
                    print(error)
                case .finished:
                    break
                }
            } receiveValue: { [weak self] model in
                self?.detail = model
            }
            .store(in: &cancellables)
    }
}

extension HighSchoolViewModel {
    
    private enum URLS {
        case highSchoolList, detail
        
        var urlString: String {
            switch self {
            case .highSchoolList:
                return "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
            case .detail:
                return "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
            }
        }
    }
}
