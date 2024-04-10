import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as firebase;
import 'package:flutter/material.dart';
import 'package:flutter_firebase_full_news_app/feature/auth/authentication_provider.dart';
import 'package:flutter_firebase_full_news_app/product/constants/index.dart';
import 'package:flutter_firebase_full_news_app/product/widget/text/sub_titleText.dart';
import 'package:flutter_firebase_full_news_app/product/widget/text/title_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

class AuthenticationView extends ConsumerStatefulWidget {
  const AuthenticationView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends ConsumerState<AuthenticationView> {
  final authProvider = StateNotifierProvider<AuthenticationNotifier, AuthenticationState>((ref) {
    return AuthenticationNotifier();
  });

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkUser(FirebaseAuth.instance.currentUser);
  }

  void checkUser(User? user) {
    ref.read(authProvider.notifier).fetchUserDetail(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: firebase.FirebaseUIActions(
        actions: [
          firebase.AuthStateChangeAction<firebase.SignedIn>((context, state) {
            if (state.user != null) checkUser(state.user);
          }),
        ],
        child: SafeArea(
          child: Padding(
            padding: context.padding.low,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const _Header(),
                  Padding(
                    padding: context.padding.normal,
                    child: firebase.LoginView(
                      action: firebase.AuthAction.signIn,
                      footerBuilder: (context, action) {
                        return const Text('data');
                      },
                      showTitle: false,
                      subtitleBuilder: (context, action) {
                        return const Text('Data');
                      },
                      providers: firebase.FirebaseUIAuth.providersFor(FirebaseAuth.instance.app),
                    ),
                  ),
                  if (ref.watch(authProvider).isRedirect)
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        StringConstants.continueToApp,
                        style: context.general.textTheme.bodySmall?.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleText(
          text: StringConstants.loginwelcomeBack,
        ),
        Padding(
          padding: context.padding.onlyTopLow,
          child: const SubTitleText(
            text: StringConstants.loginWelcomeDetail,
          ),
        ),
      ],
    );
  }
}
