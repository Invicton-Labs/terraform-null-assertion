# Terraform Assertion
A simple module that asserts that a condition is true. The assertion is checked during planning, unless the condition depends on a value that will only be known during apply.

The module forces Terraform to fail if the condition is false by attempting to call a non-existant external command. It uses the error message in the command name so that the resulting Terraform failure message is descriptive (although it is slightly confusing in the format; see the example below).

## Usage
```
module "assertion_unix_only" {
  source  = "Invicton-Labs/assertion/null"
  
  // The condition to ensure is TRUE
  // In this example, assert that the operating system uses forward slashes for path separators
  condition = dirname("/") == "/"
  
  // The error message to print out if the condition evaluates to FALSE
  error_message = "This Terraform configuration can only be run on Unix-based machines."
}
```

Output on Unix machines:
```
No changes. Your infrastructure matches the configuration.
```

Output on Windows machines:
```
Error: can't find external program "ERROR: This Terraform configuration can only be run on Unix-based machines."
```
