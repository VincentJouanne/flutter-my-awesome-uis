import 'package:flutter/material.dart';
import 'package:flutter_my_awesome_uis/scroll_to_item_in_list_after_redirection/item_data.dart';
import 'package:flutter_my_awesome_uis/scroll_to_item_in_list_after_redirection/post_frame_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ListOfAllItemsView extends StatelessWidget {
  ListOfAllItemsView({Key? key, required this.itemIdScrollTarget})
      : super(key: key);
  final String itemIdScrollTarget;
  final itemScrollController = ItemScrollController();

  void scrollToTarget(int index) {
    itemScrollController.scrollTo(
      index: index,
      duration: const Duration(
        milliseconds: 200,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List of all items'),
        ),
        body: PostFrameWidget(
          callback: () {
            final itemToScrollTo = allItems.indexWhere(
              (item) => item.id == itemIdScrollTarget,
            );
            if (itemToScrollTo != -1) {
              scrollToTarget(itemToScrollTo);
            }
          },
          child: ScrollablePositionedList.separated(
              itemCount: allItems.length,
              itemScrollController: itemScrollController,
              itemBuilder: (context, index) {
                return ListTile(title: Text(allItems[index].text));
              },
              separatorBuilder: (context, index) {
                return const Divider();
              }),
        ));
  }
}
