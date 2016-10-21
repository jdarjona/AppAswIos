//
//  SinopticoTableViewCell.swift
//  AppASW
//
//  Created by Juan de Dios Arjona on 2/9/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import UIKit

class SinopticoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var maquinaImage: UIImageView!
    @IBOutlet weak var marchaImagen: UIImageView!
    @IBOutlet weak var conexionImage: UIImageView!
    @IBOutlet weak var rendimientoLabel: UILabel!
    @IBOutlet weak var rendimientoProgress: UIProgressView!
    @IBOutlet weak var objetivoLabel: UILabel!
    
    @IBOutlet weak var maquinaLabel: UILabel!
    @IBOutlet weak var productoLabel: UILabel!
    @IBOutlet weak var operarioLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
