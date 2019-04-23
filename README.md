# RBarchart v0.2.0

[![Build Status](https://travis-ci.org/mariope/RBarchart.png?branch=master)](https://travis-ci.org/mariope/RBarchart)

Barchart OnDemand features a diverse set of market data and information APIs. 
Pricing is based on the number of monthly queries and fields requested. 
They offer four packages: Small, Medium, Large, Enterprise.

## Getting Started

[Barchart.com](https://www.barchart.com/) have available a free API to retrieve quotes and 
historical data and they have a diverse premium set of market data and information APIs. See [Barchart OnDemand](https://www.barchart.com/ondemand)

**RBarchart** package v0.2.0 implements **getQuote**, **getHistory**, **getQuoteEod**, **getClosePrice**, **getFuturesExpirations**, **getFuturesSpecifications** methods from Barchart API.

I hope in a near future to implement the premium methods.

### Prerequisities

If you install from devtools you do not need to do anything else.

```
> devtools::install_github("mariope/RBarchart")
```

#### Getting started

When you load the library, you obtain three functions: 

- **setAPIkey** to set the Barchart API key and define if it is premium API.

- **getQuote** The getQuote API is used to request price data, either real-time, delayed or end-of-day, by symbol on stocks, indexes, mutual funds, ETFs, futures, foreign exchange, or cryptocurrencies.

- **GetHistory** The getHistory API is used to request historical time series data on stocks, indexes, mutual funds, ETFs, futures, foreign exchange, or cryptocurrencies. Historical data is available as tick, minute bars or end-of-day data.

- **getQuoteEod** The getQuoteEod API is used to request end-of-day price data, by combined exchange and symbol, on stocks, indexes, mutual funds, ETFs, futures, foreign exchange, or cryptocurrencies. Historical data is available as tick, minute bars or end-of-day data.

- **getClosePrice** The getClosePrice API provides the close price for given instruments for the given date.

- **getFuturesExpirations** The getFuturesExpiration API from Barchart OnDemand provides first notice and last trade dates for futures contracts.

- **getFuturesSpecifications** Barchart OnDemand's getFuturesSpecifications API provides contract information such as trading hours, contract size and tick size for futures contracts.

```
library(RBarchart)
```

## Running RBarchart

The functions available are:

### setAPIkey

Set the API key and define if it is premium.

```
> setAPIkey('<Your API key>', premium = FALSE)
```

In order to get an API key, please, visit [Barchart Ondemand](https://www.barchart.com/ondemand/api)

### getQuote

The getQuote API is used to request price data, either real-time, 
delayed or end-of-day, by symbol on stocks, indexes, mutual funds, ETFs,
futures, foreign exchange, or cryptocurrencies.

```
> getQuote(symbols = 'ESM19')
> getQuote(symbols = 'NGM19,ESM19', fields = 'openInterest')
```

### getHistory

The getHistory API is used to request historical time series data on stocks,
indexes, mutual funds, ETFs, futures, foreign exchange, or cryptocurrencies.
Historical data is available as tick, minute bars or end-of-day data.

```
> getHistory(symbol = 'ESM19', type = 'dailyContinue')
```

### getQuoteEod

The getQuoteEod API is used to request end-of-day price data, by combined exchange and symbol, on stocks, indexes, mutual funds, ETFs, futures, foreign exchange, or cryptocurrencies. Historical data is available as tick, minute bars or end-of-day data.

```
```

### getClosePrice

The getClosePrice API provides the close price for given instruments for the given date.

```
```

### getFuturesExpirations

The getFuturesExpiration API from Barchart OnDemand provides first notice and last trade dates for futures contracts.

```
```

### getFuturesSpecifications

Barchart OnDemand's getFuturesSpecifications API provides contract information such as trading hours, contract size and tick size for futures contracts.

```
```

## Built With

* R v3.3.3
* R Studio - version 1.1.463
* XML package v3.98
* httr package v1.3.1

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

I use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/mariope/RBarchart/tags). 

## Authors

* **Mario Pisa** - *Initial work* - [RBarchart](https://github.com/mariope/RBarchart)

## License

This project is licensed under the GPL-3 License - see the [LICENSE](LICENSE) file for details

## Acknowledgments

* To Open Source community.
