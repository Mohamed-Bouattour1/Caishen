import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class pdfview extends StatefulWidget {
  File file;
   pdfview({super.key, required this.file});

  @override
  State<pdfview> createState() => _pdfviewState();
}

class _pdfviewState extends State<pdfview> {
  @override
  Widget build(BuildContext context) {
    late PDFViewController pdfViewController;
    return  PDFView(
       filePath: widget.file.path,
        autoSpacing: true,
        enableSwipe: true,
        pageSnap: true,
        swipeHorizontal: true,
        onError: (error) {
          print(error);
        },
        onPageError: (page, error) {
          print('$page: ${error.toString()}');
        },
        onViewCreated: (PDFViewController vc) {
          pdfViewController = vc;
        },
    );
  }
}