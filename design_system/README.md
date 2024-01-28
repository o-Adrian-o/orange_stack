<p align="center">
  <a href="https://flutter.dev">
    <img src="https://img.shields.io/badge/Platform-Flutter-02569B?logo=flutter"
      alt="Platform" />
  </a>
  <a href="https://opensource.org/licenses/MIT">
    <img src="https://img.shields.io/github/license/o-adrian-o/DesignSystemBasics?color=red"
      alt="License: MIT" />
  </a>
</p><br>

# Table of contents

- [Features](#features)
- [Getting started](#getting-started)
- [Usage](#usage)
- [Additional information](#additional-information)

## Features

This package defines standard values which should be used in your app in order to create a visual cohesion between elements.
- Colors
  - Neutral
  - Primary
  - Error
  - Warning
  - Success
- Dimensions
  - Container
  - Radius
  - Spacing
- Effects
  - Blur
  - Shadow
- Icons
  - Common
- Typography
  - FontSize
  - FontWeight

It has been carefully crafted by looking at different state-of-the-art design systems throughout the industry.

## Getting started

Clone the repo & add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  orange_design_system:
    path: "../orange_design_system"
```

## Usage

Start by initializing the color palette when the app starts.

```dart
DesignColor.neutral = DesignColor.fromColor(color: const Color(0xff667A8E));
DesignColor.primary = DesignColor.fromColor(color: const Color(0xff2BA4E0));
DesignColor.error = DesignColor.fromColor(color: const Color(0xffF54720));
DesignColor.warning = DesignColor.fromColor(color: const Color(0xffFAD21E));
DesignColor.success = DesignColor.fromColor(color: const Color(0xff73E167));
```

Use Design elements wherever needed.

```dart
// Color
DesignColor.primary.shade300

// Dimensions
DesignContainer.c640
DesignRadius.r4
DesignSpacing.s4

// Effects
DesignBlur.b8
DesignShadow.s8

// Icons
DesignIcon.common.arrowLeft

// Typography
DesignFontSize.s48
DesignFontWeight.bold
```

## Additional information

See the included project for example implementations.