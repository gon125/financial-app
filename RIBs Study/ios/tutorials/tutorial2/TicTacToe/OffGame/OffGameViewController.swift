//
//  OffGameViewController.swift
//  TicTacToe
//
//  Created by Geonhyeong LIm on 2021/02/23.
//  Copyright © 2021 Uber. All rights reserved.
//

import RIBs
import SnapKit
import UIKit
import RxCocoa
import RxSwift

protocol OffGamePresentableListener: class {
    func startGame()
}

final class OffGameViewController: UIViewController, OffGamePresentable, OffGameViewControllable {
    var uiviewController: UIViewController {
        return self
    }

    weak var listener: OffGamePresentableListener?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Method is not supported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.yellow
        buildStartButton()
    }
    
    private func buildStartButton() {
        let startButton = UIButton()
        view.addSubview(startButton)
        startButton.snp.makeConstraints { maker in
            maker.center.equalTo(self.view.snp.center)
            maker.leading.trailing.equalTo(self.view).inset(40)
            maker.height.equalTo(100)
        }
        startButton.setTitle("Start Game", for: .normal)
        startButton.setTitleColor(UIColor.white, for: .normal)
        startButton.backgroundColor = UIColor.black
        startButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.listener?.startGame()
            })
            .disposed(by: disposeBag)
    }
    
    private let disposeBag = DisposeBag()
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
@available(iOS 13.0, *)
struct OffGameVCRepresentable: UIViewRepresentable {
    func updateUIView(_ uiView: UIViewType, context: Context) {
        print("update")
    }
    func makeUIView(context: Context) -> some UIView {
        OffGameViewController().view
    }
}
@available(iOS 13.0, *)
struct OffGameVCPreview: PreviewProvider {
    static var previews: some View { OffGameVCRepresentable() }
}

#endif
