#' CSV File Handler
#'
#' This function handles the input of the CSV file input.  Needed for CSV File Input
#' @keywords csv, input, file
#' @export
#' @examples
#' datafile <- callModule(csvFile, "datafile", stringsAsFactors = FALSE)

csvFile <- function(input, output, session, stringsAsFactors = FALSE) {
  # The selected file, if any
  userFile <- reactive({
    # If no file is selected, don't do anything
    validate(need(input$file, message = FALSE))
    input$file
  })

  # The user's data, parsed into a data frame
  dataframe <- reactive({
    read.csv(userFile()$datapath,
             header = input$heading,
             quote = input$quote,
             stringsAsFactors = stringsAsFactors)
  })

  # We can run observers in here if we want to
  observe({
    msg <- sprintf("File %s was uploaded", userFile()$name)
    cat(msg, "\n")
  })

  # Return the reactive that yields the data frame
  return(dataframe)
}
