//
//  UserModel.swift
//  GithubSearch
//
//  Created by 박지승 on 2020/11/30.
//

import Foundation

struct Users: Decodable {
  let items: [User]
}

struct User: Decodable, Identifiable {
  var id: Int
  let login: String
}
