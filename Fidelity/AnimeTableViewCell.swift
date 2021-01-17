//
//  AnimeTableViewCell.swift
//  Fidelity
//
//  Created by Priya Reddy on 1/16/21.
//

import UIKit

class AnimeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var animeImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var synposisLbl: UILabel!
    @IBOutlet weak var startDateLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
