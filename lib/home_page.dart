import 'package:bloc_practice/list_bloc/list_bloc.dart';
import 'package:bloc_practice/list_bloc/list_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'list_bloc/list_state.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: BlocBuilder<ListBloc, ListState>(builder: (ctx, state) {
        return ListView.builder(
            itemCount: state.mData.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  context.read<ListBloc>().add(UpdateItemList(updateValue: {
                        'name': 'Aas45 WebTech1',
                        'desc': 'Flutter Developer'
                      }, index: index));
                },
                onLongPress: () {
                  context.read<ListBloc>().add(DeleteItemList(index: index));
                },
                child: ListTile(
                  title: Text(
                      context.watch<ListBloc>().state.mData[index]['name']),
                  subtitle: Text(
                      context.watch<ListBloc>().state.mData[index]['desc']),
                ),
              );
            });
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ListBloc>().add(AddItemList(
              newValue: {'name': 'Aas WebTech', 'desc': 'Flutter Developer'}));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
