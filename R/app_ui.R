#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinyWidgets
#' @import shinythemes
#'
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),

    # Your application UI logic
    fluidPage(

      # ---- Header & Intro ----
      titlePanel(
        h1("Equipage Solidaire: The App", align = "left")
      ),

      # ---- Main body ----
      tabsetPanel(
        type = "tab",

        # ---- Map tab ----
        tabPanel(
          "Map",
          fluidRow(
            # 12 columns on one row: this panel will take 1/4 of it
            column(3, wellPanel(
              selectInput(
                "election", "Choose an election: ",
                c(
                  "State legislative assembly" = "state",
                  "Lok Sabha" = "lok_sabha"
                )
              ),
            )),
            column(
              8,
              sliderTextInput("map_year", "Year",
                choices = 1990:2021,
                selected = tail(1990:2021, n = 1),
                grid = T,
                width = "100%"
              )
            )
          )
        ),

        # ---- Graphs tab ----

        tabPanel(
          "Graphs",
          fluidRow(
            # 12 columns on one row: this panel will take 1/4 of it
            column(3, wellPanel(
              selectInput(
                "election", "Choose an election: ",
                c(
                  "State legislative assembly" = "state",
                  "Lok Sabha" = "lok_sabha"
                )
              ),
            )),
            column(
              8,
              sliderTextInput("map_year", "Year",
                              choices = 1990:2021,
                              selected = tail(1990:2021, n = 1),
                              grid = T,
                              width = "100%"
              )
            )
          )
        )
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "Equipage Solidaire: The App"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
