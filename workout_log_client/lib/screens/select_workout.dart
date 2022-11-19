import 'package:flutter/material.dart';
import 'package:workout_log/screens/workout_details.dart';
import '../widgets/page/sub_header.dart';
import '../widgets/header/header.dart';
import '../widgets/page/nav_bar.dart';
import 'log_workout/log_workout.dart';

class SelectWorkout extends StatefulWidget {
  const SelectWorkout({Key? key}) : super(key: key);

  @override
  State<SelectWorkout> createState() => _SelectWorkoutState();
}

class _SelectWorkoutState extends State<SelectWorkout> {
  @override
  Widget build(BuildContext context) {
    const double sideMargin = 20;
    const EdgeInsets containerMargin =
        EdgeInsets.fromLTRB(sideMargin, 10, sideMargin, 0);
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: const NavBar(currentPage: 1),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Center(
            child: Column(children: [
              const Header(
                  title: "Select a workout",
                  navigationButton: null,
                  secondaryButton: null),
              const SubHeader(title: "Your next scheduled workout"),
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WorkoutDetails())),
                child: Container(
                  margin: containerMargin,
                  child: Container(
                      width: width - sideMargin,
                      height: 95,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Pull Hypertrophy",
                              style: Theme.of(context).textTheme.headline2),
                          SizedBox(
                            height: 50,
                            child: GridView.count(
                              primary: false,
                              shrinkWrap: true,
                              padding: const EdgeInsets.only(top: 10),
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 0,
                              crossAxisCount: 2,
                              childAspectRatio: (1 / .12),
                              children: <Widget>[
                                Text("Duration",
                                    style:
                                        TextStyle(color: Colors.grey.shade200)),
                                Text("Volume",
                                    style:
                                        TextStyle(color: Colors.grey.shade200)),
                                const Text("1 hr 30 mins"),
                                const Text("1000kg")
                              ],
                            ),
                          )
                        ],
                      )),
                ),
              ),
              const SubHeader(title: "Quick start"),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LogWorkout()));
                },
                child: Container(
                  margin: containerMargin,
                  width: double.infinity,
                  height: 70,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.grey,
                  ),
                  child: const Align(
                      alignment: Alignment.center,
                      child: Text("Start an empty workout")),
                ),
              ),
              const SubHeader(title: "Workouts"),
              Container(
                margin: containerMargin,
                child: Row(children: [
                  Expanded(
                    child: InkWell(
                        onTap: () {
                          showSearch(
                              context: context,
                              delegate: SearchWorkoutDelegate());
                        },
                        child: const GridButton(
                            text: "Search workouts", icon: Icons.search)),
                  ),
                  Expanded(
                    child: InkWell(
                        onTap: () {},
                        child: const GridButton(
                            text: "Favourites", icon: Icons.star)),
                  ),
                ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SubHeader(title: "Workout history"),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 10, left: sideMargin, right: sideMargin),
                    child: const Icon(Icons.keyboard_arrow_down,
                        color: Colors.black),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 10, bottom: 25, left: sideMargin, right: sideMargin),
                child: Container(
                  width: width - sideMargin,
                  height: 275,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Push Hypertrophy",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        ?.fontSize)),
                            InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Wrap(
                                          children: [
                                            InkWell(
                                              onTap: () {},
                                              child: const ListTile(
                                                leading:
                                                    Icon(Icons.electric_bolt),
                                                title: Text('Start workout'),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: const ListTile(
                                                leading: Icon(Icons.edit),
                                                title: Text('Edit workout'),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: const ListTile(
                                                leading: Icon(Icons.close),
                                                title: Text('Delete workout'),
                                              ),
                                            )
                                          ],
                                        );
                                      });
                                },
                                child: const Icon(Icons.more_vert,
                                    color: Colors.black))
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            "Yesterday (18/09/2022)",
                            style: TextStyle(color: Colors.grey.shade200),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child: GridView.count(
                            primary: false,
                            padding: const EdgeInsets.only(top: 10.0),
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0,
                            crossAxisCount: 2,
                            childAspectRatio: (1 / .12),
                            children: <Widget>[
                              Text("Duration",
                                  style:
                                      TextStyle(color: Colors.grey.shade200)),
                              Text("Volume",
                                  style:
                                      TextStyle(color: Colors.grey.shade200)),
                              const Text("1 hr 30 mins"),
                              const Text("1000kg")
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                        Text(
                          "Exercises",
                          style: TextStyle(color: Colors.grey.shade200),
                        ),
                        Container(
                          margin:
                              const EdgeInsets.only(top: 5, bottom: 5, left: 5),
                          child: Row(
                            children: const [
                              ExerciseImage(),
                              ExerciseText(text: "3 sets - Bench Press")
                            ],
                          ),
                        ),
                        Container(
                          margin:
                              const EdgeInsets.only(top: 5, bottom: 5, left: 5),
                          child: Row(
                            children: const [
                              ExerciseImage(),
                              ExerciseText(
                                  text: "3 sets - Chest Press (Machine)")
                            ],
                          ),
                        )
                      ]),
                ),
              )
            ]),
          )),
        ));
  }
}

class GridButton extends StatelessWidget {
  const GridButton({Key? key, required this.text, required this.icon})
      : super(key: key);
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        alignment: Alignment.center,
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.grey,
        ),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Icon(
            icon,
            color: Colors.black,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
          )
        ]),
      ),
    );
  }
}

class ExerciseImage extends StatelessWidget {
  const ExerciseImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 4.0, left: 4.0, right: 4.0),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: Colors.white,
            shape: BoxShape.circle));
  }
}

class ExerciseText extends StatelessWidget {
  const ExerciseText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 8.0, left: 4.0), child: Text(text));
  }
}

class SearchWorkoutDelegate extends SearchDelegate {
  List<String> searchResults = [
    "Push Hypertrophy",
    "Pull Hypertrophy",
    "Legs Hypertrophy"
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) =>
      Center(child: Text(query, style: Theme.of(context).textTheme.bodyText1));

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();

    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(suggestions[index]),
              onTap: () {
                //query = suggestions[index];
                //showResults(context);

                Navigator.pop(context);
              });
        });
  }
}
