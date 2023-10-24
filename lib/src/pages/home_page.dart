import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/item_list_bloc.dart';
import '../views/items_view.dart';
import 'barcode_scan_page.dart';
import 'item_add_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ItemListBloc>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('홈 화면', style: TextStyle(color: Colors.white)),
      ),
      body: const BlocDynamicGridRecyclerView(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) {
                return AlertDialog(
                  actionsAlignment: MainAxisAlignment.center,
                  actions: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.of(context).push(
                                  MaterialPageRoute<ItemInputPage>(
                                      builder: (context) {
                                        return BlocProvider.value(
                                            value: bloc,
                                            child: const BarcodeScanPage(
                                              title: '제품의 바코드를 스캔하세요.',)
                                        );
                                      }
                                  )
                              );
                            },
                            child: const Text(
                              '바코드로 추가하기',
                              style: TextStyle(color: Colors.black),
                            )
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.of(context).push(
                                  MaterialPageRoute<ItemInputPage>(
                                      builder: (context) {
                                        return BlocProvider.value(
                                          value: bloc,
                                          child: const ItemInputPage(),
                                        );
                                      }
                                  )
                              );
                            },
                            child: const Text(
                              '직접 입력하기',
                              style: TextStyle(color: Colors.black),
                            )
                        )
                      ],
                    )
                  ],
                );
              },
            );
          },
          child: const Text('+', style: TextStyle(fontSize: 30))
      ),
    );
  }
}
