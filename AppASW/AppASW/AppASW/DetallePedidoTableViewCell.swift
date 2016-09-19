//
//  DetallePedidoTableViewCell.swift
//  AppASW
//
//  Created by Juan de Dios Arjona on 17/8/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import UIKit

class DetallePedidoTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var productoLabel: UILabel!
    @IBOutlet weak var caracteristicasLabel: UILabel!
    @IBOutlet weak var pesoLabel: UILabel!
    @IBOutlet weak var paquetesLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.paquetesLabel.layer.cornerRadius = paquetesLabel.frame.width/2
        self.paquetesLabel.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
