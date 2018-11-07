//
//  PlaceProtocols.swift
//  Moscow_Places
//
//  Created by Влад on 07/11/2018.
//  Copyright © 2018 Влад. All rights reserved.
//

import Foundation

protocol PlaceModuleInput {
	var moduleOutput: PlaceModuleOutput? { get }
}

protocol PlaceModuleOutput: AnyObject {
}

protocol PlaceViewInput: AnyObject {
}

protocol PlaceViewOutput: AnyObject {
}

protocol PlaceInteractorInput: AnyObject {
}

protocol PlaceInteractorOutput: AnyObject {
}

protocol PlaceRouterInput: AnyObject {
}
