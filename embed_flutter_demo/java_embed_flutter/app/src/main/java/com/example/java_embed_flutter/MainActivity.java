package com.example.java_embed_flutter;

import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;
import io.flutter.embedding.android.FlutterActivity;

//import android.os.Bundle;
//
//import com.google.android.material.floatingactionbutton.FloatingActionButton;
//import com.google.android.material.snackbar.Snackbar;
//
//import androidx.appcompat.app.AppCompatActivity;
//import androidx.appcompat.widget.Toolbar;
//
//import android.view.View;
//
//import android.view.Menu;
//import android.view.MenuItem;


public class MainActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
//        setContentView(R.layout.activity_main);
        startActivity(
                FlutterActivity.createDefaultIntent(this)
        );
        //创建时，传入默认的路由：
//        startActivity(
//                FlutterActivity
//                        .withNewEngine()
//                        .initialRoute("/my_route")
//                        .build(currentActivity)
//        );

    }
}