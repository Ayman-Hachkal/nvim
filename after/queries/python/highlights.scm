; extends

((identifier) @constant
 (#match? @constant "^[A-Z_][A-Z0-9_]*$"))

((identifier) @variable.constant
 (#match? @variable.constant "^[A-Z_][A-Z0-9_]*$"))
