import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/services/services_locator.dart';
import '../bloc/add_menu_bloc.dart';
import '../bloc/add_menu_event.dart';
import '../bloc/add_menu_state.dart';
import '../widgets/form.dart';

class PostNewMenuScreen extends StatefulWidget {
  const PostNewMenuScreen({super.key});

  @override
  State<PostNewMenuScreen> createState() => _PostNewMenuState();
}

class _PostNewMenuState extends State<PostNewMenuScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _skuController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _widthController = TextEditingController();
  final TextEditingController _lengthController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  String? _selectedCategory;
  final List<Map<String, dynamic>> _categories = [
    {"id": 14, "name": "Frozen Food"},
    {"id": 15, "name": "Beverages"},
    {"id": 16, "name": "Snacks"},
    {"id": 17, "name": "Dairy Products"},
  ];

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final newMenuItem = {
        "categoryId": _categories.firstWhere(
            (category) => category['name'] == _selectedCategory)['id'],
        "categoryName": _selectedCategory,
        "sku": _skuController.text,
        "name": _nameController.text,
        "description": _descriptionController.text,
        "weight": int.parse(_weightController.text),
        "width": int.parse(_widthController.text),
        "length": int.parse(_lengthController.text),
        "height": int.parse(_heightController.text),
        "image": _imageController.text,
        "price": int.parse(_priceController.text),
      };

      context.read<AddMenuBloc>().add(SubmitMenuEvent(newMenuItem));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => appServiceLocator<
            AddMenuBloc>(), // Inject AddMenuBloc from the service locator
        child: BlocConsumer<AddMenuBloc, AddMenuState>(
          listener: (context, state) {
            if (state is AddMenuSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Menu item added successfully!')),
              );
              Navigator.pop(context);
            } else if (state is AddMenuErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Add New Menu"),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      DropdownButtonFormField<String>(
                        value: _selectedCategory,
                        decoration: const InputDecoration(
                          labelText: "Category",
                        ),
                        items: _categories
                            .map((category) => DropdownMenuItem<String>(
                                  value: category['name'],
                                  child: Text(category['name']),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedCategory = value;
                          });
                        },
                        validator: (value) =>
                            value == null ? 'Please select a category' : null,
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        controller: _skuController,
                        labelText: "SKU",
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter SKU' : null,
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        controller: _nameController,
                        labelText: "Name",
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter name' : null,
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        controller: _descriptionController,
                        labelText: "Description",
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter description' : null,
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        controller: _weightController,
                        labelText: "Weight (grams)",
                        keyboardType: TextInputType.number,
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter weight' : null,
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        controller: _widthController,
                        labelText: "Width (cm)",
                        keyboardType: TextInputType.number,
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter width' : null,
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        controller: _lengthController,
                        labelText: "Length (cm)",
                        keyboardType: TextInputType.number,
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter length' : null,
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        controller: _heightController,
                        labelText: "Height (cm)",
                        keyboardType: TextInputType.number,
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter height' : null,
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        controller: _imageController,
                        labelText: "Image URL",
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter image URL' : null,
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        controller: _priceController,
                        labelText: "Price",
                        keyboardType: TextInputType.number,
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter price' : null,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: state is AddMenuLoadingState
                            ? null
                            : () => _submitForm(context),
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
