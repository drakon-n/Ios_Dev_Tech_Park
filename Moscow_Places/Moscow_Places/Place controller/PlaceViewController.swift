//
//  PlaceViewController.swift
//  Moscow_Places
//
//  Created by Влад on 07/11/2018.
//  Copyright © 2018 Влад. All rights reserved.
//

import UIKit

final class PlaceViewController: UIViewController {
	var output: PlaceViewOutput!

	override func viewDidLoad() {
		super.viewDidLoad()
	}
}

extension PlaceViewController: PlaceViewInput {
}
