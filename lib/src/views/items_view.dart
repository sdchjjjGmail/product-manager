import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/item_list_bloc.dart';
import '../models/item.dart';
import '../states/item_list_state.dart';

class BlocDynamicGridRecyclerView extends StatelessWidget {
  const BlocDynamicGridRecyclerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemListBloc, ItemListState>(
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                    ),
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      return GridItemWidget(state.items[index]);
                    },
                  ),
                )
              ],
            ),
          );
        }
    );
  }
}

class GridItemWidget extends StatelessWidget {
  final Cosmetic item;

  const GridItemWidget(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build card");
    return Card(
      child: Center(
         child: Column(
           children: [
             Text("이름: ${item.name}"),
             Text("유통기한: ${item.exprdate}")
           ],
         )
      ),
    );
  }
}

