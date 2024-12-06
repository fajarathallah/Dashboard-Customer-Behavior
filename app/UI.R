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