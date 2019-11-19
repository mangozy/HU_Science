# Programmed by Zi
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

source('scripts/global.R')

# metrics_value = c("HillsN1","HillsN2","Margalef")
# metrics_name = c("Hill's N1","Hill's N2","Margalef")

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  

  observe({
    # measures_macro hide/show
    
    if (metrics_value[1] %in% input$measures_macro) {
      shinyjs::show(id = "hilln1_macro")
    } else {
      shinyjs::hide(id = "hilln1_macro")
    }
    
    if (metrics_value[2] %in% input$measures_macro) {
      shinyjs::show(id = "hilln2_macro")
    } else {
      shinyjs::hide(id = "hilln2_macro")
    }
    
    if (metrics_value[3] %in% input$measures_macro) {
        shinyjs::show(id = "margalef_macro")
    } else {
        shinyjs::hide(id = "margalef_macro")
    }
    
    # measures_fish hide/show
    if (metrics_value[1] %in% input$measures_fish) {
      shinyjs::show(id = "hilln1_fish")
    } else {
      shinyjs::hide(id = "hilln1_fish")
    }
    
    if (metrics_value[2] %in% input$measures_fish) {
      shinyjs::show(id = "hilln2_fish")
    } else {
      shinyjs::hide(id = "hilln2_fish")
    }
    
    if (metrics_value[3] %in% input$measures_fish) {
      shinyjs::show(id = "margalef_fish")
    } else {
      shinyjs::hide(id = "margalef_fish")
    }
  })
  
  output$mailsystem = renderMenu({
    mails = apply(read_csv('data/messages.csv'), 1, function(row){
      messageItem(from = row[['from']], message = row[['message']])
    })
    dropdownMenu(type = "notifications", .list = mails, icon = icon("bar-chart"))
  })
  
  # hilln1_macro_value
  output$hilln1_macro = renderInfoBox(
    infoBox("Hill's N1",paste("Predicted:", round(data.frame(predict(gam2_hills_N1_macro6,
                                                        data.frame(pH = input$ph_macro, 
                                                                   WaterTemp = input$watertemp_macro, 
                                                                   Turbidity = input$turbidity_macro, 
                                                                   SpCond = input$spcond_macro, 
                                                                   O2Dis = input$o2dis_macro, 
                                                                   Oxygen = input$oxygen_macro, 
                                                                   Flow = input$flow_macro, 
                                                                   Alkalinity = input$alkl_macro, 
                                                                   StreamOrder = input$stro_macro),
                                                        type="response"))[1,1],4)
                              ), icon = icon("neos"))
  )
  
  output$hilln2_macro = renderInfoBox(
    infoBox("Hill's N2",paste("Predicted:", round(data.frame(predict(gam2_hills_N2_macro2,
                                                                     data.frame(pH = input$ph_macro, 
                                                                                WaterTemp = input$watertemp_macro, 
                                                                                Turbidity = input$turbidity_macro, 
                                                                                SpCond = input$spcond_macro, 
                                                                                O2Dis = input$o2dis_macro, 
                                                                                Oxygen = input$oxygen_macro, 
                                                                                Flow = input$flow_macro, 
                                                                                Alkalinity = input$alkl_macro, 
                                                                                StreamOrder = input$stro_macro),
                                                                     type="response"))[1,1],4)
                              ), icon = icon("signature"))
  )
  
  output$margalef_macro = renderInfoBox(
    infoBox("Margalef",paste("Predicted:", round(data.frame(predict(gam2_margalef_macro2,
                                                                    data.frame(pH = input$ph_macro, 
                                                                               WaterTemp = input$watertemp_macro, 
                                                                               Turbidity = input$turbidity_macro, 
                                                                               SpCond = input$spcond_macro, 
                                                                               O2Dis = input$o2dis_macro, 
                                                                               Oxygen = input$oxygen_macro, 
                                                                               Flow = input$flow_macro, 
                                                                               Alkalinity = input$alkl_macro, 
                                                                               StreamOrder = input$stro_macro),
                                                                    type="response"))[1,1],4)
                             ), icon = icon("mix"))
  )
  
  #output$ph_macro_slider_value = renderValueBox()
    
  output$hilln1_fish = renderInfoBox(
    infoBox("Hill's N1",paste("Predicted:", round(data.frame(predict(gam2_hills_N1,
                                                                     data.frame(pH = input$ph_fish, 
                                                                                WaterTemp = input$watertemp_fish, 
                                                                                Turbidity = input$turbidity_fish, 
                                                                                SpCond = input$spcond_fish, 
                                                                                O2Dis = input$o2dis_fish, 
                                                                                Oxygen = input$oxygen_fish, 
                                                                                Flow = input$flow_fish),
                                                                     type="response"))[1,1],4)
                              ), icon = icon("neos"))
  )
  
  output$hilln2_fish = renderInfoBox(
    infoBox("Hill's N2",paste("Predicted:", round(data.frame(predict(gam2_hills_N2,
                                                                     data.frame(pH = input$ph_fish, 
                                                                                WaterTemp = input$watertemp_fish, 
                                                                                Turbidity = input$turbidity_fish, 
                                                                                SpCond = input$spcond_fish, 
                                                                                O2Dis = input$o2dis_fish, 
                                                                                Oxygen = input$oxygen_fish, 
                                                                                Flow = input$flow_fish),
                                                                     type="response"))[1,1],4)
                              ), icon = icon("signature"))
  )
  
  output$margalef_fish = renderInfoBox(
    infoBox("Margalef",paste("Predicted:", round(data.frame(predict(gam2_margalef,
                                                                    data.frame(pH = input$ph_fish, 
                                                                               WaterTemp = input$watertemp_fish, 
                                                                               Turbidity = input$turbidity_fish, 
                                                                               SpCond = input$spcond_fish, 
                                                                               O2Dis = input$o2dis_fish, 
                                                                               Oxygen = input$oxygen_fish, 
                                                                               Flow = input$flow_fish),
                                                                    type="response"))[1,1],4)
                             ), icon = icon("mix"))
  )
  

})
