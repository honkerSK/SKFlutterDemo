# SKFlutterDemo


### 01-Json转model 
文件夹: parsing_json_demo
内容:  两种方式: 手动转model和json_serializable转model

### 02-状态管理 
文件夹: state_management
内容:
+ 1、InheritedWidget 
+ 2、Provider.of: 
+ 3、Consumer 
+ 4、Selector
+ 5、MultiProvider 多个Provider

### 03-事件监听
文件夹: event_listener
内容: 
+ 1、指针事件Pointer 
+ 2、手势识别Gesture 
+ 3、event_bus跨组件传递事件

### 04-路由管理
文件夹: router_manager
内容: 
+ 1、路由基本使用 
+ 2、命名路由使用
+ 3、路由钩子 

### 05-动画和转场
文件夹: animation
内容:
+ 1、动画基本使用
+ 2、AnimatedWidget使用
+ 3、AnimatedBuilder使用
+ 4、 交织动画
+ 5、model转场和享元动画

### 06-主题配置
文件夹: theme
内容:
+ 1、全局Theme
+ 2、局部Theme
+ 3、暗黑模式适配 darkTheme
+ 4、封装工具类 app_theme.dart

### 07-屏幕适配
文件夹: screen_adaptation
内容:
+ 1、rpx适配
+ 2、封装工具类 screen_fit.dart

### 08-基本框架搭建
文件夹: douban
内容:
+ 1、StarRating
+ 2、DashedLine
+ 3、底部TabBar

### 09-Cupertino 风格的 Flutter app
文件夹: cupertino_store
内容: 
+ 1、Cupertino 风格的 Flutter app
+ 2、SearchBar
+ 3、CupertinoTextField
+ 4、SliverList 与 SliverChildBuilderDelegate
+ 5、CupertinoSliverNavigationBar
+ 6、CupertinoTabScaffold

### 10-Flutter调用原生相机
文件夹: sk_photo_album
内容:
+ 1、使用官方插件 image_picker: ^0.6.7+2
+ 2、ImagePicker.pickImage(source: ImageSource.gallery); 获取原生相册
+ 3、建议使用 picker.getImage(source: ImageSource.camera);

### 11-获取手机电量(Flutter项目嵌入原生代码)
文件夹: sk_battery / sk_battery_objc_java
内容: 
+ 1、创建的Flutter项目，对应iOS的编程语言是Swift，对应Android的编程语言是kotlin，可以指定编程语言创建项目

```
flutter create -i objc -a java sk_battery_objc_java
```

+ 2、通过 platform.invokeMethod 调用对应平台方法时，在对应的平台实现其操作：
sk_battery 通过Swift和Kotlin实现
sk_battery_objc_java 通过Objective-C和Java实现


### 12-原生项目嵌入Flutter模块
文件夹: embed_flutter_demo
内容: 
+ 1、创建Flutter Module

```
flutter create --template module sk_flutter_module
```

+ 2、子文件夹 sk_flutter_module :  flutter 模块
+ 3、子文件夹 oc_embed_flutter : OC项目嵌入flutter 模块
+ 4、子文件夹 swift_embed_flutter : swift项目嵌入flutter 模块
+ 5、子文件夹 java_embed_flutter : java项目嵌入flutter 模块
+ 6、子文件夹 kotlin_embed_flutter : kotlin项目嵌入flutter 模块
+ 7、Flutter模块调试

```
# --app-id是指定哪一个应用程序
# -d是指定连接哪一个设备
flutter attach --app-id com.coderTao.ios-my-test -d 3D7A877C-B0DD-4871-8D6E-0C5263B986CD
```

