# Numverify API Coldbox Module
Coldbox module for using the Numverify phone number validation API.

## Installation
This library can be installed as a ColdBox Module. Install with a simple CommandBox command:

```
$ box install numverify
```

Alternatively the git repository can be cloned into the desired directory.

### ColdBox Module

To use, add the init arguments to the `moduleSettings` struct in `config/Coldbox.cfc`:

```cfc
moduleSettings = {
    numverify: {
        accessKey: ''
    }
}
```

You can then leverage the library via the injection DSL: `Numverify@numverify`:

```cfc
property name="Numverify" inject="Numverify@numverify";
```

## Getting Started

```cfc
// To validate a phone number with country code
validationResult = Numverify.validate("12075551212");
// OR without, but providing country ID
validationResult = Numverify.validate("2075551212","US");

// list country codes with dialling prefix
countries = Numverify.countries();
```

**numverify** is modeled after the official NumVerify API. All responses are JSON and converted to structs by the module. Documentation is here: https://numverify.com/documentation

A free account is required to get an access key.