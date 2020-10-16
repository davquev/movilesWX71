package com.example.appligaperu.database

import androidx.room.*
import com.example.appligaperu.models.Team

@Dao
interface TeamDAO {
    @Insert
    fun insertTeam(vararg team: Team)

    @Query("SELECT * FROM teams ")
    fun getAllTeams(): List<Team>

    @Delete
    fun deleteTeams(vararg team: Team)

    @Update
    fun updateTeams(vararg team: Team)
}