import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/ui/show_product/components/text_head_show_product.dart';

class DescriptionProductParagraph extends StatelessWidget {
  const DescriptionProductParagraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextHeadShowProduct(
           text: "Description",
          ),
          SizedBox(
            height: 16,
          ),
          Text(
              "Đánh giá Samsung Galaxy Z Fold 3 (5G) - Khẳng định đẳng cấp Với sự thành công đáng kinh ngạc và luôn cháy hàng từ lúc ra mắt đến thời điểm hiện tại của hai thế hệ trước là Fold 1 và Z Fold 2. Galaxy Z Fold 3 lần này được ra mắt với độ hoàn thiện cao về thiết kế và hiệu năng. Mang đến cho người dùng một trải nghiệm cực kỳ thú vị hơn. Thiết kế độc đáo tiện lợi, chất liệu cao cấp Là sản phẩm mang đến độ hoàn thiện cao hơn nhiều so với hai phiên bản trước, điện thoại Samsung Galaxy Fold 3 được thiết kế kích thước hài hòa hơn. Giúp bạn có thể dễ dàng cầm khi đóng hoặc mở màn hình đều dễ sử dụng nhất. Bộ khớp nối bản lề mới giúp kết nối bộ khung của Galaxy Z Fold3 hoàn hảo hơn. Tăng cao độ bền khi đóng mở liên tục và cố định cực kỳ chắc chắn."),
        ],
      ),
    );
  }
}
