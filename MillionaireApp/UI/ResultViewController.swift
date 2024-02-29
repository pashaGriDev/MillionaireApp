// MillionaireApp, 2024

import UIKit


class ResultViewController: UIViewController {
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = ResultView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view().addSaveButtonTarget(self, action: #selector(saveResult(sender: )))
        view().addRestartButtonTarget(self, action: #selector(restartGame(sender: )))
    }
    
    override func viewDidLayoutSubviews() {
        view().setupLayots()
    }
    
    // MARK: - Functions
    
    @objc func restartGame(sender: UIButton) {
        print("RESTART GAME")
    }
    
    @objc func saveResult(sender: UIButton) {
        print("SAVE GAME")
    }
    
    func view() -> ResultView {
        return view as! ResultView
    }
}


