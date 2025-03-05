import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:realview/architecture/app.dart';
import 'package:realview/features/home/presentation/blocs/home_bloc.dart';
import 'package:realview/generic/strings.dart';
import 'package:realview/generic/widgets/app_screen.dart';

final _log = Logger('home_screen');

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScreen(
      title: Strings.screen_title_home.tr(),
      hasBackButton: false,
      child: InkWell(
        onTap: () {
          context.read<HomeBloc>().add(GoToBooksScreenEvent(context: context));
          _log.info('book icon tapped');
        },
        child: Icon(Icons.menu_book_sharp, size: 80, color: Theme.of(context).app_textColor),
      ),
    );
  }
}
