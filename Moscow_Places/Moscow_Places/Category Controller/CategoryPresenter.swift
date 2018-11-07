//
//  CategoryPresenter.swift
//  Moscow_Places
//
//  Created by Влад on 07/11/2018.
//  Copyright © 2018 Влад. All rights reserved.
//

import Foundation

final class CategoryPresenter {
	weak var view: CategoryViewInput?
	var router: CategoryRouterInput!
	var interactor: CategoryInteractorInput!
	weak var moduleOutput: CategoryModuleOutput?
}

extension CategoryPresenter: CategoryViewOutput {
}

extension CategoryPresenter: CategoryInteractorOutput {
}
