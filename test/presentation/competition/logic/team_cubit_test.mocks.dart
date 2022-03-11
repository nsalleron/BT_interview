// Mocks generated by Mockito 5.0.15 from annotations
// in flutball/test/presentation/competition/logic/team_cubit_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:flutball/core/params/match_request_params.dart' as _i9;
import 'package:flutball/core/params/team_request_params.dart' as _i6;
import 'package:flutball/core/resources/data_state.dart' as _i2;
import 'package:flutball/domain/entities/match.dart' as _i8;
import 'package:flutball/domain/entities/team.dart' as _i5;
import 'package:flutball/domain/usecases/get_match_usecase.dart' as _i7;
import 'package:flutball/domain/usecases/get_team_usecase.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeDataState_0<T> extends _i1.Fake implements _i2.DataState<T> {}

/// A class which mocks [GetTeamUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTeamUseCase extends _i1.Mock implements _i3.GetTeamUseCase {
  MockGetTeamUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.DataState<_i5.Team>> call(_i6.TeamRequestParams? params) =>
      (super.noSuchMethod(Invocation.method(#call, [params]),
          returnValue: Future<_i2.DataState<_i5.Team>>.value(
              _FakeDataState_0<_i5.Team>()))
      as _i4.Future<_i2.DataState<_i5.Team>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [GetMatchesUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetMatchesUseCase extends _i1.Mock implements _i7.GetMatchesUseCase {
  MockGetMatchesUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.DataState<List<_i8.Match>>> call(
      _i9.MatchRequestParams? params) =>
      (super.noSuchMethod(Invocation.method(#call, [params]),
          returnValue: Future<_i2.DataState<List<_i8.Match>>>.value(
              _FakeDataState_0<List<_i8.Match>>()))
      as _i4.Future<_i2.DataState<List<_i8.Match>>>);
  @override
  String toString() => super.toString();
}
