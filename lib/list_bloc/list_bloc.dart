import 'package:bloc_practice/list_bloc/list_event.dart';
import 'package:bloc_practice/list_bloc/list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc() : super(ListState(mData: [])) {
    /// Add List Item
    on<AddItemList>((event, emit) {
      List<Map<String, dynamic>> currentItem = state.mData;
      currentItem.add(event.newValue);
      emit(ListState(mData: currentItem));
      //emit(ListState(mData: state.mData..add(event.mList)));
    });

    /// Update List Item
    on<UpdateItemList>((event, emit) {
      List<Map<String, dynamic>> updatedItem = state.mData;

      updatedItem[event.index] = event.updateValue;
      emit(ListState(mData: updatedItem));
    });

    /// Delete List Item
    on<DeleteItemList>((event, emit) {
      List<Map<String, dynamic>> allItem = state.mData;

      state.mData.removeAt(event.index);
      emit(ListState(mData: allItem));
    });
  }
}
