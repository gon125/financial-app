//
//  RootRouterTests.swift
//  TicTacToeTests
//
//  Created by Geonhyeong LIm on 2021/02/24.
//  Copyright © 2021 Uber. All rights reserved.
//

@testable import TicTacToe

import XCTest

class RootRouterTests: XCTestCase {
    
    private var loggedInBuilder: LoggedInBuildableMock!
    private var rootInteractor: RootInteractableMock!
    private var rootRouter: RootRouter!

    override func setUp() {
        super.setUp()
        loggedInBuilder = LoggedInBuildableMock()
        rootInteractor = RootInteractableMock()
        rootRouter = RootRouter(interactor: rootInteractor, viewController: RootViewControllableMock(), loggedOutBuilder: LoggedOutBuildableMock(), loggedInBuilder: loggedInBuilder)
        
    }
    
    func test_routeToLoggedIn_verifyInvokeBuilderAttachReturnedRouter() {
        let loggedInRouter = LoggedInRoutingMock(interactable: LoggedInInteractableMock())
        var assignedListner: LoggedInListener? = nil
        loggedInBuilder.buildHandler = { (_ listener: LoggedInListener) -> (LoggedInRouting) in
            assignedListner = listener
            return loggedInRouter
        }
        
        XCTAssertNil(assignedListner)
        XCTAssertEqual(loggedInBuilder.buildCallCount, 0)
        XCTAssertEqual(loggedInRouter.loadCallCount, 0)
        
        rootRouter.routeToLoggedIn(withPlayer1Name: "1", player2Name: "2")
        
        XCTAssertTrue(assignedListner === rootInteractor)
        XCTAssertEqual(loggedInBuilder.buildCallCount, 1)
        XCTAssertEqual(loggedInRouter.loadCallCount, 1)
    }
}
