library(shiny)
library(rpart)
library(shinydashboard)
library(ggplot2)
library(dplyr)
library(plotly)
library(DT)
library(leaflet)
library(highcharter)
library(caret)
library(randomForest)

# Install shinythemes jika belum terinstall
# install.packages("shinythemes")

library(shiny)
library(shinythemes)
library(shinydashboard)
library(plotly)

# Membaca data
data_shop <- read.csv("https://raw.githubusercontent.com/fajarathallah/Dashboard-Customer-Behavior/refs/heads/main/Data/shopping_behavior_updated.csv")
data <- data_shop 

ui <- dashboardPage(
  dashboardHeader(title = "Dashboard Analisis Pelanggan", 
                  titleWidth = 300),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Beranda", tabName = "Beranda", icon = icon("home")),
      menuItem("Statistik Deskriptif", tabName = "stats", icon = icon("chart-bar")),
      menuItem("Analisis Produk", tabName = "products", icon = icon("tags")),
      menuItem("Metode Pembayaran", tabName = "payment", icon = icon("credit-card")),
      menuItem("Rating & Ulasan", tabName = "ratings", icon = icon("star")),
      menuItem("Lokasi & Pengeluaran", tabName = "location", icon = icon("map-marker-alt")),
      menuItem("Pengiriman & Frekuensi", tabName = "shipping", icon = icon("truck")),
      menuItem("Pelanggan & Pengeluaran", tabName = "customers", icon = icon("user")),
      menuItem("Interaktif", tabName = "interactive", icon = icon("sliders-h")),
      menuItem("Pemodelan", tabName = "modeling", icon = icon("chart-line"))
    )
  ),
  
  dashboardBody(
    # Menambahkan custom CSS untuk tema warna cream, kuning, dan biru
    tags$style(HTML("
      body {
        background-color: #f5f5dc; /* Cream background */
        color: #333333;
      }
      .navbar-default {
        background-color: #ffcc00; /* Kuning untuk navbar */
        border-color: #ffcc00;
      }
      .navbar-default .navbar-brand, .navbar-default .navbar-nav>li>a {
        color: #003366; /* Biru untuk teks navbar */
      }
      .box {
        background-color: #e6f7ff; /* Biru muda untuk box */
      }
      .box-title {
        color: #003366; /* Biru untuk judul box */
      }
      .btn-primary {
        background-color: #ffcc00; /* Kuning untuk tombol */
        border-color: #ffcc00;
      }
      .btn-primary:hover {
        background-color: #ff9900; /* Warna kuning lebih gelap saat hover */
        border-color: #ff9900;
      }
      .skin-blue .main-header .logo {
        background-color: #003366; /* Biru untuk logo */
        color: #ffcc00;
      }
      .skin-blue .main-header .logo:hover {
        background-color: #003366;
      }
      .box-header {
        background-color: #003366; /* Biru untuk header box */
        color: #ffcc00;
      }
      .selectize-input, .selectize-dropdown {
        background-color: #e6f7ff; /* Biru muda untuk selectInput */
      }
    ")),
    
    
    tabItems(
      tabItem(
        tabName = "Beranda",
        div(style = "max-width: 1000px; overflow: hidden; margin: auto;",
            img(src = "https://raw.githubusercontent.com/fajarathallah/Dashboard-Customer-Behavior/main/Data/Header.jpg", 
                style = "width: 70%; max-width: 1000px; margin: auto; display: block;"),
            lead = span("Hai, selamat datang di tempat di mana setiap angka memiliki arti. Bersiaplah untuk menghadirkan dampak besar melalui keputusan yang didukung oleh data!", 
                        style = "font-size:20px; font-weight:bold; display: flex; align-items: center; background-color: #4876FF; color: #ffffFF; padding: 15px; border-radius: 5px;"),
            solidHeader = TRUE,
            status = NULL,
            style = "background-color: #ffffff;"
        ),
        tags$head(
          tags$style(HTML(".jumbotron .btn {display: none;  /* Menghapus tombol more */}"))
        ),
        box(
          title = "Interactive Dashboard",
          solidHeader = TRUE,
          status = "primary",
          tags$p("Mulai Telusuri Data Anda. Klik tab 'Statistik Deskriptif', 'Analisis Produk', 'Metode Pembayaran', 'Rating', 'Lokasi', hingga 'Pelanggan'  di bagian atas layar untuk memulai penjelajahan data Anda dengan mudah dan cepat!",
                 style = "background-color: #0c0f36;color: #a88f1e;font-size:15px;display: flex;align-items: center;text-align: justify; padding: 10px; border-radius: 5px;"
          ),
          width = 12,
          collapsible = TRUE,
          collapsed = TRUE 
        ),
        tags$h2("Selamat Datang di Dashboard yang Interaktif"),
        tags$p("Gunakan dashboard ini untuk menjelajahi data Anda dengan cara yang baru dan interaktif. Anda dapat memfilter data, melihat tren, membandingkan metrik, dan menggali informasi detail dengan cepat. Mari buat keputusan lebih pintar bersama data "),
        tags$ol(
          tags$li("Pembayaran"),
          tags$p("Temukan bagaimana pelanggan Anda memilih untuk membayar! Dari metode paling populer hingga pola pengeluaran berdasarkan jenis pembayaran, tab ini memberikan wawasan mendalam untuk memahami kebiasaan pelanggan Anda."),
          tags$br(),
          tags$li("Produk"),
          tags$p("Lihatlah Top 5 produk yang terjual"),
          tags$br(),
          tags$li("Pelanggan"),
          tags$p("Tab ini membantu Anda memahami siapa pelanggan Anda. Dari segmentasi usia hingga lokasi, lihat bagaimana pelanggan Anda berperilaku dan temukan cara terbaik untuk meningkatkan keterlibatan mereka."),
          tags$br(),
          
        )
      ),
      
      # Tab 1: Statistik Deskriptif
      tabItem(
        tabName = "stats",
        fluidRow(
          box(title = "Distribusi Usia", width = 6, plotOutput("ageDist")),
          box(title = "Statistik Pengeluaran", width = 6, tableOutput("summaryStats"))
        )
      ),
      
      # Tab 2: Analisis Produk
      tabItem(
        tabName = "products",
        fluidRow(
          box(
            title = "Top 5 Produk Berdasarkan Jumlah Penjualan",
            width = 6,
            plotlyOutput("topProductsVertical")
          ),
          box(
            title = "Pengeluaran Berdasarkan Kategori",
            width = 6,
            plotlyOutput("categorySpend")
          )
        ),
        fluidRow(
          box(
            title = "Filter Berdasarkan Kategori",
            width = 6,
            selectInput("selectedCategory", "Pilih Kategori:", 
                        choices = unique(data$Category), 
                        selected = unique(data$Category)[1])
          ),
          box(
            title = "Rata-rata Pengeluaran untuk Produk Terpilih",
            width = 6,
            plotlyOutput("avgProductSpendVertical")
          )
        )
      ),
      
      # Tab 3: Metode Pembayaran
      tabItem(
        tabName = "payment",
        fluidRow(
          box(title = "Metode Pembayaran Terpopuler (Interaktif)", width = 6, plotlyOutput("paymentMethodInteractive")),
          box(title = "Pengeluaran Rata-rata Berdasarkan Metode Pembayaran (Interaktif)", width = 6, plotlyOutput("paymentSpendInteractive")),
          box(title = "Distribusi Metode Pembayaran (Pie Chart)", width = 12, plotlyOutput("paymentPie")),
          box(
            title = "Filter Berdasarkan Kategori",
            width = 12,
            selectInput("paymentFilter", "Pilih Kategori Produk:", choices = unique(data$Category), selected = unique(data$Category)[1]),
            plotlyOutput("filteredPayment", height = "400px")
          )
        )
      ),
      
      # Tab 4: Rating dan Ulasan
      tabItem(
        tabName = "ratings",
        fluidRow(
          box(
            title = "Filter Produk",
            width = 6,
            selectInput("selectedProduct", "Pilih Produk:", 
                        choices = unique(data$Item.Purchased), 
                        selected = unique(data$Item.Purchased)[1])
          ),
          box(
            title = "Jumlah Pelanggan Memberikan Rating Tinggi (4 & 5)",
            width = 6,
            plotlyOutput("filteredHighRatingsBar")
          )
        ),
        fluidRow(
          box(
            title = "Rata-rata Rating Produk Terpilih", 
            width = 6, 
            verbatimTextOutput("avgRatingText")
          ),
          box(
            title = "Scatter Plot: Hubungan Rating dan Pengeluaran", 
            width = 6, 
            plotlyOutput("ratingSpendingScatter")
          )
        ),
        fluidRow(
          box(
            title = "Bubble Chart: Hubungan Kategori, Pembelian, dan Rating", 
            width = 12, 
            plotlyOutput("categoryBubbleChart")
          )
        )
      ),
      
      # Tab 5: Lokasi dan Pengeluaran
      tabItem(
        tabName = "location",
        fluidRow(
          box(title = "Top 5 Lokasi Berdasarkan Pengeluaran", width = 6, plotOutput("topLocations")),
          box(title = "Rata-rata Pengeluaran Berdasarkan Lokasi", width = 6, plotOutput("avgLocationSpend"))
        )
      ),
      
      # Tab 6: Pengiriman dan Frekuensi
      tabItem(
        tabName = "shipping",
        fluidRow(
          box(title = "Jenis Pengiriman Terpopuler", width = 6, plotOutput("shippingType")),
          box(title = "Pengeluaran Berdasarkan Frekuensi Pembelian", width = 6, plotOutput("freqSpend"))
        )
      ),
      
      # Tab 7: Pelanggan dan Pengeluaran
      tabItem(
        tabName = "customers",
        fluidRow(
          box(title = "Statistik Pelanggan", width = 6, 
              textOutput("uniqueCustomers"),
              textOutput("avgSpendingPerCustomer"),
              textOutput("totalSpending")),
          box(title = "Distribusi Pelanggan Berdasarkan Usia", width = 6, plotOutput("ageDistribution"))
        ),
        fluidRow(
          box(title = "Segmentasi Pelanggan Berdasarkan Usia", width = 6, plotOutput("segmentSpending")),
          box(title = "Rata-rata Pengeluaran Berdasarkan Lokasi", width = 6, plotOutput("avgLocationSpending"))
        ),
        tabPanel("Pelanggan dan Pengeluaran",
                 sidebarLayout(
                   sidebarPanel(
                     selectInput("columnSelect", 
                                 "Pilih Kolom untuk Pie Chart", 
                                 choices = names(data)[sapply(data, function(x) is.factor(x) | is.character(x))],  # Only categorical columns
                                 selected = names(data)[1])  # Default selection to first categorical column
                   ),
                   mainPanel(
                     plotOutput("pieChart")  # Display pie chart
                   )
                 )
        )
      ),
      
      # Tab Interaktif
      tabItem(
        tabName = "interactive",
        fluidRow(
          column(4,
                 selectInput("var_x", "Pilih Variabel Kategori:", 
                             choices = c("Category", "Item.Purchased", "Payment.Method")),
                 selectInput("gender_choice", "Pilih Gender:",
                             choices = c("All", "Male", "Female"), 
                             selected = "All"),
                 selectInput("location_choice", "Pilih Lokasi:",
                             choices = c("All", unique(data$Location)), 
                             selected = "All"), # Input untuk lokasi
                 sliderInput("age_range", "Pilih Rentang Umur:", 
                             min = min(data$Age, na.rm = TRUE), 
                             max = max(data$Age, na.rm = TRUE),
                             value = c(min(data$Age, na.rm = TRUE), 
                                       max(data$Age, na.rm = TRUE))), # Slider untuk umur
                 checkboxGroupInput("var_columns", "Pilih Variabel untuk Tabel:",
                                    choices = colnames(data), 
                                    selected = colnames(data)) # Pilih semua kolom secara default
          ),
          column(8,
                 fluidRow(
                   column(6, highchartOutput("barplot")),             # Barplot di kolom kiri
                   column(6, highchartOutput("barplot_season"))       # Barplot berdasarkan Season di kolom kanan
                 ),
                 fluidRow(
                   DTOutput("data_table")  # Untuk menampilkan tabel di bawah plot
                 )
          )
        )
      ),
      
      # Tab Pemodelan
      tabItem(
        tabName = "modeling",
        fluidRow(
          box(
            title = "Pilih Model Pemodelan",
            width = 12,
            selectInput("modelType", "Pilih Model:",
                        choices = c("Regresi Linear", "Random Forest"),
                        selected = "Regresi Linear"),
            sliderInput("trainSplit", "Pilih Proporsi Data Training:",
                        min = 0.6, max = 0.9, value = 0.7, step = 0.05),
            uiOutput("selectVariables"),
            checkboxInput("showCoefficients", "Tampilkan Koefisien Model", TRUE),
            wellPanel(
              h4("Deskripsi Model"),
              p("1. Regresi Linear: Memodelkan hubungan linier antara variabel input dan pengeluaran."),
              p("2. Random Forest: Model berbasis ensemble yang lebih kuat untuk menangani hubungan non-linier.")
            ),
            a("Pelajari lebih lanjut tentang pemodelan", href = "https://www.rdocumentation.org/packages/randomForest/versions/4.7-1.1/topics/randomForest", target = "_blank")
          )
        ),
        fluidRow(
          column(6,
                 h3("Ringkasan Model"),
                 verbatimTextOutput("modelSummary")
          ),
          column(6,
                 h3("Visualisasi Model"),
                 plotOutput("modelPlot")
          )
        ),
        fluidRow(
          column(6,
                 h3("Prediksi Model"),
                 DTOutput("predictionTable")
          )
        )
      )
    )
  )
)









#Server
server <- function(input, output, session) {
  # Tab 1: Statistik Deskriptif
  output$ageDist <- renderPlot({
    ggplot(data, aes(x = Age)) +
      geom_histogram(binwidth = 5, fill = "blue", alpha = 0.7) +
      theme_minimal() +
      labs(title = "Distribusi Usia", x = "Usia", y = "Jumlah")
  })
  
  output$summaryStats <- renderTable({
    data.frame(
      Statistic = c("Mean", "Median", "Mode", "Variance", "Standard Deviation"),
      Value = c(
        mean(data$Age),
        median(data$Age),
        as.numeric(names(sort(table(data$Age), decreasing = TRUE)[1])),
        var(data$Purchase.Amount..USD.),
        sd(data$Purchase.Amount..USD.)
      )
    )
  })
  
  # Tab 2: Top 5 Produk
  output$topProductsVertical <- renderPlotly({
    top_products <- data %>%
      count(Item.Purchased) %>%
      arrange(desc(n)) %>%
      head(5)
    
    plot_ly(
      data = top_products,
      x = ~Item.Purchased,
      y = ~n,
      type = "bar",
      marker = list(color = 'rgba(44, 160, 44, 0.7)', 
                    line = list(color = 'rgba(44, 160, 44, 1.0)', width = 1.5))
    ) %>%
      layout(
        title = "Top 5 Produk Berdasarkan Jumlah Penjualan",
        xaxis = list(title = "Produk"),
        yaxis = list(title = "Jumlah Penjualan")
      )
  })
  output$categorySpend <- renderPlotly({
    category_spend <- data %>%
      group_by(Category) %>%
      summarise(TotalSpend = sum(Purchase.Amount..USD.))
    
    plot_ly(
      data = category_spend,
      labels = ~Category,
      values = ~TotalSpend,
      type = "pie",
      textinfo = "label+percent",
      insidetextorientation = "radial"
    ) %>%
      layout(
        title = "Pengeluaran Berdasarkan Kategori",
        showlegend = TRUE
      )
  })
  
  filteredDataByCategory <- reactive({
    data %>%
      filter(Category == input$selectedCategory)
  })
  output$avgProductSpendVertical <- renderPlotly({
    avg_spend <- filteredDataByCategory() %>%
      group_by(Item.Purchased) %>%
      summarise(AverageSpend = mean(Purchase.Amount..USD.))
    
    plot_ly(
      data = avg_spend,
      x = ~Item.Purchased,
      y = ~AverageSpend,
      type = "bar",
      marker = list(color = 'rgba(255, 99, 71, 0.7)', 
                    line = list(color = 'rgba(255, 99, 71, 1.0)', width = 1.5))
    ) %>%
      layout(
        title = paste("Rata-rata Pengeluaran untuk Kategori:", input$selectedCategory),
        xaxis = list(title = "Produk"),
        yaxis = list(title = "Rata-rata Pengeluaran (USD)")
      )
  })
  
  # Tab 3: Metode Pembayaran
  output$paymentMethodInteractive <- renderPlotly({
    payment_count <- data %>%
      count(Payment.Method)
    
    plot_ly(
      data = payment_count,
      x = ~n,
      y = ~reorder(Payment.Method, n),
      type = "bar",
      orientation = "h",
      marker = list(color = 'rgba(58, 71, 80, 0.6)', line = list(color = 'rgba(58, 71, 80, 1.0)', width = 1.5))
    ) %>%
      layout(
        title = "Metode Pembayaran Terpopuler (Interaktif)",
        xaxis = list(title = "Jumlah"),
        yaxis = list(title = "Metode Pembayaran")
      )
  })
  
  # Grafik interaktif: Pengeluaran rata-rata berdasarkan metode pembayaran
  output$paymentSpendInteractive <- renderPlotly({
    payment_spend <- data %>%
      group_by(Payment.Method) %>%
      summarise(AverageSpend = mean(Purchase.Amount..USD.))
    
    plot_ly(
      data = payment_spend,
      x = ~AverageSpend,
      y = ~reorder(Payment.Method, AverageSpend),
      type = "bar",
      orientation = "h",
      marker = list(color = 'rgba(26, 118, 255, 0.6)', line = list(color = 'rgba(26, 118, 255, 1.0)', width = 1.5))
    ) %>%
      layout(
        title = "Pengeluaran Rata-rata Berdasarkan Metode Pembayaran (Interaktif)",
        xaxis = list(title = "Rata-rata Pengeluaran (USD)"),
        yaxis = list(title = "Metode Pembayaran")
      )
  })
  
  # Pie chart: Distribusi metode pembayaran
  output$paymentPie <- renderPlotly({
    payment_count <- data %>%
      count(Payment.Method)
    
    plot_ly(
      data = payment_count,
      labels = ~Payment.Method,
      values = ~n,
      type = "pie",
      textinfo = "label+percent",
      insidetextorientation = "radial",
      marker = list(colors = c('#636EFA', '#EF553B', '#00CC96', '#AB63FA', '#FFA15A', '#19D3F3'))
    ) %>%
      layout(
        title = "Distribusi Metode Pembayaran (Pie Chart)",
        showlegend = TRUE
      )
  })
  
  # Grafik dengan filter kategori produk
  filteredData <- reactive({
    data %>%
      filter(Category == input$paymentFilter)
  })
  
  output$filteredPayment <- renderPlotly({
    payment_count <- filteredData() %>%
      count(Payment.Method)
    
    plot_ly(
      data = payment_count,
      x = ~n,
      y = ~reorder(Payment.Method, n),
      type = "bar",
      orientation = "h",
      marker = list(color = 'rgba(255, 99, 71, 0.6)', line = list(color = 'rgba(255, 99, 71, 1.0)', width = 1.5))
    ) %>%
      layout(
        title = paste("Metode Pembayaran Berdasarkan Kategori:", input$paymentFilter),
        xaxis = list(title = "Jumlah"),
        yaxis = list(title = "Metode Pembayaran")
      )
  })
  
  # Tab 4: Rating dan Ulasan
  output$filteredHighRatingsBar <- renderPlotly({
    # Filter data berdasarkan produk yang dipilih dan rating >= 4
    filtered_data <- data %>%
      filter(Item.Purchased == input$selectedProduct, Review.Rating >= 4) %>%
      count(Review.Rating)
    
    # Buat grafik batang
    plot_ly(
      data = filtered_data,
      x = ~Review.Rating,
      y = ~n,
      type = "bar",
      marker = list(color = 'rgba(58, 71, 80, 0.6)', 
                    line = list(color = 'rgba(58, 71, 80, 1.0)', width = 1.5))
    ) %>%
      layout(
        title = paste("Jumlah Rating Tinggi untuk", input$selectedProduct),
        xaxis = list(title = "Rating"),
        yaxis = list(title = "Jumlah")
      )
  })
  
  output$avgRatingText <- renderText({
    avg_rating <- data %>%
      summarise(AverageRating = mean(Review.Rating, na.rm = TRUE)) %>%
      pull(AverageRating)
    
    paste("Rata-rata Rating: ", round(avg_rating, 2))
  })
  output$ratingSpendingScatter <- renderPlotly({
    scatter_data <- data %>%
      group_by(Item.Purchased) %>%
      summarise(
        AverageRating = mean(Review.Rating, na.rm = TRUE),
        AverageSpending = mean(Purchase.Amount..USD., na.rm = TRUE)
      )
    
    plot_ly(
      data = scatter_data,
      x = ~AverageRating,
      y = ~AverageSpending,
      type = "scatter",
      mode = "markers",
      marker = list(size = 10, color = 'rgba(93, 164, 214, 0.7)', line = list(color = 'rgba(93, 164, 214, 1.0)', width = 1))
    ) %>%
      layout(
        title = "Hubungan Rating dan Pengeluaran Rata-rata",
        xaxis = list(title = "Rata-rata Rating"),
        yaxis = list(title = "Pengeluaran Rata-rata (USD)")
      )
  })
  output$ratingSpendingScatter <- renderPlotly({
    scatter_data <- data %>%
      group_by(Item.Purchased) %>%
      summarise(
        AverageRating = mean(Review.Rating, na.rm = TRUE),
        AverageSpending = mean(Purchase.Amount..USD., na.rm = TRUE)
      )
    
    plot_ly(
      data = scatter_data,
      x = ~AverageRating,
      y = ~AverageSpending,
      type = "scatter",
      mode = "markers",
      marker = list(size = 10, color = 'rgba(93, 164, 214, 0.7)', line = list(color = 'rgba(93, 164, 214, 1.0)', width = 1))
    ) %>%
      layout(
        title = "Hubungan Rating dan Pengeluaran Rata-rata",
        xaxis = list(title = "Rata-rata Rating"),
        yaxis = list(title = "Pengeluaran Rata-rata (USD)")
      )
  })
  output$categoryBubbleChart <- renderPlotly({
    bubble_data <- data %>%
      group_by(Category) %>%
      summarise(
        TotalPurchases = n(),
        AverageRating = mean(Review.Rating, na.rm = TRUE),
        TotalSpending = sum(Purchase.Amount..USD., na.rm = TRUE)
      )
    
    plot_ly(
      data = bubble_data,
      x = ~TotalPurchases,
      y = ~AverageRating,
      size = ~TotalSpending,
      type = "scatter",
      mode = "markers",
      marker = list(opacity = 0.6),
      text = ~paste(
        "Kategori: ", Category, "<br>",
        "Jumlah Pembelian: ", TotalPurchases, "<br>",
        "Rata-rata Rating: ", round(AverageRating, 2), "<br>",
        "Total Pengeluaran: $", round(TotalSpending, 2)
      )
    ) %>%
      layout(
        title = "Hubungan Kategori, Pembelian, dan Rating",
        xaxis = list(title = "Jumlah Pembelian"),
        yaxis = list(title = "Rata-rata Rating"),
        showlegend = FALSE
      )
  })
  
  
  
  # Tab 5: Lokasi dan Pengeluaran
  
  # Plot untuk Top 5 Lokasi Berdasarkan Pengeluaran
  output$topLocations <- renderPlot({
    data %>%
      group_by(Location) %>%
      summarise(TotalSpend = sum(Purchase.Amount..USD.)) %>%
      top_n(5, TotalSpend) %>%
      ggplot(aes(x = reorder(Location, TotalSpend), y = TotalSpend, fill = Location)) +
      geom_bar(stat = "identity") +
      theme_minimal() +
      coord_flip() +
      labs(title = "Top 5 Lokasi Berdasarkan Pengeluaran", x = "Lokasi", y = "Total Pengeluaran (USD)")
  })
  
  # Plot untuk Rata-rata Pengeluaran Berdasarkan Lokasi
  output$avgLocationSpend <- renderPlot({
    data %>%
      group_by(Location) %>%
      summarise(AverageSpend = mean(Purchase.Amount..USD.)) %>%
      top_n(5, AverageSpend) %>%
      ggplot(aes(x = reorder(Location, AverageSpend), y = AverageSpend, fill = Location)) +
      geom_bar(stat = "identity") +
      theme_minimal() +
      coord_flip() +
      labs(title = "Rata-rata Pengeluaran Berdasarkan Lokasi", x = "Lokasi", y = "Rata-rata Pengeluaran (USD)")
  })
  
  # Tab 6: Pengiriman dan Frekuensi
  output$shippingType <- renderPlot({
    data %>%
      count(Shipping.Type) %>%
      ggplot(aes(x = reorder(Shipping.Type, n), y = n, fill = Shipping.Type)) +
      geom_bar(stat = "identity") +
      theme_minimal() +
      coord_flip() +
      labs(title = "Jenis Pengiriman Terpopuler", x = "Jenis Pengiriman", y = "Jumlah")
  })
  
  output$freqSpend <- renderPlot({
    data %>%
      group_by(Frequency.of.Purchases) %>%
      summarise(TotalSpend = sum(Purchase.Amount..USD.)) %>%
      ggplot(aes(x = reorder(Frequency.of.Purchases, TotalSpend), y = TotalSpend, fill = Frequency.of.Purchases)) +
      geom_bar(stat = "identity") +
      theme_minimal() +
      coord_flip() +
      labs(title = "Pengeluaran Berdasarkan Frekuensi Pembelian", x = "Frekuensi Pembelian", y = "Total Pengeluaran (USD)")
  })
  # Tab 7: Pelanggan dan Pengeluaran
  # Statistik Pelanggan
  output$uniqueCustomers <- renderText({
    paste("Jumlah Pelanggan Unik:", length(unique(data$Customer.ID)))
  })
  
  output$avgSpendingPerCustomer <- renderText({
    avg_spending <- data %>%
      group_by(Customer.ID) %>%
      summarise(TotalSpend = sum(Purchase.Amount..USD.)) %>%
      summarise(AvgSpend = mean(TotalSpend)) %>%
      pull(AvgSpend)
    
    paste("Rata-rata Pengeluaran per Pelanggan: $", round(avg_spending, 2))
  })
  
  output$totalSpending <- renderText({
    total_spending <- sum(data$Purchase.Amount..USD.)
    paste("Total Pengeluaran Keseluruhan: $", round(total_spending, 2))
  })
  
  # Distribusi Pelanggan Berdasarkan Usia
  output$ageDistribution <- renderPlot({
    ggplot(data, aes(x = Age)) +
      geom_histogram(binwidth = 5, fill = "blue", alpha = 0.7) +
      theme_minimal() +
      labs(title = "Distribusi Usia Pelanggan", x = "Usia", y = "Jumlah Pelanggan")
  })
  
  # Segmentasi Pelanggan Berdasarkan Usia
  output$segmentSpending <- renderPlot({
    segmented_data <- data %>%
      mutate(AgeGroup = case_when(
        Age <= 25 ~ "Muda (<=25)",
        Age > 25 & Age <= 50 ~ "Dewasa (26-50)",
        Age > 50 ~ "Lansia (>50)"
      )) %>%
      group_by(AgeGroup) %>%
      summarise(AverageSpend = mean(Purchase.Amount..USD.))
    
    ggplot(segmented_data, aes(x = AgeGroup, y = AverageSpend, fill = AgeGroup)) +
      geom_bar(stat = "identity") +
      theme_minimal() +
      labs(title = "Rata-rata Pengeluaran Berdasarkan Usia", x = "Kelompok Usia", y = "Rata-rata Pengeluaran (USD)")
  })
  
  # Rata-rata Pengeluaran Berdasarkan Lokasi
  data_shop <- read.csv("https://raw.githubusercontent.com/fajarathallah/Dashboard-Customer-Behavior/refs/heads/main/Data/shopping_behavior_updated.csv")
  data_shop <- data_shop %>%
    mutate(Region = case_when(
      Location %in% c("California", "Nevada", "Oregon", "Washington") ~ "West",
      Location %in% c("New York", "Massachusetts", "Pennsylvania", "New Jersey") ~ "East",
      Location %in% c("Texas", "Florida", "Georgia", "Alabama") ~ "South",
      Location %in% c("Illinois", "Ohio", "Michigan", "Indiana") ~ "Midwest",
      TRUE ~ "Other"
    ))
  output$avgLocationSpending <- renderPlot({
    location_spend <- data_shop %>%
      group_by(Location) %>%
      summarise(AverageSpend = mean(Purchase.Amount..USD.)) %>%
      arrange(desc(AverageSpend))
    
    ggplot(location_spend, aes(x = reorder(Location, AverageSpend), y = AverageSpend, fill = Location)) +
      geom_bar(stat = "identity") +
      coord_flip() +
      theme_minimal() +
      labs(title = "Rata-rata Pengeluaran Berdasarkan Lokasi", x = "Lokasi", y = "Rata-rata Pengeluaran (USD)")
  })
  
  # Server Logic for Pie Chart (Add in the server function)
  output$pieChart <- renderPlot({
    # Get the selected column from user input
    selected_column <- input$columnSelect
    
    # Ensure the selected column is a categorical type (factor or character)
    if (is.factor(data_shop[[selected_column]]) | is.character(data_shop[[selected_column]])) {
      
      # Get the data from the selected column
      pie_data <- data_shop[[selected_column]]
      
      # Count the frequency of unique values in the selected column
      value_counts <- table(pie_data)
      unique_values <- length(value_counts)
      
      # Prepare a color palette for the pie chart
      colors <- RColorBrewer::brewer.pal(min(unique_values, 9), "Set3")
      
      # Plot the pie chart (donut chart with hole in the center)
      pie(value_counts, 
          labels = paste(names(value_counts), "\n", value_counts, "(", round(100 * value_counts / sum(value_counts), 1), "%)"), 
          col = colors,
          main = paste("Komposisi Kolom:", selected_column, "\nDengan", unique_values, "Unique Values"),
          cex.main = 1.2, 
          radius = 0.8)  # Adjust for donut chart
      
      # Ensure the plot is circular
      par(pty = "m")
    } else {
      # In case a non-categorical column is selected, show a warning message
      plot.new()
      text(0.5, 0.5, "Please select a categorical column.", cex = 1.5)
    }
  })
  
  
  
  # Tab Interaktif
  # Data yang difilter berdasarkan pilihan gender, lokasi, dan umur
  filtered_data <- reactive({
    data_filtered <- data
    if (input$gender_choice != "All") {
      data_filtered <- data_filtered %>% filter(Gender == input$gender_choice)
    }
    if (input$location_choice != "All") {
      data_filtered <- data_filtered %>% filter(Location == input$location_choice)
    }
    data_filtered <- data_filtered %>% filter(Age >= input$age_range[1], Age <= input$age_range[2])
    return(data_filtered)
  })
  
  # Barplot utama
  output$barplot <- renderHighchart({
    data_grouped <- filtered_data() %>%
      count(!!sym(input$var_x)) %>%
      arrange(desc(n))
    
    highchart() %>%
      hc_chart(type = "column") %>%
      hc_title(text = paste("Distribusi", input$var_x)) %>%
      hc_xAxis(categories = data_grouped[[input$var_x]]) %>%
      hc_yAxis(title = list(text = "Jumlah")) %>%
      hc_series(list(name = "Jumlah", data = data_grouped$n)) %>%
      hc_plotOptions(column = list(dataLabels = list(enabled = TRUE)))
  })
  
  # Barplot berdasarkan Season
  output$barplot_season <- renderHighchart({
    if (!"Season" %in% colnames(filtered_data())) {
      return(NULL)  # Pastikan kolom Season ada sebelum dilanjutkan
    }
    
    data_grouped <- filtered_data() %>%
      group_by(Season, Category) %>%
      summarize(Jumlah = n(), .groups = "drop") %>%
      arrange(Season)
    
    highchart() %>%
      hc_chart(type = "column") %>%
      hc_title(text = "Distribusi Category Berdasarkan Season") %>%
      hc_xAxis(categories = unique(data_grouped$Season), title = list(text = "Season")) %>%
      hc_yAxis(title = list(text = "Jumlah")) %>%
      hc_add_series(data = data_grouped, type = "column", hcaes(x = Season, y = Jumlah, group = Category)) %>%
      hc_plotOptions(column = list(dataLabels = list(enabled = TRUE)))
  })
  
  # Menampilkan tabel dengan kolom yang dipilih
  output$data_table <- renderDT({
    data_selected <- filtered_data() %>% select(all_of(input$var_columns))
    datatable(data_selected, options = list(pageLength = 10, scrollX = TRUE))
  })
  # Membagi Data untuk Pelatihan dan Pengujian
  splitData <- reactive({
    set.seed(123)  # Ensure reproducibility
    trainIndex <- createDataPartition(data$Purchase.Amount..USD., p = input$trainSplit, list = FALSE)
    trainData <- data[trainIndex, ]
    testData <- data[-trainIndex, ]
    return(list(train = trainData, test = testData))
  })
  
  # Reactive expression untuk model berdasarkan input pengguna
  model <- reactive({
    split <- splitData()
    trainData <- split$train
    testData <- split$test
    
    if (input$modelType == "Regresi Linear") {
      mod <- lm(Purchase.Amount..USD. ~ ., data = trainData[, c(input$variables, "Purchase.Amount..USD.")])
    } else if (input$modelType == "Random Forest") {
      mod <- randomForest(Purchase.Amount..USD. ~ ., data = trainData[, !names(trainData) %in% c("Customer.ID")])  # Menghindari penggunaan Customer.ID
    }
    return(list(model = mod, testData = testData))
  })
  
  # Menampilkan Pilihan Variabel untuk Regresi Linear
  output$selectVariables <- renderUI({
    if (input$modelType == "Regresi Linear") {
      checkboxGroupInput("variables", "Pilih Variabel untuk Model:",
                         choices = c("Age", "Gender", "Frequency.of.Purchases", "Payment.Method"),
                         selected = c("Age", "Frequency.of.Purchases"))
    }
  })
  
  # Ringkasan Model
  output$modelSummary <- renderPrint({
    mod <- model()$model
    if (input$modelType == "Regresi Linear") {
      summary(mod)  # Tidak menampilkan metrik, hanya ringkasan koefisien
    } else if (input$modelType == "Random Forest") {
      varImp(mod)  # Menampilkan pentingnya variabel pada Random Forest
    }
  })
  
  # Visualisasi Model
  output$modelPlot <- renderPlot({
    mod <- model()$model
    testData <- model()$testData
    
    if (input$modelType == "Regresi Linear") {
      pred <- predict(mod, newdata = testData)
      # Menampilkan scatter plot antara variabel X yang dipilih dan Purchase.Amount..USD.
      ggplot(testData, aes_string(x = input$variables[1], y = "Purchase.Amount..USD.")) +
        geom_point() +
        geom_smooth(method = "lm", col = "red") +
        labs(x = input$variables[1], y = "Pengeluaran (USD)", title = "Scatter Plot Regresi Linear")
    } else if (input$modelType == "Random Forest") {
      varImpPlot(mod, main = "Pentingnya Variabel (Random Forest)")
    }
  })
  
  # Tabel Prediksi Model
  output$predictionTable <- renderDT({
    mod <- model()$model
    testData <- model()$testData
    
    if (input$modelType == "Regresi Linear" || input$modelType == "Random Forest") {
      pred <- predict(mod, newdata = testData)
      testData$Prediksi <- pred
    }
    datatable(testData, options = list(pageLength = 5))
  })
}

# Run the application
shinyApp(ui = ui, server = server)