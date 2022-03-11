abstract class news_States {}

  class newsInitialState extends news_States{}

  class newsBottomNavState extends news_States{}

  class newsGetBusinessLoadingState extends news_States{}

  class newsGetBusinessSuccessState extends news_States{}

  class newsGetBusinessErrorState extends news_States{
  final String error;
  newsGetBusinessErrorState(this.error);
  }

  class newsGetScienceLoadingState extends news_States{}

  class newsGetScienceSuccessState extends news_States{}

  class newsGetScienceErrorState extends news_States{
  final String error;
  newsGetScienceErrorState(this.error);
}

  class newsGetSportsLoadingState extends news_States{}

  class newsGetSportsSuccessState extends news_States{}

  class newsGetSportsErrorState extends news_States{
  final String error;
  newsGetSportsErrorState(this.error);
  }
  class newsChangeModeState extends news_States{}
  class newsGetSearchLoadingState extends news_States{}

  class newsGetSearchSuccessState extends news_States{}

  class newsGetSearchErrorState extends news_States{
  final String error;
  newsGetSearchErrorState(this.error);
  }









