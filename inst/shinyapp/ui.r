library(kernlab)
library(caret)
library(keras)
library(shiny)
# install_keras()

ui <- fluidPage(uiOutput("tab"),
                theme = "paper",
                titlePanel("League of Legends Winner Prediction"),
                sidebarPanel(
                  
                  helpText("League of Legends is a MOBA where 2 teams (blue and red)",
                           "face off. There are 3 lanes, a jungle, and 5 roles. The ",
                           "goal is to take down the enemy Nexus to win the game."),
                  
                  numericInput("kill", "Please input the kill number of blue:", 8),
                  
                  numericInput("death", "Please input the death number of blue:", 6),
                  
                  numericInput("gold", "Please input the gold difference:", 0),
                  
                  helpText("Gold Diff = Blue Gold - Red Gold"),
                  
                  numericInput("exp", "Please input the experience difference:", 0),
                  
                  helpText("Exp Diff = Blue Exp - Red Exp"),
                  
                  numericInput("ward_place", "Please input the wards placed difference:", 0),
                  
                  helpText("Ward Placed Diff = Blue Ward Placed - Red Ward Placed"),
                  
                  numericInput("ward_des", "Please input the wards destroyed difference:", 0),
                  
                  helpText("Ward Destroyed Diff = Blue Ward Destroyed - Red Ward Destroyed"),
                  
                  selectInput("first", "Frist blood", choices = c("Blue", "Red", "No")),
                  
                  numericInput("assist", "Please input the assists difference:", 0),
                  
                  helpText("Assist Diff = Blue Assist - Red Assist"),
                  
                  selectInput("dragon", "Who get the dragon", choices = c("Blue", "Red", "No")),
                  
                  selectInput("herald", "Who get the herald", choices = c("Blue", "Red", "No")),
                  
                  numericInput("level", "Please input the average level difference:", 0),
                  
                  helpText("Average Level Diff = Blue Average Level - Red Average Level"),
                  
                  numericInput("jg", "Please input the jungle monsters killed difference:", 0),
                  
                  helpText("Jungle monsters killed Diff = Blue killed - Red killed"),
                  
                  numericInput("cs", "Please input the total minions killed difference:", 0),
                  
                  helpText("Minions killed Diff = Blue killed - Red killed"),
                  
                  submitButton("Submit")
                ),
                mainPanel(
                  h4("The data your entered : "), 
                  dataTableOutput("table"),
                  h4("Predicted Winner"),
                  verbatimTextOutput("result"),
                ),
)
