
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/cheek_intrnet/intrnet_ceker.dart';

class CheckNetAndProgressFotFetchData extends StatelessWidget {
  const CheckNetAndProgressFotFetchData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Get.find<GetXNetworkManager>()/*.isConnectionSuccessful.value?*/.connectionType.value==1?
    const Center(child:CircularProgressIndicator()):
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.wifi_off_sharp,size:60,color:Colors.grey ),
        Text("لايوجد نت",),
      ],
    )

    );
  }
}