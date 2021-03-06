//
//  TVCTableView.swift
//  BayPass
//
//  Created by Tim Roesner on 4/14/19.
//  Copyright © 2019 Tim Roesner. All rights reserved.
//

import UIKit

extension TicketViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return UserManager.shared.getPurchasedTickets().count
    }

    func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = purchasedTicketTableView.dequeueReusableCell(withIdentifier: purchasedTicketTableViewCellID) as! PurchasedTicketCell
        cell.setup(with: UserManager.shared.getPurchasedTickets()[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Did select cell")
    }
}
