//
//  WelcomeProtocols.swift
//  Moscow_Places
//
//  Created by Влад on 07/11/2018.
//  Copyright © 2018 Влад. All rights reserved.
//

import Foundation

protocol WelcomeModuleInput {
	var moduleOutput: WelcomeModuleOutput? { get }
}

protocol WelcomeModuleOutput: AnyObject {
}

protocol WelcomeViewInput: AnyObject {
}

protocol WelcomeViewOutput: AnyObject {
}

protocol WelcomeInteractorInput: AnyObject {
}

protocol WelcomeInteractorOutput: AnyObject {
}

protocol WelcomeRouterInput: AnyObject {
}
