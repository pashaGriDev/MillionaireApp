// MillionaireApp, 2024

import UIKit

extension UIImageView {
    
    class func commonImageView(imageName: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        return imageView
    }
}
  
