//
//  UINavigationControllerExtension.swift
//  InterviewProjectVitorZitti
//
//  Created by Vitor Zitti on 29/07/24.
//

import SwiftUI

extension UINavigationController {
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
}
