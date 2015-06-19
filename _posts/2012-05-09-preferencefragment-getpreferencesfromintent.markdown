---
layout: post
title: "PreferenceFragment.getPreferencesFromIntent"
date: 2012-05-09 15:37
comments: true
categories: [Android, Java, Honeycomb, ICS]
---

One of the new classes that Honeycomb introduced was the [PreferenceFragment](http://developer.android.com/reference/android/preference/PreferenceFragment.html). This class is meant to simplify the creatation of a setting / preferences screen in Android applications. It handles a lot of the displaying, saving, and changing of an application's settings. There are a couple of ways to create a `PreferenceFragment`. The simplest way is to subclass, override `onCreate()` and then use either `getPreferencesFromResource` or `getPreferencesFromIntent`.

There are many examples on how to use `getPreferencesFromResource`, but I noticed that there aren't that many on how to use `getPreferencesFromIntent`. Here is one such quick example.

<!-- more -->

The first thing to do is to create your `PreferenceFragment` and provide it with an Intent that identifies an Activity. This Activity will have some meta-data associated with it that the `PreferenceFragment` will use to create it's layout (more on this later)

``` Java [MyPreferenceFragment.java] 
public class MyPreferenceFragment extends PreferenceFragment  {
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState); 
        Intent intent = new Intent(getActivity(), MyActivityWithPreferences.class );
        addPreferencesFromIntent(intent);
    }
}
```

The next step is to create the Activity `MyActivityWithPreferences` (if you don't already have it). The code inside the Activity doesn't matter so much - what is important is how the Activity is declared in `AndroidManifest.xml`.  I provide `AndroidManifest.xml` here:

``` xml [AndroidManifest.xml]
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
          package="com.example"
          android:versionCode="1"
          android:versionName="1.0">
    <uses-sdk android:minSdkVersion="15"/>
    <application android:label="@string/app_name" android:icon="@drawable/ic_launcher">
        <activity android:name="MyActivity"
                  android:label="@string/app_name">
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
        <activity android:name=".MyActivityWithPreferences">
            <meta-data android:name="android.preference" android:resource="@xml/preference_from_intent"/>
        </activity>
    </application>
</manifest>
```

Notice on line 16 the `meta-data` element that was added as a child of the `activity` element. `PreferenceFragment` will use the resource file `res/xml/preference_from_intent.xml` and inflate a preference heirarchy using that XML file. Here is an example one such XML file:

``` xml [res/xml/preference_from_intent.xml] 
<?xml version="1.0" encoding="utf-8"?>

<PreferenceScreen xmlns:android="http://schemas.android.com/apk/res/android">

  <PreferenceCategory android:title="Inline Preferences">
    <CheckBoxPreference android:key="checkbox_preference"
                        android:title="Checkbox Preference Title"
                        android:summary="Checkbox Preference Summary" />

  </PreferenceCategory>

  <PreferenceCategory android:title="Dialog Based Preferences">

    <EditTextPreference android:key="edittext_preference"
                        android:title="EditText Preference Title"
                        android:summary="EditText Preference Summary"
                        android:dialogTitle="Edit Text Preferrence Dialog Title" />

  </PreferenceCategory>

  <PreferenceCategory android:title="Launch Preferences">

    <PreferenceScreen android:key="screen_preference"
                      android:title="Title Screen Preferences"
                      android:summary="Summary Screen Preferences">

      <CheckBoxPreference android:key="next_screen_checkbox_preference"
                          android:title="Next Screen Toggle Preference Title"
                          android:summary="Next Screen Toggle Preference Summary" />

    </PreferenceScreen>

    <PreferenceScreen android:title="Intent Preference Title"
                      android:summary="Intent Preference Summary">

      <intent android:action="android.intent.action.VIEW"
              android:data="http://www.android.com" />

    </PreferenceScreen>

  </PreferenceCategory>

</PreferenceScreen>
```

