//
//  UnsplashService.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 26/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import RxCocoa
import RxSwift

final class UnsplashService: UnsplashServiceType {

    let host = "https://api.unsplash.com/"
    let clientID = "3b99a69cee09770a4a0bbb870b437dbda53efb22f6f6de63714b71c4df7c9642"

    func fetchPopularPhotos(page: Int, perPage: Int) -> Single<[UnsplashPhotoFeed]> {
        guard let request = generateURL(endpoint: .popular(page: page, perPage: perPage))
            else { return .error(NetworkError.undefined) }
        return response(request: request).map([UnsplashPhotoFeed].self).asSingle()
    }
}

extension UnsplashService {
    func response(request: URLRequest) -> Observable<Data> {
        return URLSession.shared.rx.response(request: request)
            .map({ result -> Data in
                guard 200 <= result.response.statusCode && result.response.statusCode < 300
                    else { throw NetworkError.invalidStatusCode }

                return result.data
            })
    }

    var requiredParameters: [String: Any]? {
        return ["client_id": clientID]
    }

    func generateURL(endpoint: Endpoint, parameters: [String: Any]? = nil) -> URLRequest? {
        var components = URLComponents(string: host + endpoint.path)

        var paramters: [String: Any] = [:]
        if let endpointParameters = endpoint.parameters {
            paramters.merge(endpointParameters) { _, new in new }
        }
        if let requiredParameters = requiredParameters {
            paramters.merge(requiredParameters) { _, new in new }
        }
        components?.queryItems = paramters
            .compactMapValues({ $0 as? String })
            .map({ URLQueryItem(name: $0.key, value: $0.value) })

        guard let url = components?.url
            else { return nil }

        return URLRequest(url: url)
    }
}

extension UnsplashService {
    enum Endpoint {
        case popular(page: Int, perPage: Int)

        var parameters: [String: Any]? {
            switch self {
            case let .popular(page, perPage):
                return [
                    "order_by": "popular",
                    "page": page,
                    "per_page": perPage
                ]
            }
        }

        var path: String {
            switch self {
            case .popular: return "photos/"
            }
        }
    }
}
