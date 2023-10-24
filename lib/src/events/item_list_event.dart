import '../models/item.dart';

abstract class ItemListEvent {}

class AddItemEvent extends ItemListEvent {
  AddItemEvent(this.cosmetic);
  final Cosmetic cosmetic;
}