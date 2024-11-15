# 3D Page Carousel in SwiftUI

This project showcases a **3D Page Carousel** built using SwiftUI. The implementation uses `TabView` and `GeometryReader` to create a visually engaging, interactive carousel with a 3D rotation effect as the user swipes between pages.

## Features

- **3D Rotation Effect**: Pages rotate dynamically as you swipe, creating a perspective effect.
- **Customizable Parameters**:
  - Perspective depth.
  - Rotation angle.
  - Number of pages.
- **Dynamic Styling**: Pages feature gradient opacities and can display custom content.
- **State Management**: Uses `@State` and `@GestureState` for smooth interactions.

## How It Works

The main components of the carousel include:

1. **`TabView`**:
   - Provides swipeable pages.
   - Styled with `.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))` to hide the default page indicators.

2. **`GeometryReader`**:
   - Captures each page's position and size to compute the 3D rotation effect.

3. **Rotation Calculation**:
   - The `rotation3DEffect` modifier is applied based on the page's X-offset (`minX`) to achieve the 3D perspective.

4. **Constants**:
   - Encapsulated within a private `Constants` enum for easy adjustment:
     - `perspective`: Controls the depth of the 3D effect.
     - `rotationAngle`: Determines the maximum rotation angle for pages.

