var exec = require('cordova/exec');

exports.coolMethod = function (arg0, success, error) {
  exec(success, error, 'BarCodeScanner', 'coolMethod', [arg0]);
};

exports.scanBarcode = function (arg0, success, error) {
  exec(success, error, 'BarCodeScanner', 'scanBarcode', [arg0]);
};
