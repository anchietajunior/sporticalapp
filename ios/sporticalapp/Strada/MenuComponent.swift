import Strada
import UIKit
import Foundation

class MenuComponent: BridgeComponent {
    override class var name: String { "menu" }
    
    override func onReceive(message: Message) {
        guard let viewController else { return }
        
        let edit = UIAction(title: "Edit") { _ in
            self.reply(to: "edit")
        }
        
        let delete = UIAction(title: "Delete") { _ in
            self.reply(to: "delete")
        }

        let image = UIImage(systemName: "ellipsis.circle")
        let menu = UIMenu(children: [edit, delete])
        viewController.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, menu: menu)
    }
    
    private var viewController: UIViewController? {
        delegate.destination as? UIViewController
    }
}
