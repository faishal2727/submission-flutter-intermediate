import 'package:berbagi_app/data/datasources/local/auth_local_datasource.dart';
import 'package:berbagi_app/presentation/features/auth/screen/login_page.dart';
import 'package:berbagi_app/presentation/features/auth/screen/register_page.dart';
import 'package:berbagi_app/presentation/features/auth/screen/splash_page.dart';
import 'package:berbagi_app/presentation/features/story/provider/story_provider.dart';
import 'package:berbagi_app/presentation/features/story/screen/detail_page.dart';
import 'package:berbagi_app/presentation/features/story/screen/home_page.dart';
import 'package:berbagi_app/presentation/features/story/screen/post_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyRouterDelagate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  late final GlobalKey<NavigatorState> _navigatorKey;
  final AuthLocalDatasource authLocalKnt;
  List<Page> historyStack = [];
  bool? isLoggedIn;
  bool isRegister = false;
  String? selectedStory;
  bool? add;

  MyRouterDelagate(this.authLocalKnt)
      : _navigatorKey = GlobalKey<NavigatorState>() {
    _init();
  }
  _init() async {
    isLoggedIn = await authLocalKnt.isLoggedIn();
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoggedIn == null) {
      historyStack = _splashStack;
    } else if (isLoggedIn == true) {
      historyStack = _loggedInStack;
    } else {
      historyStack = _loggedOutStack;
    }
    return Navigator(
      key: navigatorKey,
      pages: historyStack,
      onPopPage: (route, result) {
        final didPop = route.didPop(result);
        if (!didPop) {
          return false;
        }

        selectedStory = null;
        notifyListeners();

        add = null;
        notifyListeners();

        isRegister = false;
        notifyListeners();
        return true;
      },
    );
  }

  List<Page> get _splashStack => const [
        MaterialPage(
          key: ValueKey("SplashPage"),
          child: SplashPage(),
        ),
      ];

  List<Page> get _loggedOutStack => [
        MaterialPage(
          key: const ValueKey("LoginPage"),
          child: LoginPage(
            onLogin: () {
              isLoggedIn = true;
              notifyListeners();
            },
            onRegister: () {
              isRegister = true;
              notifyListeners();
            },
          ),
        ),
        if (isRegister == true)
          MaterialPage(
            key: const ValueKey("RegisterPage"),
            child: RegisterPage(
              onRegister: () {
                isRegister = false;
                notifyListeners();
              },
              onLogin: () {
                isRegister = false;
                notifyListeners();
              },
            ),
          ),
      ];

  List<Page> get _loggedInStack => [
        MaterialPage(
          key: const ValueKey("HomePage"),
          child: HomePage(
            onLogout: () {
              isLoggedIn = false;
              notifyListeners();
            },
            onAdd: () {
              add = true;
              notifyListeners();
            },
            storyId: (String storyId) {
              selectedStory = storyId;
              notifyListeners();
            },
          ),
        ),
        if (selectedStory != null)
          MaterialPage(
            key: ValueKey("DetailPage-$selectedStory"),
            child: DetailPage(
              storyId: selectedStory ?? "",
            ),
          ),
        if (add != null)
          MaterialPage(
            key: const ValueKey("PostPage"),
            child: PostPage(
              onHome: (context) {
                add = null;
                notifyListeners();
                context.read<StoryProvider>().reload();
              },
            ),
          ),
      ];

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(configuration) {
    throw UnimplementedError();
  }
}
