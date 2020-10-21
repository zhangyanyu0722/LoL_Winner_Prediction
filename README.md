# LoL_Winner_Prediction

## Author

Yanyu Zhang : zhangya@bu.edu
Mengyuan Liu : liu.mengyu@northeastern.edu

## Introduction
League of Legends is a MOBA (multiplayer online battle arena) where 2 teams (blue and red) face off. There are 3 lanes, a jungle, and 5 roles. The goal is to take down the enemy Nexus to win the game. [For Detail]

## Content
This dataset contains the first 10min. stats of approx. 10k ranked games (SOLO QUEUE) from a high ELO (DIAMOND I to MASTER). Players have roughly the same level.

Each game is unique. The gameId can help you to fetch more attributes from the Riot API.

There are 19 features per team (38 in total) collected after 10min in-game. This includes kills, deaths, gold, experience, level… It's up to you to do some feature engineering to get more insights.

The column blueWins is the target value (the value we are trying to predict). A value of 1 means the blue team has won. 0 otherwise.

So far I know, there is no missing value.

## Glossary
Warding totem: An item that a player can put on the map to reveal the nearby area. Very useful for map/objectives control.

Minions: NPC that belong to both teams. They give gold when killed by players.

Jungle minions: NPC that belong to NO TEAM. They give gold and buffs when killed by players.

Elite monsters: Monsters with high hp/damage that give a massive bonus (gold/XP/stats) when killed by a team.

Dragons: Elite monster which gives team bonus when killed. The 4th dragon killed by a team gives a massive stats bonus. The 5th dragon (Elder Dragon) offers a huge advantage to the team.

Herald: Elite monster which gives stats bonus when killed by the player. It helps to push a lane and destroys structures.

Towers: Structures you have to destroy to reach the enemy Nexus. They give gold.

Level: Champion level. Start at 1. Max is 18.

## There are many ways to download and run it:
```
library(shiny)

# Easiest way is to use runGitHub
runGitHub("LoL_Winner_Prediction", "liumengyuan1997")
```
Or you can clone the git repository, then use ```runApp()```:

```
# First clone the repository with git. If you have cloned it into
# ~/LoL_Winner_Prediction, first go to that directory, then use runApp().
setwd("~/LoL_Winner_Prediction")
runApp()
```
To run a Shiny app from a subdirectory in the repo or zip file, you can use the ```subdir``` argument. This repository happens to contain another copy of the app in ```inst/LoL_Winner_Prediction/```.

```
runGitHub("LoL_Winner_Prediction", "zhangyanyu0722", subdir = "inst/shinyapp/")
```


## Acknowledgements
Thanks, Rito Gaming.

[For Detail]: https://www.kaggle.com/bobbyscience/league-of-legends-diamond-ranked-games-10-min
