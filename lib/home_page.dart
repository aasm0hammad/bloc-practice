import 'package:bloc_practice/list_bloc/list_bloc.dart';
import 'package:bloc_practice/list_bloc/list_event.dart';
import 'package:bloc_practice/list_bloc_db/list_bloc_db.dart';
import 'package:bloc_practice/list_bloc_db/list_bloc_event.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'list_bloc/list_state.dart';
import 'list_bloc_db/list_bloc_state.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState

    context.read<ListBlocDB>().add(Initial());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: BlocBuilder<ListBlocDB, ListBlocStateDb>(builder: (ctx, state) {
        return ListView.builder(
            itemCount: state.mData.length,
            itemBuilder: (context, index) {
              return InkWell(
                onLongPress: () {
                  context.read<ListBlocDB>().add(UpdateListItem(
                      title: "Aas",
                      desc: 'Flutter Developer',
                      id: state.mData[index]['id']));
                },
                onTap: () {
                  context
                      .read<ListBlocDB>()
                      .add(DeleteLitsItem(id: state.mData[index]['id']));
                },
                child: ListTile(
                  title: Text(
                      context.watch<ListBlocDB>().state.mData[index]['title']),
                  subtitle: Text(
                      context.watch<ListBlocDB>().state.mData[index]['des']),
                ),
              );
            });
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context
              .read<ListBlocDB>()
              .add(AddListItem(title: "title", desc: "des"));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
