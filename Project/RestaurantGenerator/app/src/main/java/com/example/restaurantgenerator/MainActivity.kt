package com.example.restaurantgenerator

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activityoptions)

        findViewById<Button>(R.id.generateButton).setOnClickListener() {
            generateRestaurant()
        }
    }

    private fun generateRestaurant() {
        val intent = Intent(this, GenerateActivity::class.java)
        startActivity(intent)
    }
}