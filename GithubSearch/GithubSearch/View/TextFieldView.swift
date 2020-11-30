//
//  TextFieldView.swift
//  GithubSearch
//
//  Created by 박지승 on 2020/11/30.
//

import SwiftUI

struct TextFieldView: View {
  @Binding var text: String
    var body: some View {
        TextField("유저 이름을 검색하세요", text: $text)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .padding(8)
          .background(Color.gray)
    }
}
