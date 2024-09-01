import os

def generate_dart_model(model_name, properties):
    # Capitalize the first letter of the model name for class naming convention
    class_name = model_name.capitalize() + "Model"
    
    # Start building the Dart class
    dart_class = f"class {class_name} {{\n"
    
    # Add final variables with types
    for prop in properties:
        if prop.endswith('?'):
            dart_class += f"  final String? {prop[:-1]};\n"
        else:
            dart_class += f"  final String {prop};\n"

    dart_class += "\n"
    
    # Add constructor
    dart_class += f"  {class_name}({{"
    constructor_args = []
    for prop in properties:
        if prop.endswith('?'):
            constructor_args.append(f"this.{prop[:-1]}")
        else:
            constructor_args.append(f"required this.{prop}")
    dart_class += ", ".join(constructor_args) + "});\n\n"
    
    # Add fromJson factory constructor
    dart_class += f"  factory {class_name}.fromJson(Map<String, dynamic> json) => {class_name}(\n"
    for prop in properties:
        if prop.endswith('?'):
            dart_class += f"      {prop[:-1]}: json['{prop[:-1]}'] as String?,\n"
        else:
            dart_class += f"      {prop}: json['{prop}'] as String,\n"
    dart_class += f"  );\n\n"
    
    # Add toJson method
    dart_class += "  Map<String, dynamic> toJson() => {\n"
    for prop in properties:
        dart_class += f"        '{prop if not prop.endswith('?') else prop[:-1]}': {prop if not prop.endswith('?') else prop[:-1]},\n"
    dart_class += "  };\n"
    
    # Close the class
    dart_class += "}"

    return dart_class

def save_dart_model_to_file(model_name, model_content):
    file_name = os.path.join(".\lib\core\data\models", model_name + "_model.dart")
    with open(file_name, "w") as file:
        file.write(model_content)


model_name = "user"
properties = ["username?", "email", "password"]
dart_model = generate_dart_model(model_name, properties)

save_dart_model_to_file(model_name=model_name,model_content=dart_model)