
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:healthcare_app/core/widgets/main_text_form_field.dart';
import 'package:healthcare_app/features/search/widgets/search_list.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchKey = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Doctors '),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            MainTextFormField(
              hintText: 'Search.....',
              textInputType: TextInputType.text,
              onchange: (search) {
                setState(() {
                  searchKey = search  ;
                });
              },
            ),
            const Gap(20),
            Expanded(
              child: SearchList(
                searchKey: searchKey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


















