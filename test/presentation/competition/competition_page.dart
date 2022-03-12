import 'package:flutball/core/params/competition_request_params.dart';
import 'package:flutball/core/params/match_request_params.dart';
import 'package:flutball/core/resources/data_state.dart';
import 'package:flutball/domain/entities/helpers/types_helper.dart';
import 'package:flutball/domain/usecases/get_competitions_usecase.dart';
import 'package:flutball/domain/usecases/get_match_usecase.dart';
import 'package:flutball/domain/usecases/get_team_usecase.dart';
import 'package:flutball/presentation/competition/competition_page.dart';
import 'package:flutball/presentation/competition/logic/competition_cubit.dart';
import 'package:flutball/presentation/competition/logic/team_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/competition_fixtures.dart';
import 'competition_page.mocks.dart';

typedef WidgetProvider = Widget Function();

@GenerateMocks([GetCompetitionUseCase, GetTeamUseCase, GetMatchesUseCase])
void main() {
  final GetCompetitionUseCase getCompetitionUseCase =
      MockGetCompetitionUseCase();
  final GetTeamUseCase getTeamUseCase = MockGetTeamUseCase();
  final GetMatchesUseCase getMatchesUseCase = MockGetMatchesUseCase();
  const CompetitionsRequestParams competitionsRequestParams =
      CompetitionsRequestParams();

  setUp(() {
    when(getCompetitionUseCase(competitionsRequestParams)).thenAnswer(
      (_) async => DataSuccess<Competitions?>([competitionFixture()]),
    );
    when(
      getMatchesUseCase(
        const MatchRequestParams(competitionId: 1),
      ),
    ).thenAnswer((_) async => DataSuccess<Matches>([]));
  });

  screenTestGolden(
    screenName: '$TeamPage',
    tag: '$TeamPage',
    showSemanticsDebugger: true,
    builder: () => MultiBlocProvider(
      providers: [
        BlocProvider<CompetitionCubit>(
          create: (_) => CompetitionCubit(
            getCompetitionUseCase: getCompetitionUseCase,
          )..fetchCompetitions(params: competitionsRequestParams),
        ),
        BlocProvider<TeamCubit>(
          create: (_) => TeamCubit(
            getTeamUseCase: getTeamUseCase,
            getMatchesUseCase: getMatchesUseCase,
          ),
        ),
      ],
      child: const TeamPage(),
    ),
  );
}

void screenTestGolden({
  required String screenName,
  required String tag,
  required WidgetProvider builder,
  bool showSemanticsDebugger = true,
}) {
  testGoldens('Test Golden on $screenName', (WidgetTester tester) async {
    final child = builder.call();
    await loadAppFonts();

    await tester.pumpWidgetBuilder(
      MaterialGolden(
        key: Key(tag),
        child: child,
      ),
      wrapper: materialAppWrapper(
        platform: TargetPlatform.android,
      ),
    );

    final List<Device> devices = [
      Device.iphone11,
      Device.tabletLandscape,
      Device.phone.copyWith(name: 'a11y', textScale: 2)
    ];

    await multiScreenGolden(
      tester,
      tag,
      devices: devices,
      autoHeight: true,
      finder: find.byKey(Key(tag)),
    );

    if (showSemanticsDebugger) {
      /*await tester.pumpWidgetBuilder(
        SemanticsDebugger(
          labelStyle: const TextStyle(
            color: Color(0xFF000000),
            fontSize: 10.0,
            height: 0.8,
          ),
          child: child,
        ),
      );
      await multiScreenGolden(tester, tag,
          devices: [Device.phone.copyWith(name: 'semantic')], autoHeight: true,
          finder: find.byKey(Key(tag)));*/
    }
  });
}

class MaterialGolden extends StatelessWidget {
  const MaterialGolden({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Golden tests',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      themeMode: ThemeMode.light,
      theme: ThemeData(
        platform: TargetPlatform.android,
        primarySwatch: Colors.blue,
      ),
      locale: const Locale('en'),
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
      home: child,
    );
  }
}

final a11yScreen = Device.phone.copyWith(name: 'a11y', textScale: 2);
