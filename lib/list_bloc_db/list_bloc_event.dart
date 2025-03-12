import 'package:bloc_practice/list_bloc/list_event.dart';

abstract class ListBlocEventDB {}

class AddListItem extends ListBlocEventDB {
  String title;
  String desc;

  AddListItem({required this.title, required this.desc});
}

class Initial extends ListBlocEventDB {}

class UpdateListItem extends ListBlocEventDB {
  String title;
  String desc;
  int id;

  UpdateListItem({required this.title, required this.desc, required this.id});
}

class DeleteLitsItem extends ListBlocEventDB{

  int id;

  DeleteLitsItem({required this.id});

}
