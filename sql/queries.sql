--Top 10 symbols by open interest (OI) change across exchanges.
--This shows which trading symbols had the biggest change in Open Interest.
-- Rank symbols by trading volume
SELECT 
    symbol,
    SUM(contracts) AS total_volume,
    RANK() OVER (ORDER BY SUM(contracts) DESC) AS volume_rank
FROM trades
GROUP BY symbol
ORDER BY volume_rank
LIMIT 10;

--Volatility analysis: 7-day rolling std dev of close prices for NIFTY options.
--This calculates price volatility for NIFTY options.
-- 7-day rolling volatility for NIFTY options
SELECT 
    symbol,
    timestamp,
    close,
    STDDEV(close) OVER (
        PARTITION BY symbol
        ORDER BY timestamp
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS volatility_7_day
FROM trades
WHERE symbol = 'NIFTY'
AND instrument = 'OPTIDX'
ORDER BY timestamp;

--Cross-exchange comparison: Avg settle_pr for gold futures (MCX) vs. equity index futures (NSE).
--This compares average closing prices across exchanges like NSE, BSE, MCX.
SELECT 
    exchange,
    AVG(close) AS avg_close_price
FROM trades
GROUP BY exchange;

--Option chain summary: Grouped by expiry_dt and strike_pr, calculating implied volume.
--This summarizes trading activity by expiry date.
SELECT 
    symbol,
    expiry_dt,
    SUM(contracts) AS total_contracts
FROM trades
GROUP BY symbol, expiry_dt
ORDER BY expiry_dt;

--Performance-optimized query for max volume in last 30 days using indexes/window functions.
--Finds highest traded symbols.
SELECT 
    symbol,
    MAX(contracts) AS max_volume
FROM trades
GROUP BY symbol
ORDER BY max_volume DESC
LIMIT 10;

--Create Index (Performance Optimization)
CREATE INDEX idx_symbol
ON trades(symbol);

CREATE INDEX idx_timestamp
ON trades(timestamp);

--Query Optimization
EXPLAIN ANALYZE
SELECT MAX(contracts)
FROM trades;
