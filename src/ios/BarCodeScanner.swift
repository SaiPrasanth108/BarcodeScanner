
@objc(BarCodeScanner) 
class BarCodeScanner : CDVPlugin{

    var barCode: String?
    var pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR)
    
    @objc(scanBarcode:) 
    func scanBarcode(_ command: CDVInvokedUrlCommand) {
        DispatchQueue.main.async {
            let vc = ScannerViewController()
            vc.modalPresentationStyle = .overCurrentContext
            vc.modalTransitionStyle = .crossDissolve
            vc.delegate = self
            self.viewController.present(vc, animated: false, completion: nil)
            
            self.pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: self.barCode)
            self.commandDelegate!.send(self.pluginResult, callbackId: command.callbackId)
        }
    }
    
}

extension BarCodeScanner: ScannerViewControllerDelegate {
    func found(code: String) {
        barCode = code
        print("Barcode : ", barCode ?? "Not get barcode")
    }
}