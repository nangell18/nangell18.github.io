library(tidyverse)
library(shiny)
library(DT)

# question 3 -----------------------------

df3 = read_csv('adult_modified.csv')

# convert categorical variables to character type
d3 <- df3 %>% mutate_at(c('workclass', 'sex'), as.character)

# get variable names
variables_names3 = names(d3)

# get names of numeric variables
variables_numeric3 = d3 %>% select_if(is.numeric) %>% names

# get names of categorical variables
variables_category3 = d3 %>% select_if(is.character) %>% names

# question 4 -----------------------------

df4 = read_csv('adult_modified.csv')

# convert categorical variables to character type
d4 <- df4 %>% mutate_at(c('workclass', 'sex'), as.character)

# get variable names
variables_names4 = names(d4)

# get names of numeric variables
variables_numeric4 = d4 %>% select_if(is.numeric) %>% names

# get names of categorical variables
variables_category4 = d4 %>% select_if(is.character) %>% names

# question 6 -----------------------------

df6 = read_csv('adult_modified.csv')

# convert categorical variables to character type
d6 <- df6 %>% mutate_at(c('race', 'occupation'), as.character)

# get variable names
variables_names6 = names(d6)

# get names of numeric variables
variables_numeric6 = d6 %>% select_if(is.numeric) %>% names

# get names of categorical variables
variables_category6 = d6 %>% select_if(is.character) %>% names

# question 10 -----------------------------

df10 <- read_csv('diamonds.csv')

# convert categorical variables to character type
d10 <- df10 %>% mutate_at(c('cut', 'color'), as.character)

# get variable names
variables_names10 = names(d10)

# get names of numeric variables
variables_numeric10 = d10 %>% select_if(is.numeric) %>% names

# get names of categorical variables
variables_category10 = d10 %>% select_if(is.character) %>% names

# question 12 -----------------------------

d12 <- read_csv('WHO-COVID-19-global-data.csv')

# get names of numeric variables
variables_numeric12 = d12 %>% select_if(is.numeric) %>% names

# get variable names
variables_names12 = names(d12)


ui <- navbarPage("Please select Tab",
                 tabPanel("Question 3",
                          
                          sidebarLayout(
                            
                            sidebarPanel(
                              
                              selectInput(
                                inputId ="var1_3",
                                label = "Select a Numeric Variables",
                                choices = variables_numeric3, selected = "age"
                              ),
                              
                              selectInput(
                                inputId ="var2_3",
                                label = "Select a Categorical Variables",
                                choices = variables_category3,
                                selected = "workclass"
                              ),
                              
                              checkboxGroupInput(inputId = "native_country", label = "Select any native country listed below",
                                                 choices = names(table(d3$native_country)), inline = TRUE),
                              
                            ),
                            
                            # Main panel for displaying outputs ----
                            mainPanel(
                              
                              # Output: Histogram ----
                              
                              plotOutput(outputId = 'show_plot3')
                            )
                    )
                          
                 ), #close question 3
                 
                 tabPanel("Question 4",
                          sidebarLayout(
                            
                            sidebarPanel(
                              
                              selectInput(
                                inputId ="var1_4",
                                label = "Select a Numeric Variables",
                                choices = variables_numeric4, selected = "hours_per_week"
                              ),
                              
                              selectInput(
                                inputId ="var2_4",
                                label = "Select a Categorical Variables",
                                choices = variables_category4,
                                selected = "income"
                              ), 
                              
                              sliderInput(inputId = "age",
                                          "Select Age Range:",
                                          min = min(d4$age, na.rm=TRUE),
                                          max = max(d4$age, na.rm=TRUE),
                                          value= c(50, 200))
                              
                            ),
                            
                            # Main panel for displaying outputs ----
                            mainPanel(
                              
                              # Output: Histogram ----
                              
                              plotOutput(outputId = 'show_plot4')
                            )
                          )   
                          
                 ),
                 
                 tabPanel("Question 6",
                          sidebarLayout(
                            
                            sidebarPanel(
                              
                              selectInput(
                                inputId ="var1_6",
                                label = "Select a Numeric Variables",
                                choices = variables_numeric6, selected = "age"
                              ),
                              
                              selectInput(
                                inputId ="var2_6",
                                label = "Select a Categorical Variables",
                                choices = variables_category6,
                                selected = "race"
                              ),
                              
                              radioButtons(inputId = "plot_choice", 
                                           label = h3("Select Plot:"),
                                           choices = c("Density Plot" = "density",
                                                       "Histogram Plot" = "histogram"),
                                           selected = 'density')
                              
                            ),
                            
                            # Main panel for displaying outputs ----
                            mainPanel(
                              
                              # Output: Histogram ----
                              
                              plotOutput(outputId = 'show_plot6')
                            )
                          )
                 ),
                 
                 tabPanel("Question 10",
                          
                          sidebarLayout(
                            
                            sidebarPanel(
                              
                              selectInput('v1_10', label='Select a Numeric Variable', variables_names10, selected = "length"),
                              selectInput('v2_10', label='Select a Categorical Variable', variables_names10, selected = "cut"),
                              
                              radioButtons(inputId = "plot_choice_10", 
                                           label = h3("Select Plot:"),
                                           choices = c("Density Plot" = "density",
                                                       "Histogram Plot" = "histogram"),
                                           selected = 'density'),
                              
                              checkboxGroupInput(inputId = "color", label = "Select any color",
                                                 choices = names(table(d10$color)), inline = TRUE),
                              
                              sliderInput(inputId = "price",
                                          "Select Price Range:",
                                          min = min(d10$price, na.rm=TRUE),
                                          max = max(d10$price, na.rm=TRUE),
                                          value= c(50, 200))
                              
                              
                            ),
                            
                            # Main panel for displaying outputs ----
                            mainPanel(
                              plotOutput(outputId = 'show_plot10')
                            )
                          )
                 ), # close question 10
                 
                 tabPanel("Question 12",
                          
                          sidebarLayout(
                            
                            sidebarPanel(
                              
                              selectInput('v1_12', label='Select a Numeric Variable', choices = variables_names12, selected = "Cumulative_cases"),
                              
                              radioButtons(inputId = "plot_choice_12", 
                                           label = h3("Select Plot:"),
                                           choices = c("Scatter Plot" = "geom_point",
                                                       "Line Plot" = "geom_line")
                              ),
                              
                              checkboxGroupInput(inputId = "Country", label = "Select any Country of the following countries",
                                                 choices = c('United States of America','Canada','Brazil'), inline = TRUE),
                              
                              dateRangeInput(inputId = "date", 
                                             strong("Date range"), 
                                             start = "2020-01-03", end = "2021-10-18",
                                             min = "2020-01-03", max = "2021-10-18"),
                              
                              
                            ),
                            
                            # Main panel for displaying outputs ----
                            mainPanel(
                              plotOutput(outputId = 'show_plot12')
                            )
                          )
                          
                          ) # close tabPanel for question 12
)

