import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_flow/core/utils/widgets/custom_app_bar.dart';
import 'package:ticket_flow/features/admin/presentation/manager/department_cubit/department_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'widgets/add_dep_body.dart';

class AddDepartmentPage extends StatelessWidget {
  const AddDepartmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => DepartmentCubit(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(text: S.of(context).addDepartment),
              AddDepBody(),
            ],
          ),
        ),
      ),
    );
  }
}
