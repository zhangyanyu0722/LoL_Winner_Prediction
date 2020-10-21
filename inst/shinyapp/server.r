library(kernlab)
library(caret)
library(keras)
library(shiny)
# install_keras()

server <- shinyServer(function(input, output, section) {
  
  first <- reactive({
    switch(input$first,
           "Blue" = 1,
           "Red" = -1,
           "No" = 0)
  })
  
  dragon <- reactive({
    switch(input$dragon,
           "Blue" = 1,
           "Red" = -1,
           "No" = 0)
  })
  
  herald <- reactive({
    switch(input$herald,
           "Blue" = 1,
           "Red" = -1,
           "No" = 0)
  })
  # compose data frame
  new <- reactive({
    data.frame(
      Name = c("blueKills",
               "blueDeaths",
               "blueGoldDiff",
               "blueExperienceDiff",
               "WardsPlacedDiff",
               "WardsDestroyedDiff",
               "FirstBloodDiff",
               "blueAssistsDiff",
               "DragonsDiff",
               "HeraldsDiff",
               "AvgLevelDiff",
               "TotalJungleMinionsKilledDiff",
               "CSPerMinDiff"),
      
      Value = as.numeric(c(input$kill,
                           input$death,
                           input$gold,
                           input$exp,
                           input$ward_place,
                           input$ward_des,
                           first(),
                           input$assist,
                           dragon(),
                           herald(),
                           input$level,
                           input$jg,
                           input$cs)),
      
      stringsAsFactors=FALSE)
  })

  # ann.model <- load_model_tf("models/ann_model")
  load("knn_model.RData")
  # load("models/lgm_model.RData")
  load("svm_model.RData")
  load("res_model.RData")
  
  output$result <- renderPrint({
    test <- as.data.frame(predict(res.pca, newdata = data.frame("blueKills"=input$kill,
                                                                "blueDeaths"=input$death,
                                                                "blueGoldDiff"=input$gold,
                                                                "blueExperienceDiff"=input$exp,
                                                                "WardsPlacedDiff"=input$ward_place,
                                                                "WardsDestroyedDiff"=input$ward_des,
                                                                "FirstBloodDiff"=first(),
                                                                "blueAssistsDiff"=input$assist,
                                                                "DragonsDiff"=dragon(),
                                                                "HeraldsDiff"=herald(),
                                                                "AvgLevelDiff"=input$level,
                                                                "TotalJungleMinionsKilledDiff"=input$jg,
                                                                "CSPerMinDiff"=input$cs
    )))
    
    knn.predict <- predict(knn.model, newdata = test)
    # glm.predict = predict(lgm.model, newdata = test)
    svm.predict <- predict(svm.model, test)
    
    # ann.predict <- predict_classes(object = ann.model, x = as.matrix(test[,1:13])) %>%
    # as.vector()
    
    models <- c(knn.predict,svm.predict)
    uniqv <- unique(models)
    vote <- uniqv[which.max(tabulate(match(models, uniqv)))]
    
    if(vote == 2) { winner = "Blue team is the winner based on the first ten minutes data (accuracy is about 70 percent)" }
    if(vote == 1) { winner = "Red team is the winner based on the first ten minutes data (accuracy is about 70 percent)" }
    
    return(winner)
  })
  # show the result
  output$table <- renderDataTable({
    new()
  })
  
})
