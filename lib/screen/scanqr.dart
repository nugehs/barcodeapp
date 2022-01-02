import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanScreen extends StatefulWidget {
  ScanScreen() : super();

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  double width = 0.0;
  String qrString = 'Not Scanned';

  @override
  Widget build(BuildContext context) {
    // height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan Qr Code'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            qrString,
            style: const TextStyle(color: Colors.black, fontSize: 30),
          ),
          ElevatedButton(
            onPressed: scanQR,
            child: const Text('Scan QR Code'),
          ),
          SizedBox(
            width: width,
          )
        ],
      ),
    );
  }

  Future<void> scanQR() async {
    try {
      FlutterBarcodeScanner.scanBarcode('blue', "Cancle", true, ScanMode.QR)
          .then((value) {
        setState(() {
          qrString = value;
        });
      });
    } catch (e) {
      setState(() {
        qrString = 'unable to read the qr';
      });
    }
  }
}
