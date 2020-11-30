//
//  SearchViewModel.swift
//  GithubSearch
//
//  Created by 박지승 on 2020/11/29.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
  @Published var text: String = ""
  @Published var userList: [User] = []
  
  private var cancellables = Set<AnyCancellable>()
  
  init() {
    $text
      .filter { !$0.isEmpty && $0 != " " }
      .removeDuplicates()
      .debounce(for: 0.5, scheduler: DispatchQueue.main)
      .flatMap { text -> AnyPublisher<[User], Never> in
        self.getUserList(text: text)
      }
      .receive(on: DispatchQueue.main)
      .assign(to: \.userList, on: self)
      .store(in: &cancellables)
  }
  
  private func getUserList(text: String) -> AnyPublisher<[User], Never> {
    return URLSession.shared.dataTaskPublisher(for: searchUrlRequest())
      .map(\.data)
      .decode(type: Users.self, decoder: JSONDecoder())
      .replaceError(with: Users(items: []))
      .map(\.items)
      .eraseToAnyPublisher()
  }
  
  private func searchUrlRequest() -> URLRequest {
    let baseUrl = "https://api.github.com/search/users"
    var urlComponent = URLComponents(string: baseUrl)
    urlComponent?.queryItems = [URLQueryItem(name: "q", value: text)]
    
    return URLRequest(url: urlComponent!.url!)
  }
  
}


