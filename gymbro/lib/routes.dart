import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'programs.dart';
import 'programs/pecs.dart';
import 'programs/biceps.dart';
import 'programs/triceps.dart';
import 'programs/back.dart';
import 'programs/shoulders.dart';
import 'programs/cardio.dart';
import 'programs/abs.dart';
import 'programs/legs.dart';

final routes = GoRouter(routes: [
  GoRoute(
    path: "/",
    name: "ProgramsChoose",
    builder: (BuildContext context, GoRouterState state) =>
        const ProgramsChoose(),
  ),
  GoRoute(
    path: "/pecs",
    name: "PecsProgram",
    builder: (BuildContext context, GoRouterState state) => const PecsProgram(),
  ),
  GoRoute(
    path: "/biceps",
    name: "BicepsProgram",
    builder: (BuildContext context, GoRouterState state) =>
        const BicepsProgram(),
  ),
  GoRoute(
    path: "/triceps",
    name: "TricepsProgram",
    builder: (BuildContext context, GoRouterState state) =>
        const TricepsProgram(),
  ),
  GoRoute(
    path: "/back",
    name: "BackProgram",
    builder: (BuildContext context, GoRouterState state) => const BackProgram(),
  ),
  GoRoute(
    path: "/shoulders",
    name: "ShouldersProgram",
    builder: (BuildContext context, GoRouterState state) =>
        const ShouldersProgram(),
  ),
  GoRoute(
    path: "/cardio",
    name: "CardioProgram",
    builder: (BuildContext context, GoRouterState state) =>
        const CardioProgram(),
  ),
  GoRoute(
    path: "/abs",
    name: "AbsProgram",
    builder: (BuildContext context, GoRouterState state) => const AbsProgram(),
  ),
  GoRoute(
    path: "/legs",
    name: "LegsProgram",
    builder: (BuildContext context, GoRouterState state) => const LegsProgram(),
  ),
]);
