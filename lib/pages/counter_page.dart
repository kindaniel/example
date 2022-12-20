import 'package:example/pages/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final CounterCubit counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => counterCubit,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => counterCubit.increment(),
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: [
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state is CounterError) {
                  const snackBar = SnackBar(
                    backgroundColor: Colors.red,
                    content: Text('Ocorreu um erro inesperado!'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              builder: (context, state) {
                if (state is CounterLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is CounterInitial) {
                  return const Center(
                    child: Text('Estado inicial'),
                  );
                }
                if (state is CounterSuccess) {
                  return Center(child: Text('Valor: ${state.value}'));
                }

                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
