////
////  readme.swift
////  PhotoCollection
////
////  Created by BrysonSaclausa on 7/22/20.
////  Copyright © 2020 Lambda School. All rights reserved.
////
//
//import Foundation
//
//
//Part 2 - Storyboard Programmatic UI Set Up
//
//PhotoCollectionViewCell
//
//Create a function called setUpSubviews() or something along those lines. In this function:
//
//Create an image view that will display the UIImage that the photo.imageData contains.
//Create a label that will display the Photo's title.
//Constrain these views to the cell programmatically using only the NSLayoutConstraint initializer. (Yes, the long one. No anchors yet. 😉)
//You will want to call this function only once. Otherwise you will end up adding image views and labels over and over again to the cell.









//Create an updateViews() function that passes the information from the Photo to the image view and label. (If you need help turning Data into a UIImage look at UIImage's initializers in the documentation. Call this function sometime after the photo variable has been given a value from the cellForItem at method in the PhotosCollectionViewController. There are a couple places you could decide to do this.
//
//PhotoCollectionViewController
//
//Implement the following UICollectionViewDelegateFlowLayout methods. As a hint, look at what these functions want you to return:
//insetForSectionAt. The collection view does not have any insets created in the storyboard. Add them using this method.
//minimumInteritemSpacingForSectionAt. There is no spacing between items (cells) in the collection view.
//sizeForItemAt. Similarly, the cells' size in the storyboard is very small. Implement this method to give the cells a good size to display the photo and its title.
//As a stretch challenge make the cells dynamically get their size to show two cells horizontally no matter the size of the device.
//
//PhotoDetailViewController Scene
//
//Create a function called setUpSubviews() or something along those lines. In this function:
//
//Add an UIImageView to the view controller's view. You can leave its image empty in this function.
//Add a UIButton to the view controller's view. Set its title to "Add Image" and add a target to it that calls the addImage function that already exists in this view controller.
//Add a UITextField to the view controller's view. Set its placeholder to something like "Give this photo a title:". You can leave its text empty.
//Constrain the above UI elements using only NSLayoutAnchors.
//Create a UIBarButtonItem. Set its title to "Save Photo". Set its action as the savePhoto method that already exists in this view controller. Then, set it as the navigation item's right bar button item. (the documentation on UINavigationItem is your friend here). Note: a view controller subclass already has a navigationItem property built-in.
//Don't forget to call this method somewhere that makes sense!
//Create an updateViews() function that passes the information from the Photo to the image view and text field. Call this function sometime after the photo variable has been given a value from the cellForItem at method in the PhotosCollectionViewController. Again, there are a couple places you could decide to do this.
//
//ThemeSelectionViewController Scene
//
//Create a function called setUpSubviews() or something along those lines. In this function:
//Add a label that tells the user to select a theme that they would like to use.
//Add two buttons. The first's title should be "Dark" for the dark theme, and the other's should be "Blue". Add a target to each button that calls selectDarkTheme and selectBlueTheme respectively.
//Constrain these UI elements using whichever method of programmatic constraints you prefer.
//Don't forget to call this method somewhere that makes sense!
