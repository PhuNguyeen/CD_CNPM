import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/model/product/product.dart';
import 'package:flutter_pat_shop/ui/show_product/components/body_show_product.dart';
import 'package:flutter_pat_shop/util/widgets/my_elevated_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowProductScreen extends StatelessWidget {
  final Product product;
  ShowProductScreen({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BodyShowProduct(
        product: product,
      ),
      bottomNavigationBar: bottomNavBarShowProduct(size, context),
    );
  }

  Widget bottomNavBarShowProduct(Size size, BuildContext context) => Container(
        height: 60,
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 1,
              offset: Offset(-1, 0),
            ),
            BoxShadow(
              color: Colors.white,
              blurRadius: 1,
              offset: Offset(-1, 0),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyElevatedButton(
                magin: const EdgeInsets.symmetric(vertical: 8.0),
                color: Colors.blue,
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    isDismissible: true,
                    backgroundColor: Colors.transparent,
                    builder: (_) => buildBottumSheetChat(context),
                  );
                },
                height: 50,
                width: 50,
                child: Icon(
                  Icons.message_outlined,
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              MyElevatedButton(
                magin: const EdgeInsets.symmetric(vertical: 8.0),
                color: Colors.green,
                onPressed: () {
                  Fluttertoast.showToast(
                    msg: "Add to Shopping Cart",
                  );
                },
                height: 50,
                width: size.width * 0.7,
                child: Text(
                  "Add to Shopping Cart",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                borderRadius: BorderRadius.circular(50),
              ),
            ],
          ),
        ),
      );

  //click vào sẽ tắt bottom sheet
  Widget makeDismissible(
          {required Widget child, required BuildContext context}) =>
      GestureDetector(
        child: GestureDetector(
          child: child,
          onTap: () {},
        ),
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
      );

  Widget buildBottumSheetChat(BuildContext context) => makeDismissible(
        context: context,
        child: DraggableScrollableSheet(
          initialChildSize: 0.64,
          minChildSize: 0.2,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              padding: EdgeInsets.only(left: 16, bottom: 0, right: 16, top: 16),
              child: ListView(
                physics: BouncingScrollPhysics(),
                controller: scrollController,
                children: [Text(a!)],
              ),
            );
          },
        ),
      );

  final String? a =
      "Nội dung Hắn vừa đi vừa chửi. Bao giờ cũng thế, cứ rượu xong là hắn chửi. Bắt đầu hắn chửi trời. Có hề gì? Trời có của riêng nhà nào? Rồi hắn chửi đời. Thế cũng chẳng sao: đời là tất cả nhưng chúng là ai. Tức mình, hắn chửi ngay tất cả làng Vũ Đại. Nhưng cả làng Vũ Đại ai cũng nhủ: “Chắc nó trừ mình ra!”. Không ai lên tiếng cả. Tức thật! Ờ! Thế này thì tức thật? Tức chết đi được mất! Đã thế, hắn phải chửi cha đứa nào không chửi nhau với hắn. Nhưng cũng không ai ra điều. Mẹ kiếp! Thế có phí rượu không? Thế thì có khổ hắn không? Không biết đứa chết mẹ nào lại đẻ ra thân hắn cho hắn khổ đến nông nỗi này? A ha! Phải đấy, hắn cứ thế mà chửi, hắn cứ chửi đứa chết mẹ nào đẻ ra thân hắn, đẻ ra cái thằng Chí Phèo! Hắn nghiến răng vào mà chửi cái đứa đã đẻ ra Chí Phèo. Nhưng mà biết đứa nào đã đẻ ra Chí Phèo? Có mà trời biết! Hắn không biết, cả làng Vũ Đại cũng không ai biết... (Lược một đoạn: Một người đi thả ống lươn nhặt được Chí Phèo “trần truồng và xám ngắt trong một váy đụp để bên cái lò gạch bỏ không”, sau đó, chuyền tay cho người làng nuôi. Lớn lên, làm canh điền cho lí Kiến, Chí Phèo bị lí Kiến ghen, đẩy vào tù. Bảy, tám năm sau, Chí Phèo ra tù...). Hắn về lớp này trông khác hẳn, mới đầu chẳng ai biết hắn là ai. Trông đặc như thằng săng đá!. Cái đầu thì trọc lốc, cái răng cạo trắng hớn, cái mặt thì đen mà rất cơng cơng, hai mắt gườm gườm trông gớm chết! Hắn mặc quần nái đen với cái áo tây vàng. Cái ngực phanh, đầy những nét chạm trổ rồng phượng với một ông tướng cầm chuỳ, cả hai cánh tay cũng thế. Trông gớm chết! Hắn về hôm trước, hôm sau đã thấy ngồi ở chợ uống rượu với thịt chó suốt từ trưa đến xế chiều. Rồi say khướt, hắn xách một cái vỏ chai đến cổng nhà bá Kiến, gọi tận tên tục ra mà chửi. Cụ bá không có nhà. Thấy bộ điệu hung hăng của hắn, bà cả đùn bà hai, bà hai thúc bà ba, bà ba gọi bà tư, nhưng rốt cục chẳng bà nào dám ra nói với hắn một vài lời phải chăng. Mắc cái phải cái thằng liều lĩnh quá, nó lại say rượu, tay nó lại nhăm nhăm cầm cái vỏ chai, mà nhà lúc ấy toàn đàn bà cả... Thôi thì cứ đóng cái cổng cho thật chắc rồi mặc thây cha nó, nó có chửi thì tai liền miệng đấy, chửi rồi lại nghe! Thành thử chỉ có ba con chó dữ với một thằng say rượu!... Thật là ầm ĩ? Hàng xóm phải một bữa điếc tai, nhưng có lẽ trong bụng thì họ hả: xưa nay họ mới chỉ được nghe bà cả, bà hai, bà ba, bà tư nhà cụ bá chửi người ta, bây giờ họ mới được nghe người ta chửi lại cả nhà cụ bá. Mà chửi mới sướng miệng làm sao! Mới ngoa ngoắt làm sao! Họ bảo nhau: “Phen này cha con thằng bá Kiến đố còn dám vác mặt đi đâu nữa! Mồ mả tổ tiên đến lộn lên mất”. Cũng có người hiền lành hơn thì bảo: “Phúc đời nhà nó, chắc ông lí không có nhà...”. Ông lí đây là ông lí Cường, con giai cụ bá nổi tiếng là hách địch, coi người như rơm như rác. Phải ông lí Cường thử có nhà xem nào? Quả nhiên họ nói có sai đâu! Đấy, có tiếng người sang sảng quát: “Mày muốn lôi thôi gì... cái thằng không cha không mẹ này! Mày muốn lôi thôi gì? Đã bảo mà! Cái tiếng quát tháo kia là tiếng lí Cường. Lí Cường đã về! Lí Cường đã về! Phải biết... A ha! Một cái tát rất kêu. Ôi! Cái gì thế này? Tiếng đấm, tiếng đá nhau bình bịch, thôi cứ gọi là tan xương? Bỗng “choang” một cái, thôi phải rồi, hắn đập cái chai vào cột cổng... Ồ hắn kêu... Hắn vừa chửi vừa kêu làng như bị người ta cắt họng. Ồ hắn kêu!";
}
