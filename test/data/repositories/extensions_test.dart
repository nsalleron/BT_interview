import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutball/data/models/responses/competition_response_model.dart';
import 'package:flutball/data/repositories/extensions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:retrofit/dio.dart';

import '../../fixtures/competition_response_fixtures.dart';
import 'extensions_test.mocks.dart';

@GenerateMocks([RequestOptions])
void main() {
  final RequestOptions requestOptions = MockRequestOptions();

  group('extension tests', () {
    test('''
    GIVEN competitionResponseModel and ${HttpStatus.ok} 
    WHEN use when on httpResponse
    THEN should have competitions results 
    ''', () async {
      //Given
      final CompetitionResponseModel competitionResponseModel =
          competitionResponseModelFixture();
      final httpResponse = HttpResponse<CompetitionResponseModel>(
        competitionResponseModel,
        Response<RequestOptions>(
          requestOptions: requestOptions,
          statusCode: HttpStatus.ok,
        ),
      );

      //when
      final result = httpResponse
          .whenSuccessOrDefaultError((response) => response.competitions);

      //Then
      expect(result.data, competitionResponseModel.competitions);
    });

    test('''
    GIVEN competitionResponseModel and ${HttpStatus.badGateway} 
    WHEN use when on httpResponse
    THEN should have not empty error and empty result
    ''', () async {
      //Given
      final httpResponse = HttpResponse<CompetitionResponseModel?>(
        null,
        Response<RequestOptions>(
          requestOptions: requestOptions,
          statusCode: HttpStatus.badGateway,
        ),
      );

      //when
      final result = httpResponse
          .whenSuccessOrDefaultError((response) => response.competitions);

      //Then
      expect(result.data, null);
      expect(result.error, isNotNull);
    });
  });
}
