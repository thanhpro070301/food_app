import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/widget/card_product.dart';
import '../../../common/widget/line_tab.dart';
import '../../../common/widget/text_style.dart';
import '../../../core/constants/constants.dart';
import '../../../core/constants/theme_constants/pallete.dart';
import '../data/model/cate_model/cate_model.dart';
import '../provider/category_provider.dart';
import '../provider/food_provider.dart';

class ProductScreen extends ConsumerStatefulWidget {
  const ProductScreen({super.key});

  @override
  ConsumerState<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends ConsumerState<ProductScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  void initializeTabController(List<CateModel> categories) {
    _tabController = TabController(vsync: this, length: categories.length);
  }

  @override
  Widget build(BuildContext context) {
    final categoriesProvider = ref.watch(categoryControllerProvider);
    final List<Tab> myTabs = categoriesProvider
        .map((category) => Tab(text: category.cateName))
        .toList();
    if (_tabController == null) {
      initializeTabController(categoriesProvider);
    }
    final foodProvider = ref.watch(foodControllerProvider);
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
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
                    Image.asset(AssetsConstants.vector),
                    Image.asset(AssetsConstants.shoping_cart),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Image.asset(AssetsConstants.delicious),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.h),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 314.w,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.h),
                        ),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.h),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.grey.shade200,
                      border: InputBorder.none,
                      hintText: "Search...",
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              TabBar(
                isScrollable: true,
                indicator: LineTabIndicator(
                  color: Palette.backgroundOrange1,
                  lineHeight: 1.5.h,
                  strokeWidth: 3.h,
                ),
                labelColor: Palette.backgroundOrange1,
                unselectedLabelColor: const Color(0xffA8A8A8),
                controller: _tabController,
                labelStyle: const TextStyle(
                  fontSize: 20,
                ),
                tabs: myTabs.map((e) => e).toList(),
              ),
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
                  children: categoriesProvider.map((category) {
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
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
