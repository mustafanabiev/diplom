import 'package:diplom/home/cubit/home_cubit.dart';
import 'package:diplom/home/pages/home_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme =
        ColorScheme.fromSeed(seedColor: Colors.green);
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: colorScheme.onInverseSurface,
        appBar: AppBar(
          backgroundColor: colorScheme.onInverseSurface,
          surfaceTintColor: colorScheme.onInverseSurface,
          title: const Text('Өсүмдүктөр'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(child: Text('Мөмө-жемиштер')),
              Tab(child: Text('Жашылчалар')),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state.plantModel.isEmpty) {
                    return const Center(child: Text('No'));
                  } else {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                      ),
                      padding: const EdgeInsets.all(8.0),
                      itemCount: state.plantModel.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeDetailPage(
                                  index: index,
                                  plantModel: state.plantModel[index],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.green),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: Image.asset(
                                        'assets/images/${state.plantModel[index].image}',
                                        width: double.infinity,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    state.plantModel[index].name,
                                    style: const TextStyle(fontSize: 18.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state.plantModel2.isEmpty) {
                    return const Center(child: Text('No'));
                  } else {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                      ),
                      padding: const EdgeInsets.all(8.0),
                      itemCount: state.plantModel2.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeDetailPage(
                                  index: index,
                                  plantModel: state.plantModel2[index],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.green),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: Image.asset(
                                        'assets/images/${state.plantModel2[index].image}',
                                        width: double.infinity,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    state.plantModel2[index].name,
                                    style: const TextStyle(fontSize: 18.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
