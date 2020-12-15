## 1.1. 简单的 Java 程序

    // 将 .java 文件编译成 .class 文件
    javac App.java

    // 执行 App.class 文件
    java App

## 包引入机制

同目录下直接使用

不同目录下声明 package

## 将 class 文件变成 jar 包并引用

    javac -classpath ./Tools.jar:. App.java

    java -classpath ./Tools.jar:. App


