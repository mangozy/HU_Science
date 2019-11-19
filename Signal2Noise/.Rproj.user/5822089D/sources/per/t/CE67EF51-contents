# Programmed by Zi
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

source("scripts/ui_scripts.R")

sliderInput_width = "50%"

# metrics_value = c("HillsN1","HillsN2","Margalef")
# metrics_name = c("Hill's N1","Hill's N2","Margalef")

# define UI logics
shinyUI(
  
  dashboardPage(
    dashboardHeader(title="SRBC Signal2Noise", 
                    dropdownMenuOutput("mailsystem"),
                    tags$li(a(href = 'http://www.harrisburgu.edu',
                              img(src = 'E3Logo.jpg',
                                  title = "Harrisburg University", height = "30px"),
                              style = "padding-top:10px; padding-bottom:10px;"),
                            class = "dropdown")
                    ),

    dashboardSidebar(
      
      sidebarMenu(
        
        sidebarSearchForm("searchText","buttonSearch,","Search"),
        
        menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard"), badgeLabel = "New"),
          menuSubItem("Bionic Response", tabName = "bionic"),
          menuSubItem("Sensitivity Analysis", tabName = "sensitive"),
          menuSubItem("Help", tabName = "help")
          )
          ),

    dashboardBody(
      # tags$head(tags$link(rel="E3_Favicon", href="HU_E3_Favicon.jpg")),
      useShinyjs(),
      tabItems(
        tabItem(tabName = "dashboard",
                box(title = "Welcome to SRBC Signal2Noise Application", 
                    status = "primary", 
                    solidHeader = T, 
                    fluidPage(fluidRow(
                      fluidRow(

                        column(10,
                               div(style="display: inline-block; width: 49%;",img(src="HillN1MacroData.png", width=350)),
                               div(style="display: inline-block; width: 49%;",img(src="HillN1FishData.png", width=350))
                               )
                        )
                      
                    ))

                    , width = "80%")
                
                ),
        
                tabItem(
                      
                        tabName = "bionic",
                        h2("Bionic Response"),
                        
                        br(),

                        ##
                        tabBox(title = "Diversity Metric(s)",
                               
                               tabPanel(title = "Macroinvertebrates",
                                        
                                        fluidRow(column(width = 12,
                                                        infoBoxOutput("hilln1_macro"),
                                                        infoBoxOutput("hilln2_macro"),
                                                        infoBoxOutput("margalef_macro"))),
                                        
                                        fluidRow(column(width = 12,
                                                        box(checkboxGroupInput(inputId = "measures_macro",
                                                                               label = "Macro Metrics:",
                                                                               choiceNames = metrics_name,
                                                                               choiceValues = metrics_value,
                                                                               selected = metrics_value, inline = TRUE))
                                                     )),


                                        fluidRow(column(width = 12,
                                                        box(title = "Specify the following parameters", status = "primary", solidHeader = T,
                                                            sliderInput("ph_macro", "pH",min=round(min(trial2$pH),2), max=round(max(trial2$pH),2), value=median(trial2$pH), width = sliderInput_width),
                                                            sliderInput("watertemp_macro", "Water Temp",min=round(min(trial2$WaterTemp),2), max=round(max(trial2$WaterTemp),2), value=mean(trial2$WaterTemp), width = sliderInput_width),
                                                            sliderInput("turbidity_macro", "Turbidity",min=round(min(trial2$Turbidity),2), max=round(max(trial2$Turbidity),2), value=mean(trial2$Turbidity), width = sliderInput_width),
                                                            sliderInput("spcond_macro", "SpCond",min=round(min(trial2$SpCond),2), max=round(max(trial2$SpCond),2), value=mean(trial2$SpCond), width = sliderInput_width),
                                                            sliderInput("o2dis_macro", "O2Dis",min=round(min(trial2$O2Dis),2), max=round(max(trial2$O2Dis),2), value=mean(trial2$O2Dis), width = sliderInput_width),
                                                            sliderInput("oxygen_macro", "Oxygen",min=round(min(trial2$Oxygen),2), max=round(max(trial2$Oxygen),2), value=mean(trial2$Oxygen), width = sliderInput_width),
                                                            sliderInput("flow_macro", "Flow",min=round(min(trial2$Flow),2), max=round(max(trial2$Flow),2), value=mean(trial2$Flow), width = sliderInput_width),
                                                            sliderInput("alkl_macro", "Alkalinity",min=round(min(trial2$Alkalinity),2), max=round(max(trial2$Alkalinity),2), value=mean(trial2$Alkalinity), width = sliderInput_width),
                                                            sliderInput("stro_macro",
                                                                        "Stream Order",
                                                                        min=round(min(as.numeric(trial2$StreamOrder)),2),
                                                                        max=round(max(as.numeric(trial2$StreamOrder)),2),
                                                                        value=as.factor(as.integer(mean(as.integer(trial2$StreamOrder)))),
                                                                        step = 1,
                                                                        width = "40%"),
                                                            collapsed = TRUE, collapsible = TRUE
                                                            )
                                                        )
                                                 )
                                        ),
                               
                               tabPanel(title = "Fish",
                                        fluidRow(column(width = 12,
                                                        infoBoxOutput("hilln1_fish"),
                                                        infoBoxOutput("hilln2_fish"),
                                                        infoBoxOutput("margalef_fish"))),
                                        
                                        fluidRow(column(width = 12,
                                                        box(checkboxGroupInput(inputId = "measures_fish",
                                                                               label = "Fish Metrics:",
                                                                               choiceNames = metrics_name,
                                                                               choiceValues = metrics_value,
                                                                               selected = metrics_value, inline = TRUE))
                                                        )),

                                        fluidRow(column(width = 12,
                                                        box(title = "Specify the following parameters", status = "primary", solidHeader = T,
                                                            sliderInput("ph_fish", "pH",min=round(min(gam_dat2$pH),2), max=round(max(gam_dat2$pH),2), value=median(gam_dat2$pH), width = sliderInput_width),
                                                            sliderInput("watertemp_fish", "Water Temp",min=round(min(gam_dat2$WaterTemp),2), max=round(max(gam_dat2$WaterTemp),2), value=mean(gam_dat2$WaterTemp), width = sliderInput_width),
                                                            sliderInput("turbidity_fish", "Turbidity",min=round(min(gam_dat2$Turbidity),2), max=round(max(gam_dat2$Turbidity),2), value=mean(gam_dat2$Turbidity), width = sliderInput_width),
                                                            sliderInput("spcond_fish", "SpCond",min=round(min(gam_dat2$SpCond),2), max=round(max(gam_dat2$SpCond),2), value=mean(gam_dat2$SpCond), width = sliderInput_width),
                                                            sliderInput("o2dis_fish", "O2Dis",min=round(min(gam_dat2$O2Dis),2), max=round(max(gam_dat2$O2Dis),2), value=mean(gam_dat2$O2Dis), width = sliderInput_width),
                                                            sliderInput("oxygen_fish", "Oxygen",min=round(min(gam_dat2$Oxygen),2), max=round(max(gam_dat2$Oxygen),2), value=mean(gam_dat2$Oxygen), width = sliderInput_width),
                                                            sliderInput("flow_fish", "Flow",min=round(min(gam_dat2$Flow),2), max=round(max(gam_dat2$Flow),2), value=mean(gam_dat2$Flow), width = sliderInput_width),
                                                            collapsed = TRUE, collapsible = TRUE)))
                                        
                                       ), width = "100%"
                          )

                        ),
        
                tabItem(tabName = "sensitive",
                        h2("Sensitivity Analysis"),
                        br()
                        ),
                       
                tabItem(tabName = "help",
                        h2("Help - User Instruction"),
                        br()
                        )
                )
        )
      )
    )