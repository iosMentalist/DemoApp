//
//  MainServiceAdapterTests.swift
//  DemoTests
//
//  Created by Caio Zullo on 03/06/2020.
//  Copyright © 2020 Shady Kahaleh. All rights reserved.
//

import XCTest
@testable import DemoApp

class MainServiceAdapterTests: XCTestCase {

    func test_load_producesCombinedSuccessfulLoaderResults() {
        let (sut, loader) = makeSUT()
        
        let result = getResult(sut)

        XCTAssertEqual(try result?.get(), loader.stub)
    }
    
    func test_load_failsWithArticleLoaderError() {
        let (sut, loader) = makeSUT()
        loader.articleLoaderError = NSError(domain: "any", code: 0)
                
        let result = getResult(sut)
        
        XCTAssertEqual(result?.error as NSError?, loader.articleLoaderError)
    }
    
    func test_load_failsWithPictureLoaderError() {
        let (sut, loader) = makeSUT()
        loader.pictureLoaderError = NSError(domain: "any", code: 0)
                
        let result = getResult(sut)
        
        XCTAssertEqual(result?.error as NSError?, loader.pictureLoaderError)
    }
    
    func test_load_failsWithDailyLoaderError() {
        let (sut, loader) = makeSUT()
        loader.dailyLoaderError = NSError(domain: "any", code: 0)
                
        let result = getResult(sut)
        
        XCTAssertEqual(result?.error as NSError?, loader.dailyLoaderError)
    }
    
    // MARK: - Helpers
    
    private func makeSUT(file: StaticString = #file, line: UInt = #line) -> (MainLoaderAdapter, LoaderStub) {
        let loader = LoaderStub()
        let sut = MainLoaderAdapter(articleLoader: loader, pictureLoader: loader, dailyLoader: loader)
        trackForMemoryLeaks(sut, file: file, line: line)
        trackForMemoryLeaks(loader, file: file, line: line)
        return (sut, loader)
    }
    
    private func getResult(_ sut: MainLoaderAdapter) -> MainLoader.Result? {
        let exp = expectation(description: "Wait for completion")
        var result: MainLoader.Result?
        sut.load(date: Date()) {
            result = $0
            exp.fulfill()
        }
        waitForExpectations(timeout: 0.1)
        return result
    }
    
    private class LoaderStub: ArticleLoader, PictureLoader, DailyLoader {
        let stub = MainModel(
            articles: [
                Article(ID: "any", date: Date(), name: "any", category: .sport, articleTypeId: 0, articleTexts: [.init(articleText: "")])
            ],
            pictures: [
                Picture(name: "any", imageURL: "http://any.com")
            ],
            dailyQuote: "a quote")
        
        var articleLoaderError: NSError?
        var pictureLoaderError: NSError?
        var dailyLoaderError: NSError?
        
        func load(date: Date, completion: @escaping (ArticleLoaderResult) -> Void) {
            DispatchQueue.global().async {
                if let error = self.articleLoaderError {
                    completion(.failure(error))
                } else {
                    completion(.success(self.stub.articles))
                }
            }
        }
        
        func load(date: Date, completion: @escaping (PictureLoaderResult) -> Void) {
            DispatchQueue.global().async {
                if let error = self.pictureLoaderError {
                    completion(.failure(error))
                } else {
                    completion(.success(self.stub.pictures))
                }
            }
        }
        
        func load(completion: @escaping (DailyLoaderResult) -> Void) {
            DispatchQueue.global().async {
                if let error = self.dailyLoaderError {
                    completion(.failure(error))
                } else {
                    completion(.success(self.stub.dailyQuote))
                }
            }
        }
    }

}

private extension Result {
    var error: Failure? {
        switch self {
        case let .failure(error):
            return error
        case .success:
            return nil
        }
    }
}
