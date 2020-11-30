//
//  SearchListItem.swift
//  GithubSearch
//
//  Created by 박지승 on 2020/11/29.
//

import SwiftUI

struct SearchListItem: View {
  private var name: User
  
  init(_ name: User) {
    self.name = name
  }
  
  var body: some View {
    Text(name.login)
  }
}
