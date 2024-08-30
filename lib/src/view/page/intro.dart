import 'package:fl_lib/fl_lib.dart';
import 'package:flutter/material.dart';

typedef IntroPageBuilder = Widget Function(BuildContext ctx, double padTop);

final class IntroPageArgs {
  final List<Widget> pages;
  final void Function(BuildContext context) onDone;

  const IntroPageArgs({required this.pages, required this.onDone});
}

final class IntroPage extends StatefulWidget {
  final IntroPageArgs args;

  const IntroPage({
    super.key,
    required this.args,
  });

  @override
  State<IntroPage> createState() => _IntroPageState();

  static const route = AppRouteArg<void, IntroPageArgs>(
    page: IntroPage.new,
    path: '/intro',
  );

  static Widget title({IconData? icon, String? text, bool big = false}) {
    assert(icon != null || text != null);

    Widget child;
    if (icon != null) {
      child = Icon(icon, size: big ? 41 : null);
    } else if (text != null) {
      child = Text(
        text,
        style: big
            ? const TextStyle(fontSize: 41, fontWeight: FontWeight.w500)
            : UIs.textGrey,
      );
    } else {
      child = const SizedBox();
    }
    if (!big) {
      child = Padding(
        padding: const EdgeInsets.symmetric(vertical: 13),
        child: child,
      );
    }
    return Center(child: child);
  }
}

final class _IntroPageState extends State<IntroPage> {
  final _pageController = PageController();
  final _currentPage = 0.vn;
  late final _args = widget.args;
  late final _pageCount = _args.pages.length;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: _pageCount,
        onPageChanged: (index) => _currentPage.value = index,
        itemBuilder: (_, index) => _args.pages[index],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListenBuilder(
              listenable: _currentPage,
              builder: () {
                if (!hasPre) return UIs.placeholder;
                return FadeIn(
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                );
              },
            ).expanded(),
            ValBuilder(
              listenable: _currentPage,
              builder: (idx) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FadeIn(
                      key: ValueKey(idx),
                      child: Text(
                        '${idx + 1}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      ' / $_pageCount',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                );
              },
            ).expanded(),
            ListenBuilder(
              listenable: _currentPage,
              builder: () {
                if (!hasNext) {
                  return FadeIn(
                    key: const Key('done'),
                    child: IconButton(
                      icon: const Icon(Icons.done),
                      onPressed: () => _args.onDone(context),
                    ),
                  );
                }
                return FadeIn(
                  key: const Key('next'),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                );
              },
            ).expanded(),
          ],
        ),
      ),
    );
  }

  bool get hasPre => _currentPage.value > 0;
  bool get hasNext => _currentPage.value < _pageCount - 1;
}
