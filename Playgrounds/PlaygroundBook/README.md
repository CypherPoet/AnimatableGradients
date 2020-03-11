#  Playground Book Xcode Project #

## Overview ##

Welcome to the Playground Book Xcode project! This Xcode project is set up to produce two things:

- A playground book
- An app for debugging the live view

In support of this, there are five targets in this Xcode project:

- **PlaygroundBook**: Produces a playground book as its output
- **BookCore**: Compiles the *BookCore* auxiliary module, an auxiliary module that contains the implementation of the live view and any other author-only functionality
- **BookAPI**: Compiles the *BookAPI* auxiliary module, an auxiliary module that is automatically imported into all user code throughout the book
- **UserModule**: Compiles the *UserModule* user module, a blank user module where users may write code
- **LiveViewTestApp**: Produces an app which uses the `Book_Sources` module to show the live view similarly to how it would be shown in Swift Playgrounds

This project includes the PlaygroundSupport and PlaygroundBluetooth frameworks from Swift Playgrounds to allow the BookCore, BookAPI, UserModule, and LiveViewTestApp targets to take full advantage of those APIs. The supporting content included with this template, including these frameworks, requires Xcode 11.1 to build. Attempting to use this template with another version of Xcode may result in build errors.

For more information about the playground book file format, see the *[Swift Playgrounds authoring documentation](https://developer.apple.com/go/?id=swift-playgroundbook-authoring)*.

## First Steps ##

To get started with this Xcode project, you need to make a few changes to personalize it for your playground book.

1. Open `BuildSettings.xcconfig` (in the “Config Files” group in the Project navigator) and make the following modifications:

  - Set `BUNDLE_IDENTIFIER_PREFIX` to a value appropriate for your team
  - Set `PLAYGROUND_BOOK_FILE_NAME` to a value appropriate for your playground book

You may also modify `PLAYGROUND_BOOK_CONTENT_VERSION` to set the `ContentVersion` in the book's `Manifest.plist`. `PLAYGROUND_BOOK_CONTENT_IDENTIFIER` may also be modified to customize to set a specific `ContentIdentifier` in the book's `Manifest.plist`. (It defaults to a value based on `BUNDLE_IDENTIFIER_PREFIX` and `PLAYGROUND_BOOK_FILE_NAME`.)

2. Open `ManifestPlist.strings` (in the “PrivateResources” group in the “PlaygroundBook” group in the Project navigator) and modify the values of the strings to be appropriate for your playground book.

3. Open the Project Editor, select the LiveViewTestApp target, and select the appropriate Team in the Signing section. (This step is not required if you are only testing with the iOS Simulator.)

Once you've finished configuring the project, you can build the PlaygroundBook target, which will produce your playground book as a product. (You can access it by opening the “Products” group in the Project navigator, and then right-clicking and selecting “Show in Finder”. From there, you can use AirDrop or other methods to copy the playground book to an iPad running Swift Playgrounds, or double-click it to import it into Swift Playgrounds on your Mac.)

## Common Tasks ##

This Xcode project is structured both in Xcode and on-disk in a very particular way to ensure that the book is assembled correctly. Below are guides for accomplishing some common tasks when creating your playground book.

### Adding a New Auxiliary or User Module ###

An auxiliary module is a Swift module which vends an API to the playground book without exposing the sources. A user module is a Swift module where the sources are fully editable by users. (For more information about auxiliary and user modules, see the *[Swift Playgrounds authoring documentation](https://developer.apple.com/go/?id=swift-playgroundbook-authoring)*.)

To create an auxiliary module or user module, you need to create the right folder structure on-disk. You also need to create a static library target which builds the sources to get editor features such as code completion and live issues. This can be accomplished by performing the following steps:

  1. In the Project navigator, expand the “PlaygroundBook” group
  2. If you are adding an auxiliary module, expand the “Modules” group. If you are adding a user module, expand the “UserModules” group.
  3. Control-click (or right-click) on the “Modules” or “UserModules” group
  4. Choose “New Group” from the context menu
  5. Name the newly-created group `ModuleName.playgroundmodule`, where “ModuleName” is the name of the module you are creatinng
  6. Control-click (or right-click) on the newly-created group
  7. Choose "New Group" from the context menu
  8. Name the newly-created group `Sources`
  9. Control-click (or right-click) on the newly-created group
  10. Choose “New File…” from the context menu, and create a new Swift file using the assistant
  11. Select the top-level Xcode project from the Project navigator
  12. In the Editor menu, select “Add Target…”
  13. Select the iOS platform at the top of the assistant, choose the “Static Library” template, and click the Next button
  14. In the “Product Name” field, put the name of the module, matching the name of the “ModuleName” you chose in step 5
  15. Fill in the other fields and click the Finish button
  16. In the Project editor, select the project itself, and then select the Info tab
  17. In the Configurations outline view, expand all build configurations
  18. For each build configuration, in the row for the newly-added target, click “None” and choose “ModuleOverridingBuildSettings” from the pop-up menu
  19. In the Project editor, select the newly-added target, and then select the Build Settings tab
  20. Click “All” in the filter bar to show all build settings
  21. Click on a build setting to select it, and then open the Edit menu and click “Select All”
  22. Press the Delete key on your keyboard to remove all build setting overrides at the target level
  23. Select the Build Phases tab
  24. Expand the “Compile Sources” build phase
  25. Remove the source file that is listed in the “Compile Sources” build phase
  26. From the Project navigator, drag the source file added in step 10 into the “Compile Sources” build phase
  27. In the Project navigator, locate the group named after the target added in steps 12—15 (i.e. “ModuleName” **without** the “.playgroundbook” extension)
  28. Control-click (or right-click) on this group
  29. Choose “Delete” from the context menu
  30. Select “Move to Trash” in the confirmation dialog to delete the source files

These steps give you a configured, standalone auxiliary or user module. As you’re using the module you’ve just created, it’s important to confirm the following things:

  - The source files for the auxiliary or user module **must** be inside of the “Sources” folder in the “ModuleName.playgroundmodule” folder in the “Modules” or “UserModules” folder on-disk. If not, they will not be copied into the final playground book
  - You must specify explicit target dependencies in the Project editor to ensure that the modules build in the correct order
  - If you want to use this module from LiveViewTestApp, you must specify an explicit target dependency from LiveViewTestApp to this module

### Deleting an Auxiliary or User Module ###

To delete an auxiliary module or user module, you need to delete three things: the target for the library which builds the module, the group in the Xcode project for the module, and the on-disk folder for the module. This can be accomplished by performing the following steps:

  1. Select the top-level Xcode project from the Project navigator
  2. Select the target for the module you wish to delete
  3. Control-click (or right-click) on the target for the module
  4. Choose “Delete” from the context menu and confirm the deletion
  5. Control-click (or right-click) on the group for the module you wish to delete in the Project navigator (e.g. ModuleName.playgroundmodule)
  6. Choose “Delete” from the context menu
  7. Select “Move to Trash” in the confirmation dialog to delete the source files
  8. Expand the “Supporting Content” group (a child of the “PlaygroundBook” group) in the Project navigator
  9. Find the module you wish to delete in the “Modules” or “UserModules” folder
  10. Control-click (or right-click) on the folder for the module you wish to delete
  11. Choose “Delete” from the context menu and confirm the deletion

### Renaming an Auxiliary or User Module ###

To rename an auxiliary or user module, rename both the “ModuleName.playgroundmodule” group and “ModuleName” target to the new name (e.g. “NewModuleName.playgroundmodule” and “NewModuleName”, respectively). If you are renaming an auxiliary module which is in the `UserAutoImportedAuxiliaryModules` array in the book-level Manifest.plist, you will need to rename it there as well; otherwise, no further changes are required.

### Adding Sources to an Auxiliary or User Module ###

In order to work correctly throughout this project, source files must be added to the Xcode project, to the module's static library target, and to the `ModuleName.playgroundmodule/Sources` folder on disk. To add a new source file, you can either use the *File > New > File…* menu item, or right-click on the “Sources” group in the “ModuleName.playgroundmodule” group in the Project navigator and select *New File…*.

In the assistant, select the appropriate template (either “Swift File” or “Cocoa Touch Class”, typically). When the assistant presents a sheet to save the new file, ensure the following is true:

  - The destination of the save sheet is the `Sources` directory inside of the `ModuleName.playgroundmodule` directory (where “ModuleName” is the name of the module to which you are adding a source file)
  - The new source file is being added to the ModuleName target (and no others)

Adding a source file to the previously-mentioned “Sources” group should default to a location where both of those are true.

If a source file is not in the correct `Sources` directory on-disk, then it will not be copied into the correct location in the final playground book and will not be usable in Swift Playgrounds.

If a source file is not a member of the module's static library target, then it will not be compiled in Xcode. This means that syntax highlighting, code completion, and other editor features will not work in that source file, and the API it provides will not be usable in other source files in the project.

**Note**: Only Swift sources are supported in playground books. This Xcode project will not enforce that requirement, but if any non-Swift source files are present in the final playground book, Swift Playgrounds will ignore them.

### Adding Book-Level PrivateResources ###

To add content to the book-level `PrivateResources` directory, add the resource file to the Xcode project, and ensure it is a member of the “Copy Bundle Resources” build phase of the PlaygroundBook target. It will be compiled if necessary (as is the case for xibs, storyboards, asset catalogs, and some other resource types) and then copied in to the playground book's `PrivateResources` directory.

### Adding Book-Level PublicResources ###

This Xcode project does not support book-level `PublicResources` by default. To add a `PublicResources` directory to your book, do the following:

  1. Create `PublicResources` directory in Finder in the `PlaygroundBook` directory
  2. Add the `PublicResources` directory to the “PlaygroundBook” group in Xcode as a folder reference (not as a group reference)
  3. Add the `PublicResources` directory to the “Copy Book Contents” build phase in the PlaygroundBook target in the Project editor

Unlike `PrivateResources`, the contents of the `PublicResources` directory are only copied. They will not be compiled; if you use compiled resources, you must treat them as `PrivateResources`.

### Adding Chapters, Pages, or Chapter- or Page-Level Content ##

This Xcode project has limited support for editing the chapters and pages in your playground book. The `Chapters` directory is present in the Xcode project as a folder. You may add `.playgroundchapter` packages there, and they will automatically be copied into the final playground book.

When adding a chapter or a page, you must also edit the book's or chapter's `Manifest.plist` file to reference the new chapter or page.

This Xcode project does not support syntax highlighting, code completion, live issues, or other advanced editor features inside of chapters and pages. It is therefore recommended that as much source code as possible be included in the auxiliary modules, and that the chapters and pages have as little source code as possible.

### Testing the Live View ###

This Xcode project includes support for testing your playground book's live view. This testing support assumes that the live view for your playground book is implemented in BookCore auxiliary module. If it is implemented elsewhere (i.e. in a page's `Contents.swift` or `LiveView.swift` file), then it cannot easily be tested using this mechanism.

To test your live view, run the LiveViewTestApp app. This app, which works on iPad, in the iOS Simulator, and as a Mac Catalyst app, is capable of displaying a live view in a manner similar to how Swift Playgrounds would display it. Most notably, LiveViewTestApp will correctly configure the live view safe area layout guides exposed by the PlaygroundSupport framework.

To configure your live view, implement the `setUpLiveView()` method in `AppDelegate.swift`. This should return a `UIView` or `UIViewController` which is ready to be used as the live view.

By default, LiveViewTestApp will run your live view in full screen. LiveViewTestApp is also able to run your live view in a side-by-side view (as if it were in Swift Playgrounds with the source code editor either next to or below the live view). To enable this, make the `liveViewConfiguration` property in `AppDelegate.swift` return `.sideBySide` instead of `.fullScreen`.
