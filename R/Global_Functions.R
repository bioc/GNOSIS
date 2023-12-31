# Redefine functions
tags <- shiny::tags
validate <- shiny::validate
levels <- base::levels
unique <- base::unique
hide <- shinyjs::hide
show <- shinyjs::show
show_object <- methods::show
filter <- dplyr::filter

# Create own functions
## Function to get complete cases
completeFun <- function(data, desiredCols) {
    completeVec <- complete.cases(data[, desiredCols])
    return(data[completeVec, ])
}

## Function to get mode
getmode <- function(v) {
    uniqv <- unique(v)
    uniqv[which.max(tabulate(match(v, uniqv)))]
}

## Function to position sample size
give.n <- function(x) {
    return(c(y = median(x) * 1.05, label = length(x)))
}

## Download Plot
Download_Server <- function(id, datalist, plot) {
    moduleServer(id, function(input, output, session) {
        output$Download_PNG <- downloadHandler(
            filename = function() {
                paste(plot, ".png", sep = "")
            },
            content = function(file) {
                png(
                    file,
                    width = input$Plot_Width,
                    height = input$Plot_Height,
                    units = "in",
                    res = 1200
                )
                plot(datalist[[plot]]())
                dev.off()
            }
        )

        output$Download_SVG <-
            downloadHandler(
                filename = function() {
                    paste(plot, ".svg", sep = "")
                },
                content = function(file) {
                    svg(file,
                        width = input$Plot_Width,
                        height = input$Plot_Height
                    )
                    datalist[[plot]]()
                    dev.off()
                }
            )
    })
}

Download_Server_1 <- function(id, datalist, plot) {
    moduleServer(id, function(input, output, session) {
        output$Download_PNG_1 <- downloadHandler(
            filename = function() {
                paste(plot, ".png", sep = "")
            },
            content = function(file) {
                png(
                    file,
                    width = input$Plot_Width_1,
                    height = input$Plot_Height_1,
                    units = "in",
                    res = 1200
                )
                plot(datalist[[plot]]())
                dev.off()
            }
        )

        output$Download_SVG_1 <-
            downloadHandler(
                filename = function() {
                    paste(plot, ".svg", sep = "")
                },
                content = function(file) {
                    svg(file,
                        width = input$Plot_Width_1,
                        height = input$Plot_Height_1
                    )
                    datalist[[plot]]()
                    dev.off()
                }
            )
    })
}


Download_Server_2 <- function(id, datalist, plot) {
    moduleServer(id, function(input, output, session) {
        output$Download_PNG_2 <- downloadHandler(
            filename = function() {
                paste(plot, ".png", sep = "")
            },
            content = function(file) {
                png(
                    file,
                    width = input$Plot_Width_2,
                    height = input$Plot_Height_2,
                    units = "in",
                    res = 1200
                )
                plot(datalist[[plot]]())
                dev.off()
            }
        )

        output$Download_SVG_2 <-
            downloadHandler(
                filename = function() {
                    paste(plot, ".svg", sep = "")
                },
                content = function(file) {
                    svg(file,
                        width = input$Plot_Width_2,
                        height = input$Plot_Height_2
                    )
                    datalist[[plot]]()
                    dev.off()
                }
            )
    })
}
