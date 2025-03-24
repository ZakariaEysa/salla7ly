// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome to  Salla7ly !`
  String get welcomeToSalla7ly {
    return Intl.message(
      'Welcome to  Salla7ly !',
      name: 'welcomeToSalla7ly',
      desc: '',
      args: [],
    );
  }

  /// `Connect easily with skilled craftsmen and get personalized service recommendations tailored to your needs.`
  String get on1Content {
    return Intl.message(
      'Connect easily with skilled craftsmen and get personalized service recommendations tailored to your needs.',
      name: 'on1Content',
      desc: '',
      args: [],
    );
  }

  /// ` We connect you with expert craftsmen delivering top-quality service with professionalism and care.`
  String get on2Content {
    return Intl.message(
      ' We connect you with expert craftsmen delivering top-quality service with professionalism and care.',
      name: 'on2Content',
      desc: '',
      args: [],
    );
  }

  /// `Craftsmen can discover job opportunities effortlessly, while users  can post their needs and connect with  skilled professionals. `
  String get on3Content {
    return Intl.message(
      'Craftsmen can discover job opportunities effortlessly, while users  can post their needs and connect with  skilled professionals. ',
      name: 'on3Content',
      desc: '',
      args: [],
    );
  }

  /// `Skilled Hands, Trusted Service!`
  String get on2Title {
    return Intl.message(
      'Skilled Hands, Trusted Service!',
      name: 'on2Title',
      desc: '',
      args: [],
    );
  }

  /// `Find Work Easily, Get the Right Help!`
  String get on3Title {
    return Intl.message(
      'Find Work Easily, Get the Right Help!',
      name: 'on3Title',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get Next {
    return Intl.message(
      'Next',
      name: 'Next',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get Skip {
    return Intl.message(
      'Skip',
      name: 'Skip',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get Start {
    return Intl.message(
      'Start',
      name: 'Start',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
