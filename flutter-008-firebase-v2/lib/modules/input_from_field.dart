import 'package:flutter/material.dart';

// Widget을 return 하는 method
// Widget은 모든 Widget의 부모 인터페이스이다.
Widget inputFormField(
    // required는 필수로 매개변수를 전달해야하고
    // Type?는 선택적으로 전달한다. (null도 허용)
    {required FocusNode focusNode,
    String? hintText,
    String? helpText,
    required Function(String) setValue,
    required Function(String?) validator}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      focusNode: focusNode,
      validator: (value) => validator(value),
      onChanged: (value) => setValue(value),
      decoration: InputDecoration(
        hintText: hintText,
        helperText: helpText,
        helperStyle: const TextStyle(color: Colors.blue),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    ),
  );
}
