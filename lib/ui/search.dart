import 'package:flutter/material.dart';
import 'package:metroid_prime_items/ui/search_finder.dart';


class SearchWidget extends SearchDelegate {

  @override
  final String? searchFieldLabel = "Search by Room";

  //Create an icon to clear the search query
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  //Create a leading icon to navigate back from the search view
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchFinder(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SearchFinder(query: query);
  }


  
}