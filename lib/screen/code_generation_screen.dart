import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/layout/default_layout.dart';
import 'package:riverpod_practice/riverpod/code_generation_provider.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);
    final state4 = ref.watch(gStateMultiplyProvider(number1: 10, number2: 20));

    return DefaultLayout(
      title: 'CodeGenerationScreen',
      body: Column(
        children: [
          Text('State1 : $state1'),
          state2.when(
            data: (data) {
              return Text(
                'State2 : $data',
                textAlign: TextAlign.center,
              );
            },
            error: (err, stack) => Text(err.toString()),
            loading: () {
              return const Center(child: CircularProgressIndicator());
            },
          ),
          state3.when(
            data: (data) {
              return Text(
                'State3 : $data',
                textAlign: TextAlign.center,
              );
            },
            error: (err, stack) => Text(err.toString()),
            loading: () {
              return const Center(child: CircularProgressIndicator());
            },
          ),
          Text('State4: $state4'),
          Consumer(
            builder: (context, ref, child) {
              print('builder build');
              final state5 = ref.watch(gStateNotifierProvider);

              return Row(
                children: [
                  Text('State5: $state5'),
                  if (child != null) child,
                ],
              );
            },
            child: Text('Hello'),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(gStateNotifierProvider.notifier).increment();
                },
                child: const Text('Increment'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(gStateNotifierProvider.notifier).decrement();
                },
                child: const Text('Decrement'),
              ),
            ],
          ),
          // invalidate()
          // 유효하지 않게 하다
          ElevatedButton(
            onPressed: () {
              ref.invalidate(gStateNotifierProvider);
            },
            child: Text('Invalidate'),
          ),
        ],
      ),
    );
  }
}
