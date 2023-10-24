import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/item_list_bloc.dart';
import '../events/item_list_event.dart';
import '../models/item.dart';
import '../states/item_list_state.dart';

class ItemInputPage extends StatelessWidget {
  const ItemInputPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _ItemInfoCard();
  }
}

class _ItemInfoCard extends StatefulWidget {
  const _ItemInfoCard({Key? key}) : super(key: key);

  @override
  _ItemInfoInput createState() => _ItemInfoInput();
}

class _ItemInfoInput extends State<_ItemInfoCard> {
  _ItemInfoInput();

  String inputName = '';
  String expirationDate = '';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemListBloc, ItemListState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: true,
                  title: const Text('정보를 입력하세요.'),
                ),
                body: Container(
                  margin: const EdgeInsets.all(10),
                  child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextField(
                                  decoration: const InputDecoration(
                                    labelText: '이름',
                                    labelStyle: TextStyle(
                                        color: Colors.blueGrey),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.blueGrey),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))
                                    ),
                                  ),
                                  onChanged: (name) {
                                    setState(() {
                                      inputName = name;
                                    });
                                  },
                                ),
                                const SizedBox(height: 15,),
                                TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    labelText: '유통기한',
                                    labelStyle: TextStyle(
                                        color: Colors.blueGrey),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.blueGrey),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))
                                    ),
                                  ),
                                  onChanged: (date) {
                                    setState(() {
                                      expirationDate = date;
                                    });
                                  },
                                )
                              ],
                            ),
                            ElevatedButton(
                              child: const Text('추가하기'),
                              onPressed: () {
                                context.read<ItemListBloc>().add(AddItemEvent(Cosmetic(
                                  inputName,
                                  expirationDate.toString(),
                                )));
                                Navigator.pop(context);
                              },
                            )
                          ]
                      )
                  ),
                )
            ),
          );
        }
    );
  }
}