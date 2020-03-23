library(shiny)
library(qmongrdata)
KvalIndData$Aar <- as.integer(KvalIndData$Aar)

# Define UI for data upload app ----
ui <- fluidPage(
  shinyjs::useShinyjs(),

  # App title ----
  # titlePanel("Last opp filer"),

  # Sidebar layout with input and output definitions ----
  sidebarLayout(

    # Sidebar panel for inputs ----
    sidebarPanel(

      # Input: Select a file ----
      fileInput("file1", "Velg csv-fil",
                multiple = FALSE,
                accept = c("text/csv",
                           "text/comma-separated-values,text/plain",
                           ".csv"),
                ),

      # Horizontal line ----
      tags$hr(),

      # # Input: Checkbox if file has header ----
      # checkboxInput("header", "Header", TRUE),

      # Input: Select separator ----
      radioButtons("sep", "Kolonneseparator",
                   choices = c(Semikolon = ";",
                               Komma = ",",
                               Tab = "\t"),
                   selected = ";"),

      radioButtons("dec_sep", "Desimalseparator",
                   choices = c(Puktum = ".",
                               Komma = ","),
                   selected = ","),

      radioButtons("tegnsett", "Tegnsetting",
                   choices = c("LATIN1", "UTF-8", "Annet"), #, "UTF-8-BOM"
                   selected = "UTF-8"),

      uiOutput(outputId = "andretegn"),

      # Input: Select number of rows to display ----
      radioButtons("disp", "Vis",
                   choices = c("Første 20 rader" = "head",
                               "20 tilfeldige rader" = "tilf20",
                               "Alle rader" = "all"),
                   selected = "head"),

      tags$hr(),

      shinyjs::disabled(actionButton(inputId = "lastopp", label = "Send til server", icon("paper-plane"),
                   style = "color: #fff; background-color: #337ab7; border-color: #2e6da4")),
      shinyjs::hidden(p(id = "text1", "Fiks følgende problemer med datasettet for å aktivisere
                        opplastingsknapp: ")),
      uiOutput("feilmeld")
    ),

    # Main panel for displaying outputs ----
    mainPanel(
      titlePanel("Last opp fil"),
      h4("Dette er et verktøy for å hjelpe med å laste opp filer i riktig format til bruk i sykehusviser. Under
         er det vist et eksempel på hvordan filen skal se ut. Din fil skal være i csv-format med de samme
         kolonnenavnene som i eksempelet. Det er ikke nøye med små og store bokstaver eller rekkefølgen på
         kolonnene. Under følger en forklaring på innholdet i kolonnene."),

      div(class = "container", style = "margin-right:(@gutter / 10)",
          tags$ul(
            tags$li(h5(tags$b(names(KvalIndData)[1]),
                       ": året for hendelsen")),
            tags$li(h5(tags$b(names(KvalIndData)[2]),
                       ": registerets navn på enheten knyttet til hendelsen")),
            tags$li(h5(tags$b(names(KvalIndData)[3]),
                       ": registerets numeriske ID (ofte RESH) på enheten knyttet til hendelsen")),
            tags$li(h5(tags$b(names(KvalIndData)[4]),
                       ": organisasjonsnummeret til sykehus/HF knyttet til hendelsen,
                       hentet fra tilsendt fil SykehusNavnStruktur")),
            tags$li(h5(tags$b(names(KvalIndData)[5]),
                       ": enten en binær indikator (0/1) for fremstilling av andel måloppnåelse,
                       eller en numerisk variabel for fremstilling av gjennomsnitt eller median")),
            tags$li(h5(tags$b(names(KvalIndData)[6]),
                       ": identifikator for kvalitetsindikator, skal samsvare med
                       identifikator gitt i Indikatorbeskrivelse"))
          )
      ),
      br(),
      h4("Eksempeldata:"),
      # Output: Data file ----
      tableOutput("eksempel"),
      # Horizontal line ----
      tags$hr(),
      h4("Opplastet datasett:"),
      h5("Her vises en utsnitt av datasett du har lastet opp. Juster parametrene i menyen på venstresiden
         slik at norske tegn (æøå) representeres riktig og tallene fremstår slik de skal."),
      tableOutput("contents")
    )
  )
)

# Define server logic to read selected file ----
server <- function(input, output) {

  observe(
      if (datatester()$test2 & datatester()$test3 & datatester()$test4) {
        shinyjs::enable("lastopp")
        shinyjs::hide("text1")
      } else {
        shinyjs::disable("lastopp")
        shinyjs::show("text1")
      }
  )

  output$andretegn <- renderUI({
    if (input$tegnsett == "Annet") {
      selectInput(inputId = "andretegn_verdi", label = "Spesifiser:",
                  choices = iconvlist(), selected = "MS-ANSI")
    }
  })

  df <- reactive({
    req(input$file1)
    if (input$tegnsett == "Annet") {
      if (!is.null(input$andretegn_verdi)) {
        tegn <- input$andretegn_verdi
      } else {
        tegn <- "MS-ANSI"
      }
    } else {
      tegn <- input$tegnsett
    }
    df <- read.csv(input$file1$datapath,
                   header = TRUE,
                   sep = input$sep,
                   fileEncoding = tegn,
                   stringsAsFactors = FALSE)
  })

  datatester <- function() {
    req(df())
    # Test 1: Riktig antall kolonner i opplasting (fjernet, dekkes av test 2 og 3)
    # Test 2: Alle kolonnenavn i opplasting finnes i KvalIndData
    # Test 3: Alle kolonnenavn i KvalIndData finnes i opplasting
    # Test 3: Alle kolonnenavn i KvalIndData finnes i opplasting
    # Test 4: Alle OrgNrShus i opplasting finnes i SykehusNavnStruktur

    test1 <- length(names(df())) == length(names(KvalIndData))
    test1tekst <- paste0("Opplastet fil har ", dim(df())[2], " kolonner. Den skal ha 6 kolonner.")
    test2 <- length(setdiff(tolower(names(df())), tolower(names(KvalIndData)))) == 0
    test2tekst <- paste0("Følgende kolonnenavn i opplastet fil er ikke å finne som skrevet i
                         eksempeldata: ",
                         paste0(names(df())[match(setdiff(tolower(names(df())),
                                                          tolower(names(KvalIndData))), tolower(names(df())))],
                                collapse = ", "))
    test3 <- length(setdiff(tolower(names(KvalIndData)), tolower(names(df())))) == 0
    test3tekst <- paste0("Følgende kolonner mangler eller er feilskrevet i opplastet fil: ",
                         paste0(names(KvalIndData)[match(setdiff(tolower(names(KvalIndData)),
                                                                 tolower(names(df()))), tolower(names(KvalIndData)))],
                                collapse = ", "))
    test4 <- length(setdiff(df()[, match(tolower("OrgNrShus"), tolower(names(df())))],
                            c(SykehusNavnStruktur$OrgNrRHF, SykehusNavnStruktur$OrgNrHF,
                                                    SykehusNavnStruktur$OrgNrShus))) == 0
    test4tekst <- paste0("Følgende organisasjonsnummer i opplastet fil finnes ikke i tilsendt
                         mappingfil: ",
                         paste0(setdiff(df()[, match(tolower("OrgNrShus"), tolower(names(df())))],
                                        c(SykehusNavnStruktur$OrgNrRHF, SykehusNavnStruktur$OrgNrHF,
                                          SykehusNavnStruktur$OrgNrShus)),
                                collapse = ", "))
    list(test1 = test1, test2 = test2, test3 = test3, test4 = test4,
         test1tekst = test1tekst, test2tekst = test2tekst, test3tekst = test3tekst, test4tekst = test4tekst)
  }

  output$feilmeld <- shiny::renderUI({
    data_test <- datatester()
    shiny::tagList(
      shiny::tags$ul(
          if (!data_test$test2) {
            tags[["li"]](h5(tags[["b"]](data_test[["test2tekst"]])))
            },
          if (!data_test$test3) {
            tags[["li"]](h5(tags[["b"]](data_test[["test3tekst"]])))
            },
          if (!data_test$test4) {
            tags[["li"]](h5(tags[["b"]](data_test[["test4tekst"]])))
            }
        )
    )
  })

  output$contents <- renderTable({

    if (input$disp == "head") {
      df()[1:20, ]
    } else {
      if (input$disp == "tilf20") {
        df()[sample(1:dim(df())[1], 20), ]
      } else {
        return(df())
      }
    }
  })

  output$eksempel <- renderTable({
    KvalIndData[sample(1:dim(KvalIndData)[1], 6), ]
  })

  # Last opp data til tempdir med filnavn registernavn og dato
  observeEvent(input$lastopp, {
    opplast <- df()[, match(tolower(names(df())), tolower(names(KvalIndData)))]
    names(opplast) <- names(KvalIndData)
    assign(paste0(paste0(unique(stringr::str_extract(opplast$KvalIndID, "[aA-zZ]+")), collapse = "_"),
                  format(Sys.Date(), "%Y_%m_%d")), opplast)
    path <- usethis::proj_get()
    dir_data <- fs::path(path, "data-raw")
    paths <- fs::path(dir_data, paste0(paste0(unique(stringr::str_extract(opplast$KvalIndID,
                                                                          "[aA-zZ]+")),
                                              collapse = "_"),
                                   format(Sys.Date(), "%Y_%m_%d")), ext = "rda")
    save(list = paste0(paste0(unique(stringr::str_extract(opplast$KvalIndID, "[aA-zZ]+")), collapse = "_"),
                format(Sys.Date(), "%Y_%m_%d")), file = paths)
    shiny::showNotification("Fil lagret på server, fred være med deg mitt barn.", type = "message")
  })
}
# Run the app ----
shinyApp(ui, server)
