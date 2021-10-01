class CheckNetworkModel{
  int type;
  CheckNetworkModel(
    {
      this.type,
    }
  );
  fetchNetworkType({var networkType}){
    this.type = networkType;
    return this;
  }

}