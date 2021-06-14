
@objc(BarCodeScanner) 
class BarCodeScanner : CDVPlugin{

    var barCode: String?
    var pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR)
    
    @objc(scanBarcode:) 
    func scanBarcode(_ command: CDVInvokedUrlCommand) {
        
        let vc = ScannerViewController()
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        vc.delegate = self
        self.viewController.present(vc, animated: false, completion: nil)
        
        pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: barCode)
        self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
    }
    
}

extension BarCodeScanner: ScannerViewControllerDelegate {
    func found(code: String) {
        barCode = code
        print("Barcode : ", barCode ?? "Not get barcode")
    }
}