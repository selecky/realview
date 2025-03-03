import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:realview/architecture/app.dart';
import 'package:realview/features/dark_mode/presentation/blocs/dark_mode_bloc.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkModeBloc, DarkModeState>(
      builder: (context, state) {
        return App.isDarkMode
            ? SvgPicture.asset('assets/images/app_logo_white.svg')
            : SvgPicture.asset('assets/images/app_logo_black.svg');
      },
    );
  }
}
