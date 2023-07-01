import 'package:doctor_fy/core/helpers/extensions/context_extensions.dart';
import 'package:doctor_fy/core/routes/router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:doctor_fy/core/themes/themes.dart';
import 'package:doctor_fy/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:doctor_fy/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, _) {
          return GlobalLoaderOverlay(
            overlayColor: Colors.black,
            overlayOpacity: 0.5,
            useDefaultLoading: false,
            switchInCurve: Curves.bounceIn,
            switchOutCurve: Curves.bounceOut,
            overlayWidget: Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: context.theme.colorScheme.surface,
                size: 50.sp,
              ),
            ),
            child: MaterialApp.router(
              title: 'Doctorfy',
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              routerConfig: router,
            ),
          );
        },
      ),
    );
  }
}
