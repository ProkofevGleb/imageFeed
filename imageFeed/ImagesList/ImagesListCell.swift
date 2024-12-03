import UIKit

final class ImagesListCell: UITableViewCell {
    static let reuseIdentifier = "ImagesListCell"
    
    // Создаем градиентный слой
    let gradientLayer = CAGradientLayer()
    
    @IBOutlet var cellView: UIImageView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var likeLabel: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addGradientToCellView()
    }
    
    private func addGradientToCellView() {
        gradientLayer.frame = cellView.bounds
        
        let topColor = UIColor.clear.cgColor
        let bottomColor = UIColor(hex: "#1A1B22", alpha: 0.2)?.cgColor
        
        gradientLayer.colors = [topColor, bottomColor].compactMap { $0 }
        
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        
        let height = cellView.bounds.height
        gradientLayer.locations = [NSNumber(value: (height - 30) / height), NSNumber(value: height / height)]
        
        cellView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Обновляем фрейм градиента на размер contentView
        gradientLayer.frame = contentView.bounds
        
        // Устанавливаем местоположения для градиента
        let height = contentView.bounds.height
        gradientLayer.locations = [NSNumber(value: (height - 30) / height), NSNumber(value: height / height)]
    }
}
