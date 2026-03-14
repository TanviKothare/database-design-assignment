# Database Design Assignment – F&O Trading Data

## Project Overview
This project implements a relational database design to store and analyze high-volume Futures & Options (F&O) trading data from Indian exchanges such as NSE, BSE, and MCX.

The dataset used is the **NSE Future and Options Dataset (3M)** from Kaggle containing more than **2.5 million rows** with information about instruments, expiry dates, option types, OHLC prices, trading volume, and open interest.

The goal of the project is to demonstrate:
- Database schema design
- SQL query optimization
- Trading analytics using SQL
- Efficient handling of high-volume financial datasets

---

## Dataset
Source: Kaggle – NSE Future and Options Dataset

The dataset includes:
- Instrument type
- Symbol
- Expiry date
- Strike price
- Option type
- Open, High, Low, Close prices
- Settlement price
- Contracts traded
- Open interest
- Timestamp

The schema is designed to support **multiple exchanges** such as:
- NSE
- BSE
- MCX

---

## Database Design

The schema is designed following **Third Normal Form (3NF)** to reduce redundancy and maintain data integrity.

Key design principles:

- Each trade record stores OHLC and volume information.
- Exchange column allows **cross-exchange analytics**.
- Expiry date and strike price support **option chain analysis**.
- Schema supports **high-frequency trading data ingestion**.

---

## Why Star Schema Was Avoided

A star schema is typically used in data warehousing and analytical workloads.

However, for this dataset:

- Data ingestion is **high-frequency and transactional**
- Normalized schema reduces **data duplication**
- Better suited for **time-series financial data**
- Simplifies **data updates and integrity constraints**

Therefore a **normalized relational schema (3NF)** was chosen instead.

---

## Scalability for Large Datasets

The system is designed to handle **10M+ rows of trading data** using:

- Indexing on `symbol` and `timestamp`
- Partitioning strategies based on time or exchange
- Efficient aggregation queries
- Window functions for time-series analysis

These optimizations allow faster query execution for large financial datasets.

---

## SQL Queries Implemented

The project includes several analytical SQL queries:

1. Top 10 symbols by trading volume
2. 7-day rolling volatility for NIFTY options
3. Cross-exchange price comparison
4. Option chain summary by expiry date
5. Maximum trading volume analysis

Window functions and aggregation techniques are used for financial analytics.

---

## Data Loading

Trading data from the Kaggle CSV dataset is loaded into PostgreSQL using Python and Jupyter Notebook.

The notebook performs:

- CSV file loading
- Database connection
- Bulk insertion into the `trades` table

---

## Technologies Used

- PostgreSQL
- SQL
- Python
- Jupyter Notebook
- GitHub

---

## Repository Structure
database-design-assignment
│
├── README.md
├── er_diagram.png
├── design_reasoning.pdf
├── load_data.ipynb
│
└── sql
├── create_tables.sql
├── queries.sql
└── indexes.sql
