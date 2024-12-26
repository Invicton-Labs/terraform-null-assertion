# Terraform Assertion
A simple module that asserts that a condition is true. The assertion is checked during planning, unless the condition depends on a value that will only be known during apply.

The module forces Terraform to fail if the condition is false by providing an invalid input to a Terraform function. It uses the error message in the invalid input so that the resulting Terraform failure message is descriptive (although it is slightly confusing in the format; see the example below).

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
// This is where you see the real error message
var.error_message is "This Terraform configuration can only be run on Unix-based machines."

// Ignore this part
There is no function named "SEE_ABOVE_ERROR_MESSAGE".
```

## Plan, Apply, and Unknown Values

There are several edge cases regarding conditions that aren't known until apply and error messages that aren't known until apply.


### Conditions not known during planning

When the `condition` variable doesn't have a known value during the plan step, the assertion will not be checked during the plan step. The `error_message` variable will not be used or evaluated.

The `condition` _will_ still be checked during the apply step, and the `error_message` variable will be used if `condition` evaluates to `false`.


### Error messages not known during planning

When the `error_message` variable doesn't have a known value during the plan step, the behaviour will vary depending on whether the `condition` value is known during the plan step.

If `condition` is not known during planning, then the `error_message` will not be evaluated/used until the apply step, and only if `condition` evaluates to `false`.

If the `condition` _is_ known during planning and it evaluates to `false`, then the Terraform operation will fail during the plan step and the output error message will explain that the `error_message` variable value is invalid (not known).

If `condition` evaluates to `true` as soon as it's known, then `error_message` will never be used or evaluated, so it doesn't matter if it's known or not.
