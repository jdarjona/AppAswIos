//
//  MonitorTableViewCell.swift
//  AppASW
//
//  Created by Juan de Dios Arjona on 4/7/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import UIKit

class MonitorTableViewCell: UITableViewCell {

    var codPedido = ""
    @IBOutlet weak var codPedidoLabel: UILabel!
    @IBOutlet weak var clienteLabel: UILabel!
    @IBOutlet weak var fechaLabel: UILabel!
    @IBOutlet weak var comercialLabel: UILabel!
    @IBOutlet weak var estadoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
