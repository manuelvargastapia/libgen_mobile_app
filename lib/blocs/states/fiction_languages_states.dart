abstract class FictionLanguagesState {
  const FictionLanguagesState();
}

class FictionLanguagesInitialState extends FictionLanguagesState {
  const FictionLanguagesInitialState();
}

class FictionLanguagesLoadingState extends FictionLanguagesState {
  const FictionLanguagesLoadingState();
}

class FictionLanguagesSuccessState extends FictionLanguagesState {
  final List<String> languages;
  const FictionLanguagesSuccessState(this.languages);
}

class FictionLanguagesErrorState extends FictionLanguagesState {
  const FictionLanguagesErrorState();
}

class FictionLanguagesConnectionFailedState extends FictionLanguagesState {
  const FictionLanguagesConnectionFailedState();
}
