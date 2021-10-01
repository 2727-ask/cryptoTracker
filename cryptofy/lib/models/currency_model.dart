

class CryptoCurrency{
  var name;
  var eur;
  var usd;
  var chf;
  var gbp;
  var ttry; 

CryptoCurrency({
  this.name,
  this.usd,
  this.eur,
  this.chf,
  this.gbp,
  this.ttry,
});


fetchedValue({var cryptoName, var cryptoPrices}){
  this.name = cryptoName;
  this.usd = cryptoPrices['USD'];
  this.eur = cryptoPrices['EUR'];
  this.chf = cryptoPrices['CHF'];
  this.gbp = cryptoPrices['GBP'];
  this.ttry = cryptoPrices['TRY'];

  //print(this.name);

return this;

}



}