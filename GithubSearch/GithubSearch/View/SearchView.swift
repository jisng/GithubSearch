//
//  SearchView.swift
//  GithubSearch
//
//  Created by 박지승 on 2020/11/29.
//

import SwiftUI

struct SearchView: View {
  @ObservedObject var viewModel = SearchViewModel()
  
  var body: some View {
    VStack {
      TextFieldView(text: $viewModel.text)
      List(viewModel.userList) { item in
        SearchListItem(item)
      }
    }
  }
}

struct SearchView_Previews: PreviewProvider {
  static var previews: some View {
    SearchView()
  }
}
