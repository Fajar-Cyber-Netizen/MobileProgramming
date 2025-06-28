import 'package:flutter/material.dart';

// Enum untuk status tombol
enum ButtonState { init, loading, done }

class AutocompletePage extends StatefulWidget {
  const AutocompletePage({super.key});

  @override
  State<AutocompletePage> createState() => _AutocompletePageState();
}

class _AutocompletePageState extends State<AutocompletePage> {
  bool isAnimating = true;
  ButtonState state = ButtonState.init;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDone = state == ButtonState.done;
    final isStretched = isAnimating || state == ButtonState.init;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan 8'),
        backgroundColor: Colors.pink,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: MySearch());
            },
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
          width: state == ButtonState.init ? width : 70,
          height: 70,
          onEnd: () => setState(() => isAnimating = !isAnimating),
          child: isStretched ? buildButton() : buildSmallButton(isDone),
        ),
      ),
    );
  }

  Widget buildButton() => OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: const StadiumBorder(
            side: BorderSide(width: 2, color: Colors.indigo),
          ),
        ),
        child: const Text(
          'Submit',
          style: TextStyle(
            fontSize: 24,
            color: Colors.indigo,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w600,
          ),
        ),
        onPressed: () async {
          setState(() => state = ButtonState.loading);
          await Future.delayed(const Duration(seconds: 3));
          setState(() => state = ButtonState.done);
          await Future.delayed(const Duration(seconds: 3));
          setState(() => state = ButtonState.init);
        },
      );

  Widget buildSmallButton(bool isDone) {
    final color = isDone ? Colors.green : Colors.indigo;
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Center(
        child: isDone
            ? const Icon(Icons.done, size: 52, color: Colors.white)
            : const CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}

class MySearch extends SearchDelegate {
  List<String> searchResults = ['Flutter', 'Kotlin', 'Java', 'PHP', 'HTML'];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  List<Widget>? buildActions(BuildContext context) => [
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

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
          style: const TextStyle(fontSize: 64, fontWeight: FontWeight.w200),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((item) {
      final result = item.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];

        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            showResults(context);
          },
        );
      },
    );
  }
}
