# View
Here I list all the modifiers that are available on a `View` object. Documentation [here](https://developer.apple.com/documentation/swiftui/view)
## 1 Configuring view elements
### 1.1 Accessibility modifiers
TODO
### 1.2 Appearance modifiers
#### 1.2.1 Colors and patterns
```
backgroundStyle
foregroundStyle
foregroundColor
```
#### 1.2.2 Tint
```
tint
listRowSeparatorTint
listSectionSeparatorTint
listItemTint
```
#### 1.2.3 Light and dark appearance
```
preferredColorScheme
```
#### 1.2.4 Foreground elements
```
border
overlay
```
#### 1.2.5 Background elements
```
background
listRowBackground
scrollContentBackground
```
#### 1.2.6 Control configuration
```
defaultWheelPickerItemHeight
horizontalRadioGroupLayout
controlSize
buttonBorderShape
headerProminence
scrollDisabled
scrollBounceBehavior
menuOrder
menuActionDismissBehavior
```
#### 1.2.7 Privacy and redaction
```
privacySensitive
redacted
unredacted
```
#### 1.2.8 Visibilty
```
hidden
labelsHidden
menuIndicator
listRowSeparator
listSectionSeparator
presistentSystemOverlays
scorllIndicators
```
#### 1.2.9 Widget configuration
```
widgetAccentable
widgetLabels
dynamicIsland
```
### 1.3 Text and symbol modifiers
#### 1.3.1 Fonts
```
font
```
#### 1.3.2 Dynamic type
```
dynamicTypeSize
```
#### 1.3.3 Text style
```
bold
fontDesign
fontWeight
fontWidth
italic
monospaced
monospacedDigit
strikethrough
textCase
underline
```
#### 1.3.4 Text layout
```
allowsTightening
baselineOffset
flipsForRightToLeftLayoutDirection
kerning
minimumScaleFactor
tracking
truncationMode
```
#### 1.3.5 Multiline text
```
lineLimit
lineSpacing
multilineTextAlignment
```
#### 1.3.6 Text selection
```
textSelection
```
#### 1.3.7 Text entry
```
autocorrection
keyboardType
scrollDismissesKeyboard
textInputAutocapitalization
textContentType
```
#### 1.3.8 Find and replace
```
findNavigator
findDisabled
replaceDisabled
```
#### 1.3.9 Symbol appearance
```
symbolRenderingMode
symbolVariant
```
### 1.4 Auxiliary view modifiers
#### 1.4.1 Navigation titles
```
navigationTitle
navigationSubtitle
```
#### 1.4.2 Navigation title configuration
```
navigationDocument
```
#### 1.4.3 Navigation bars
```
navigationBarBackButtonHidden
navigationBarTitleDisplayMode
```
#### 1.4.4 Navigation stacks and columns
```
navigationDestination
navigationSplitViewColumnWidth
```
#### 1.4.5 Tab views
```
tabItem
```
#### 1.4.6 Toolbars
```
toolbar
toolbarBackground
toolbarColorScheme
toolbarRole
toolbarTitleMenu
```
#### 1.4.7 Context menus
```
contextMenu
```
#### 1.4.8 Badges
```
badge
```
#### 1.4.9 Help text
```
help
```
#### 1.4.10 Status bar
```
statusBarHidden
```
#### 1.4.11 Touch Bar
```
touchBar
touchBarItemPrincipal
touchBarCustomizationLabel
touchBarItemPresence
```
### 1.5 Chart view modifiers
#### 1.5.1 Styles
```
chartBackground
chartForegroundStyleScale
chartPlotStyle
```
#### 1.5.2 Legends
```
chartLegend
```
#### 1.5.3 Overlays
```
chartOverlay
```
#### 1.5.4 Axes
```
chartXAxis
chartYAxis
```
#### 1.5.5 Axis labels
```
chartXAxisLabel
chartYAxisLabel
```
#### 1.5.6 Axis scales
```
chartXScale
chartYScale
```
#### 1.5.7 Symbol scales
```
chartSymbolScale
```
#### 1.5.8 Symbol size scales
```
chartSymbolSizeScale
```
#### 1.5.9 Line style scales
```
chartLineStyleScale
```
## 2. Drawing views
### 2.1 Style modifiers
#### 2.1.1 Controls

```
buttonStyle
datePickerStyle
menuStyle
pickerStyle
toggleStyle
```

#### 2.1.2 Indicators

```
guageStyle
progressViewStyle
```

#### 2.1.3 Text

```
labelStyle
textFieldStyle
```

#### 2.1.4 Collections

```
listStyle
tableStyle
disclosureGroupStyle
```

#### 2.1.5 Presentation

```
navigationSplitViewStyle
tabViewStyle
presentedWindowStyle
presentedWindowToolbarStyle
```

#### 2.1.6 Groups

```
controlGroupStyle
groupBoxStyle
indexViewStyle
```

### 2.2 Layout modifiers
#### 2.2.1 Size

```
frame
fixedSize
layoutPriority
```

#### 2.2.2 Position

````
position
offset
coordinateSpace
````

#### 2.2.3 Alignment

```
alignmentGuide
```

#### 2.2.4 Padding
#### 2.2.5 Grid configuration
#### 2.2.6 Safe area
#### 2.2.7 Layer order
### 2.3 Graphics and rendering modifiers
#### 2.3.1 Masks and clipping
#### 2.3.2 Scale
#### 2.3.3 Rotation and transformation
#### 2.3.4 Graphical effects
#### 2.3.5 Composites
#### 2.3.6 Animations
## 3. Providing interactivity
### 3.1 Input and event modifiers
#### 3.1.2 Interactivity
#### 3.1.3 List controls
#### 3.1.4 Taps and gestures
#### 3.1.5 Keyboard shortcuts
#### 3.1.6 Hover
#### 3.1.7 Focus
#### 3.1.8 Copy and paste
#### 3.1.9 Drag and drop
#### 3.1.10 Submission
#### 3.1.11 Movement
#### 3.1.12 Deletion
#### 3.1.13 Commands
#### 3.1.15 User activities
#### 3.1.16 View life cycle
#### 3.1.17 File renaming
#### 3.1.18 URLs
#### 3.1.19 Publisher events
#### 3.1.20 Hit testing
#### 3.1.21 Content shape
#### 3.1.22 Import and export
#### 3.1.23 App intents
### 3.2 Search modifiers
#### 3.2.1 Displaying a search interface
#### 3.2.2 Searching with tokens
#### 3.2.3 Making search suggestions
#### 3.2.4 Limiting search scope
### 3.3 Presentation modifiers
#### 3.3.1 Alerts
#### 3.3.2 Alerts with message
#### 3.3.3 Confirmation dialogs
#### 3.3.4 Confirmation dialogs with a message
#### 3.3.5 Sheets
#### 3.3.6 Popovers
#### 3.3.7 Sheet and popover configuration
#### 3.3.8 File managers
#### 3.3.9 Quick look previews
#### 3.3.10 Family sharing
#### 3.3.11 Live activities
#### 3.3.12 Apple music
#### 3.3.13 StoreKit
#### 3.3.14 PhotoKit
### 3.4 State modifiers
#### 3.4.1 Identity
#### 3.4.2 Environment values
#### 3.4.3 Preferences
#### 3.4.4 Default storage

