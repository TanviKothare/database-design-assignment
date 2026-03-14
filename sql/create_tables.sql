CREATE TABLE IF NOT EXISTS public.trades
(
    instrument text COLLATE pg_catalog."default",
    exchange text COLLATE pg_catalog."default",
    symbol text COLLATE pg_catalog."default",
    expiry_dt date,
    strike_pr numeric,
    option_typ text COLLATE pg_catalog."default",
    open numeric,
    high numeric,
    low numeric,
    close numeric,
    settle_pr numeric,
    contracts bigint,
    val_inlakh numeric,
    open_int bigint,
    chg_in_oi bigint,
    "timestamp" date
)
