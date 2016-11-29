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
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    public func animateCantidad(){
    
        UIView.animate(withDuration: 1.8, delay: 1, options: UIViewAnimationOptions(), animations: {() -> Void in
            
            self.paquetesLabel.layer.cornerRadius = self.paquetesLabel.frame.width/2
            self.paquetesLabel.clipsToBounds = true
        })
    }
    
    
}
