import 'package:abantether/core/constants/app_constants.dart';
import 'package:abantether/di/di.dart';
import 'package:abantether/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:abantether/features/profile/presentation/widgets/info_field.dart';
import 'package:abantether/features/profile/presentation/widgets/phone_field.dart';
import 'package:abantether/features/profile/presentation/widgets/profile_header.dart';
import 'package:abantether/features/profile/presentation/widgets/save_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>(),
      child: _ProfileScreen(),
    );
  }
}

class _ProfileScreen extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(profileTitle),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: BlocConsumer<ProfileCubit, ProfileState>(
                  listener: (context, state) {
                    state.whenOrNull(
                      error: (error) => ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(error ?? ''))),
                    );
                  },
                  builder: (context, state) {
                    return state.whenOrNull(
                            loading: () => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                            success: (user) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ProfileHeader(name: user.name ?? ''),
                                  const SizedBox(height: 32),
                                  InfoField(
                                    label: nameLabel,
                                    value: user.name ?? '',
                                    icon: Icons.person_outline,
                                  ),
                                  const SizedBox(height: 24),
                                  InfoField(
                                    label: emailLabel,
                                    value: user.email ?? '',
                                    icon: Icons.email_outlined,
                                  ),
                                  const SizedBox(height: 24),
                                  PhoneField(
                                      phoneNumber: user.phoneNumber ?? '',
                                      controller: phoneController),
                                  const SizedBox(height: 32),
                                  SaveButton(
                                    onPressed: () => cubit.updateUser(
                                      id: user.id ?? -1,
                                      phoneNumber: phoneController.text,
                                    ),
                                  ),
                                ],
                              )
                                  .animate()
                                  .fade(duration: const Duration(seconds: 1));
                            }) ??
                        const SizedBox();
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
