import 'package:fl_lib/fl_lib.dart';
import 'package:flutter/material.dart';

final class SearchPage<T> extends SearchDelegate<T> {
  final Future<List<T>> Function(String) future;
  final Widget Function(BuildContext, T) builder;
  final EdgeInsetsGeometry? padding;
  final Duration throttleInterval;

  List<T> _cache = [];
  DateTime? _lastSearch;

  SearchPage({
    required this.future,
    required this.builder,
    this.padding,
    this.throttleInterval = const Duration(milliseconds: 200),
  });

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: context.pop,
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildList(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildList(context);
  }

  Widget _buildList(BuildContext context) {
    return FutureWidget(
      future: _search(query),
      loading: const Center(child: SizedLoading.medium),
      error: (error, trace) {
        return Center(
          child: Text('$error\n$trace'),
        );
      },
      success: (list) {
        if (list == null || list.isEmpty) {
          return const Center(child: Text('~'));
        }

        return ListView.builder(
          padding: padding,
          itemCount: list.length,
          itemBuilder: (_, index) => builder(context, list[index]),
        );
      },
    );
  }

  Future<List<T>> _search(String query) async {
    final lastSearch = _lastSearch;
    if (lastSearch != null) {
      final now = DateTime.now();
      if (now.difference(lastSearch) < throttleInterval) {
        return _cache;
      }
    }
    _cache = await future(query);
    return _cache;
  }
}
