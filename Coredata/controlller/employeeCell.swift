//
//  employeeCell.swift
//  Coredata
//
//  Created by comviva on 07/02/22.
//

import UIKit

class employeeCell: UITableViewCell {

    @IBOutlet weak var salary: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var empid: UILabel!
    @IBOutlet weak var nameL: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
