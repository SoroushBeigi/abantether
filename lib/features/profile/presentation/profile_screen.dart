import 'package:abantether/core/constants/app_constants.dart';
import 'package:abantether/di/di.dart';
import 'package:abantether/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                          success: (user) => Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildProfileHeader(user.name ?? ''),
                              const SizedBox(height: 32),
                              _buildInfoField(
                                label: nameLabel,
                                value: user.name ?? '',
                                icon: Icons.person_outline,
                              ),
                              const SizedBox(height: 24),
                              _buildInfoField(
                                label: emailLabel,
                                value: user.email ?? '',
                                icon: Icons.email_outlined,
                              ),
                              const SizedBox(height: 24),
                              _buildEditablePhoneField(
                                  phoneNumber: user.phoneNumber ?? '',
                                  controller: phoneController),
                              const SizedBox(height: 32),
                              _buildSaveButton(
                                  onPressed: () => cubit.updateUser(
                                        id: user.id ?? -1,
                                        phoneNumber: phoneController.text,
                                      )),
                            ],
                          ),
                        ) ??
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

  Widget _buildProfileHeader(String name) {
    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue.shade100,
          ),
          child: Icon(
            Icons.person,
            size: 60,
            color: Colors.blue.shade800,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoField({
    required String label,
    required String value,
    required IconData icon,
  }) {
    return TextFormField(
      initialValue: value,
      enabled: false,
      style: TextStyle(
        color: Colors.grey.shade800,
      ),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 1.0,
          ),
        ),
        contentPadding: const EdgeInsets.all(16),
        filled: true,
        fillColor: Colors.grey.shade100,
      ),
    );
  }

  Widget _buildEditablePhoneField(
      {String? phoneNumber, required TextEditingController controller}) {
    controller.text = phoneNumber ?? '';
    return TextFormField(
      controller: controller,
      enabled: true,
      keyboardType: TextInputType.phone,
      style: TextStyle(
        color: Colors.grey.shade800,
      ),
      decoration: InputDecoration(
        labelText: phoneLabel,
        prefixIcon: const Icon(Icons.phone_iphone, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 1.0,
          ),
        ),
        contentPadding: const EdgeInsets.all(16),
        suffixIcon: const Icon(Icons.edit, color: Colors.grey),
        hintText: phoneHint,
        fillColor: Colors.white,
      ),
    );
  }

  Widget _buildSaveButton({required void Function()? onPressed}) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade800,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      icon: const Icon(
        Icons.save_outlined,
        color: Colors.white,
      ),
      label: const Text(
        saveChanges,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
