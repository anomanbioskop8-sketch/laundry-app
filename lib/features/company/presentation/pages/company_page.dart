// =============================================================================
// File        : company_page.dart
// Path        : lib/features/company/presentation/pages/company_page.dart
// Layer       : Presentation
// -----------------------------------------------------------------------------
// Fungsi:
// - Menampilkan informasi company aktif
// - Menggunakan SessionCubit sebagai source authenticated tenant
// =============================================================================

import 'package:app_laundry/core/base/builders/base_stream_builder.dart';
import 'package:app_laundry/core/constants/company_strings.dart';
import 'package:app_laundry/core/ui/states/app_empty_widget.dart';
import 'package:app_laundry/features/company/domain/entities/company_entity.dart';
import 'package:app_laundry/features/company/presentation/cubit/company_cubit.dart';
import 'package:app_laundry/features/company/presentation/widgets/company_fab.dart';
import 'package:app_laundry/features/company/presentation/widgets/info_company_view.dart';
import 'package:flutter/material.dart';

class CompanyPage extends StatelessWidget {
  const CompanyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Company')),

      body: BaseStreamBuilder<CompanyCubit, CompanyEntity>(
        empty: AppEmptyWidget(message: CompanyStrings.empty),
        builder: (data) {
          final company = data.first;
          return InfoCompanyView(company: company);
        },
      ),

      floatingActionButton: BaseStreamBuilder<CompanyCubit, CompanyEntity>(
        builder: (data) {
          final company = data.first;

          return CompanyFab(company: company);
        },
      ),
    );
  }
}
