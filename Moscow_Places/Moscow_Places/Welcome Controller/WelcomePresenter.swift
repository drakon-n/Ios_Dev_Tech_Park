//
//  WelcomePresenter.swift
//  Moscow_Places
//
//  Created by Влад on 07/11/2018.
//  Copyright © 2018 Влад. All rights reserved.
//

import Foundation

final class WelcomePresenter {
	weak var view: WelcomeViewInput?
	var router: WelcomeRouterInput!
	var interactor: WelcomeInteractorInput!
	weak var moduleOutput: WelcomeModuleOutput?
}

extension WelcomePresenter: WelcomeViewOutput {
}

extension WelcomePresenter: WelcomeInteractorOutput {
}
