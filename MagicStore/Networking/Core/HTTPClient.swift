//
//  HTTPClient.swift
//  MagicStore
//
//  Created by Rachel Schneebaum on 10/3/23.
//

import Foundation

protocol HTTPClient {
	// This is just a way to associate a particular endpoint type with a particular http client/network service
    associatedtype EndpointType: Endpoint
	// NOTE: This `NetworkSession` type is just a wrapper around `URLSession` to allow for easier testing;
	// It's fine to use `URLSession` directly instead
    var urlSession: NetworkSession { get }
    func request<T: Decodable>(_ endpoint: EndpointType) async throws -> T
}

extension HTTPClient {
    func request<T: Decodable>(_ endpoint: EndpointType) async throws -> T {
        guard let urlRequest = endpoint.urlRequest else {
            throw NetworkError.badRequest
        }

        let (data, response) = try await urlSession.data(for: urlRequest)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.noResponse
        }
        
        guard 200..<300 ~= httpResponse.statusCode else {
            throw NetworkError.requestFailure(httpResponse.statusCode)
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
	
	/// Demonstrates a basic network request without async/await (still asynchronous, but using completion handlers and `Result` types instead)
	func request<T: Decodable>(_ endpoint: EndpointType, completion: @escaping (Result<T, NetworkError>) -> Void) {
		guard let urlRequest = endpoint.urlRequest else {
			completion(.failure(.badRequest))
			return
		}
		
		// There are three completion handler params:
		// `data` is the data returned from the network request, e.g., to be parsed as json
		// `response` is a `URLResponse`, which includes things like the status code, headers, etc.
		// `error` is... an error
		// annoyingly, any/all of these could be nil
		let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
			guard let httpResponse = response as? HTTPURLResponse else {
				completion(.failure(.noResponse))
				return
			}
			
			guard 200..<300 ~= httpResponse.statusCode else {
				completion(.failure(.requestFailure(httpResponse.statusCode)))
				return
			}
			
			guard let data,
				  let decoded = try? JSONDecoder().decode(T.self, from: data) else {
				completion(.failure(.decodingFailure))
				return
			}
			
			completion(.success(decoded))
		}
		
		task.resume()
	}
	
	func demoURLSessionConfiguration() {
		let configuration = URLSessionConfiguration.default
		configuration.timeoutIntervalForRequest = 0.5
		configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
		let urlSession = URLSession(configuration: configuration)
		// urlSession.downloadTask(with: //... etc.)
	}
}

@Observable class FakeViewModel {
	var results: SearchResults?
	var errorMessage: String?
	
	let service = ScryfallNetworkService()
	let backgroundQueue = DispatchQueue.global(qos: .background)
	let mainQueue = DispatchQueue.main
	
	func example() {
		// Making a network request on a background queue
		backgroundQueue.async {
			self.service.request(.random) { (result: Result<SearchResults, NetworkError>) in
				switch result {
				case .success(let decoded):
					// Assign values to properties on the main queue — because `@Observable` types'
					// properties affect the UI
					self.mainQueue.async {
						self.results = decoded
						// This would also be where you'd update a view controller if using MVC, e.g., tableView.reloadData()
					}
					
				case .failure(let error):
					self.mainQueue.async {
						self.errorMessage = error.localizedDescription
					}
				}
			}
		}
	}
}
