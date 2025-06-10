# Keep awesome_notifications classes
-keep class me.carda.awesome_notifications.** { *; }
-keep class androidx.core.app.** { *; }
-keep class androidx.core.content.** { *; }
-keep class androidx.work.** { *; }

# Keep notification-related classes
-keep class android.app.Notification { *; }
-keep class android.app.NotificationChannel { *; }
-keep class android.app.NotificationChannelGroup { *; }
-keep class android.app.NotificationManager { *; }
-keep class android.support.v4.app.NotificationCompat { *; }
-keep class android.support.v4.app.NotificationManagerCompat { *; }

# Keep the entry point for notification events
-keep class * extends me.carda.awesome_notifications.core.broadcasters.receivers.** { *; }

# Keep Google Guava related classes
-keep class com.google.common.** { *; }
-keep interface com.google.common.** { *; }
-dontwarn com.google.common.**
-dontwarn com.google.j2objc.annotations.**
-dontwarn java.lang.ClassValue
-dontwarn org.codehaus.mojo.animal_sniffer.IgnoreJRERequirement

# Keep ShortcutBadger
-keep class me.leolin.shortcutbadger.** { *; }

# Play Core
-keep class com.google.android.play.core.** { *; }
-keep interface com.google.android.play.core.** { *; }

# Flutter and Flutter plugins
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }
-dontwarn io.flutter.embedding.** 