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
import 'exercises/benchpress.dart';
import 'exercises/inclinedpress.dart';
import 'exercises/pecfly.dart';
import 'exercises/lowerpecfly.dart';
import 'exercises/dips.dart';

final routes = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      name: "ProgramsChoose",
      builder: (BuildContext context, GoRouterState state) =>
          const ProgramsChoose(),
    ),
    GoRoute(
      path: "/pecs",
      name: "PecsProgram",
      builder: (BuildContext context, GoRouterState state) =>
          const PecsProgram(),
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
      builder: (BuildContext context, GoRouterState state) =>
          const BackProgram(),
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
      builder: (BuildContext context, GoRouterState state) =>
          const AbsProgram(),
    ),
    GoRoute(
      path: "/legs",
      name: "LegsProgram",
      builder: (BuildContext context, GoRouterState state) =>
          const LegsProgram(),
    ),
    GoRoute(
      path: "/benchpress",
      name: "Bench Press",
      builder: (BuildContext context, GoRouterState state) =>
          const BenchPress(),
    ),
    GoRoute(
      path: "/inclinedpress",
      name: "Inclined Press",
      builder: (BuildContext context, GoRouterState state) => const InclinedPress(),
    ),
    GoRoute(
      path: "/pecfly",
      name: "Pec Fly",
      builder: (BuildContext context, GoRouterState state) => const PecFly(),
    ),
    GoRoute(
      path: "/lowerpecfly",
      name: "Lower Pec Fly",
      builder: (BuildContext context, GoRouterState state) => const LowerPecFly(),
    ),
    GoRoute(
      path: "/dips",
      name: "Dips",
      builder: (BuildContext context, GoRouterState state) =>
          const Dips(),
    ),
  ],
);
