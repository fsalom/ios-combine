import UIKit

class CryptoCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!

    var crypto: CryptoDTO! {
        didSet {
            setupUI()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupUI() {
        nameLabel.text = crypto.name
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
