//
//  LoggedOutViewController.swift
//  TicTacToe
//
//  Created by Geonhyeong LIm on 2021/02/19.
//  Copyright © 2021 Uber. All rights reserved.
//

import RIBs
import RxSwift
import UIKit
import SnapKit

protocol LoggedOutPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class LoggedOutViewController: UIViewController, LoggedOutPresentable, LoggedOutViewControllable {

    weak var listener: LoggedOutPresentableListener?
}
