# Task Distribution Chart Widget

A modern Flutter widget that displays a task distribution chart using a donut-style circular chart with interactive features.

## Features

✅ **Donut Chart**: Circular chart with customizable inner radius  
✅ **Interactive Tooltips**: Hover/tap to show name and percentage  
✅ **Center Text**: Displays selected segment info in the center  
✅ **Color Legend**: Right-side legend with colored dots  
✅ **Modern UI**: Rounded corners, drop shadow, yellow accent bar  
✅ **Responsive**: Uses flutter_screenutil for responsive design  
✅ **Customizable**: Easy to modify colors, data, and styling  

## Dependencies

Add to your `pubspec.yaml`:

```yaml
dependencies:
  syncfusion_flutter_charts: ^31.1.19
  flutter_screenutil: ^5.9.3
```

## Usage

### Basic Usage

```dart
import 'package:homekru_owner/widgets/task_distribution_chart.dart';

// In your widget
const TaskDistributionChart()
```

### Example Data Structure

The widget uses the following data structure:

```dart
class TaskDistributionData {
  final String name;        // Helper name (e.g., "Rina")
  final double percentage;  // Percentage value (e.g., 60.0)
  final Color color;        // Segment color
}
```

### Default Data

The widget comes with pre-configured data:
- **Rina**: 60% (Primary Blue)
- **Budi**: 25% (Grey)  
- **Siti**: 15% (Light Grey)

## Widget Structure

```
┌─────────────────────────────────────────┐
│ [Yellow Accent Bar]                     │
│                                         │
│  ┌─────────┐  ● Rina                    │
│  │  60%    │  ● Budi                    │
│  │  Rina   │  ● Siti                    │
│  └─────────┘                            │
│                                         │
│  Task Distribution                      │
│  Completed By Helper                    │
└─────────────────────────────────────────┘
```

## Customization

### Colors
The widget uses your app's theme colors:
- `appTheme.primaryColor` - Primary blue for Rina
- `appTheme.grey` - Dark grey for Budi  
- `appTheme.veryLightGrey` - Light grey for Siti
- `appTheme.textPrimary` - Text color
- `Colors.yellow` - Accent bar color

### Chart Properties
- **Inner Radius**: 60% (creates donut effect)
- **Tooltip**: Shows "Name : Percentage%" format
- **Interactive**: Tap segments to update center text
- **Legend**: Right-side with colored dots

## Integration

### In Dashboard
```dart
// Replace existing task distribution card
TaskDistributionChart()
```

### In List/Grid
```dart
ListView(
  children: [
    TaskDistributionChart(),
    // Other widgets...
  ],
)
```

## Technical Details

### State Management
- Uses `StatefulWidget` for interactive features
- Manages selected segment state
- Updates center text on tap

### Performance
- Efficient rendering with Syncfusion charts
- Minimal rebuilds with proper state management
- Responsive design with ScreenUtil

### Accessibility
- Tooltips provide additional context
- Color-coded legend for visual clarity
- Clear text labels and percentages

## Troubleshooting

### Common Issues

1. **Import Error**: Ensure `syncfusion_flutter_charts` is added to pubspec.yaml
2. **Theme Colors**: Make sure `appTheme` is properly configured
3. **ScreenUtil**: Ensure ScreenUtil is initialized in your app

### Dependencies
- Flutter SDK: ^3.7.0
- Dart SDK: ^3.7.0
- syncfusion_flutter_charts: ^31.1.19
- flutter_screenutil: ^5.9.3

## License

This widget is part of the Homekru Owner app and follows the same licensing terms.
