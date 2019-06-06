//flutter
import 'package:flutter/material.dart';

//tool
import 'package:flutter_shop/tools/tool_screen.dart';

//model
import 'package:flutter_shop/pages/category_page/model/category_page_category_model.dart';

//provide
import 'package:flutter_shop/pages/category_page/provide/category_page_provide.dart';
import 'package:provide/provide.dart';

class CategoryRightTopCategoryWidget extends StatelessWidget {
  Widget _createListItem(
      BuildContext context, CategoryPageProvide provide, int subCategoryindex) {
    CategoryPageMainCategoryModel mainCategoryModel =
        provide.mainCategoryModelList[provide.mainCategoryIndex];
    CategoryPageSubCategoryModel subCategoryModel =
        mainCategoryModel.bxMallSubDto[subCategoryindex];

    bool isSelected = subCategoryindex == provide.subCategoryIndex;
    return InkWell(
      onTap: () {
        provide.updateSubCategoryIndex(subCategoryindex);
      },
      child: Container(
        padding: EdgeInsets.only(left: 6.0, right: 6.0),
        alignment: Alignment.center,
        child: Text(
          '${subCategoryModel.mallSubName}',
          style: TextStyle(
            color: isSelected ? Colors.pink : Colors.black87,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Provide<CategoryPageProvide>(
      builder: (BuildContext context, Widget child, provide) {
        
        CategoryPageMainCategoryModel mainCategoryModel =
            provide.mainCategoryModelList[provide.mainCategoryIndex];
        return Container(
          height: fitPx(40.0),
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
              width: 1.0,
              color: Color.fromRGBO(230, 230, 230, 1),
            )),
            //color: Colors.blueAccent
          ),
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return _createListItem(context, provide, index);
            },
            scrollDirection: Axis.horizontal,
            itemCount: mainCategoryModel.bxMallSubDto.length,
          ),
        );
      },
    );
  }
}
