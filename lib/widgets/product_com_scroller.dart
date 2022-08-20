import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../models/detail_model.dart';

class ProductionCompaniesScroller extends StatelessWidget {
  const ProductionCompaniesScroller(this.productionCompanies, {Key? key})
      : super(key: key);

  final List<ProductionCompanies> productionCompanies;

  Widget _buildCompanies(BuildContext context, int index) {
    var companies = productionCompanies[index];
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              companies.logoPath != null
                  ? "https://image.tmdb.org/t/p/w500/${companies.logoPath}"
                  : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTy__65wzWmUssNtP3q-faLnGpQHRJkouR7MQ&usqp=CAU",
            ),
            radius: 35.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              companies.name ?? "Undefined",
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'productionCompanies',
            style: textTheme.headlineMedium!.copyWith(fontSize: 18.0),
          ).tr(),
        ),
        SizedBox.fromSize(
          size: const Size.fromHeight(120.0),
          child: ListView.builder(
            itemCount: productionCompanies.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 12.0, left: 20.0),
            itemBuilder: _buildCompanies,
          ),
        ),
      ],
    );
  }
}
