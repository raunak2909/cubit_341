import 'package:cubit_341/list/list_cubit.dart';
import 'package:cubit_341/list/list_state.dart';
import 'package:cubit_341/model/list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListPage extends StatelessWidget {
  List<ListModel> mNotes = [];

  @override
  Widget build(BuildContext context) {
    print("build called!!");

    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: BlocBuilder<ListCubit, ListState>(builder: (ctx, state){
        mNotes = state.mData;
        print("bloc builder called!!");
        return mNotes.isNotEmpty
            ? ListView.builder(
            itemCount: mNotes.length,
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(mNotes[index].title),
                subtitle: Text(mNotes[index].desc),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            context.read<ListCubit>().updateNote(
                                updatedTitle: "Update Title",
                                updatedDesc: "The content is updated!!",
                                index: index);
                          },
                          icon: Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            context.read<ListCubit>().removeNote(index: index);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                    ],
                  ),
                ),
              );
            })
            : Center(
          child: Text('No Notes yet!!'),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ListCubit>().addNote(title: "NewNote", desc: "My Desc");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
