import 'package:app_laundry/app/router/paths/company_paths.dart';
import 'package:app_laundry/features/company/domain/entities/company_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CompanyFab extends StatelessWidget {
  final CompanyEntity company;
  const CompanyFab({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'fab_company',
      onPressed: () async {
        await context.pushNamed(CompanyPaths.companyFormName, extra: company);
      },
      child: const Icon(Icons.edit_outlined),
    );
  }
}
