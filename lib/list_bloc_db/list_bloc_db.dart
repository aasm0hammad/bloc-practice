import 'package:bloc_practice/db/db_helper.dart';
import 'package:bloc_practice/list_bloc_db/list_bloc_event.dart';
import 'package:bloc_practice/list_bloc_db/list_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListBlocDB extends Bloc<ListBlocEventDB,ListBlocStateDb>{
  DbHelper dbHelper;
  ListBlocDB({required this.dbHelper}): super(ListBlocStateDb(mData: [])){

    on<AddListItem>((event,emit)async{

     bool check=await dbHelper.addListItem(title: event.title, desc: event.desc);
     if(check) {
       List<Map<String, dynamic>> all=await dbHelper.fetch();
       emit(ListBlocStateDb(mData: all));
     }
     


    });

    on<Initial>((event,emit)async{

      List<Map<String, dynamic>> all=await dbHelper.fetch();
      emit(ListBlocStateDb(mData: all));
    });
    on<UpdateListItem>((event,emit)async{

      bool check=await dbHelper.updateListItem(title: event.title, desc: event.desc, id: event.id);

      if(check){
        List<Map<String,dynamic>> all=await dbHelper.fetch();

        emit(ListBlocStateDb(mData: all));
      }

    });
    on<DeleteLitsItem>((event,emit)async{
      bool check=await dbHelper.delete(id: event.id);
      if(check){

        List<Map<String,dynamic>> all=await dbHelper.fetch();
        emit(ListBlocStateDb(mData: all));


      }

    });




  }



}