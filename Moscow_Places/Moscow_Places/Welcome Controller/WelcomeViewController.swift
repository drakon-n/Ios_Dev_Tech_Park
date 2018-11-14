//
//  WelcomeViewController.swift
//  Moscow_Places
//
//  Created by Влад on 07/11/2018.
//  Copyright © 2018 Влад. All rights reserved.
//

import UIKit

final class WelcomeViewController: UIViewController {
	var output: WelcomeViewOutput!

	override func viewDidLoad() {
		super.viewDidLoad()
	}
}

extension WelcomeViewController: WelcomeViewInput {
}
