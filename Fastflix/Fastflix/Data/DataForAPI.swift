//
//  DataForAPI.swift
//  Fastflix
//
//  Created by hyeoktae kwon on 2019/07/19.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import Foundation

// MARK: - MovieElement
struct MovieElement: Codable {
  let id: Int
  let name: String
  let videoFile, sampleVideoFile: JSONNull?
  let productionDate, uploadedDate, synopsis, runningTime: String
  let viewCount: Int
  let logoImagePath: String
  let horizontalImagePath: String
  let verticalImage, circleImage: JSONNull?
  let bigImagePath: String
  let degree: Degree
  let directors, actors, feature, author: [Degree]
  let genre: [Degree]
  
  enum CodingKeys: String, CodingKey {
    case id, name
    case videoFile = "video_file"
    case sampleVideoFile = "sample_video_file"
    case productionDate = "production_date"
    case uploadedDate = "uploaded_date"
    case synopsis
    case runningTime = "running_time"
    case viewCount = "view_count"
    case logoImagePath = "logo_image_path"
    case horizontalImagePath = "horizontal_image_path"
    case verticalImage = "vertical_image"
    case circleImage = "circle_image"
    case bigImagePath = "big_image_path"
    case degree, directors, actors, feature, author, genre
  }
}

// MARK: - Degree
struct Degree: Codable {
  let id: Int
  let name: String
}

typealias Movie = [MovieElement]

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
  
  public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
    return true
  }
  
  public var hashValue: Int {
    return 0
  }
  
  public init() {}
  
  public required init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    if !container.decodeNil() {
      throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
    }
  }
  
  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encodeNil()
  }
}
