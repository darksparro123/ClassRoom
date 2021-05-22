import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class PdfViewScreen extends StatefulWidget {
  @override
  _PdfViewScreenState createState() => _PdfViewScreenState();
}

class _PdfViewScreenState extends State<PdfViewScreen> {
  PDFDocument _doc;
  bool _loading = true;
  Future<bool> _initPdf() async {
    try {
      String url =
          "https://firebasestorage.googleapis.com/v0/b/marioblog-ad8e5.appspot.com/o/Student%20List%20-%20Batch%2004.pdf?alt=media&token=9e833bbd-1129-4ae3-9952-db98779bee5d";
      final doc = await PDFDocument.fromURL(url);
      setState(() {
        _doc = doc;
        _loading = false;
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  void initState() {
    _initPdf();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("PDF Viewer"),
        ),
        body: _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : PDFViewer(
                document: _doc,
                indicatorBackground: Colors.indigo,
              ));
  }
}
