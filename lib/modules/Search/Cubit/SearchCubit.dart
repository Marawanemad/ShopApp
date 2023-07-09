import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Network/API/DioHelper.dart';
import 'package:shopapp/Network/EndPoint.dart';
import 'package:shopapp/Network/modeles/SearchModel.dart';
import 'package:shopapp/modules/Search/Cubit/SearchState.dart';
import 'package:shopapp/widgets/components.dart';

class SearchCubit extends Cubit<SearchStates> {
  // to make intialize super cubit
  SearchCubit() : super(SearchIntialState());
// to make object from cubit use it in any place
  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? searchmodel;
  void getSearchData(String SearchText) {
    emit(SearchLoadingState());
    DioHelper.postData(
      url: SEARCH,
      token: token,
      data: {"text": SearchText},
    ).then((value) {
      searchmodel = SearchModel.fromjson(value.data);

      emit(SearchSuccessState());
    }).catchError((onError) {
      print("Error when Search ${onError.toString()}");
      emit(SearchErrorState(onError));
    });
  }
}
