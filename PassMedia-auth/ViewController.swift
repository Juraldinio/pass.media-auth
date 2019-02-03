//
//  ViewController.swift
//  PassMedia-auth
//
//  Created by Jura on 2/2/19.
//  Copyright © 2019 Juraldinio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	private struct WebNamedLinks {
		let name: String
		let url: URL?
	}
	
	private struct Constants {
		static let cellName = "CellName"
		static let elements = [
			WebNamedLinks(name: "Pass.Media", url: URL(string: "https://uma.media/login")),
			WebNamedLinks(name: "Uma.Player", url: URL(string: "https://uma.media/video/4a2f25ebf3bf90f2d9031d8050006621/"))
		]
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		let tableView = UITableView(frame: .zero)
		tableView.dataSource = self
		tableView.delegate = self
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellName)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		self.view.addSubview(tableView)
		
		NSLayoutConstraint.activate([
			self.view.topAnchor.constraint(equalTo: tableView.topAnchor),
			self.view.bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
			self.view.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
			self.view.trailingAnchor.constraint(equalTo: tableView.trailingAnchor)
			])
	}

}

extension ViewController: UITableViewDataSource {
	
	public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return Constants.elements.count
	}
	
	public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellName) ?? UITableViewCell(frame: .zero)
		cell.textLabel?.text = Constants.elements[indexPath.row].name
		return cell
	}
	
}

extension ViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let webController = WebViewController()
		webController.url = Constants.elements[indexPath.row].url
		self.navigationController?.pushViewController(webController, animated: true)
	}
	
}
