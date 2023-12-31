import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybloackapp/logic/bloc_logic/counter_bloc.dart';
import 'package:mybloackapp/logic/bloc_logic/counter_event.dart';
import 'package:mybloackapp/logic/cubit_logic/counter_cubit.dart';
import 'package:mybloackapp/logic/cubit_logic/counter_state.dart';
import 'package:mybloackapp/presentation/secon_page.dart';
import 'package:mybloackapp/presentation/weather_ui.dart';

import '../constant/string_constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({required this.ctx});
  final BuildContext ctx;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late CounterCubit counterCubit;

  ///cubit state
  late CounterBloc counterBloc;

  ///bloc state

  @override
  void initState() {
    counterCubit = CounterCubit();

    ///cubit_state
    counterBloc = CounterBloc();

    ///bloc_state
    super.initState();
  }

  void _incrementCounter() {
    counterCubit.increment();

    ///cubit_state
    counterBloc.add(CounterIncrementEvent());

    ///bloc_state
  }

  @override
  Widget build(BuildContext context) {
    return cubitStateScreen(context);
  }

  Widget cubitStateScreen(BuildContext ct) {
    return BlocProvider<CounterCubit>(
      create: (context) => counterCubit,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(AppStrings.appbarText),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  // Get.to(WeatherUiPage(
                  //   ctxx: context,
                  // ));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => WeatherUiPage(
                              ctxx: widget.ctx,
                            )),
                  );
                },
                child: const Text("Click Me To Redirect to weather app!",
                    style: TextStyle(
                        color: Colors.blue,
                        height: 15.0,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold)),
              ),
              const Text(AppStrings.cubitCounter),
              BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) => Text('${state.value}')),
              OutlinedButton(
                  style: ButtonStyle(
                      side: MaterialStateProperty.all(const BorderSide(
                    color: Colors.black,
                    width: 1.5,
                  ))),
                  onPressed: () {
                    _incrementCounter();
                  },
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 25),
                  )),
              const SizedBox(
                height: 30,
              ),
              IconButton(
                icon: const Icon(Icons.navigate_next),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget blocStateScreen(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => counterBloc,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(AppStrings.appbarText),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(AppStrings.blocCounter),
                BlocBuilder<CounterBloc, CounterState>(
                    builder: (context, state) => Text('${state.value}')),
                OutlinedButton(
                    style: ButtonStyle(
                        side: MaterialStateProperty.all(const BorderSide(
                      color: Colors.black,
                      width: 1.5,
                    ))),
                    onPressed: () {
                      _incrementCounter();
                    },
                    child: const Text(
                      '+',
                      style: TextStyle(fontSize: 25),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
