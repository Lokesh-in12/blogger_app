import 'package:blogger_app/src/views/screens/createBlogscreen/create_blog_screen.dart';
import 'package:blogger_app/src/views/screens/homescreen/home_screen.dart';
import 'package:blogger_app/src/views/screens/profilescreen/profile_screen.dart';
import 'package:blogger_app/src/views/screens/singleblog/single_blog.dart';
import 'package:blogger_app/src/views/screens/welcomeScreen/signinScreen/sign_in_screen.dart';
import 'package:blogger_app/src/views/screens/welcomeScreen/signupScreen/sign_up_screen.dart';
import 'package:blogger_app/src/views/screens/welcomeScreen/welcome_screen.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'app_route_constants.dart';
import 'package:go_router/go_router.dart';

class MyAppRouterConfig {
  static GoRouter returnRouter(bool isLoggedIn, GoogleSignInAccount? account) {
    print("fsfesfef=>> $isLoggedIn");
    GoRouter router = GoRouter(
        initialLocation: '/signIn',
        // initialLocation: '/createBlog/:id',
        // initialLocation: '/welcomePage',
        redirect: (context, state) async {
          if (isLoggedIn && state.location.startsWith('/signIn')) {
            return '/';
          } else {
            return null;
          }
        },
        routes: [
          GoRoute(
              path: '/',
              name: AppRouteConsts.home,
              builder: (context, state) => HomeScreen(),
              routes: [
                GoRoute(
                  path: 'blog/:id',
                  name: AppRouteConsts.singleBlog,
                  builder: (context, state) =>
                      SingleBlogPage(id: state.params['id']!),
                ),
                GoRoute(
                  path: 'profile/:id',
                  name: AppRouteConsts.profile,
                  builder: (context, state) =>
                      ProfileScreen(id: state.params['id']!),
                ),
                GoRoute(
                  path: 'createBlog/:id',
                  name: AppRouteConsts.createBlog,
                  builder: (context, state) =>
                      CreateBlogScreen(id: state.params['id']!),
                ),
              ]),
          GoRoute(
            path: '/welcomePage',
            name: AppRouteConsts.welcomePage,
            builder: (context, state) => WelcomeScreen(),
          ),
          GoRoute(
            path: '/signIn',
            name: AppRouteConsts.signIn,
            builder: (context, state) => SignInScreen(),
          ),
          GoRoute(
            path: '/signUp',
            name: AppRouteConsts.signUp,
            builder: (context, state) => SignUpScreen(),
          ),
        ]);
    return router;
  }
}
