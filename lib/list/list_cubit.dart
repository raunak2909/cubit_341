import 'package:cubit_341/list/list_state.dart';
import 'package:cubit_341/model/list_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCubit extends Cubit<ListState> {
  ListCubit() : super(ListState(mData: []));

  ///events
  addNote({required String title, required String desc}) {
    var currentStateValue = state.mData;
    currentStateValue.add(ListModel(title: title, desc: desc));
    emit(ListState(mData: currentStateValue));
  }

  updateNote({required String updatedTitle, required String updatedDesc, required int index}) {

    var currentStateValue = state.mData;

    currentStateValue[index] = ListModel(title: updatedTitle, desc: updatedDesc);

    emit(ListState(mData: currentStateValue));
  }

  removeNote({required int index}){
    var currentStateValue = state.mData;

    currentStateValue.removeAt(index);

    emit(ListState(mData: currentStateValue));
  }

}
