//
//  BookTableViewCell.swift
//  Reading List
//
//  Created by Alex on 4/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    @IBOutlet var bookNameLbl: UILabel!
    @IBOutlet var readCheckBtn: UIButton!

    @IBAction func readCheckedBtnPressed(_ sender: UIButton) {
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
