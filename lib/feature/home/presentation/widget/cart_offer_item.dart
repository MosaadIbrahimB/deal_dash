
import 'package:dealdash/core/resources/color_manger/color_manager.dart';
import 'package:dealdash/core/resources/strings_manger/strings_manager.dart';
import 'package:dealdash/feature/home/data/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardOfferItem extends StatelessWidget {
  const CardOfferItem({
    super.key,
    required this.offerData,
  });

  final StoreInCategory? offerData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
  
      child: Card(
     
        elevation: 2,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //image
                SizedBox(
                  height: MediaQuery.of(context).size.height * .22,
                  width: double.infinity,
                  child: Image.network(
                    offerData?.image ?? '',
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                //title
               Padding(
                  padding: const EdgeInsets.only(left: 8.0).r,
                  child: Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    offerData?.name ?? AppStrings.appelMob,
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: Row(
                    children: [
                      FittedBox(
                          fit: BoxFit.scaleDown,
                          child: 
                           Padding(
                            padding: const EdgeInsets.only(left: 8.0).r,
                            child:Text(
                            "discount ",
                            style: TextStyle(
                              fontSize: 14,
                              color: ColorManager.yellow,
                            ),),
                          )),
                      Text(
                        (offerData?.offers.length ?? 0) % 2 == 1 ? "30% Off" : "10% Off",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: ColorManager.red,
                        ),
                      ),
                      const SizedBox(),
                    ],
                  ),
                ),
              ],
            ),
           
            Positioned(
              top: 5,
              right: 5,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: ColorManager.whitGreen,
                ),
                child: Row(
                  children: [
                    Text(
                      "3.5",
                      style: TextStyle(
                        color: ColorManager.primary,
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: ColorManager.yellow,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
