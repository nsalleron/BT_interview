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

class I18n {
  I18n();

  static I18n? _current;

  static I18n get current {
    assert(_current != null,
        'No instance of I18n was loaded. Try to initialize the I18n delegate before accessing I18n.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<I18n> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = I18n();
      I18n._current = instance;

      return instance;
    });
  }

  static I18n of(BuildContext context) {
    final instance = I18n.maybeOf(context);
    assert(instance != null,
        'No instance of I18n present in the widget tree. Did you add I18n.delegate in localizationsDelegates?');
    return instance!;
  }

  static I18n? maybeOf(BuildContext context) {
    return Localizations.of<I18n>(context, I18n);
  }

  /// `Flutball`
  String get app_title {
    return Intl.message(
      'Flutball',
      name: 'app_title',
      desc: '',
      args: [],
    );
  }

  /// `name: `
  String get competition_title {
    return Intl.message(
      'name: ',
      name: 'competition_title',
      desc: '',
      args: [],
    );
  }

  /// `country: `
  String get competition_country {
    return Intl.message(
      'country: ',
      name: 'competition_country',
      desc: '',
      args: [],
    );
  }

  /// `start date:`
  String get competition_startDate {
    return Intl.message(
      'start date:',
      name: 'competition_startDate',
      desc: '',
      args: [],
    );
  }

  /// `end date:`
  String get competition_endDate {
    return Intl.message(
      'end date:',
      name: 'competition_endDate',
      desc: '',
      args: [],
    );
  }

  /// `Last update: `
  String get competition_lastUpdate {
    return Intl.message(
      'Last update: ',
      name: 'competition_lastUpdate',
      desc: '',
      args: [],
    );
  }

  /// `Area: `
  String get club_area {
    return Intl.message(
      'Area: ',
      name: 'club_area',
      desc: '',
      args: [],
    );
  }

  /// `Address: `
  String get club_address {
    return Intl.message(
      'Address: ',
      name: 'club_address',
      desc: '',
      args: [],
    );
  }

  /// `Website: `
  String get club_website {
    return Intl.message(
      'Website: ',
      name: 'club_website',
      desc: '',
      args: [],
    );
  }

  /// `Email: `
  String get club_email {
    return Intl.message(
      'Email: ',
      name: 'club_email',
      desc: '',
      args: [],
    );
  }

  /// `Founded: `
  String get club_founded {
    return Intl.message(
      'Founded: ',
      name: 'club_founded',
      desc: '',
      args: [],
    );
  }

  /// `Venue: `
  String get club_venue {
    return Intl.message(
      'Venue: ',
      name: 'club_venue',
      desc: '',
      args: [],
    );
  }

  /// `No winner yet ! :(`
  String get team_noWinnerYet {
    return Intl.message(
      'No winner yet ! :(',
      name: 'team_noWinnerYet',
      desc: '',
      args: [],
    );
  }

  /// `Player role: `
  String get team_playerRole {
    return Intl.message(
      'Player role: ',
      name: 'team_playerRole',
      desc: '',
      args: [],
    );
  }

  /// `Player nationality: `
  String get team_playerNationality {
    return Intl.message(
      'Player nationality: ',
      name: 'team_playerNationality',
      desc: '',
      args: [],
    );
  }

  /// `Player country: `
  String get team_playerCountry {
    return Intl.message(
      'Player country: ',
      name: 'team_playerCountry',
      desc: '',
      args: [],
    );
  }

  /// `Player date of birth: `
  String get team_playerDateOfBirth {
    return Intl.message(
      'Player date of birth: ',
      name: 'team_playerDateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Player position: `
  String get team_playerPosition {
    return Intl.message(
      'Player position: ',
      name: 'team_playerPosition',
      desc: '',
      args: [],
    );
  }

  /// `Player name: `
  String get team_playerName {
    return Intl.message(
      'Player name: ',
      name: 'team_playerName',
      desc: '',
      args: [],
    );
  }

  /// `Data seem's to be corrumpt!`
  String get tech_dataFailure {
    return Intl.message(
      'Data seem\'s to be corrumpt!',
      name: 'tech_dataFailure',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<I18n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<I18n> load(Locale locale) => I18n.load(locale);
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
