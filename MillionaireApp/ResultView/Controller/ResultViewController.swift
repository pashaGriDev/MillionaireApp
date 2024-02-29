// MillionaireApp, 2024

import UIKit


class ResultViewController: UIViewController {
    
    var result = ResultModel(user: "", result: 1)
    var delegate: ResultViewControllerDelegate?
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = ResultView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view().addSaveButtonTarget(self, action: #selector(saveResult(sender: )))
        view().addRestartButtonTarget(self, action: #selector(restartGame(sender: )))
        
        self.delegate = view()
        self.delegate?.reloadLabel(result: result)
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


