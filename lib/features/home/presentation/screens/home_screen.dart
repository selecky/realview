import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:realview/features/home/presentation/blocs/home_bloc.dart';
import 'package:realview/features/home/presentation/widgets/home_tile.dart';
import 'package:realview/utils/strings.dart';
import 'package:realview/common_widgets/app_screen.dart';

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
      child: HomeTile(
        onTap: () {
          context.read<HomeBloc>().add(GoToAuthorsScreenEvent(context: context));
          _log.info('authors icon tapped');
        },
        iconData: Icons.menu_book_sharp,
        title: Strings.screen_title_authors.tr(),
      ),
    );
  }
}
