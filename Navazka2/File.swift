@IBAction func showCofficientBoardAction(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
   guard let vc = storyboard.instantiateViewController(withIdentifier: "CofficientBoard") as? CofficientBoard
    else { return }
    if let nomberElement = nomberElementView.text,
        let newNoberElement = Double(nomberElement) {
        vc.elementValue = Int(newNoberElement)
    }
    vc.deligete = self
    present(vc, animated: true)
}
