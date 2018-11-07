//
//  CategoryProtocols.swift
//  Moscow_Places
//
//  Created by Влад on 07/11/2018.
//  Copyright © 2018 Влад. All rights reserved.
//

import Foundation

protocol CategoryModuleInput {
	var moduleOutput: CategoryModuleOutput? { get }
}

protocol CategoryModuleOutput: AnyObject {
}

protocol CategoryViewInput: AnyObject {
}

protocol CategoryViewOutput: AnyObject {
}

protocol CategoryInteractorInput: AnyObject {
}

protocol CategoryInteractorOutput: AnyObject {
}

protocol CategoryRouterInput: AnyObject {
}
