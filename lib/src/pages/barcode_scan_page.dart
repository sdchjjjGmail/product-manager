import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';

import '../bloc/item_list_bloc.dart';
import '../events/item_list_event.dart';
import '../models/item.dart';
import '../states/item_list_state.dart';

class BarcodeScanPage extends StatefulWidget {
  const BarcodeScanPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  BarcodeScanPageState createState() => BarcodeScanPageState();
}

class BarcodeScanPageState extends State<BarcodeScanPage> {
  String? _qrInfo = '스캔하세요';

  @override
  void initState() {
    super.initState();
    _init();
  }

  /// 초기화 함수
  _init() async {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// QR/Bar Code 스캔 성공시 호출
  _qrCallback(String? code) {
    if (_qrInfo != code) {
      setState(() {
        _qrInfo = code;
      });
      context
          .read<ItemListBloc>()
          .add(AddItemEvent(Cosmetic(code.toString(), "20251010")));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemListBloc, ItemListState>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: Text(widget.title!),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 500,
                    width: 500,
                    child: QRBarScannerCamera(
                      // 에러 발생시..
                      onError: (context, error) =>
                          Text(
                            error.toString(),
                            style: const TextStyle(color: Colors.red),
                          ),
                      // QR 이 읽혔을 경우
                      qrCodeCallback: (code) {
                        _qrCallback(code);
                      },
                    ),
                  ),

                  /// 사이즈 자동 조절을 위해 FittedBox 사용
                  FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        _qrInfo!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              )
          );
        }
    );
  }
}
