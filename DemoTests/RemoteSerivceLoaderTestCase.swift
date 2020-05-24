//
//  RemoteArticleTests.swift
//  LitourgiaTests
//
//  Created by Shady Kahaleh on 4/9/20.
//  Copyright © 2020 Shady Kahaleh. All rights reserved.
//

import XCTest
@testable import DemoApp

class RemoteArticleLoaderTestCase: XCTestCase {

    func test_init_doesntCallAPI(){
        let sut = makeSut()

        XCTAssertNil(sut.client)
    }

    func test_load_FromAPI(){
        let sut = makeSut()
        sut.load(articles:[:], date: "05-05-2020", completion: {_ in }  )

        XCTAssertNotNil(sut.client)
    }

    func test_load_withArticles(){

    }


    //HELPERS

    func anyURL() -> URL{
        return URL(string:"http://anyurl.com")!
    }

    func makeSut() -> RemoteArticleLoader {
        let client = HttpClient()
        let remoteArticleLoader = RemoteArticleLoader()

        return remoteArticleLoader
    }
}
