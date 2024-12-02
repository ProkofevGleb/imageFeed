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
        // Устанавливаем размеры градиентного слоя
        gradientLayer.frame = cellView.bounds
        
        // Определяем цвета градиента с использованием HEX-кодов
        let topColor = UIColor.clear.cgColor // Прозрачный цвет сверху
        let bottomColor = UIColor(hex: "#1A1B22", alpha: 0.2)?.cgColor // 20% от #1A1B22
        
        gradientLayer.colors = [topColor, bottomColor].compactMap { $0 } // Убираем nil значения, если bottomColor не удалось создать
        
        // Устанавливаем точки начала и конца градиента
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0) // Начинаем с верхней середины
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1) // Заканчиваем в нижней середине
        
        // Устанавливаем местоположения цветов для градиента
        let height = cellView.bounds.height
        gradientLayer.locations = [NSNumber(value: (height - 30) / height), NSNumber(value: height / height)]
        
        // Добавляем градиентный слой к cellView
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
