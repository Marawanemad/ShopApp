abstract class SearchStates {}

class SearchIntialState extends SearchStates {}

class SearchLoadingState extends SearchStates {}

class SearchSuccessState extends SearchStates {}

class SearchErrorState extends SearchStates {
  final String error;
  SearchErrorState(this.error);
}

class changeSearchFavState extends SearchStates {}
