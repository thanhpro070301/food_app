import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/common/common.dart';
import 'package:food_app/features/details/view/details_screen.dart';
import 'package:food_app/features/home/provider/category_provider.dart';
import 'package:food_app/features/home/provider/food_provider.dart';
import 'package:food_app/gen/assets.gen.dart';
import '../../../common/tab_category.dart';
import '../../../common/widget/search_field.dart';
import '../../../common/widget/text_style.dart';

class ProductScreen extends ConsumerStatefulWidget {
  final VoidCallback onTap;
  final IconData icon;
  const ProductScreen({
    super.key,
    required this.onTap,
    required this.icon,
  });

  @override
  ConsumerState<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends ConsumerState<ProductScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List<Tab> myTabs = [];
  @override
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final categoriesProvider = ref.watch(categoryControllerProvider);
    if (categoriesProvider.isNotEmpty) {
      myTabs = categoriesProvider
          .map((category) => Tab(text: category.cateName))
          .toList();
      _tabController = TabController(vsync: this, length: myTabs.length);
    }
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categoriesProvider = ref.watch(categoryControllerProvider);
    if (categoriesProvider.isEmpty) {
      return const Loader();
    }
    if (_tabController == null) {
      myTabs = categoriesProvider
          .map((category) => Tab(text: category.cateName))
          .toList();
      _tabController = TabController(vsync: this, length: myTabs.length);
    }

    final foodProvider = ref.watch(foodControllerProvider);
    return Scaffold(
      backgroundColor: const Color(0xFFEDEDED),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 25.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: widget.onTap,
                      child: Icon(
                        widget.icon,
                        size: 30.h,
                      ),
                    ),
                    Image.asset(
                      Assets.images.cartIcon.path,
                      width: 40,
                      height: 40,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Image.asset(Assets.images.delici.path),
              ),
              SizedBox(
                height: 20.h,
              ),
              const SearchField(),
              SizedBox(
                height: 20.h,
              ),
              TabCategory(tabController: _tabController, myTabs: myTabs),
              Padding(
                padding: EdgeInsets.all(8.h),
                child: const Align(
                  alignment: Alignment.topRight,
                  child: TextSmallStyle(text: "see more"),
                ),
              ),
              SizedBox(
                height: 321.h,
                child: TabBarView(
                  controller: _tabController,
                  children: categoriesProvider.map(
                    (category) {
                      final foodInCategory = foodProvider
                          .where((food) => food.cateId == category.cateId)
                          .toList();
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: foodInCategory.length,
                        itemBuilder: (context, index) {
                          return CardProduct(
                            categoryName: foodInCategory[index].foodName,
                            image: foodInCategory[index].images.isNotEmpty
                                ? foodInCategory[index].images[0].imageUrl
                                : '',
                            price: foodInCategory[index].price.toString(),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                    cateId: foodInCategory[index].cateId,
                                    cateName: foodInCategory[index].cateName,
                                    foodID: foodInCategory[index].foodId,
                                    description:
                                        foodInCategory[index].description,
                                    foodName: foodInCategory[index].foodName,
                                    price: foodInCategory[index].price,
                                    images: foodInCategory[index].images,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
