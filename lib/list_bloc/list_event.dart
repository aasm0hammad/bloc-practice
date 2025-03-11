abstract class ListEvent {}

/// Add Item Event

class AddItemList extends ListEvent {
  Map<String, dynamic> newValue;

  AddItemList({required this.newValue});
}

/// Update Item Event
class UpdateItemList extends ListEvent {
  int index;
  Map<String, dynamic> updateValue;

  UpdateItemList({required this.updateValue, required this.index});
}

/// Delete Item Event
class DeleteItemList extends ListEvent {
  int index;
  DeleteItemList({required this.index});
}
