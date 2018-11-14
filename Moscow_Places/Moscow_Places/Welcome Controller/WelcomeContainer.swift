//
//  WelcomeContainer.swift
//  Moscow_Places
//
//  Created by Влад on 07/11/2018.
//  Copyright © 2018 Влад. All rights reserved.
//

import UIKit

final class WelcomeContainer {
	let viewController: UIViewController
	private(set) weak var router: WelcomeRouterInput!

	class func assemble(with input: WelcomeModuleInput) -> WelcomeContainer {
		let viewController = WelcomeViewController()
		let presenter = WelcomePresenter()
		let router = WelcomeRouter()
		let interactor = WelcomeInteractor()

		viewController.output = presenter

		presenter.view = viewController
		presenter.router = router
		presenter.interactor = interactor
		presenter.moduleOutput = input.moduleOutput

		interactor.output = presenter

		return WelcomeContainer(view: viewController, router: router)
	}

	private init(view: UIViewController, router: WelcomeRouterInput) {
		viewController = view
		self.router = router
	}
}

struct WelcomeInput: WelcomeModuleInput {
	weak var moduleOutput: WelcomeModuleOutput?
}
