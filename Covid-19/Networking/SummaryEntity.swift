import UIKit

struct SummaryEntity: Decodable {
    let Global: GlobalEntity
    let Countries: [CountryEntity]
    let Date: String
}

struct GlobalEntity: Decodable {
    let NewConfirmed: Int
    let TotalConfirmed: Int
    let NewDeaths: Int
    let TotalDeaths: Int
    let NewRecovered: Int
    let TotalRecovered: Int
}

struct CountryEntity: Decodable {
    let Country: String
    let CountryCode: String
    let Slug: String
    let NewConfirmed: Int
    let TotalConfirmed: Int
    let NewDeaths: Int
    let TotalDeaths: Int
    let NewRecovered: Int
    let TotalRecovered: Int
    let Date: String
}


func getSummary(_ completion: @escaping (SummaryEntity) -> Void) {
    URLSession.shared.dataTask(with: URL(string: "https://api.covid19api.com/summary")!) { (data, response, error) in
        guard error == nil else {
            return
        }
        guard let data = data else {
            return
        }
        let summary = try! JSONDecoder().decode(SummaryEntity.self, from: data)
        completion(summary)
    }.resume()
}
