# PhotoCollection - Programmatic Constraints

## Introduction

You may have created this application in the past, however you will be laying out the UI elements programmatically using the `NSLayoutConstraint` and `NSLayoutAnchor` APIs for this module project. The application allows a user to add photos from their photo library to a collection of photos in a `UICollectionView`. It will also let the user select a theme and it will persist that preference between launches of the app using `UserDefaults`.

Please look at the screen recording below to get an idea of what the finished project should look like. Use this screen recording as a guideline; you are free to change colors and tweak the constraints as you see fit. Don't stress about making your project look the _exact_ same as this:

![](https://user-images.githubusercontent.com/16965587/43599465-e822d442-9644-11e8-8dda-e2d939eb8e7d.gif)

## Instructions

Please fork and clone this repository. This repository contains a starter project.

**Be regularly committing and pushing your code as appropriate.**

### Part 1

First, familiarize yourself with the code in the starter project. Much of the model and model controller code is given to you. 

Most of what you will be doing is writing code that takes the place of what you would be doing in the storyboard. If you look in the Main.storyboard, the view controllers still exist but are largely empty, with only the elements for navigation still there. You should not need to modify the storyboard file in any way.

### Part 2 - ~~Storyboard~~ Programmatic UI Set Up

#### PhotoCollectionViewCell

1. Create a function called `setUpSubviews()` or something along those lines. In this function:

    - Create an image view that will display the `UIImage` that the `photo.imageData` contains.
    - Create a label that will display the `Photo`'s `title`. 
    - Constrain these views to the cell programmatically using only the `NSLayoutConstraint` initializer. (Yes, the long one. No anchors yet. 😉)
    - You will want to call this function only once. Otherwise you will end up adding image views and labels over and over again to the cell.
  
2. Create an `updateViews()` function that passes the information from the Photo to the image view and label. (If you need help turning `Data` into a `UIImage` look at `UIImage`'s initializers in the documentation. Call this function sometime after the `photo` variable has been given a value from the `cellForItem at` method in the `PhotosCollectionViewController`. There are a couple places you could decide to do this.

#### PhotoCollectionViewController

1. Implement the following `UICollectionViewDelegateFlowLayout` methods. As a hint, look at what these functions want you to return:
    - `insetForSectionAt`. The collection view does not have any insets created in the storyboard. Add them using this method.
    - `minimumInteritemSpacingForSectionAt`. There is no spacing between items (cells) in the collection view. 
    - `sizeForItemAt`. Similarly, the cells' size in the storyboard is very small. Implement this method to give the cells a good size to display the photo and its title.

**As a stretch challenge** make the cells dynamically get their size to show two cells horizontally no matter the size of the device.

#### PhotoDetailViewController Scene

1. Create a function called `setUpSubviews()` or something along those lines. In this function:
    - Add an `UIImageView` to the view controller's `view`. You can leave its image empty in this function.
    - Add a `UIButton` to the view controller's `view`. Set its title to "Add Image" and add a target to it that calls the `addImage` function that already exists in this view controller.
    - Add a `UITextField` to the view controller's `view`. Set its `placeholder` to something like "Give this photo a title:". You can leave its `text` empty. 
    - Constrain the above UI elements **using only `NSLayoutAnchor`s**.
    - Create a `UIBarButtonItem`. Set its title to "Save Photo". Set its action as the `savePhoto` method that already exists in this view controller. Then, set it as the navigation item's right bar button item. (the documentation on `UINavigationItem` is your friend here). **Note:** a view controller subclass already has a `navigationItem` property built-in.
    - Don't forget to call this method somewhere that makes sense!

2. Create an `updateViews()` function that passes the information from the `Photo` to the image view and text field. Call this function sometime after the `photo` variable has been given a value from the `cellForItem at` method in the `PhotosCollectionViewController`. Again, there are a couple places you could decide to do this.

#### ThemeSelectionViewController Scene

1. Create a function called `setUpSubviews()` or something along those lines. In this function:
    - Add a label that tells the user to select a theme that they would like to use.
    - Add two buttons. The first's title should be "Dark" for the dark theme, and the other's should be "Blue". Add a target to each button that calls `selectDarkTheme` and `selectBlueTheme` respectively.
    - Constrain these UI elements using whichever method of programmatic constraints you prefer.
    - Don't forget to call this method somewhere that makes sense! 
  
## Go Further

- Commit your final working version with the above requirements, then customize the layout of this application to futher practice your programmatic constraining skills.
