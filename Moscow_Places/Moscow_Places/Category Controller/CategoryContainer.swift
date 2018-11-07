//
//  CategoryContainer.swift
//  Moscow_Places
//
//  Created by Влад on 07/11/2018.
//  Copyright © 2018 Влад. All rights reserved.
//

import UIKit

final class CategoryContainer {
	let viewController: UIViewController
	private(set) weak var router: CategoryRouterInput!

	class func assemble(with input: CategoryModuleInput) -> CategoryContainer {
		let viewController = CategoryViewController()
		let presenter = CategoryPresenter()
		let router = CategoryRouter()
		let interactor = CategoryInteractor()

		viewController.output = presenter

		presenter.view = viewController
		presenter.router = router
		presenter.interactor = interactor
		presenter.moduleOutput = input.moduleOutput

		interactor.output = presenter

		return CategoryContainer(view: viewController, router: router)
	}

	private init(view: UIViewController, router: CategoryRouterInput) {
		viewController = view
		self.router = router
	}
}

struct CategoryInput: CategoryModuleInput {
	weak var moduleOutput: CategoryModuleOutput?
}
