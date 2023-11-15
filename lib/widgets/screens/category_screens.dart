
import 'package:flutter/cupertino.dart';
import 'package:dashboard/dummy_data.dart';
import '../category_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: CustomScrollView(
          slivers: <Widget>[
            // CupertinoSliverNavigationBar(
            //   largeTitle: Text('Categories'),
            // ),
            SliverPadding(
              padding: EdgeInsets.only(top: 130),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    final catData = DUMMY_CATEGORIES[index];
                    return CategoryItem(
                        catData.id, catData.title, catData.color);
                  },
                  childCount: DUMMY_CATEGORIES.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
