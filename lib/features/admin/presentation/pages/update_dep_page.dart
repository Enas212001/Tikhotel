import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_flow/core/utils/widgets/custom_app_bar.dart';
import 'package:ticket_flow/features/admin/data/models/department_model/department_model.dart';
import 'package:ticket_flow/features/admin/presentation/manager/department_cubit/department_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'widgets/update_dep_body.dart';

class UpdateDepPage extends StatelessWidget {
  const UpdateDepPage({super.key, required this.department});
  final DepartmentModel department;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => DepartmentCubit(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(text: S.of(context).updateDepartment),
              UpdateDepBody(department: department),
            ],
          ),
        ),
      ),
    );
  }
}
