-- Index for faster symbol filtering
CREATE INDEX IF NOT EXISTS idx_symbol
ON trades(symbol);

-- Index for expiry date filtering
CREATE INDEX IF NOT EXISTS idx_expiry_dt
ON trades(expiry_dt);

-- Index for timestamp queries
CREATE INDEX IF NOT EXISTS idx_timestamp
ON trades("timestamp");

-- Composite index for symbol and expiry
CREATE INDEX IF NOT EXISTS idx_symbol_expiry
ON trades(symbol, expiry_dt);
