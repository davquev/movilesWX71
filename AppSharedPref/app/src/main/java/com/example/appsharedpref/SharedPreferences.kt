package com.example.appsharedpref

import android.content.Context

class SharedPreferences(val context: Context) {
    private val PREFS_NAME = "sharedPreferences"

    private val sharedPreference = context.getSharedPreferences(
        PREFS_NAME, Context.MODE_PRIVATE
    )

    fun save(keyName: String, value: String){
        val editor = sharedPreference.edit()
        editor.putString(keyName, value)
        editor.commit()
    }

    fun getValueString(keyName: String): String?{
        return  sharedPreference.getString(keyName, null)
    }

    fun clearSharedPreference(){
        val editor = sharedPreference.edit()
        editor.clear()
        editor.commit()
    }
}