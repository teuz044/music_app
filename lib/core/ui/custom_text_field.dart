import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String titulo;
  final Icon? icone;
  final int? maxLines;
  final bool? isRequired;
  final double? borderRadius;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.titulo,
     this.icone,
    this.isRequired, this.maxLines, this.borderRadius,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLines,
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.titulo,
        suffixIcon: widget.icone,
        alignLabelWithHint: true,
        border:  OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius ?? 20)),
        ),
      ),
      validator: (value) {
        if (widget.isRequired != null && widget.isRequired!) {
          if (value == null || value.isEmpty) {
            return 'Campo obrigatório';
          }
        }
        return null;
      },
    );
  }
}
