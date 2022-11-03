Flutter ads with Interstitial banners

App uses the google mobile ads plugin:

 google_mobile_ads: ^2.1.0

Find the string value of your Ad Manager app ID (identified in the Ad Manager UI) and add it in two places:

AndroidManifest.xml file

     <meta-data
           android:name="com.google.android.gms.ads.APPLICATION_ID"
           android:value="a-app-pub-################~##########"
           tools:replace="android:value" />

Info.plist

   <key>GADApplicationIdentifier</key>
   <string>a-app-pub-################~##########</string>

More information about the application can be found in article -> <INSTERT ARTICLE LINK>