# server
server <- function(input, output, session) {
  
  output$show_plot3 <- renderPlot({
    
    d3 = read_csv('adult_modified.csv')
    
    v1 = input$var1_3
    v2 = input$var2_3
    
    d <- d3 %>% filter(native_country %in% input$native_country)
    
    library(ggplot2)
    
    ggplot(d, aes(x = d[[v1]], color = as.factor(d[[v2]])))+
      geom_density()+
      labs(x = v1, color = v2)
    
    
  })
  
  output$show_plot4 <- renderPlot({
    
    d4 = read_csv('adult_modified.csv')
    
    v1 = input$var1_4
    v2 = input$var2_4
    
    
    library(ggplot2)
    
    d <- d4 %>% filter(age>input$age[1], age<input$age[2])
    
    ggplot(d, aes(x = d[[v1]], color = as.factor(d[[v2]])))+
      geom_density()+
      labs(x = v1, color = v2)
    
    
  })
  
  
  output$show_plot6 <- renderPlot({
    
    d6 = read_csv('adult_modified.csv')
    
    d <- d6
    
    v1 = input$var1_6
    v2 = input$var2_6
    
    
    library(ggplot2)
    
    if(input$plot_choice == 'density')
      
    {
      ggplot(d, aes(x = d[[v1]], color = as.factor(d[[v2]])))+
        geom_density()+
        labs(x = v1, color = v2)
    }
    
    else
    {
      ggplot(d, aes(x = d[[v1]], color = as.factor(d[[v2]])))+
        geom_histogram()+
        labs(x = v1, color = v2)
    }
    
  })
  
  output$show_plot10 <- renderPlot({
    
    df10 <- read_csv('diamonds.csv')
    
    v1 = input$v1_10
    v2 = input$v2_10
    
    library(ggplot2)
    
    d <- df10 %>% filter(color %in% input$color) %>% filter(price>input$price[1], price<input$price[2])
    
    if(input$plot_choice_10 == 'density')
      
    {
      ggplot(d, aes(x = d[[v1]], color = as.factor(d[[v2]])))+
        geom_density()+
        labs(x = v1, color = v2)
    }
    
    else
    {
      ggplot(d, aes(x = d[[v1]], color = as.factor(d[[v2]])))+
        geom_histogram()+
        labs(x = v1, color = v2)
    }
    
  })
  
  output$show_plot12 <- renderPlot({
    
    d12 <- read_csv('WHO-COVID-19-global-data.csv')
    
    country = input$Country
    
    v1_12 = input$v1_12
    
    library(ggplot2)
    
    d <- d12 %>% filter(Country %in% country, Date_reported>input$date[1],  Date_reported<input$date[2])
    
    if(input$plot_choice_12 == 'geom_line')
      
    {
      ggplot(d, aes(x = Date_reported, y = d[[v1_12]], color = Country))+
        geom_line()+
        labs(x = "Date", y = v1_12)
    }
    
    else
    {
      ggplot(d, aes(x = Date_reported, y = d[[v1_12]], color = Country))+
        geom_point()+
        labs(x = "Date", y = v1_12)
    }
    
  })
}

shinyApp(ui = ui, server = server)
