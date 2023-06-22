InitializeHardcoreParameters()
{
level.pers_upgrade_jugg = 0;
level.zombie_vars[ "zombie_score_bonus_melee" ] = 5;
level.zombie_vars[ "zombie_score_bonus_burn" ] = 5;
level.zombie_vars[ "zombie_score_bonus_head" ] = 10;
level.zombie_vars[ "zombie_score_bonus_neck" ] = 10;
level.zombie_vars[ "zombie_score_bonus_torso" ] = 5;
level.zombie_vars[ "zombie_score_damage_light" ] = 1;
level.zombie_vars[ "zombie_score_damage_normal" ] = 1;
level.zombie_vars[ "penalty_no_revive" ] = 1;
level.zombie_vars[ "penalty_died" ] = 1;
level.zombie_vars[ "penalty_downed" ] = 3;
level.zombie_vars[ "zombie_new_runner_interval" ] = 1;
level.zombie_actor_limit = 20;
level.zombie_ai_limit = 52;/*Insane 72*/
level.zombie_vars[ "zombie_max_ai" ] = 52;/*Insane 72*/
level.zombie_vars[ "zombie_ai_per_player" ] = 13;/*Insane 18*/
level.zombie_vars[ "zombie_health_increase_multiplier" ] = 1.15;/*Insane 1.5*/
level.zombie_vars[ "zombie_health_increase" ] = 400;/*Insane 600*/
level.zombie_vars[ "zombie_move_speed_multiplier" ] = 90; /*Insane 180*/
level.zombie_vars[ "zombie_between_round_time" ] = 3;/*Insane 0.01*/
level.zombie_vars[ "zombie_spawn_delay" ] = 0.01;
level.zombie_vars[ "zombie_perk_juggernaut_health" ] = 150;
level.zombie_vars[ "zombie_perk_juggernaut_health_upgrade" ] = 150;
foreach(player in level.players)
{
player.maxhealth = 50;
player.health = player.maxhealth;
}
level thread hardcoreroundswitch();
}

hardcoreroundswitch()
{
level thread maps/mp/zombies/_zm_audio::change_zombie_music( "dog_start" );
//ent = spawn( "script_origin", self.origin );
//ent playsound( "zmb_dog_round_start" );
for(;;)
{
level waittill( "between_round_over" );
wait 5.0;
level thread maps/mp/zombies/_zm_audio::change_zombie_music( "dog_start" );
}
}
