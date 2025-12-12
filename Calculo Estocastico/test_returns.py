import yfinance as yf
import pandas as pd
import numpy as np

data = yf.download("AAPL", start="2020-01-01", end="2023-01-01")
data.sort_index(inplace=True)
data['Returns'] = data['Close'].pct_change()
print(data[['Close', 'Returns']].head())
