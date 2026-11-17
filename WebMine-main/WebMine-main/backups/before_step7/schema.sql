-- WebMine database schema (reconstructed from the queries in AmazonDatabase.py)
-- Run against the "Scraper" database:  psql -U postgres -d Scraper -f schema.sql

CREATE SCHEMA IF NOT EXISTS amazon;
CREATE SCHEMA IF NOT EXISTS bsc;

-- ---------- bsc: internal product catalogue ----------
CREATE TABLE IF NOT EXISTS bsc.categories (
    id   SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS bsc.productmaster (
    ipcode     VARCHAR(100) PRIMARY KEY,
    whsku      VARCHAR(255),
    categoryid INT REFERENCES bsc.categories(id)
);

-- ---------- amazon ----------
-- Maps an Amazon ASIN (platformcode) to the internal product (ipcode)
CREATE TABLE IF NOT EXISTS amazon.productmaster (
    id           SERIAL PRIMARY KEY,
    platformcode VARCHAR(50) NOT NULL UNIQUE,
    ipcode       VARCHAR(100) REFERENCES bsc.productmaster(ipcode)
);

-- Daily snapshot of each product page (written by AmazonReviewDump.py)
CREATE TABLE IF NOT EXISTS amazon.productoverview (
    valuationdate DATE         NOT NULL,
    platformcode  VARCHAR(50)  NOT NULL,
    title         VARCHAR(255),
    price         NUMERIC(12,2),
    rating        NUMERIC(3,1),
    totalrating   INT,
    totalreviews  INT,
    PRIMARY KEY (valuationdate, platformcode)
);

-- Individual reviews (written by AmazonReviewDump.py)
CREATE TABLE IF NOT EXISTS amazon.reviewdump (
    reviewid      VARCHAR(100) PRIMARY KEY,
    valuationdate DATE,
    platformcode  VARCHAR(50),
    reviewername  VARCHAR(255),
    rating        NUMERIC(3,1),
    review        TEXT,
    reviewdate    DATE
);

-- Per-product sentiment (written by AmazonsentimentAnalysis.py)
CREATE TABLE IF NOT EXISTS amazon.sentiment (
    valuationdate       DATE        NOT NULL,
    platformproductcode VARCHAR(50) NOT NULL,
    summary             TEXT,
    positivekeywords    TEXT,
    negativekeywords    TEXT,
    mixedkeywords       TEXT,
    PRIMARY KEY (valuationdate, platformproductcode)
);

-- Per-category sentiment (written by AmazonsentimentAnalysis.py)
CREATE TABLE IF NOT EXISTS amazon.categorysentiment (
    valuationdate    DATE         NOT NULL,
    category         VARCHAR(255) NOT NULL,
    categorysummary  TEXT,
    positivekeywords TEXT,
    negativekeywords TEXT,
    mixedkeywords    TEXT,
    avgprice         NUMERIC(12,2),
    avgrating        NUMERIC(3,2),
    PRIMARY KEY (valuationdate, category)
);

-- Daily sales report (filled from outside this project; used by dashboard sales charts)
CREATE TABLE IF NOT EXISTS amazon.dsrdump (
    valuationdate     DATE NOT NULL,
    platformproductid INT  NOT NULL REFERENCES amazon.productmaster(id),
    totalquantitysold NUMERIC,
    PRIMARY KEY (valuationdate, platformproductid)
);

-- Competitor snapshots (written by AmazonCompScraper.py)
CREATE TABLE IF NOT EXISTS amazon.competitors (
    valuationdate DATE        NOT NULL,
    asin          VARCHAR(50) NOT NULL,
    compasin      VARCHAR(50) NOT NULL,
    compsku       VARCHAR(255),
    category      VARCHAR(255),
    comprating    NUMERIC(3,1),
    compbrand     VARCHAR(255),
    volume        VARCHAR(50),
    sku           VARCHAR(255),
    PRIMARY KEY (valuationdate, asin, compasin)
);
