//
//  ModelDefinitions.swift
//  MySwiftUI
//
//  Created by Mario Heberthardt on 20/10/2022.
//

import Foundation

// MARK: - Configuration
struct Configuration: Codable {
    let images: Images
    let changeKeys: [String]

    enum CodingKeys: String, CodingKey {
        case images
        case changeKeys = "change_keys"
    }
}

// MARK: - Images
struct Images: Codable {
    let baseURL: URL
    let secureBaseURL: URL
    let backdropSizes, logoSizes, posterSizes, profileSizes: [String]
    let stillSizes: [String]

    enum CodingKeys: String, CodingKey {
        case baseURL = "base_url"
        case secureBaseURL = "secure_base_url"
        case backdropSizes = "backdrop_sizes"
        case logoSizes = "logo_sizes"
        case posterSizes = "poster_sizes"
        case profileSizes = "profile_sizes"
        case stillSizes = "still_sizes"
    }
}

// MARK: - Genre
struct Genres: Codable {
    let genres: [Genre]
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}

// MARK: - MovieResult
struct MovieList: Codable {
    let dates: Dates
    let page: Int
    let results: [Movie]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case dates ,page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Dates
struct Dates: Codable {
    let maximum, minimum: Date
}

// MARK: - Result
struct Movie: Codable, Identifiable {
    let adult: Bool
    let backdropPath: String?
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

// MARK: - Test Data
extension Movie {
    static let testMovie = Movie(adult: false, 
                                 backdropPath: "/d6MhreFdMHONqX3iZlJGCF8UkIt.jpg",
                                 genreIDS: [28,878],
                                 id: 436270,
                                 originalLanguage: "en",
                                 originalTitle: "Black Adam",
                                 overview: "Black Adam spends the next 5,000 years flying back to Earth. By the time he makes it back, in 1945, Shazam has appointed three new champions to take his place: Captain Marvel, Captain Marvel Jr., and Mary Marvel.",
                                 popularity: 3890.299,
                                 posterPath: "/3zXceNTtyj5FLjwQXuPvLYK5YYL.jpg",
                                 releaseDate: "2022-10-19",
                                 title: "Black Adam",
                                 video: false,
                                 voteAverage: 7.1,
                                 voteCount: 555)
}

// MARK: - MovieDetail
struct MovieDetail: Codable {
    let adult: Bool
    let backdropPath: String
    let budget: Int
    let homepage: String
    let id: Int
    let imdbID, originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath: String
    let productionCompanies: [ProductionCompany]
    let revenue, runtime: Int
    let spokenLanguages: [SpokenLanguage]
    let status, tagline, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case budget, homepage, id
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case revenue, runtime
        case spokenLanguages = "spoken_languages"
        case status, tagline, title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

extension MovieDetail {
    static var testDetail = MovieDetail(adult: false,
                                        backdropPath: "/d6MhreFdMHONqX3iZlJGCF8UkIt.jpg",
                                        budget: 140000000,
                                        homepage: "",
                                        id: 436270,
                                        imdbID: "tt6443346",
                                        originalLanguage: "en",
                                        originalTitle: "Black Adam",
                                        overview: "Black Adam spends the next 5,000 years flying back to Earth. By the time he makes it back, in 1945, Shazam has appointed three new champions to take his place: Captain Marvel, Captain Marvel Jr., and Mary Marvel.",
                                        popularity: 4.5,
                                        posterPath: "/3zXceNTtyj5FLjwQXuPvLYK5YYL.jpg",
                                        productionCompanies: [.testData],
                                        revenue: 250000000,
                                        runtime: 210,
                                        spokenLanguages: [],
                                        status: "Release",
                                        tagline: "The black FURY ",
                                        title: "Black Adam",
                                        video: true,
                                        voteAverage: 4.0,
                                        voteCount: 555)
}

// MARK: - ProductionCompany
struct ProductionCompany: Codable, Identifiable {
    let id: Int
    let logoPath: String?
    let name, originCountry: String

    enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
}

extension ProductionCompany {
    static var testData = ProductionCompany(id: 12,
                                        logoPath: "/iaYpEp3LQmb8AfAtmTvpqd4149c.png",
                                        name: "New Line Cinema",
                                        originCountry: "US")
}

// MARK: - SpokenLanguage
struct SpokenLanguage: Codable {
    let englishName, iso639_1, name: String

    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case iso639_1 = "iso_639_1"
        case name
    }
}

// MARK: - MovieCredits
struct MovieCredits: Codable {
    let id: Int
    let cast, crew: [CastCrew]
}

// MARK: - Cast
struct CastCrew: Codable ,Identifiable {
    let id = UUID()
    let adult: Bool
    let gender, realID: Int
    let knownForDepartment, name, originalName: String
    let popularity: Double
    let profilePath: String?
    let castID: Int?
    let character: String?
    let creditID: String
    let order: Int?
    let department, job: String?

    enum CodingKeys: String, CodingKey {
        case adult, gender
        case realID = "id"
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case castID = "cast_id"
        case character
        case creditID = "credit_id"
        case order, department, job
    }
}

extension CastCrew {
    static let theRock  = CastCrew(adult: false,
                                   gender: 2,
                                   realID: 18918,
                                   knownForDepartment: "Acting",
                                   name: "Dwayne Johnson",
                                   originalName: "Dwayne Johnson",
                                   popularity: 58.368,
                                   profilePath: "/kuqFzlYMc2Irs0yPznMd1FroeGq.jpg",
                                   castID: 0,
                                   character: "Black Adam / Toth Adam",
                                   creditID:"59e392f39251410b677000225",
                                   order: 0,
                                   department: nil,
                                   job: nil)
    
    static let director = CastCrew(adult: false,
                                   gender: 2,
                                   realID: 59521,
                                   knownForDepartment: "Directing",
                                   name: "Jaume Collet-Serra",
                                   originalName: "Jaume Collet-Serra",
                                   popularity: 7.901,
                                   profilePath: "/kuqFzlYMc2Irs0yPznMd1FroeGq.jpg",
                                   castID: nil,
                                   character: nil,
                                   creditID:"59e392f39251410b677000225",
                                   order: nil,
                                   department: "Directing",
                                   job: "director ")
}
