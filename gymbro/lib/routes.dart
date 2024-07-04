import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'programs.dart';
import 'programs/pecs.dart';
import 'programs/biceps.dart';
import 'programs/triceps.dart';
import 'programs/back.dart';
import 'programs/shoulders.dart';
import 'programs/abs.dart';
import 'programs/legs.dart';
import 'exercises/benchpress.dart';
import 'exercises/inclinedpress.dart';
import 'exercises/pecfly.dart';
import 'exercises/lowerpecfly.dart';
import 'exercises/dips.dart';
import 'exercises/skullcrusher.dart';
import 'exercises/tricepsextpulley.dart';
import 'exercises/shoulderpress.dart';
import 'exercises/reardelt.dart';
import 'exercises/inclinecurl.dart';
import 'exercises/hammercurl.dart';
import 'exercises/spidercurl.dart';
import 'package:GymBro/exercises/pullups.dart';
import 'package:GymBro/exercises/seatedrow.dart';
import 'package:GymBro/exercises/deadlift.dart';
import 'package:GymBro/exercises/legraises.dart';
import 'package:GymBro/exercises/declinecrunches.dart';
import 'package:GymBro/exercises/squat.dart';
import 'package:GymBro/exercises/legpress.dart';

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
      builder: (BuildContext context, GoRouterState state) =>
          const InclinedPress(),
    ),
    GoRoute(
      path: "/pecfly",
      name: "Pec Fly",
      builder: (BuildContext context, GoRouterState state) => const PecFly(),
    ),
    GoRoute(
      path: "/lowerpecfly",
      name: "Lower Pec Fly",
      builder: (BuildContext context, GoRouterState state) =>
          const LowerPecFly(),
    ),
    GoRoute(
      path: "/dips",
      name: "Dips",
      builder: (BuildContext context, GoRouterState state) => const Dips(),
    ),
    GoRoute(
      path: "/skullcrusher",
      name: "Skull Crusher",
      builder: (BuildContext context, GoRouterState state) =>
          const SkullCrusher(),
    ),
    GoRoute(
      path: "/tricepspulley",
      name: "Triceps Pulley",
      builder: (BuildContext context, GoRouterState state) =>
          const TricepsPulley(),
    ),
    GoRoute(
      path: "/shoulderpress",
      name: "Shoulder Press",
      builder: (BuildContext context, GoRouterState state) =>
          const ShoulderPress(),
    ),
    GoRoute(
      path: "/reardelt",
      name: "Rear Delt",
      builder: (BuildContext context, GoRouterState state) =>
          const RearDelt(),
    ),
    GoRoute(
      path: "/inclinecurl",
      name: "Incline Curl",
      builder: (BuildContext context, GoRouterState state) => const InclineCurl(),
    ),
    GoRoute(
      path: "/hammercurl",
      name: "Hammer Curl",
      builder: (BuildContext context, GoRouterState state) => const HammerCurl(),
    ),
    GoRoute(
      path: "/spidercurl",
      name: "Spider Curl",
      builder: (BuildContext context, GoRouterState state) => const SpiderCurl(),
    ),
    GoRoute(
      path: "/pullups",
      name: "Pull-ups",
      builder: (BuildContext context, GoRouterState state) =>
          const PullUps(),
    ),
    GoRoute(
      path: "/seatedrow",
      name: "Seated Row",
      builder: (BuildContext context, GoRouterState state) => const SeatedRow(),
    ),
    GoRoute(
      path: "/deadlift",
      name: "Deadlift",
      builder: (BuildContext context, GoRouterState state) => const DeadLift(),
    ),
    GoRoute(
      path: "/legraises",
      name: "Leg Raises",
      builder: (BuildContext context, GoRouterState state) => const LegRaises(),
    ),
    GoRoute(
      path: "/declinecrunches",
      name: "Decline Crunches",
      builder: (BuildContext context, GoRouterState state) => const DeclineCrunches(),
    ),
    GoRoute(
      path: "/squats",
      name: "Squats",
      builder: (BuildContext context, GoRouterState state) =>
          const Squats(),
    ),
    GoRoute(
      path: "/legpress",
      name: "Leg Press",
      builder: (BuildContext context, GoRouterState state) => const LegPress(),
    ),
  ],
);

String getRoute(int index) {
  switch (index) {
    case 0:
      return "/";
    case 1:
      return "/pecs";
    case 2:
      return "/triceps";
    case 3:
      return "/shoulders";
    case 4:
      return "/biceps";
    case 5:
      return "/back";
    case 6:
      return "/abs";
    case 7:
      return "/legs";
    default:
      return "/";
  }
}

// ignore: must_be_immutable
class Dashboard extends StatefulWidget {
  int selectedIndex;
  Dashboard(this.selectedIndex, {super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      extended: false,
      selectedIndex: widget.selectedIndex,
      onDestinationSelected: (int index) {
        setState(() {
          widget.selectedIndex = index;
          context.go(getRoute(widget.selectedIndex));
        });
      },
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.home),
          label: Text('Home'),
        ),
        NavigationRailDestination(
          icon: ImageIcon(AssetImage("assets/chest_icon.png")),
          label: Text('Pecs'),
        ),
        NavigationRailDestination(
          icon: ImageIcon(AssetImage("assets/triceps_icon.png")),
          label: Text('Triceps'),
        ),
        NavigationRailDestination(
          icon: ImageIcon(AssetImage("assets/shoulders_icon.png")),
          label: Text('Shoulders'),
        ),
        NavigationRailDestination(
          icon: ImageIcon(AssetImage("assets/biceps_icon.png")),
          label: Text('Biceps'),
        ),
        NavigationRailDestination(
          icon: ImageIcon(AssetImage("assets/back_icon.png")),
          label: Text('Back'),
        ),
        NavigationRailDestination(
          icon: ImageIcon(AssetImage("assets/abs_icon.png")),
          label: Text('Abs'),
        ),
        NavigationRailDestination(
          icon: ImageIcon(AssetImage("assets/quads_icon.png")),
          label: Text('Legs'),
        ),
      ],
    );
  }
}
