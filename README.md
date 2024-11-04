# nodered-yfinance2-salesforce

- crea nuova immagine
- crea container
- modifica settings.js dentro /data

```javascript
/** The following property can be used to set predefined values in Global Context.
     * This allows extra node modules to be made available with in Function node.
     * For example, the following:
     *    functionGlobalContext: { os:require('os') }
     * will allow the `os` module to be accessed in a Function node using:
     *    global.get("os")
     */
    functionGlobalContext: {
        // os:require('os'),
        yahooFinance:require('yahoo-finance2')
    },
```

Richiesta yahoo finance come global variable

1. crea nuovo flusso
2. aggiungi attivitià "function"
3. inserire codice javascript

## Nodered function
```javascript
const yahooFinance = global.get('yahooFinance'); // Access the global yahooFinance object

(async () => {
    const symbol = msg.symbol || 'WDAY';

    try {
        // Use the correct API method to fetch the quote
        const quote = await yahooFinance.default.quote(symbol);
        msg.payload = {
            symbol: symbol,
            price: quote.regularMarketPrice
        };
        node.send(msg);
    } catch (error) {
        msg.payload = { error: error.message };
        node.send(msg);
    }
})();

return msg;

```
