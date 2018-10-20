//
//  MBReport.swift
//  BroccoliEarth
//
//  Created by joseewu on 2018/10/20.
//  Copyright © 2018 com.js. All rights reserved.
//

import Foundation
struct ArrayDataTransform<T:Codable>:Codable {
    private enum CodingKeys: String, CodingKey {
        case data = "images"
    }
    let data:[T]?
}
extension ArrayDataTransform {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try? container.decode(Array<T>.self, forKey: .data)
    }
}
struct MBReport:Codable {
    private enum CodingKeys: String, CodingKey {
        case dataId = "id"
        case userId = "userId"
        case latitude = "latitude"
        case longitude = "longitude"
        case time = "created_at"
    }
    let dataId:Int?
    let userId:Int?
    let latitude:Double?
    let longitude:Double?
    let time:String?
}
extension MBReport {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        dataId = try? container.decode(Int.self, forKey: .dataId)
        userId = try? container.decode(Int.self, forKey: .userId)
        latitude = try? container.decode(Double.self, forKey: .latitude)
        longitude = try? container.decode(Double.self, forKey: .longitude)
        time = try? container.decode(String.self, forKey: .time)
    }
}
