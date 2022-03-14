// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "app_title": MessageLookupByLibrary.simpleMessage("Flutball"),
        "club_address": MessageLookupByLibrary.simpleMessage("Address: "),
        "club_area": MessageLookupByLibrary.simpleMessage("Area: "),
        "club_email": MessageLookupByLibrary.simpleMessage("Email: "),
        "club_founded": MessageLookupByLibrary.simpleMessage("Founded: "),
        "club_name": MessageLookupByLibrary.simpleMessage("Name: "),
        "club_venue": MessageLookupByLibrary.simpleMessage("Venue: "),
        "club_website": MessageLookupByLibrary.simpleMessage("Website: "),
        "competition_country":
            MessageLookupByLibrary.simpleMessage("country: "),
        "competition_endDate":
            MessageLookupByLibrary.simpleMessage("end date:"),
        "competition_lastUpdate":
            MessageLookupByLibrary.simpleMessage("Last update: "),
        "competition_startDate":
            MessageLookupByLibrary.simpleMessage("start date:"),
        "competition_title": MessageLookupByLibrary.simpleMessage("name: "),
        "team_noWinnerYet":
            MessageLookupByLibrary.simpleMessage("No winner yet ! :("),
        "team_playerCountry":
            MessageLookupByLibrary.simpleMessage("Player country: "),
        "team_playerDateOfBirth":
            MessageLookupByLibrary.simpleMessage("Player date of birth: "),
        "team_playerName":
            MessageLookupByLibrary.simpleMessage("Player name: "),
        "team_playerNationality":
            MessageLookupByLibrary.simpleMessage("Player nationality: "),
        "team_playerPosition":
            MessageLookupByLibrary.simpleMessage("Player position: "),
        "team_playerRole":
            MessageLookupByLibrary.simpleMessage("Player role: "),
        "tech_dataFailure":
            MessageLookupByLibrary.simpleMessage("Data seem\'s to be corrumpt!")
      };
}
