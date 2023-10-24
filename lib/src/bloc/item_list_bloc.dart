import 'package:flutter_bloc/flutter_bloc.dart';

import '../events/item_list_event.dart';
import '../models/item.dart';
import '../states/item_list_state.dart';
import '../views/popup_message.dart';

class ItemListBloc extends Bloc<ItemListEvent, ItemListState> {
  ItemListBloc() : super(ItemListState([])) {
    on<AddItemEvent>((event, emit) {
      final newItem = event.cosmetic;
      final updatedItems = List<Cosmetic>.from(state.items)..add(newItem);
      emit(ItemListState(updatedItems));
      showItemAddedMessage();
    });
  }
}