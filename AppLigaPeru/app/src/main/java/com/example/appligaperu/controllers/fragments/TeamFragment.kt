package com.example.appligaperu.controllers.fragments

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.example.appligaperu.R
import com.example.appligaperu.adapter.TeamAdapter
import com.example.appligaperu.models.Team

class TeamFragment : Fragment(), TeamAdapter.OnItemClickListener {
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_team, container, false)
    }

    override fun onItemClicked(team: Team) {
        TODO("Not yet implemented")
    }
}