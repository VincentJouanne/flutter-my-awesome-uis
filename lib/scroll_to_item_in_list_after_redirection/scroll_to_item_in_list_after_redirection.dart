import 'package:flutter/material.dart';
import 'package:flutter_my_awesome_uis/awesome_ui.dart';
import 'package:flutter_my_awesome_uis/scroll_to_item_in_list_after_redirection/item_data.dart';
import 'package:flutter_my_awesome_uis/scroll_to_item_in_list_after_redirection/list_of_all_items.dart';

class ScrollToItemInListAfterRedirectionView extends AwesomeUI {
  const ScrollToItemInListAfterRedirectionView({Key? key})
      : super(key: key, name: 'Scroll to item in list after redirection');

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ListOfSomeSpecificItem(),
    );
  }
}

class ListOfSomeSpecificItem extends StatelessWidget {
  const ListOfSomeSpecificItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ButtonItemTarget(item: allItems[9]),
          ButtonItemTarget(item: allItems[29]),
          ButtonItemTarget(item: allItems[49])
        ],
      ),
    );
  }
}

class ButtonItemTarget extends StatelessWidget {
  const ButtonItemTarget({Key? key, required this.item}) : super(key: key);
  final Item item;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ListOfAllItemsView(
              itemIdScrollTarget: item.id,
            ),
          ),
        );
      },
      child: Text(item.text),
    );
  }
}
