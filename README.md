# exercise1

## 1. Environment

| tool                              | version |
| --------------------------------- | ------- |
| dart                              | 2.17.5  |
| flutter                           | 3.0.3   |
| Java for gradle build for Android | 17      |
| gradle for Android                | 7.4     |



## 2. Project structure & source screenhsot

Project structure(Source code are all the dart files under lib folder)

![image-20250507201427193](README.assets/image-20250507201427193.png)

YAML dependencies(pubspec.yaml):

```yaml
name: exercise1
description: A new Flutter project.
publish_to: 'none'
version: 1.0.0+1

environment:
  sdk: ">=2.17.5 <3.0.0"
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0

flutter:
  uses-material-design: true
```

IDE: Android Studio







## 3. Design flow

The following is the demonstration of the app on Web:

![image-20250507195249017](README.assets/image-20250507195249017.png)

The above is the home page of the app, where you can add items into the shopping cart. To add an item into the shopping cart, click the "+" button of the card of the item. The card of the added item will be like as the following:

![image-20250507195643845](README.assets/image-20250507195643845.png)

The "+" button of that card gets disabled and a new "X" button appear on the top right corner of the selected card as above. You can view your selected item in your shopping cart page by clicking the bottom right floating button with a cart icon:

![image-20250507195910627](README.assets/image-20250507195910627.png)



Below is the shopping cat page, where is lists out all of your selected items and calculate the total price for you. Click the top-left back button will bring you back to home page

![image-20250507200133170](README.assets/image-20250507200133170.png)

To remove an item from the shopping cart, just click the "X" button of your selected cards. The "+" button will transit from disabled status to enabled status again. Then navigate back to the shopping cart page, the selected items will disappear.

![image-20250507200325508](README.assets/image-20250507200325508.png)

![image-20250507200432454](README.assets/image-20250507200432454.png)



To view the product information or description of any product, just click the card of that product on the home page and you will navigate to the product information page as following:

![image-20250507200637955](README.assets/image-20250507200637955.png)

![image-20250507200700013](README.assets/image-20250507200700013.png)





## 4. How to run

Web:

1. After unzipping the folder, open the `Exercise1` as the root folder of the project in Android studio

2. Select the Chrome(Web) as the device and click the run button. It should be able to open up a chrome window to run the application. This may take a while for the first time.

   ![image-20250507202416439](README.assets/image-20250507202416439.png)

3. (Note):  It is possible that the pop-up chrome window may be blank as following. In this case, you may need to refresh to make the app load in the browser.

   ![image-20250507202700893](README.assets/image-20250507202700893.png)

   

Android device:

1. **Pre-requisite:** Ensure you all follow all set-up steps in this link: https://docs.flutter.dev/get-started/install/windows/mobile

2. Plug your Android device into your computer 

3. Go to your setting > Developer Options >  enable USB debugging

4. This is my Android device as following shown in Android studio:

   ![image-20250507203131673](README.assets/image-20250507203131673.png)

4. Select your mobile device and click run. It should take some time to build for the first time.





## 5. Demo on Android physical device

1. View a product page on the device:

   ![image-20250507203653422](README.assets/image-20250507203653422.png)

   ![image-20250507203709607](README.assets/image-20250507203709607.png)

2.  Enter the shopping cart:

   ![image-20250507203908176](README.assets/image-20250507203908176.png)

   ![image-20250507203927646](README.assets/image-20250507203927646.png)

3. add an item to the shopping cart:

   ![image-20250507204011561](README.assets/image-20250507204011561.png)

   ![image-20250507204030324](README.assets/image-20250507204030324.png)

4. Remove an item from the shopping cart:

   ![image-20250507204126462](README.assets/image-20250507204126462.png)

   ![image-20250507204137524](README.assets/image-20250507204137524.png)

   



## 6. Github link

https://github.com/junior-stack/COMP5450-E1.git
