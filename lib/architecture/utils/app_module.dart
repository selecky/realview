abstract class AppModule {
  void registerDataSource();
  void registerRepo();
  void registerUseCase();
  void registerBloc();
  void registerScreen();
  void registerNavigation();
  void registerDI();

  void registerDependencies() {
    registerDataSource();
    registerRepo();
    registerNavigation();
    registerUseCase();
    registerBloc();
    registerScreen();
    registerDI();
  }
}
