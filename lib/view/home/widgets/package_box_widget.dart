import 'package:flutter/material.dart';
import 'package:kwin_shops_admin_app/core/core_config/config_color.dart';
import 'package:kwin_shops_admin_app/core/core_config/config_dimension.dart';
import 'package:kwin_shops_admin_app/core/core_config/config_style.dart';
import 'package:kwin_shops_admin_app/core/core_functions/functions.dart';

class PackageBoxWidget extends StatelessWidget {
  const PackageBoxWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: DIMEN_SIXTEEN, vertical: DIMEN_FOURTEEN - 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          Functions.buildBoxShadow(),
        ],
        border: Border.all(color: BLACK_LIGHT, width: 0.7),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  "https://marketplace.canva.com/EAFMNm9ybqQ/1/0/1600w/canva-gold-luxury-initial-circle-logo-qRQJCijq_Jw.jpg",
                  fit: BoxFit.cover,
                  width: 60,
                  height: 60,
                ),
              ),
              const SizedBox(width: 30),
              Column(
                children: [
                  Text(
                    "K-WIN FREE",
                    style: ConfigStyle.boldStyleThree(
                      DIMEN_SIXTEEN,
                      BLACK_HEAVY,
                    ),
                  ),
                  Text(
                    "1 Month Trial",
                    style: ConfigStyle.regularStyleThree(
                      DIMEN_FOURTEEN,
                      BLACK_HEAVY,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
            child: Center(
              child: Container(
                height: 0.6,
                color: BLACK_LIGHT,
              ),
            ),
          ),
          Text(
            "After trial,start one subscription\n-Subscribed by 20 customers",
            style: ConfigStyle.regularStyleThree(
              DIMEN_FOURTEEN,
              BLACK_LIGHT,
            ),
          )
        ],
      ),
    );
  }
}
