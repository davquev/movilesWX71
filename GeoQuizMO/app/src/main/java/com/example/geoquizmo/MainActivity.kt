package com.example.geoquizmo

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.Toast
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
    lateinit var questions: ArrayList<Question>
    var position = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        loadQuestions()
        setupViews()
    }

    fun loadQuestions() {
        questions = ArrayList()
        var question = Question("¿Es Santiago capital de Brasil?", false)
        questions.add(question)

        question = Question("¿Es Cuba capital de Brasil?", false)
        questions.add(question)

        question = Question("¿Es Buenos Aires capital de Francia?", false)
        questions.add(question)

        question = Question("¿Es Sydney capital de Australia?", true)
        questions.add(question)
    }

    fun setupViews() {
        showSentence()

        //2da forma
        btYes.setOnClickListener {
            if (questions[position].answer) {
                Toast.makeText(this, "Correcto", Toast.LENGTH_LONG).show()
            }
            else{
                Toast.makeText(this, "Incorrecto", Toast.LENGTH_LONG).show()
            }
        }

        btNo.setOnClickListener {
            if (!questions[position].answer) {
                Toast.makeText(this, "Correcto", Toast.LENGTH_LONG).show()
            }
            else{
                Toast.makeText(this, "Incorrecto", Toast.LENGTH_LONG).show()
            }
        }

        btNext.setOnClickListener {
            position++
            showSentence()
        }
    }

    fun showSentence() {
        tvSentence.text = questions[position].sentence
    }
}