//
//  PlaceContainer.swift
//  Moscow_Places
//
//  Created by Влад on 07/11/2018.
//  Copyright © 2018 Влад. All rights reserved.
//

import UIKit

final class PlaceContainer {
	let viewController: UIViewController
	private(set) weak var router: PlaceRouterInput!

	class func assemble(with input: PlaceModuleInput) -> PlaceContainer {
		let viewController = PlaceViewController()
		let presenter = PlacePresenter()
		let router = PlaceRouter()
		let interactor = PlaceInteractor()

		viewController.output = presenter

		presenter.view = viewController
		presenter.router = router
		presenter.interactor = interactor
		presenter.moduleOutput = input.moduleOutput

		interactor.output = presenter

		return PlaceContainer(view: viewController, router: router)
	}

	private init(view: UIViewController, router: PlaceRouterInput) {
		viewController = view
		self.router = router
	}
}

struct PlaceInput: PlaceModuleInput {
	weak var moduleOutput: PlaceModuleOutput?
}
