import 'package:berbagi_app/data/datasources/local/auth_local_datasource.dart';
import 'package:berbagi_app/data/datasources/remote/auth_remote_datasource.dart';
import 'package:berbagi_app/data/datasources/remote/story_remote_datasource.dart';
import 'package:berbagi_app/presentation/features/auth/provider/auth_provider.dart';
import 'package:berbagi_app/presentation/features/story/provider/image_handler_provider.dart';
import 'package:berbagi_app/presentation/features/story/provider/post_provider.dart';
import 'package:berbagi_app/presentation/features/story/provider/story_provider.dart';
import 'package:berbagi_app/routes/router_delegate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late MyRouterDelagate myRouterDelagate;
  late AuthLocalDatasource authLocalDatasource;
  late AuthRemoteDatasource authRemoteDatasource;
  late AuthProvider authProvider;
  late StoryProvider storyProvider;
  late StoryDatasource storyDatasource;
  late ImageHandlerProvider imageHandlerProvider;
  late PostProvider postProvider;


  @override
  void initState() {
    super.initState();
    authLocalDatasource = AuthLocalDatasource();
    myRouterDelagate = MyRouterDelagate(authLocalDatasource);
    authRemoteDatasource = AuthRemoteDatasource();
    authProvider = AuthProvider(
      authLocalDatasource: authLocalDatasource,
      authRemoteDatasource: authRemoteDatasource,
    );
    storyDatasource = StoryDatasource();
    storyProvider = StoryProvider(storyDatasource: StoryDatasource());
    imageHandlerProvider = ImageHandlerProvider();
    postProvider = PostProvider(storyDatasource: storyDatasource);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => authProvider),
        ChangeNotifierProvider(create:(context) => storyProvider),
        ChangeNotifierProvider(create: (create) => imageHandlerProvider),
        ChangeNotifierProvider(create: (create) => postProvider),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Router(
          routerDelegate: myRouterDelagate,
          backButtonDispatcher: RootBackButtonDispatcher(),
        ),
      ),
    );
  }
}
