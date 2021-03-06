//+------------------------------------------------------------------+
//|                                                      slk_lib.mq4 |
//|                        Copyright 2016, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property library
#property copyright "Copyright 2016, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//---
#define CLR_BUY      clrBlue
#define CLR_SELL     clrRed
#define CLR_CLOSE    clrBlack
#define CLR_MODIFY   clrOrange

#define OP_MARKET    -2
#define OP_PENDING   -3

//--------------------------------------------------------------------
//| GetError                                                         |
//--------------------------------------------------------------------
string GetError(int error_code)
  {
   string error_string;
   switch(error_code)
     {
      case 0:  error_string="no error";                                                   break;
      case 1:  error_string="no error,trade conditions not changed";                      break;
      case 2:  error_string="common error";                                               break;
      case 3:  error_string="invalid trade parameters";                                   break;
      case 4:  error_string="trade server is busy";                                       break;
      case 5:  error_string="old version of the client terminal";                         break;
      case 6:  error_string="no connection with trade server";                            break;
      case 7:  error_string="not enough rights";                                          break;
      case 8:  error_string="too frequent requests";                                      break;
      case 9:  error_string="malfunctional trade operation(never returned error)";        break;
      case 64: error_string="account disabled";                                           break;
      case 65: error_string="invalid account";                                            break;
      case 128:error_string="trade timeout";                                              break;
      case 129:error_string="invalid price";                                              break;
      case 130:error_string="invalid stops";                                              break;
      case 131:error_string="invalid trade volume";                                       break;
      case 132:error_string="market is closed";                                           break;
      case 133:error_string="trade is disabled";                                          break;
      case 134:error_string="not enough money";                                           break;
      case 135:error_string="price changed";                                              break;
      case 136:error_string="off quotes";                                                 break;
      case 137:error_string="broker is busy(never returned error)";                       break;
      case 138:error_string="requote";                                                    break;
      case 139:error_string="order is locked";                                            break;
      case 140:error_string="long positions only allowed";                                break;
      case 141:error_string="too many requests";                                          break;
      case 145:error_string="modification denied because order is too close to market";   break;
      case 146:error_string="trade context is busy";                                      break;
      case 147:error_string="expirations are denied by broker";                           break;
      case 148:error_string="amount of open and pending orders has reached the limit";    break;
      case 149:error_string="hedging is prohibited";                                      break;
      case 150:error_string="prohibited by FIFO rules";                                   break;
      //---mql4 errors
      case 4000:error_string="no error(never generated code)";                            break;
      case 4001:error_string="wrong function pointer";                                    break;
      case 4002:error_string="array index is out of range";                               break;
      case 4003:error_string="no memory for function call stack";                         break;
      case 4004:error_string="recursive stack overflow";                                  break;
      case 4005:error_string="not enough stack for parameter";                            break;
      case 4006:error_string="no memory for parameter string";                            break;
      case 4007:error_string="no memory for temp string";                                 break;
      case 4008:error_string="non-initialized string";                                    break;
      case 4009:error_string="non-initialized string in array";                           break;
      case 4010:error_string="no memory for array\' string";                              break;
      case 4011:error_string="too long string";                                           break;
      case 4012:error_string="remainder from zero divide";                                break;
      case 4013:error_string="zero divide";                                               break;
      case 4014:error_string="unknown command";                                           break;
      case 4015:error_string="wrong jump(never generated error)";                         break;
      case 4016:error_string="non-initialized array";                                     break;
      case 4017:error_string="dll calls are not allowed";                                 break;
      case 4018:error_string="cannot load library";                                       break;
      case 4019:error_string="cannot call function";                                      break;
      case 4020:error_string="expert function calls are not allowed";                     break;
      case 4021:error_string="not enough memory for temp string returned from function";  break;
      case 4022:error_string="system is busy(never generated error)";                     break;
      case 4023:error_string="dll-function call critical error";                          break;
      case 4024:error_string="internal error";                                            break;
      case 4025:error_string="out of memory";                                             break;
      case 4026:error_string="invalid pointer";                                           break;
      case 4027:error_string="too many formatters in the format function";                break;
      case 4028:error_string="parameters count is more than formatters count";            break;
      case 4029:error_string="invalid array";                                             break;
      case 4030:error_string="no reply from chart";                                       break;
      case 4050:error_string="invalid function parameters count";                         break;
      case 4051:error_string="invalid function parameter value";                          break;
      case 4052:error_string="string function internal error";                            break;
      case 4053:error_string="some array error";                                          break;
      case 4054:error_string="incorrect series array usage";                              break;
      case 4055:error_string="custom indicator error";                                    break;
      case 4056:error_string="arrays are incompatible";                                   break;
      case 4057:error_string="global variables processing error";                         break;
      case 4058:error_string="global variable not found";                                 break;
      case 4059:error_string="function is not allowed in testing mode";                   break;
      case 4060:error_string="function is not confirmed";                                 break;
      case 4061:error_string="send mail error";                                           break;
      case 4062:error_string="string parameter expected";                                 break;
      case 4063:error_string="integer parameter expected";                                break;
      case 4064:error_string="double parameter expected";                                 break;
      case 4065:error_string="array as parameter expected";                               break;
      case 4066:error_string="requested history data is in update state";                 break;
      case 4067:error_string="internal trade error";                                      break;
      case 4068:error_string="resource not found";                                        break;
      case 4069:error_string="resource not supported";                                    break;
      case 4070:error_string="duplicate resource";                                        break;
      case 4071:error_string="cannot initialize custom indicator";                        break;
      case 4072:error_string="cannot load custom indicator";                              break;
      case 4073:error_string="no history data";                                           break;
      case 4074:error_string="not enough memory for history data";                        break;
      case 4075:error_string="not enough memory for indicator";                           break;
      case 4099:error_string="end of file";                                               break;
      case 4100:error_string="some file error";                                           break;
      case 4101:error_string="wrong file name";                                           break;
      case 4102:error_string="too many opened files";                                     break;
      case 4103:error_string="cannot open file";                                          break;
      case 4104:error_string="incompatible access to a file";                             break;
      case 4105:error_string="no order selected";                                         break;
      case 4106:error_string="unknown symbol";                                            break;
      case 4107:error_string="invalid price parameter for trade function";                break;
      case 4108:error_string="invalid ticket";                                            break;
      case 4109:error_string="trade is not allowed in the expert properties";             break;
      case 4110:error_string="longs are not allowed in the expert properties";            break;
      case 4111:error_string="shorts are not allowed in the expert properties";           break;
      case 4200:error_string="object already exists";                                     break;
      case 4201:error_string="unknown object property";                                   break;
      case 4202:error_string="object does not exist";                                     break;
      case 4203:error_string="unknown object type";                                       break;
      case 4204:error_string="no object name";                                            break;
      case 4205:error_string="object coordinates error";                                  break;
      case 4206:error_string="no specified subwindow";                                    break;
      case 4207:error_string="graphical object error";                                    break;
      case 4210:error_string="unknown chart property";                                    break;
      case 4211:error_string="chart not found";                                           break;
      case 4212:error_string="chart subwindow not found";                                 break;
      case 4213:error_string="chart indicator not found";                                 break;
      case 4220:error_string="symbol select error";                                       break;
      case 4250:error_string="notification error";                                        break;
      case 4251:error_string="notification parameter error";                              break;
      case 4252:error_string="notifications disabled";                                    break;
      case 4253:error_string="notification send too frequent";                            break;
      case 4260:error_string="ftp server is not specified";                               break;
      case 4261:error_string="ftp login is not specified";                                break;
      case 4262:error_string="ftp connect failed";                                        break;
      case 4263:error_string="ftp connect closed";                                        break;
      case 4264:error_string="ftp change path error";                                     break;
      case 4265:error_string="ftp file error";                                            break;
      case 4266:error_string="ftp error";                                                 break;
      case 5001:error_string="too many opened files";                                     break;
      case 5002:error_string="wrong file name";                                           break;
      case 5003:error_string="too long file name";                                        break;
      case 5004:error_string="cannot open file";                                          break;
      case 5005:error_string="text file buffer allocation error";                         break;
      case 5006:error_string="cannot delete file";                                        break;
      case 5007:error_string="invalid file handle(file closed or was not opened)";        break;
      case 5008:error_string="wrong file handle(handle index is out of handle table)";    break;
      case 5009:error_string="file must be opened with FILE_WRITE flag";                  break;
      case 5010:error_string="file must be opened with FILE_READ flag";                   break;
      case 5011:error_string="file must be opened with FILE_BIN flag";                    break;
      case 5012:error_string="file must be opened with FILE_TXT flag";                    break;
      case 5013:error_string="file must be opened with FILE_TXT or FILE_CSV flag";        break;
      case 5014:error_string="file must be opened with FILE_CSV flag";                    break;
      case 5015:error_string="file read error";                                           break;
      case 5016:error_string="file write error";                                          break;
      case 5017:error_string="string size must be specified for binary file";             break;
      case 5018:error_string="incompatible file(for string arrays-TXT,for others-BIN)";   break;
      case 5019:error_string="file is directory,not file";                                break;
      case 5020:error_string="file does not exist";                                       break;
      case 5021:error_string="file cannot be rewritten";                                  break;
      case 5022:error_string="wrong directory name";                                      break;
      case 5023:error_string="directory does not exist";                                  break;
      case 5024:error_string="specified file is not directory";                           break;
      case 5025:error_string="cannot delete directory";                                   break;
      case 5026:error_string="cannot clean directory";                                    break;
      case 5027:error_string="array resize error";                                        break;
      case 5028:error_string="string resize error";                                       break;
      case 5029:error_string="structure contains strings or dynamic arrays";              break;
      default: error_string="unknown error";
     }
   ResetLastError();
   return(StringConcatenate(error_code,": ",error_string));
  }

//--------------------------------------------------------------------
//| ORDERS                                                           |
//--------------------------------------------------------------------
//+------------------------------------------------------------------+
//| SendOrder                                                        |
//+------------------------------------------------------------------+
int SendOrder(string sym,
              int type,
              double volume,
              double price,
              int slippage,
              double sl,
              double tp,
              string comment,
              int magic,
              datetime expiration,
              color clr,
              string msg="ok")
  {
   datetime dtstart=TimeCurrent();
   while(true)
     {
      if(IsStopped())
        {
         Print("stopped OrderSend: trading is stopped!");
         return(-1);
        }
      if(TimeCurrent()>dtstart+30)
        {
         Print("passed OrderSend: trade context busy for too long");
         return(-1);
        }
      RefreshRates();
      if(type==OP_BUY || type==OP_BUYSTOP || type==OP_BUYLIMIT)
        {
         if(type==OP_BUY) price=MarketInfo(sym,MODE_ASK);
         if(AccountFreeMarginCheck(sym,OP_BUY,volume)<=0 || GetLastError()==134) return(-1);
         if(sl>0 && price-sl<MarketInfo(sym,MODE_STOPLEVEL)*MarketInfo(sym,MODE_POINT)) return(-1);
         if(tp>0 && tp-price<MarketInfo(sym,MODE_STOPLEVEL)*MarketInfo(sym,MODE_POINT)) return(-1);
        }
      else if(type==OP_SELL || type==OP_SELLSTOP || type==OP_SELLLIMIT)
        {
         if(type==OP_SELL) price=MarketInfo(sym,MODE_BID);
         if(AccountFreeMarginCheck(sym,OP_SELL,volume)<=0 || GetLastError()==134) return(-1);
         if(sl>0 && sl-price<MarketInfo(sym,MODE_STOPLEVEL)*MarketInfo(sym,MODE_POINT)) return(-1);
         if(tp>0 && price-tp<MarketInfo(sym,MODE_STOPLEVEL)*MarketInfo(sym,MODE_POINT)) return(-1);
        }
      if(!IsTradeContextBusy())
        {
         double exec=GetTickCount();
         int ticket=OrderSend(sym,
                              type,
                              NormalizeDouble(volume,(int)-MathLog10(MarketInfo(sym,MODE_LOTSTEP))),
                              NormalizeDouble(price,(int)MarketInfo(sym,MODE_DIGITS)),
                              slippage,
                              NormalizeDouble(sl,(int)MarketInfo(sym,MODE_DIGITS)),
                              NormalizeDouble(tp,(int)MarketInfo(sym,MODE_DIGITS)),
                              comment,
                              magic,
                              expiration,
                              clr);
         if(ticket>0)
           {
            if(type==OP_BUY || type==OP_SELL)
              {
               if(OrderSelect(ticket,SELECT_BY_TICKET,MODE_TRADES)==true)
                 {
                  double slip=0;
                  if(OrderType()==OP_BUY) slip=(OrderOpenPrice()-price)/MarketInfo(sym,MODE_POINT);
                  else if(OrderType()==OP_SELL) slip=(price-OrderOpenPrice())/MarketInfo(sym,MODE_POINT);
                  PrintFormat("open #%i execution time: %.f ms slippage: %.f pts %s",ticket,GetTickCount()-exec,slip,msg);
                 }
              }
            else
               PrintFormat("open #%i execution time: %.f ms %s",ticket,GetTickCount()-exec,msg);
            return(ticket);
           }
         int err=GetLastError();
         if(err==ERR_NO_ERROR || err==ERR_COMMON_ERROR || err==ERR_SERVER_BUSY || err==ERR_NO_CONNECTION || err==ERR_MARKET_CLOSED ||
            err==ERR_PRICE_CHANGED || err==ERR_INVALID_PRICE || err==ERR_OFF_QUOTES || err==ERR_BROKER_BUSY || err==ERR_REQUOTE  ||
            err==ERR_TRADE_TIMEOUT || err==ERR_TRADE_CONTEXT_BUSY)
            Print("error (temprary) OrderSend ",GetError(GetLastError()));
         else return(-1);
        }
      else Print("waiting OrderSend: trade context busy");
      Sleep(1000);
     }
   return(-1);
  }
//+------------------------------------------------------------------+
//| CloseOrder                                                       |
//+------------------------------------------------------------------+
bool CloseOrder(int ticket,
                double volume,
                double price,
                int slippage=0,
                color clr=clrRed,
                string msg="ok")

  {
   if(OrderSelect(ticket,SELECT_BY_TICKET,MODE_TRADES)==false) return(false);
   string type=OrderType()==OP_BUY || OrderType()==OP_SELL? "OrderClose":"OrderDelete";
   datetime dtstart=TimeCurrent();
   bool success;
   while(true)
     {
      if(IsStopped())
        {
         Print("stopped ",type,": trading is stopped!");
         return(false);
        }
      if(TimeCurrent()>dtstart+30)
        {
         Print("passed ",type,": trade context busy for too long");
         return(false);
        }
      RefreshRates();
      if(OrderType()==OP_BUY) price=MarketInfo(OrderSymbol(),MODE_BID);
      else if(OrderType()==OP_SELL) price=MarketInfo(OrderSymbol(),MODE_ASK);
      if(!IsTradeContextBusy())
        {
         double exec=GetTickCount();
         if(OrderType()==OP_BUY || OrderType()==OP_SELL)
            success=OrderClose(ticket,
                               volume,
                               NormalizeDouble(price,(int)MarketInfo(OrderSymbol(),MODE_DIGITS)),
                               slippage,
                               clr);
         else
            success=OrderDelete(ticket,clr);

         if(success)
           {
            string type2=OrderType()==OP_BUY || OrderType()==OP_SELL? "close":"delete";
            if(type2=="close")
              {
               if(OrderSelect(ticket,SELECT_BY_TICKET,MODE_HISTORY)==true)
                 {
                  double slip=0;
                  if(OrderType()==OP_BUY) slip=(price-OrderClosePrice())/MarketInfo(OrderSymbol(),MODE_POINT);
                  else if(OrderType()==OP_SELL) slip=(OrderClosePrice()-price)/MarketInfo(OrderSymbol(),MODE_POINT);
                  PrintFormat("%s #%i execution time: %.f ms slippage %.f pts %s",type2,ticket,GetTickCount()-exec,slip,msg);
                 }
              }
            else
              PrintFormat("%s #%i execution time: %.f ms %s",type2,ticket,GetTickCount()-exec,msg);
            return(true);
           }
         int err=GetLastError();
         if(err==ERR_NO_ERROR || err==ERR_COMMON_ERROR || err==ERR_SERVER_BUSY || err==ERR_NO_CONNECTION || err==ERR_MARKET_CLOSED ||
            err==ERR_PRICE_CHANGED || err==ERR_INVALID_PRICE || err==ERR_OFF_QUOTES || err==ERR_BROKER_BUSY || err==ERR_REQUOTE  ||
            err==ERR_TRADE_TIMEOUT || err==ERR_TRADE_CONTEXT_BUSY)
            Print("error (temprary) ",type," ",GetError(GetLastError()));
         else return(false);
        }
      else Print("waiting ",type,": trade context busy");
      Sleep(100);
     }
   return(false);
  }
//+------------------------------------------------------------------+
//| ModifyOrder                                                      |
//+------------------------------------------------------------------+
bool ModifyOrder(int ticket,
                 double price,
                 double sl,
                 double tp,
                 datetime expiration,
                 color clr=clrOrange,
                 string msg="ok")
  {
   if(OrderSelect(ticket,SELECT_BY_TICKET,MODE_TRADES)==false) return(false);
   RefreshRates();
   if(OrderType()==OP_BUY) price=MarketInfo(OrderSymbol(),MODE_BID);
   else if(OrderType()==OP_SELL) price=MarketInfo(OrderSymbol(),MODE_ASK);
   if(!IsTradeContextBusy())
     {
      double exec=GetTickCount();
      bool success=OrderModify(ticket,
                               NormalizeDouble(price,(int)MarketInfo(OrderSymbol(),MODE_DIGITS)),
                               NormalizeDouble(sl,(int)MarketInfo(OrderSymbol(),MODE_DIGITS)),
                               NormalizeDouble(tp,(int)MarketInfo(OrderSymbol(),MODE_DIGITS)),
                               expiration,
                               clr);

      if(success)
        {
         PrintFormat("modify #%i execution time: %.f ms %s",ticket,GetTickCount()-exec,msg);
         return(true);
        }
     }
   return(false);
  }
//+------------------------------------------------------------------+
//| CloseType                                                        |
//+------------------------------------------------------------------+
void CloseType(string sym="",
               int type=-1,
               int magic=-1,
               string msg="ok")
  {
   for(int i=OrdersTotal()-1; i>=0; i--)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES)==false) break;
      if(sym==OrderSymbol() || sym=="")
        {
         if(magic==OrderMagicNumber() || magic==-1)
           {
            if(type==OrderType() || type==-1)
               CloseOrder(OrderTicket(),OrderLots(),OrderClosePrice(),0,CLR_CLOSE,msg);
           }
        }
     }
  }
//+------------------------------------------------------------------+
//| CloseTypePerc                                                    |
//+------------------------------------------------------------------+
void CloseTypePerc(string sym="",
                   int type=-1,
                   int magic=-1,
                   double perc=1,
                   string msg="ok")
  {
   for(int i=OrdersTotal()-1; i>=0; i--)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES)==false) break;
      if(sym==OrderSymbol() || sym=="")
        {
         if(magic==OrderMagicNumber() || magic==-1)
           {
            bool close=false;
            if(type==OP_MARKET)
              {
               if(OrderType()==OP_BUY || OrderType()==OP_SELL)
                  close=true;
              }
            else if(type==OP_PENDING)
              {
               if(OrderType()==OP_BUYLIMIT || OrderType()==OP_SELLLIMIT || OrderType()==OP_BUYSTOP || OrderType()==OP_SELLSTOP)
                  close=true;
              }
            else if(type==OrderType() || type==-1)
               close=true;
            //---
            if(close)
              {
               if(!CloseOrder(OrderTicket(),OrderLots()*perc,OrderClosePrice(),0,CLR_CLOSE,msg))
                  Print("error OrderClose ",GetError(GetLastError()));
              }
           }
        }
     }
  }
//+------------------------------------------------------------------+
//| CloseTypeLots                                                    |
//+------------------------------------------------------------------+
void CloseTypeLots(string sym="",
                   int type=-1,
                   int magic=-1,
                   double volume=0.1,
                   string msg="ok")
  {
   for(int i=OrdersTotal()-1; i>=0; i--)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES)==false) break;
      if(sym==OrderSymbol() || sym=="")
        {
         if(magic==OrderMagicNumber() || magic==-1)
           {
            bool close=false;
            if(type==OP_MARKET)
              {
               if(OrderType()==OP_BUY || OrderType()==OP_SELL)
                  close=true;
              }
            else if(type==OP_PENDING)
              {
               if(OrderType()==OP_BUYLIMIT || OrderType()==OP_SELLLIMIT || OrderType()==OP_BUYSTOP || OrderType()==OP_SELLSTOP)
                  close=true;
              }
            else if(type==OrderType() || type==-1)
               close=true;
            //---
            if(close)
              {
               if(!CloseOrder(OrderTicket(),volume,OrderClosePrice(),0,CLR_CLOSE,msg))
                  Print("error OrderClose ",GetError(GetLastError()));
              }
           }
        }
     }
  }
//+------------------------------------------------------------------+
//| ModifyTypeStoploss                                               |
//+------------------------------------------------------------------+
void ModifyTypeStoploss(string sym="",
                        int type=-1,
                        double price=0,
                        int magic=-1,
                        string msg="ok")
  {
   for(int i=OrdersTotal()-1; i>=0; i--)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES)==false) break;
      if(sym==OrderSymbol() || sym=="")
        {
         if(magic==OrderMagicNumber() || magic==-1)
           {
            bool mod=false;
            if(type==OP_MARKET)
              {
               if(OrderType()==OP_BUY || OrderType()==OP_SELL)
                  mod=true;
              }
            else if(type==OP_PENDING)
              {
               if(OrderType()==OP_BUYLIMIT || OrderType()==OP_SELLLIMIT || OrderType()==OP_BUYSTOP || OrderType()==OP_SELLSTOP)
                  mod=true;
              }
            else if(type==OrderType() || type==-1)
               mod=true;
            //---
            if(mod)
              {
               if(!ModifyOrder(OrderTicket(),OrderClosePrice(),price,OrderTakeProfit(),OrderExpiration(),CLR_MODIFY,msg))
                  Print("error OrderModify ",GetError(GetLastError()));
              }
           }
        }
     }
  }
//+------------------------------------------------------------------+
//| CountOrdersExt                                                   |
//+------------------------------------------------------------------+
void CountOrdersExt(int &_buy,
                    int &_sell,
                    int &_buylimit,
                    int &_selllimit,
                    int &_buystop,
                    int &_sellstop,
                    string sym="",
                    int magic=-1)
  {
   _buy=0;
   _sell=0;
   _buylimit=0;
   _selllimit=0;
   _buystop=0;
   _sellstop=0;
   for(int i=OrdersTotal()-1; i>=0; i--)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES)==false) break;
      if(sym==OrderSymbol() || sym=="")
        {
         if(magic==OrderMagicNumber() || magic==-1)
           {
            if(OrderType()==OP_BUY) _buy++;
            if(OrderType()==OP_SELL) _sell++;
            if(OrderType()==OP_BUYLIMIT) _buylimit++;
            if(OrderType()==OP_SELLLIMIT) _selllimit++;
            if(OrderType()==OP_BUYSTOP) _buystop++;
            if(OrderType()==OP_SELLSTOP) _sellstop++;
           }
        }
     }
  }
//+------------------------------------------------------------------+
//| CountOrders                                                       |
//+------------------------------------------------------------------+
int CountOrders(string sym="",
                int type=-1,
                int magic=-1,
                int mode=MODE_TRADES)
  {
   int total,k=0;
   if(mode==MODE_TRADES) total=OrdersTotal();
   else                  total=OrdersHistoryTotal();
   for(int i=total-1; i>=0; i--)
     {
      if(OrderSelect(i,SELECT_BY_POS,mode)==false) break;
      if(sym==OrderSymbol() || sym=="")
        {
         if(magic==OrderMagicNumber() || magic==-1)
           {
            if(type==OP_MARKET)
              {
               if(OrderType()==OP_BUY || OrderType()==OP_SELL)
                  k++;
              }
            else if(type==OP_PENDING)
              {
               if(OrderType()==OP_BUYLIMIT || OrderType()==OP_SELLLIMIT || OrderType()==OP_BUYSTOP || OrderType()==OP_SELLSTOP)
                  k++;
              }
            else if(type==OrderType() || type==-1)
               k++;
           }
        }
     }
   return(k);
  }
//+------------------------------------------------------------------+
//| CountProfit                                                      |
//+------------------------------------------------------------------+
double CountProfit(string sym="",
                   int type=-1,
                   int magic=-1,
                   int mode=MODE_TRADES)
  {
   int total;
   double k=0;
   if(mode==MODE_TRADES) total=OrdersTotal();
   else                  total=OrdersHistoryTotal();
   for(int i=total-1; i>=0; i--)
     {
      if(OrderSelect(i,SELECT_BY_POS,mode)==false) break;
      if(sym==OrderSymbol() || sym=="")
        {
         if(magic==OrderMagicNumber() || magic==-1)
           {
            if(type==OrderType() || type==-1)
               k+=OrderProfit()+OrderSwap()+OrderCommission();
           }
        }
     }
   return(k);
  }
//+------------------------------------------------------------------+ 
//| CountPoints                                                      |
//+------------------------------------------------------------------+
double CountPoints(string sym="",
                   int type=-1,
                   int magic=-1,
                   int mode=MODE_TRADES)
  {
   int total;
   double k=0;
   if(mode==MODE_TRADES) total=OrdersTotal();
   else                  total=OrdersHistoryTotal();
   for(int i=total-1; i>=0; i--)
     {
      if(OrderSelect(i,SELECT_BY_POS,mode)==false) break;
      if(sym==OrderSymbol() || sym=="")
        {
         if(magic==OrderMagicNumber() || magic==-1)
           {
            if(type==OrderType() || type==-1)
              {
               if(OrderType()==OP_BUY) k+=MarketInfo(OrderSymbol(),MODE_BID)-OrderOpenPrice();
               else if(OrderType()==OP_SELL) k+=OrderOpenPrice()-MarketInfo(OrderSymbol(),MODE_ASK);
              }
           }
        }
     }
   return(k);
  }
//--------------------------------------------------------------------
//| LastTicket                                                       |
//--------------------------------------------------------------------
int LastTicket(string sym="",
               int type=-1,
               int magic=-1,
               int mode=MODE_TRADES)
  {
   int total;
   if(mode==MODE_TRADES) total=OrdersTotal();
   else                  total=OrdersHistoryTotal();
   for(int i=total-1; i>=0; i--)
     {
      if(OrderSelect(i,SELECT_BY_POS,mode)==false) break;
      if(sym==OrderSymbol() || sym=="")
        {
         if(magic==OrderMagicNumber() || magic==-1)
           {
            if(type==OP_MARKET)
              {
               if(OrderType()==OP_BUY || OrderType()==OP_SELL)
                  return(OrderTicket());
              }
            else if(type==OP_PENDING)
              {
               if(OrderType()==OP_BUYLIMIT || OrderType()==OP_SELLLIMIT || OrderType()==OP_BUYSTOP || OrderType()==OP_SELLSTOP)
                  return(OrderTicket());
              }
            else if(type==OrderType() || type==-1)
               return(OrderTicket());
           }
        }
     }
   return(-1);
  }
//--------------------------------------------------------------------
//| FirstTicket                                                      |
//--------------------------------------------------------------------
int FirstTicket(string sym="",
                int type=-1,
                int magic=-1,
                int mode=MODE_TRADES)
  {
   int total=0,ticket=-1;
   datetime dt=TimeCurrent();
   if(mode==MODE_TRADES) total=OrdersTotal();
   else                  total=OrdersHistoryTotal();
   for(int i=total-1; i>=0; i--)
     {
      if(OrderSelect(i,SELECT_BY_POS,mode)==false) break;
      if(sym==OrderSymbol() || sym=="")
        {
         if(magic==OrderMagicNumber() || magic==-1)
           {
            if(type==OP_MARKET)
              {
               if(OrderType()==OP_BUY || OrderType()==OP_SELL)
                 {
                  if(dt>OrderOpenTime())
                    {
                     dt=OrderOpenTime();
                     ticket=OrderTicket();
                    }
                 }
              }
            else if(type==OP_PENDING)
              {
               if(OrderType()==OP_BUYLIMIT || OrderType()==OP_SELLLIMIT || OrderType()==OP_BUYSTOP || OrderType()==OP_SELLSTOP)
                 {
                  if(dt>OrderOpenTime())
                    {
                     dt=OrderOpenTime();
                     ticket=OrderTicket();
                    }
                 }
              }
            else if(type==OrderType() || type==-1)
              {
               if(dt>OrderOpenTime())
                 {
                  dt=OrderOpenTime();
                  ticket=OrderTicket();
                 }
              }
           }
        }
     }
   return(ticket);
  }
//+------------------------------------------------------------------+
//| LastCloseTime                                                     |
//+------------------------------------------------------------------+
datetime LastCloseTime(string sym="",
                       int type=-1,
                       int magic=-1,
                       int mode=MODE_TRADES)
  {
   int total;
   datetime dtlast=-1;
   if(mode==MODE_TRADES) total=OrdersTotal();
   else                  total=OrdersHistoryTotal();
   for(int i=total-1; i>=0; i--)
     {
      if(OrderSelect(i,SELECT_BY_POS,mode)==false) break;
      if(sym==OrderSymbol() || sym=="")
        {
         if(magic==OrderMagicNumber() || magic==-1)
           {
            if(type==OP_MARKET)
              {
               if(OrderType()==OP_BUY || OrderType()==OP_SELL)
                 {
                  if(dtlast>OrderCloseTime()) break;
                  else dtlast=OrderCloseTime();
                 }
              }
            else if(type==OP_PENDING)
              {
               if(OrderType()==OP_BUYLIMIT || OrderType()==OP_SELLLIMIT || OrderType()==OP_BUYSTOP || OrderType()==OP_SELLSTOP)
                 {
                  if(dtlast>OrderCloseTime()) break;
                  else dtlast=OrderCloseTime();
                 }
              }
            else if(type==OrderType() || type==-1)
              {
               if(dtlast>OrderCloseTime()) break;
               else dtlast=OrderCloseTime();
              }
           }
        }
     }
   return(dtlast);
  }
//+------------------------------------------------------------------+
//| LastOpenTime                                                     |
//+------------------------------------------------------------------+
datetime LastOpenTime(string sym="",
                      int type=-1,
                      int magic=-1,
                      int mode=MODE_TRADES)
  {
   int total;
   datetime dtlast=-1;
   if(mode==MODE_TRADES) total=OrdersTotal();
   else                  total=OrdersHistoryTotal();
   for(int i=total-1; i>=0; i--)
     {
      if(OrderSelect(i,SELECT_BY_POS,mode)==false) break;
      if(sym==OrderSymbol() || sym=="")
        {
         if(magic==OrderMagicNumber() || magic==-1)
           {
            if(type==OP_MARKET)
              {
               if(OrderType()==OP_BUY || OrderType()==OP_SELL)
                 {
                  if(dtlast>OrderOpenTime()) break;
                  else dtlast=OrderOpenTime();
                 }
              }
            else if(type==OP_PENDING)
              {
               if(OrderType()==OP_BUYLIMIT || OrderType()==OP_SELLLIMIT || OrderType()==OP_BUYSTOP || OrderType()==OP_SELLSTOP)
                 {
                  if(dtlast>OrderOpenTime()) break;
                  else dtlast=OrderOpenTime();
                 }
              }
            else if(type==OrderType() || type==-1)
              {
               if(dtlast>OrderOpenTime()) break;
               else dtlast=OrderOpenTime();
              }
           }
        }
     }
   return(dtlast);
  }
//--------------------------------------------------------------------
//| IsOrderDistance                                                  |
//--------------------------------------------------------------------
bool IsOrderDistance(double price,
                     int distance,
                     string sym="",
                     int magic=-1)
  {
   for(int i=OrdersTotal()-1; i>=0; i--)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES)==false) break;
      if(sym==OrderSymbol() || sym=="")
        {
         if(magic==OrderMagicNumber() || magic==-1)
           {
            double pt=MarketInfo(OrderSymbol(),MODE_POINT);
            if(OrderOpenPrice()+distance*pt>=price && OrderOpenPrice()-distance*pt<=price)
               return(true);
           }
        }
     }
   return(false);
  }
//+------------------------------------------------------------------+ 
//| BreakevenTicket                                                  |
//+------------------------------------------------------------------+
bool BreakevenTicket(int ticket,
                     double be,
                     double step)
  {
   if(OrderSelect(ticket,SELECT_BY_TICKET,MODE_TRADES)==false)
      return(false);
   int dig=(int)MarketInfo(OrderSymbol(),MODE_DIGITS);
   double pt=MarketInfo(OrderSymbol(),MODE_POINT);

   RefreshRates();
   double _ask=MarketInfo(OrderSymbol(),MODE_ASK);
   double _bid=MarketInfo(OrderSymbol(),MODE_BID);
   if(OrderType()==OP_BUY)
     {
      if(_bid>OrderOpenPrice()+be)
        {
         if(OrderStopLoss()<OrderOpenPrice()+(step-pt))
           {
            if(!ModifyOrder(OrderTicket(),
                            OrderClosePrice(),
                            OrderOpenPrice()+step,
                            OrderTakeProfit(),
                            OrderExpiration(),
                            CLR_MODIFY,
                            "("+DoubleToString(OrderStopLoss(),dig)+" -> "+DoubleToString(OrderOpenPrice()+step,dig)+") - breakeven"))
               Print("error OrderModify ",GetError(GetLastError()));
            else return(true);
           }
        }
     }
   if(OrderType()==OP_SELL)
     {
      if(_ask<OrderOpenPrice()-be)
        {
         if((OrderOpenPrice()-(step-pt)<OrderStopLoss()) || OrderStopLoss()==0)
           {
            if(!ModifyOrder(OrderTicket(),
                            OrderClosePrice(),
                            OrderOpenPrice()-step,
                            OrderTakeProfit(),
                            OrderExpiration(),
                            CLR_MODIFY,
                            "("+DoubleToString(OrderStopLoss(),dig)+" -> "+DoubleToString(OrderOpenPrice()+step,dig)+") - breakeven"))
               Print("error OrderModify ",GetError(GetLastError()));
            else return(true);
           }
        }
     }
   return(false);
  }
//+------------------------------------------------------------------+ 
//| TrailTicket                                                     |
//+------------------------------------------------------------------+
bool TrailTicket(int ticket,
                 double start,
                 double stop,
                 double step)
  {
   if(OrderSelect(ticket,SELECT_BY_TICKET,MODE_TRADES)==false)
      return(false);
   int dig=(int)MarketInfo(OrderSymbol(),MODE_DIGITS);
   double pt=MarketInfo(OrderSymbol(),MODE_POINT);

   RefreshRates();
   double _ask=MarketInfo(OrderSymbol(),MODE_ASK);
   double _bid=MarketInfo(OrderSymbol(),MODE_BID);
   if(OrderType()==OP_BUY)
     {
      if(_bid>OrderOpenPrice()+start)
        {
         if(OrderStopLoss()<_bid-(stop+step+pt))
           {
            if(stop>MarketInfo(OrderSymbol(),MODE_STOPLEVEL)*pt)
              {
               if(!ModifyOrder(OrderTicket(),
                               OrderClosePrice(),
                               _bid-stop,
                               OrderTakeProfit(),
                               OrderExpiration(),
                               CLR_MODIFY,
                               "sl: "+DoubleToString(OrderStopLoss(),dig)+" -> "+DoubleToString(_bid-stop,dig)+" - trailstop"))
                  Print("error OrderModify ",GetError(GetLastError()));
               else return(true);
              }
           }
        }
     }
   if(OrderType()==OP_SELL)
     {
      if(_ask<OrderOpenPrice()-start)
        {
         if((_ask+(stop+step+pt)<OrderStopLoss()) || OrderStopLoss()==0)
           {
            if(stop>MarketInfo(OrderSymbol(),MODE_STOPLEVEL)*pt)
              {
               if(!ModifyOrder(OrderTicket(),
                               OrderClosePrice(),
                               _ask+stop,
                               OrderTakeProfit(),
                               OrderExpiration(),
                               CLR_MODIFY,
                               "sl: "+DoubleToString(OrderStopLoss(),dig)+" -> "+DoubleToString(_ask+stop,dig)+" - trailstop"))
                  Print("error OrderModify ",GetError(GetLastError()));
               else return(true);
              }
           }
        }
     }
   return(false);
  }
//+------------------------------------------------------------------+
//| TrailCandles                                                     |
//+------------------------------------------------------------------+
bool TrailCandles(int ticket,
                  int tf=PERIOD_CURRENT,
                  int sh=1,
                  int per=1)
  {
   if(OrderSelect(ticket,SELECT_BY_TICKET,MODE_TRADES)==false)
      return(false);

   int dig=(int)MarketInfo(OrderSymbol(),MODE_DIGITS);
   double pt=MarketInfo(OrderSymbol(),MODE_POINT);
   double high=iHigh(OrderSymbol(),tf,iHighest(OrderSymbol(),tf,MODE_HIGH,per,sh));
   double low=iLow(OrderSymbol(),tf,iLowest(OrderSymbol(),tf,MODE_LOW,per,sh));
  if(OrderType()==OP_BUY)
     {
      if(low>OrderOpenPrice())
        {
          if(low>OrderStopLoss() || OrderStopLoss()==0)
           {
             if(MarketInfo(OrderSymbol(),MODE_BID)-(MarketInfo(OrderSymbol(),MODE_STOPLEVEL)*pt)>low)
              {
               if(!ModifyOrder(OrderTicket(),OrderClosePrice(),low,OrderTakeProfit(),OrderExpiration(),clrOrange,"TrailCandle"))
                  Print("error OrderModify ",GetError(GetLastError()));
               else return(true);
              }
           }
        }
     }
   if(OrderType()==OP_SELL)
     {
      if(high<OrderOpenPrice())
        {
         if(high<OrderStopLoss() || OrderStopLoss()==0)
           {
            if(MarketInfo(OrderSymbol(),MODE_ASK)+(MarketInfo(OrderSymbol(),MODE_STOPLEVEL)*pt)<high)
              {
               if(!ModifyOrder(OrderTicket(),OrderClosePrice(),high,OrderTakeProfit(),OrderExpiration(),clrOrange,"TrailCandle"))
                  Print("error OrderModify ",GetError(GetLastError()));
               else return(true);
              }
           }
        }
     }
   return(false);
  }
//--------------------------------------------------------------------
//| WheelBarrel                                                      |
//--------------------------------------------------------------------
bool WheelBarrel(int ticket,
                 double pt,
                 double move)
  {
   if(OrderSelect(ticket,SELECT_BY_TICKET,MODE_TRADES)==false)
      return(false);

   bool success=false;
   double gpoints;
   gpoints=OrderProfit()/(OrderLots()*MarketInfo(OrderSymbol(),MODE_LOTSIZE));
   if(OrderType()==OP_BUY)
     {
      if(OrderStopLoss()==0 || OrderStopLoss()<OrderOpenPrice())
        {
         if(gpoints>pt)
           {
            success=OrderModify(OrderTicket(),
                                OrderOpenPrice(),
                                OrderOpenPrice()+move,
                                OrderTakeProfit(),
                                OrderExpiration(),
                                clrYellow);
           }
        }
      else
        {
         if(OrderStopLoss()>=OrderOpenPrice())
           {
            double safegpoints=OrderStopLoss()-OrderOpenPrice();
            if(gpoints-safegpoints>pt)
              {
               success=OrderModify(OrderTicket(),
                                   OrderOpenPrice(),
                                   OrderStopLoss()+move,
                                   OrderTakeProfit(),
                                   OrderExpiration(),
                                   clrYellow);

              }
           }
        }
     }
   if(OrderType()==OP_SELL)
     {
      if(OrderStopLoss()==0 || OrderStopLoss()>OrderOpenPrice())
        {
         if(gpoints>pt)
           {
            success=OrderModify(OrderTicket(),
                                OrderOpenPrice(),
                                OrderOpenPrice()-move,
                                OrderTakeProfit(),
                                OrderExpiration(),
                                clrYellow);
           }
        }
      else
        {
         if(OrderStopLoss()<=OrderOpenPrice())
           {
            double safegpoints=OrderOpenPrice()-OrderStopLoss();
            if(gpoints-safegpoints>pt)
              {
               success=OrderModify(OrderTicket(),
                                   OrderOpenPrice(),
                                   OrderStopLoss()-move,
                                   OrderTakeProfit(),
                                   OrderExpiration(),
                                   clrYellow);
              }
           }
        }
     }
   return(success);
  }
//+------------------------------------------------------------------+
//| ProfitReport                                                     |
//+------------------------------------------------------------------+
string ProfitReport(string sym="",
                    int magic=-1,
                    bool comm_swap=false)
  {
   static string profitreport="";
   static int tradehistory=0;
   if(tradehistory!=OrdersHistoryTotal())
     {
      int count=0,win=0;
      double profit[4];
      ArrayInitialize(profit,0);
      long daily=TimeCurrent()-(TimeCurrent()%86400);
      long weekly=daily-TimeDayOfWeek(daily)*86400;
      long monthly=TimeMonth(TimeCurrent());
      tradehistory=OrdersHistoryTotal();
      for(int i=0; i<tradehistory; i++)
        {
         if(OrderSelect(i,SELECT_BY_POS,MODE_HISTORY)==false) break;
         if(sym==OrderSymbol() || sym=="")
           {
            if(magic==OrderMagicNumber() || magic==-1)
              {
               if(OrderType()==OP_BUY || OrderType()==OP_SELL)
                 {
                  if(OrderCloseTime()>=daily) profit[0]+=OrderProfit()+OrderCommission()+OrderSwap();
                  if(OrderCloseTime()>=weekly) profit[1]+=OrderProfit()+OrderCommission()+OrderSwap();
                  if(TimeMonth(OrderCloseTime())==monthly) profit[2]+=OrderProfit()+OrderCommission()+OrderSwap();
                  count++;
                  profit[3]+=OrderProfit();
                  if(comm_swap==true) profit[3]+=OrderCommission()+OrderSwap();
                  if(profit[3]>=0.00000) win++;
                 }
              }
           }
        }
      profitreport="Today: "+DoubleToStr(profit[0],1)+
                   "\nThis Week: "+DoubleToStr(profit[1],1)+
                   "\nThis Month: "+DoubleToStr(profit[2],1)+
                   "\nTotal Profits: "+DoubleToStr(profit[3],1)+(count>1? "  (Average "+DoubleToStr(profit[3]/count,1)+")":"")+
                   "\nTotal Trades: "+IntegerToString(count)+(win>0? "  (Ratio "+DoubleToString(100*win/count,1)+"%)":"");
                  //"\nAll Lots: "+DoubleToStr(_lots[3],1)+"  (Average "+DoubleToStr(_profit[3]/_lots[3],1)+" per lot)";
     }
   return(profitreport);
  }
//--------------------------------------------------------------------
//| CheckSlippage                                                    |
//--------------------------------------------------------------------
int CheckSlippage(int ticket,
                  double price)
  {
   double slippage=0;
   if(OrderCloseTime()==0)
     {
      if(OrderType()==OP_BUY) slippage=(OrderOpenPrice()-price)/MarketInfo(OrderSymbol(),MODE_POINT);
      else if(OrderType()==OP_SELL) slippage=(price-OrderOpenPrice())/MarketInfo(OrderSymbol(),MODE_POINT);
     }
   else
     {
      if(OrderType()==OP_BUY) slippage=(price-OrderClosePrice())/MarketInfo(OrderSymbol(),MODE_POINT);
      else if(OrderType()==OP_SELL) slippage=(OrderClosePrice()-price)/MarketInfo(OrderSymbol(),MODE_POINT);
     }
/*
   PrintFormat("%s #%i at %g %s at %g slippage: %.f pts",
               OrderCloseTime()==0? "open":"close",
               OrderTicket(),
               NormalizeDouble(price,(int)MarketInfo(OrderSymbol(),MODE_DIGITS)),
               OrderCloseTime()==0? "open":"close",
               NormalizeDouble(OrderOpenPrice(),(int)MarketInfo(OrderSymbol(),MODE_DIGITS)),
               slippage);
*/
   return((int)slippage);
  }
//--------------------------------------------------------------------
//| CheckExection                                                    |
//--------------------------------------------------------------------
double CheckExecution(string sym)
  {
   RefreshRates();
   double price=MarketInfo(sym,MODE_ASK)+10000*MarketInfo(sym,MODE_POINT);
   if(!IsTradeContextBusy())
     {
      double exec=GetTickCount();
      int ticket=OrderSend(sym,
                           OP_BUYSTOP,
                           MarketInfo(sym,MODE_MINLOT),
                           NormalizeDouble(price,(int)MarketInfo(sym,MODE_DIGITS)),
                           0,
                           NormalizeDouble(price-100*MarketInfo(sym,MODE_POINT),(int)MarketInfo(sym,MODE_DIGITS)),
                           NormalizeDouble(price+100*MarketInfo(sym,MODE_POINT),(int)MarketInfo(sym,MODE_DIGITS)),
                           "latency_test",
                           321421,
                           0,
                           clrNONE);
      if(ticket!=-1)
        {
         exec=GetTickCount()-exec;
         PrintFormat("Broker execution times=%.f ms",exec);
         while(true)
           {
            if(!IsTradeContextBusy())
              {
               if(OrderDelete(ticket,clrNONE))
                  return(exec);
               Sleep(100);
              }
           }
        }
     }
   return(-1);
  }
//--------------------------------------------------------------------
//| CalcLotsType 0=fixed,1=risk,2=margin                             |
//--------------------------------------------------------------------
double CalcLotsType(string sym,
                    int type,
                    double risk,
                    double sl=0)
  {
   double lotsize=0;
   double max=MarketInfo(sym,MODE_MAXLOT);
   double min=MarketInfo(sym,MODE_MINLOT);
   double lotstep=MarketInfo(sym,MODE_LOTSTEP);
   double tickval=MarketInfo(sym,MODE_TICKVALUE);
   double margin=MarketInfo(sym,MODE_MARGINREQUIRED);
   int lotdigits=(int)-MathLog10(lotstep);
   if(type==0) lotsize=risk;
   if(type==1) lotsize=AccountBalance()*(risk/100.0)/(sl*tickval);
   if(type==2) lotsize=AccountEquity()*(risk/100.0)/margin;
   if(lotsize<=min) lotsize=min;
   if(lotsize>=max) lotsize=max;
   return(NormalizeDouble(lotsize,lotdigits));
  }
//--------------------------------------------------------------------
//| LotsTypeMM 0=fixed,1=risk,2=margin                               |
//--------------------------------------------------------------------
double LotsTypeMM(string sym,
                  int type,
                  double risk,
                  double sl=0)
  {
   double lotsize=0;
   if(type==0) lotsize=risk;
   if(type==1) lotsize=AccountBalance()*(risk/100.0)/(sl*MarketInfo(sym,MODE_TICKVALUE));
   if(type==2) lotsize=AccountEquity()*(risk/100.0)/MarketInfo(sym,MODE_MARGINREQUIRED);
   if(lotsize<=MarketInfo(sym,MODE_MINLOT)) lotsize=MarketInfo(sym,MODE_MINLOT);
   if(lotsize>=MarketInfo(sym,MODE_MAXLOT)) lotsize=MarketInfo(sym,MODE_MAXLOT);
   return(NormalizeDouble(lotsize,(int)-MathLog10(MarketInfo(sym,MODE_LOTSTEP))));
  }
//--------------------------------------------------------------------
//| MarginMM                                                         |
//--------------------------------------------------------------------
double MarginMM(string sym,
                double risk)
  {
   double lot=MathCeil(AccountFreeMargin()*risk/1000)/100;
   if(lot<MarketInfo(sym,MODE_MINLOT)) lot=MarketInfo(sym,MODE_MINLOT);
   if(lot>MarketInfo(sym,MODE_MAXLOT)) lot=MarketInfo(sym,MODE_MAXLOT);
   return(lot);
  }
//--------------------------------------------------------------------
//| RiskMM                                                           |
//--------------------------------------------------------------------
double RiskMM(string sym,
              double risk,
              double sl)
  {
   double lot=AccountBalance()*(risk/100.0)/(sl*MarketInfo(sym,MODE_TICKVALUE));
   if(lot<MarketInfo(sym,MODE_MINLOT)) lot=MarketInfo(sym,MODE_MINLOT);
   if(lot>MarketInfo(sym,MODE_MAXLOT)) lot=MarketInfo(sym,MODE_MAXLOT);
   return(lot);
  }
//--------------------------------------------------------------------
//| MoneyMM                                                          |
//--------------------------------------------------------------------
double MoneyMM(string sym,
               double risk,
               double sl,
               double money)
  {
   double lot=money*(risk/100.0)/(sl*MarketInfo(sym,MODE_TICKVALUE));
   if(lot<MarketInfo(sym,MODE_MINLOT)) lot=MarketInfo(sym,MODE_MINLOT);
   if(lot>MarketInfo(sym,MODE_MAXLOT)) lot=MarketInfo(sym,MODE_MAXLOT);
   return(lot);
  }
//--------------------------------------------------------------------
//| IsTradeHour                                                      |
//--------------------------------------------------------------------
bool IsTradeHour(int hour_start,
                 int hour_stop,
                 bool weekend=false)
  {
   bool istime=false;
   datetime dt=TimeCurrent();
   if(hour_start<hour_stop && TimeHour(dt)>=hour_start && TimeHour(dt)<hour_stop) istime=true;
   if(hour_start>hour_stop &&(TimeHour(dt)>=hour_start || TimeHour(dt)<hour_stop)) istime=true;
   if(weekend==false)
     {
      if(TimeDayOfWeek(dt)==SATURDAY || TimeDayOfWeek(dt)==SUNDAY)
         istime=false;
     }
   return(istime);
  }
//--------------------------------------------------------------------
//| IsTradeTime                                                      |
//--------------------------------------------------------------------
bool IsTradeTime(datetime dt,
                 int hour_start,
                 int hour_stop,
                 bool weekend=false)
  {
   bool istime=false;
   if(hour_start<hour_stop && TimeHour(dt)>=hour_start && TimeHour(dt)<hour_stop) istime=true;
   if(hour_start>hour_stop &&(TimeHour(dt)>=hour_start || TimeHour(dt)<hour_stop)) istime=true;
   if(weekend==false)
     {
      if(TimeDayOfWeek(dt)==SATURDAY || TimeDayOfWeek(dt)==SUNDAY)
         istime=false;
     }
   return(istime);
  }
//--------------------------------------------------------------------
//| IsTradeDayOfWeek                                                 |
//--------------------------------------------------------------------
bool IsTradeDayOfWeek(datetime dt,
                      string str_days="1,2,3,4,5")
  {
   string days[];
   int k=StringSplit(str_days,StringGetCharacter(",",0),days);
   for(int i=0; i<k; i++)
     {
      if(StringFind((string)TimeDayOfWeek(dt),days[i],0)!=-1)
         return(true);
     }
   return(false);
  }
//--------------------------------------------------------------------
//| IsNFP                                                            |
//--------------------------------------------------------------------
bool IsNFP(datetime dt,
           int hours=6)
  {
   if(hours==0) hours=1;
   if(TimeDayOfWeek(dt)==5 && TimeDay(dt)<8)
     {
      if(TimeHour(dt)>13-hours || TimeHour(dt)<13+hours)
         return(true);
     }
   return(false);
  }
//+------------------------------------------------------------------+
//| IsCurrencySession                                                |
//+------------------------------------------------------------------+
bool IsCurrencySession(datetime dt,
                       string curr)
  {
   int ds=TimeDaylightSavings()? -1:0;
   int asia_start=22;
   int asia_stop=7;
   int euro_start=7+ds;
   int euro_stop=16+ds;
   int us_start=13+ds;
   int us_stop=22+ds;
   if((TimeHour(dt)>=asia_start && TimeHour(dt)<asia_stop) || (asia_start>asia_stop && TimeHour(dt)<=asia_stop))
     {
      if(StringFind("JPY NZD AUD",curr,0)!=-1)
         return(true);
     }
   if((TimeHour(dt)>=euro_start && TimeHour(dt)<euro_stop) || (euro_start>euro_stop && TimeHour(dt)<=euro_stop))
     {
      if(StringFind("EUR GBP CHF",curr,0)!=-1)
         return(true);
     }
   if((TimeHour(dt)>=us_start && TimeHour(dt)<us_stop) || (us_start>us_stop && TimeHour(dt)<=euro_stop))
     {
      if(StringFind("USD CAD",curr,0)!=-1)
         return(true);
     }
   return(false);
  }
//+------------------------------------------------------------------+
//| IsCurrencySession                                                |
//+------------------------------------------------------------------+
bool IsCurrencySessionOpen(datetime dt,
                           string curr)
  {
   int ds=TimeDaylightSavings()? -1:0;
   int asia_start=0;
   int asia_stop=3;
   int euro_start=7+ds;
   int euro_stop=11+ds;
   int us_start=13+ds;
   int us_stop=16+ds;
   if((TimeHour(dt)>=asia_start && TimeHour(dt)<asia_stop) || (asia_start>asia_stop && TimeHour(dt)<=asia_stop))
     {
      if(StringFind("JPY NZD AUD",curr,0)!=-1)
         return(true);
     }
   if((TimeHour(dt)>=euro_start && TimeHour(dt)<euro_stop) || (euro_start>euro_stop && TimeHour(dt)<=euro_stop))
     {
      if(StringFind("EUR GBP CHF",curr,0)!=-1)
         return(true);
     }
   if((TimeHour(dt)>=us_start && TimeHour(dt)<us_stop) || (us_start>us_stop && TimeHour(dt)<=euro_stop))
     {
      if(StringFind("USD CAD",curr,0)!=-1)
         return(true);
     }
   return(false);
  }
//+------------------------------------------------------------------+
//| IsLondonDst                                                      |
//+------------------------------------------------------------------+
bool IsLondonDst(datetime dt,
                 bool dst=false)
  {
   int ds=dst? -1:0;
   int london_start=8+ds;
   int london_stop=11+ds;
   if((TimeHour(dt)>=london_start && TimeHour(dt)<london_stop) || (london_start>london_stop && TimeHour(dt)<=london_stop))
      return(true);
   return(false);
  }
//+------------------------------------------------------------------+
//| IsLondonOpen                                                   |
//+------------------------------------------------------------------+
bool IsLondonOpen(datetime dt)
  {
   int ds=TimeDaylightSavings()? -1:0;
   int london_start=8+ds;
   int london_stop=11+ds;
   if((TimeHour(dt)>=london_start && TimeHour(dt)<london_stop) || (london_start>london_stop && TimeHour(dt)<=london_stop))
      return(true);
   return(false);
  }
//+------------------------------------------------------------------+
//| IsNYOpen                                                         |
//+------------------------------------------------------------------+
bool IsNYOpen(datetime dt)
  {
   int ds=TimeDaylightSavings()? -1:0;
   int ny_start=13+ds;
   int ny_stop=15+ds;
   if((TimeHour(dt)>=ny_start && TimeHour(dt)<ny_stop) || (ny_start>ny_stop && TimeHour(dt)<=ny_stop))
      return(true);
   return(false);
  }
//+------------------------------------------------------------------+
//| IsDailyClose                                                     |
//+------------------------------------------------------------------+
bool IsDailyClose(datetime dt)
  {
   int ds=TimeDaylightSavings()? -1:0;
   int dc_start=16+ds;
   int dc_stop=17+ds;
   if((TimeHour(dt)>=dc_start && TimeHour(dt)<dc_stop) || (dc_start>dc_stop && TimeHour(dt)<=dc_stop))
      return(true);
   return(false);
  }
//+------------------------------------------------------------------+
//| DateTimeOffset                                                    |
//+------------------------------------------------------------------+
int DateTimeOffset(datetime time1,
                   datetime time2)
  {
   int offset=(int)(time1-time2);
   return(offset);
  }
//+------------------------------------------------------------------+
//| OffsetHours                                                      |
//+------------------------------------------------------------------+
int OffsetHours()
  {
   int offset=(int)(TimeCurrent()-TimeGMT());
   return(offset/=3600);
  }
//+------------------------------------------------------------------+
//| IsMarketOpenDT                                                   |
//+------------------------------------------------------------------+
bool IsMarketOpen(datetime dt)
  {
   datetime begin=0;
   datetime end=0;
   datetime time=TimeCurrent();
   uint     session_index=0;
   if(SymbolInfoSessionTrade(Symbol(),TimeDayOfWeek(dt),session_index,begin,end)==true)
     {
      string sdt=TimeToString(dt,TIME_MINUTES|TIME_SECONDS);
      string sbegin=TimeToString(begin,TIME_MINUTES|TIME_SECONDS);
      string send=TimeToString(end-1,TIME_MINUTES|TIME_SECONDS);
      dt=StringToTime(sdt);
      begin=StringToTime(sbegin);
      end=StringToTime(send);
      if(dt>=begin && dt<=end)
          return(false);
      return(true); 
     }
   return(false);
  }
//+------------------------------------------------------------------+
//| IsTicket                                                         |
//+------------------------------------------------------------------+
int IsTicket(int ticket,
             int &array[])
  {
   int index=-1;
   int size=ArraySize(array);
   for(int i=0; i<size; i++)
     {
      if(ticket==array[i])
        {
         index=i;
         break;
        }
     }
   return(index);
  }
//+------------------------------------------------------------------+
//| AddTicket                                                        |
//+------------------------------------------------------------------+
void AddTicket(int ticket,
               int &array[])
  {
	ArrayCopy(array,array,1,0,WHOLE_ARRAY);
	array[0]=ticket;
  }
//+------------------------------------------------------------------+
//| DeleteTicket                                                     |
//+------------------------------------------------------------------+
void DeleteTicket(int ticket,
                  int &array[])
  {
   int tmp[],k=0;
   int size=ArraySize(array);
   for(int i=0; i<size; i++)
     {
      if(array[i]>0 && array[i]!=ticket)
        {
         ArrayResize(tmp,k+1);
         tmp[k]=array[i];
         k++;
        }
     }
   ArrayFree(array);
	ArrayCopy(array,tmp,0,0,WHOLE_ARRAY);
  }
//+------------------------------------------------------------------+
//| BalancedPair                                                     |
//+------------------------------------------------------------------+
bool BalancedPair(int type,
                  string curr1,
                  string curr2,
                  int magic)
{
   //Only allow an individual currency to trade if it is a balanced trade
   //example: UJ Buy open, so only allow Sell xxxJPY.
   //The passed parameter is the proposed trade, so an existing one must balance that
   string buy1,sell1,buy2,sell2;
   if(type==OP_BUY || type==OP_BUYSTOP || type==OP_BUYLIMIT)
     {
      buy1=curr1;
      sell1=curr2;
     }
   else
     {
      buy1=curr2;
      sell1=curr1;
     }
   for(int i=OrdersTotal()-1; i>=0; i--)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES)==false) break;
      if(OrderMagicNumber()==magic)
        {
         if(OrderType()==OP_BUY || OrderType()==OP_BUYSTOP || OrderType()==OP_BUYLIMIT)
           {
            buy2=StringSubstr(OrderSymbol(),0,3);
            sell2=StringSubstr(OrderSymbol(),3,3);
           }
         else
           {
            buy2=StringSubstr(OrderSymbol(),3,3);
            sell2=StringSubstr(OrderSymbol(),0,3);
           }
         if(buy1==buy2 || sell1==sell2)
            return(false);
        }
     }
  return(true);
}
//--------------------------------------------------------------------
//| SpreadAvg                                                        |
//--------------------------------------------------------------------
int SpreadAvg(string sym,
              int per)
  {
   static int spreads[];
   ArrayResize(spreads,per);
   ArrayCopy(spreads,spreads,1,0,per);
   spreads[0]=(int)MarketInfo(sym,MODE_SPREAD);
   int i,sum=0;
   for(i=0; i<per; i++)
     {
      if(spreads[i]==-1) break;
      sum+=spreads[i];
     }
   return(sum/i);
  }
//--------------------------------------------------------------------
//| TicketOpenStr                                                    |
//--------------------------------------------------------------------
string TicketOpenStr(int ticket)
  {
   if(OrderSelect(ticket,SELECT_BY_TICKET,MODE_TRADES)==false)
      return("");

   string type=OrderType()==OP_BUY? "buy":"sell";
   int dig=(int)MarketInfo(OrderSymbol(),MODE_DIGITS);
   string ticket_open=  "#"+(string)OrderTicket()+" "+type+" "+DoubleToString(OrderLots(),2)+" "+OrderSymbol()+" at "+DoubleToString(OrderOpenPrice(),dig)+
                        " sl: "+DoubleToString(OrderStopLoss(),dig)+" tp: "+DoubleToString(OrderTakeProfit(),dig);
   return(ticket_open);
  }
//--------------------------------------------------------------------
//| TicketCloseStr                                                   |
//--------------------------------------------------------------------
string TicketCloseStr(int ticket)
  {
   if(OrderSelect(ticket,SELECT_BY_TICKET,MODE_HISTORY)==false)
      return("");

   string type=OrderType()==OP_BUY? "buy":"sell";
   int dig=(int)MarketInfo(OrderSymbol(),MODE_DIGITS);
   string ticket_close= "#"+(string)OrderTicket()+" "+type+" "+DoubleToString(OrderLots(),2)+" "+OrderSymbol()+" at "+DoubleToString(OrderOpenPrice(),dig)+
                        " close at "+DoubleToString(OrderClosePrice(),dig);
   return(ticket_close);
  }
//--------------------------------------------------------------------
//| TicketProfitStr                                                  |
//--------------------------------------------------------------------
string TicketProfitStr(int ticket)
  {
   if(OrderSelect(ticket,SELECT_BY_TICKET,MODE_TRADES)==false)
      if(OrderSelect(ticket,SELECT_BY_TICKET,MODE_HISTORY)==false)
         return("");

   string ticket_profit="profit: "+DoubleToString(OrderProfit(),2);
   if(OrderCommission()!=0.00) ticket_profit+=", commission: "+DoubleToString(OrderCommission(),2);
   if(OrderSwap()!=0.00)       ticket_profit+=", swap: "+DoubleToString(OrderSwap(),2);
   return(ticket_profit);
  }
//+------------------------------------------------------------------+
//| CreateMagic                                                      |
//+------------------------------------------------------------------+
int CreateMagic(string base,
                string sym=NULL)
  {
   int len=StringLen(base+sym);
   int asciisum=0;
   for(int i=0; i<len; i++)
      asciisum+=StringGetChar(base+sym,i);
   return(AccountNumber()+asciisum);
  }
//--------------------------------------------------------------------
//| ScreenShot                                                       |
//--------------------------------------------------------------------
void ScreenShot(int ticket)
  {
   if(IsTesting() && OrderSelect(ticket,SELECT_BY_TICKET,MODE_TRADES)==false)
      return;
   string filename=TimeToString(TimeCurrent())+" "+OrderSymbol()+" "+(string)ticket+".gif";
   if(!WindowScreenShot("trades\\"+filename,640,480))
      Print("error ScreenShot ",GetError(GetLastError()));
  }
//--------------------------------------------------------------------
//| StringUpper                                                      |
//--------------------------------------------------------------------
string StringUpper(string str)
  {
   string res="";
   string key_upper="abcdefghijklmnopqrstuvwxyz";
   string key_lower="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
   for(int i=0; i<StringLen(str); i++)
     {
      int t1=StringFind(key_lower,StringSubstr(str,i,1),0);
      if(t1>=0) res+=StringSubstr(key_upper,t1,1);
      else      res+=StringSubstr(str,i,1);
   }
  return(res);
}  
//--------------------------------------------------------------------
//| StringLower                                                      |
//--------------------------------------------------------------------
string StringLower(string str)
  {
   string res="";
   string key_lower="abcdefghijklmnopqrstuvwxyz";
   string key_upper="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
   for(int i=0; i<StringLen(str); i++)
     {
      int t1=StringFind(key_upper,StringSubstr(str,i,1),0);
      if(t1>=0) res+=StringSubstr(key_lower,t1,1);
      else      res+=StringSubstr(str,i,1);
     }
   return(res);
}
//--------------------------------------------------------------------
//| StrToNumber                                                      |
//--------------------------------------------------------------------
// strips all non-numeric characters out of a string, to return a numeric (double) value
// valid numeric characters are digits 0,1,2,3,4,5,6,7,8,9, decimal point (.) and minus sign (-)
double StrToNumber(string str)
  {
   int dp=-1;
   int sgn=1;
   double num=0.0;
   for(int i=0; i<StringLen(str); i++)
     {
      string s=StringSubstr(str,i,1);
      if(s=="-") sgn=-sgn;
      else if(s==".") dp=0;
      else if(s>="0" && s<="9")
        {
         if(dp>=0) dp++;
         if(dp>0) num+=StrToInteger(s)/MathPow(10,dp);
         else num=num*10+StrToInteger(s);
        }
     }
   return(num*sgn);
  }
//+------------------------------------------------------------------+
//| OrderTypeToStr                                                   |
//+------------------------------------------------------------------+
string OrderTypeToStr(int type)
  {
   switch(type)
     {
      case OP_BUY: return("OP_BUY");
      case OP_SELL: return("OP_SELL");
      case OP_BUYLIMIT: return("OP_BUYLIMIT");
      case OP_SELLLIMIT: return("OP_SELLLIMIT");
      case OP_BUYSTOP: return("OP_BUYSTOP");
      case OP_SELLSTOP: return("OP_SELLSTOP");
      case OP_MARKET: return("OP_MARKET");
      case OP_PENDING: return("OP_PENDING");
      default: return("");
     }
  }
//+------------------------------------------------------------------+
//| TimeframeToString                                                |
//+------------------------------------------------------------------+
string TimeframeToString(int tf)
  {
   switch(tf)
     {
      case PERIOD_M1: return("M1");
      case PERIOD_M5: return("M5");
      case PERIOD_M15: return("M15");
      case PERIOD_M30: return("M30");
      case PERIOD_H1: return("H1");
      case PERIOD_H4: return("H4");
      case PERIOD_D1: return("D1");
      case PERIOD_W1: return("W1");
      case PERIOD_MN1: return("MN1");
      default: return("");
     }
  }
//+------------------------------------------------------------------+
//| DayToStr                                                         |
//+------------------------------------------------------------------+
string DayToStr(datetime time)
  {
   switch(TimeDayOfWeek(time))
     {
      case 0: return("Sun");
      case 1: return("Mon");
      case 2: return("Tue");
      case 3: return("Wed");
      case 4: return("Thu");
      case 5: return("Fri");
      case 6: return("Sat");
      default: return("");
     }
  }
//+------------------------------------------------------------------+
//| MonthToStr                                                         |
//+------------------------------------------------------------------+
string MonthToStr(datetime time)
  {
   switch(TimeMonth(time))
     {
      case 1: return("Jan");
      case 2: return("Feb");
      case 3: return("Mar");
      case 4: return("Apr");
      case 5: return("May");
      case 6: return("Jun");
      case 7: return("Jul");
      case 8: return("Aug");
      case 9: return("Sep");
      case 10: return("Okt");
      case 11: return("Nov");
      case 12: return("Dec");
      default: return("");
     }
  }
//--------------------------------------------------------------------
//| Random                                                           |
//--------------------------------------------------------------------
int Random(int numbers)
  {
   int num=0;
   int nr=(int)MathPow(10,numbers);
   while(StringLen(IntegerToString(num))<numbers)
      num=nr+(1-nr)*MathRand()/32767;
   return(num);
  }





//--------------------------------------------------------------------
//| VISUALS                                                          |
//--------------------------------------------------------------------
//+------------------------------------------------------------------+
//| ChartPriceChange (for OnChartEvent)                              |
//+------------------------------------------------------------------+
bool ChartPriceChange()
  {
   static double chigh,clow,cpixel;
   double ch=ChartGetDouble(0,CHART_PRICE_MAX);
   double cl=ChartGetDouble(0,CHART_PRICE_MIN);
   double cp=(int)ChartGetInteger(0,CHART_HEIGHT_IN_PIXELS);
  
   if(ch!=chigh || cl!=clow || cp!=cpixel)
     {
      clow=cl;
      chigh=ch;
      cpixel=cp;
      return(true);
     }
   return(false);
  }
//+------------------------------------------------------------------+
//| DrawOrderHistory                                                 |
//+------------------------------------------------------------------+
void DrawOrderHistory(string sym="",
                      int magic=0)
  {
   int historytotal=OrdersHistoryTotal();
   for(int i=historytotal-1; i>=0; i--)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_HISTORY)==false) break;
      if(OrderMagicNumber()==magic || magic==0)
        {
         if(OrderSymbol()==sym || sym=="")
           {
            if(OrderType()==OP_BUY)
              {
               DrawTicket(OrderTicket(),"buy",OrderLots(),OrderSymbol(),
                               OrderOpenTime(),OrderOpenPrice(),
                               OrderCloseTime(),OrderClosePrice(),CLR_CLOSE,CLR_BUY);
              }
            if(OrderType()==OP_SELL)
              {
               DrawTicket(OrderTicket(),"sell",OrderLots(),OrderSymbol(),
                               OrderOpenTime(),OrderOpenPrice(),
                               OrderCloseTime(),OrderClosePrice(),CLR_CLOSE,CLR_SELL);
              }
           }
        }
     }
  }
//+------------------------------------------------------------------+
//| DrawTicket                                                       |
//+------------------------------------------------------------------+
void DrawTicket(int iTicket,
                string sType,
                double dLots,
                string sSymbol,
                datetime tOpenTime,
                double dOpenPrice,
                datetime tCloseTime,
                double dClosePrice,
                color cColorCloseArrow,
                color cColorTrend)
  {
   // example:
   // #52378378 buy 0.10 EURUSD at 1.24369 close at 1.24632
   // #52378378 1.24369 -> 1.24632
   int iOpenArrowCode=1;
   int iCloseArrowCode=3;
   bool objExist;
   int i;
   string objName;
   int obj_total=ObjectsTotal();
   //---
   string sOpenArrow="#"+(string)iTicket+" "+sType+" "+DoubleToString(dLots,2)+" "+sSymbol+" at "+DoubleToString(dOpenPrice,Digits);
   objExist=false;
   for(i=obj_total; i>=0; i--)
     {
      objName=ObjectName(i);
      if(StringFind(objName,sOpenArrow,0)!=-1)
        {
         objExist=true;
         break;
        }
     }
   if(objExist==false)
     {
      ObjectCreate(sOpenArrow,OBJ_ARROW,0,tOpenTime,dOpenPrice);
      ObjectSet(sOpenArrow,OBJPROP_COLOR,cColorTrend);
      ObjectSet(sOpenArrow,OBJPROP_ARROWCODE,iOpenArrowCode);
     }
   //---
   string sCloseArrow="#"+(string)iTicket+" "+sType+" "+DoubleToString(dLots,2)+" "+sSymbol+" at "+DoubleToString(dOpenPrice,Digits)+
                      " close at "+DoubleToString(dClosePrice,Digits);
   objExist=false;
   for(i=obj_total; i>=0; i--)
     {
      objName=ObjectName(i);
      if(StringFind(objName,sCloseArrow,0)!=-1)
        {
         objExist=true;
         break;
        }
     }
   if(objExist==false)
     {
      ObjectCreate(sCloseArrow,OBJ_ARROW,0,tCloseTime,dClosePrice);
      ObjectSet(sCloseArrow,OBJPROP_COLOR,cColorCloseArrow);
      ObjectSet(sCloseArrow,OBJPROP_ARROWCODE,iCloseArrowCode);
     }
   //---
   string sTrendLine="#"+(string)iTicket+" "+DoubleToString(dOpenPrice,Digits)+" -> "+DoubleToString(dClosePrice,Digits);
   objExist=false;
   for(i=obj_total; i>=0; i--)
     {
      objName=ObjectName(i);
      if(StringFind(objName,sTrendLine,0)!=-1)
        {
         objExist=true;
         break;
        }
     }
   if(objExist==false)
     {
      ObjectCreate(sTrendLine,OBJ_TREND,0,tOpenTime,dOpenPrice,tCloseTime,dClosePrice);
      ObjectSet(sTrendLine,OBJPROP_COLOR,cColorTrend);
      ObjectSet(sTrendLine,OBJPROP_STYLE,STYLE_DOT);
      ObjectSet(sTrendLine,OBJPROP_RAY,false);
     }
  }
//+------------------------------------------------------------------+
//| PlotLabel                                                        |
//+------------------------------------------------------------------+
void PlotLabel(string object,
               string text,
               int x,
               int y,
               color clr,
               int fontsize,
               string font)
  {
   if(text!="")
     {
      if(ObjectCreate(ChartID(),object,OBJ_LABEL,0,0,0))
        {
         ObjectSetInteger(ChartID(),object,OBJPROP_SELECTABLE,false);
         ObjectSetInteger(ChartID(),object,OBJPROP_BACK,false);
        }
      ObjectSetInteger(ChartID(),object,OBJPROP_XDISTANCE,x);
      ObjectSetInteger(ChartID(),object,OBJPROP_YDISTANCE,y);
      ObjectSetText(object,text,fontsize,font,clr);
     }
   else
      ObjectDelete(object);
  }
//+------------------------------------------------------------------+
//| PlotText                                                         |
//+------------------------------------------------------------------+
void PlotText(string object,
              string text,
              datetime time,
              double price,
              color clr,
              int fontsize,
              string font)
  {
   if(text!="")
     {
      if(ObjectCreate(ChartID(),object,OBJ_TEXT,0,0,0))
        {
         ObjectSetInteger(ChartID(),object,OBJPROP_SELECTABLE,false);
         ObjectSetInteger(ChartID(),object,OBJPROP_BACK,false);
        }
      ObjectSetInteger(ChartID(),object,OBJPROP_TIME,time);
      ObjectSetDouble(ChartID(),object,OBJPROP_PRICE,price);
      ObjectSetText(object,text,fontsize,font,clr);
     }
   else
      ObjectDelete(object);
  }
//+------------------------------------------------------------------+ 
//| PlotRectangleLabel                                                         |
//+------------------------------------------------------------------+
void PlotRectangleLabel(string object,
                        int xsize,
                        int ysize,
                        int xpos,
                        int ypos,
                        color clr=clrGray,
                        color borderclr=clrGray,
                        int border=BORDER_FLAT,
                        int back=false,
                        int select=false)
  {
   if(ObjectCreate(ChartID(),object,OBJ_RECTANGLE_LABEL,0,0,0))
     {
      ObjectSetInteger(ChartID(),object,OBJPROP_BGCOLOR,clr);
      ObjectSetInteger(ChartID(),object,OBJPROP_COLOR,borderclr);
      ObjectSetInteger(ChartID(),object,OBJPROP_BORDER_TYPE,border);
      ObjectSetInteger(ChartID(),object,OBJPROP_XSIZE,xsize);
      ObjectSetInteger(ChartID(),object,OBJPROP_YSIZE,ysize);
      ObjectSetInteger(ChartID(),object,OBJPROP_XDISTANCE,xpos);
      ObjectSetInteger(ChartID(),object,OBJPROP_YDISTANCE,ypos);
      ObjectSetInteger(ChartID(),object,OBJPROP_CORNER,CORNER_LEFT_UPPER);
      ObjectSetInteger(ChartID(),object,OBJPROP_ANCHOR,ANCHOR_CENTER);
      ObjectSetInteger(ChartID(),object,OBJPROP_SELECTABLE,select);
      ObjectSetInteger(ChartID(),object,OBJPROP_BACK,back);
     }
  }
//+------------------------------------------------------------------+ 
//| PlotTL                                                           |
//+------------------------------------------------------------------+
void PlotTL(string object,
            datetime x1,
            datetime x2,
            double y1,
            double y2,
            color clr=clrRed,
            int width=1,
            int style=STYLE_SOLID,
            bool ray=false,
            bool back=false,
            bool select=false)
  {
   if(ObjectCreate(ChartID(),object,OBJ_TREND,0,x1,y1,x2,y2))
      ObjectSetInteger(ChartID(),object,OBJPROP_SELECTABLE,select);
   ObjectMove(ChartID(),object,0,x1,y1);
   ObjectMove(ChartID(),object,1,x2,y2);
   ObjectSetInteger(ChartID(),object,OBJPROP_STYLE,style);
   ObjectSetInteger(ChartID(),object,OBJPROP_WIDTH,width);
   ObjectSetInteger(ChartID(),object,OBJPROP_COLOR,clr);
   ObjectSetInteger(ChartID(),object,OBJPROP_BACK,back);
   ObjectSetInteger(ChartID(),object,OBJPROP_RAY,ray);
  }
//+------------------------------------------------------------------+
//| PlotVL                                                           |
//+------------------------------------------------------------------+
void PlotVL(string object,
            datetime x,
            color clr=clrRed,
            int width=1,
            int style=STYLE_SOLID,
            bool back=false,
            bool select=false)
  {
   if(ObjectCreate(ChartID(),object,OBJ_VLINE,0,x,0))
      ObjectSetInteger(ChartID(),object,OBJPROP_SELECTABLE,select);
   ObjectSetInteger(ChartID(),object,OBJPROP_TIME1,x);
   ObjectSetInteger(ChartID(),object,OBJPROP_STYLE,style);
   ObjectSetInteger(ChartID(),object,OBJPROP_WIDTH,width);
   ObjectSetInteger(ChartID(),object,OBJPROP_COLOR,clr);
   ObjectSetInteger(ChartID(),object,OBJPROP_BACK,back);
  }
//+------------------------------------------------------------------+
//| PlotHL                                                           |
//+------------------------------------------------------------------+
void PlotHL(string object,
            double price,
            color clr=clrRed,
            int width=1,
            int style=STYLE_SOLID,
            bool back=false,
            bool select=false)
  {
   if(ObjectCreate(ChartID(),object,OBJ_HLINE,0,0,price))
      ObjectSetInteger(ChartID(),object,OBJPROP_SELECTABLE,select);
   ObjectSetDouble(ChartID(),object,OBJPROP_PRICE,price);
   ObjectSetInteger(ChartID(),object,OBJPROP_STYLE,style);
   ObjectSetInteger(ChartID(),object,OBJPROP_WIDTH,width);
   ObjectSetInteger(ChartID(),object,OBJPROP_COLOR,clr);
   ObjectSetInteger(ChartID(),object,OBJPROP_BACK,back);
   ObjectSetString(ChartID(),object,OBJPROP_TOOLTIP,DoubleToString(price,Digits));
  }
//+------------------------------------------------------------------+
//| PlotArrow                                                        |
//+------------------------------------------------------------------+
void PlotArrow(string object,
               double price,
               datetime time,
               color clr=clrWhite,
               int code=0,
               int size=2,
               int anchor=ANCHOR_LEFT,
               bool back=false,
               bool select=false)
  {
   if(ObjectCreate(ChartID(),object,OBJ_ARROW,0,0,0))
     {
      ObjectSetInteger(ChartID(),object,OBJPROP_ANCHOR,anchor);
      ObjectSetInteger(ChartID(),object,OBJPROP_SELECTABLE,select);
      ObjectSetInteger(ChartID(),object,OBJPROP_SELECTED,false);
      ObjectSetInteger(ChartID(),object,OBJPROP_BACK,back);
     }
   ObjectSetInteger(ChartID(),object,OBJPROP_TIME,time);
   ObjectSetDouble(ChartID(),object,OBJPROP_PRICE,price);
   ObjectSetInteger(ChartID(),object,OBJPROP_ARROWCODE,code);
   ObjectSetInteger(ChartID(),object,OBJPROP_COLOR,clr);
   ObjectSetInteger(ChartID(),object,OBJPROP_STYLE,STYLE_SOLID);
   ObjectSetInteger(ChartID(),object,OBJPROP_WIDTH,size);
  }
//+------------------------------------------------------------------+ 
//| PlotButton                                                       |
//+------------------------------------------------------------------+
void PlotButton(string object,
                string name,
                int xsize,
                int ysize,
                int xpos,
                int ypos,
                color bg=clrGray,
                color clr=clrWhite,
                string font="Calibri",
                int fontsize=8,
                bool flat=true)
  {
   if(ObjectCreate(ChartID(),object,OBJ_BUTTON,0,0,0))
     {
      ObjectSetString(ChartID(),object,OBJPROP_TEXT,name);
      ObjectSetInteger(ChartID(),object,OBJPROP_FONTSIZE,fontsize);
      ObjectSetString(ChartID(),object,OBJPROP_FONT,font);
      ObjectSetInteger(ChartID(),object,OBJPROP_COLOR,clr);
      ObjectSetInteger(ChartID(),object,OBJPROP_BGCOLOR,bg);
      if(flat) ObjectSetInteger(ChartID(),object,OBJPROP_BORDER_COLOR,bg);
      ObjectSetInteger(ChartID(),object,OBJPROP_STATE,false);
      ObjectSetInteger(ChartID(),object,OBJPROP_XSIZE,xsize);
      ObjectSetInteger(ChartID(),object,OBJPROP_YSIZE,ysize);
      ObjectSetInteger(ChartID(),object,OBJPROP_XDISTANCE,xpos);
      ObjectSetInteger(ChartID(),object,OBJPROP_YDISTANCE,ypos);
      ObjectSetInteger(ChartID(),object,OBJPROP_CORNER,CORNER_LEFT_UPPER);
      ObjectSetInteger(ChartID(),object,OBJPROP_ANCHOR,ANCHOR_CENTER);
      ObjectSetInteger(ChartID(),object,OBJPROP_SELECTABLE,false);
      ObjectSetInteger(ChartID(),object,OBJPROP_HIDDEN,true);
      ObjectSetInteger(ChartID(),object,OBJPROP_BACK,false);
     }
  }
//+------------------------------------------------------------------+ 
//| PlotEdit                                                         |
//+------------------------------------------------------------------+
void PlotEdit(string object,
              string text,
              int xsize,
              int ysize,
              int xpos,
              int ypos,
              color bg=clrGray,
              color clr=clrWhite,
              string font="Calibri",
              int fontsize=8,
              bool flat=true)
  {
   if(ObjectCreate(ChartID(),object,OBJ_EDIT,0,0,0))
     {
      ObjectSetString(ChartID(),object,OBJPROP_TEXT,text);
      ObjectSetInteger(ChartID(),object,OBJPROP_FONTSIZE,fontsize);
      ObjectSetString(ChartID(),object,OBJPROP_FONT,font);
      ObjectSetInteger(ChartID(),object,OBJPROP_COLOR,clr);
      ObjectSetInteger(ChartID(),object,OBJPROP_BGCOLOR,bg);
      if(flat) ObjectSetInteger(ChartID(),object,OBJPROP_BORDER_COLOR,bg);
      ObjectSetInteger(ChartID(),object,OBJPROP_STATE,false);
      ObjectSetInteger(ChartID(),object,OBJPROP_XSIZE,xsize);
      ObjectSetInteger(ChartID(),object,OBJPROP_YSIZE,ysize);
      ObjectSetInteger(ChartID(),object,OBJPROP_XDISTANCE,xpos);
      ObjectSetInteger(ChartID(),object,OBJPROP_YDISTANCE,ypos);
      ObjectSetInteger(ChartID(),object,OBJPROP_CORNER,CORNER_LEFT_UPPER);
      ObjectSetInteger(ChartID(),object,OBJPROP_ANCHOR,ANCHOR_CENTER);
      ObjectSetInteger(ChartID(),object,OBJPROP_SELECTABLE,false);
      ObjectSetInteger(ChartID(),object,OBJPROP_HIDDEN,true);
      ObjectSetInteger(ChartID(),object,OBJPROP_BACK,false);
     }
  }
//+------------------------------------------------------------------+
//| PlotCopyright                                                    |
//+------------------------------------------------------------------+
void PlotCopyright(string str)
  {
   string object="copyright";
   if(ObjectCreate(ChartID(),object,OBJ_LABEL,0,0,0))
     {
      ObjectSetString(ChartID(),object,OBJPROP_TEXT,"copyright © "+(string)Year()+" "+str);
      ObjectSetString(ChartID(),object,OBJPROP_FONT,"Courier New");
      ObjectSetInteger(ChartID(),object,OBJPROP_FONTSIZE,7);
      ObjectSetInteger(ChartID(),object,OBJPROP_COLOR,clrSilver);
      ObjectSetInteger(ChartID(),object,OBJPROP_YDISTANCE,10);
      ObjectSetInteger(ChartID(),object,OBJPROP_XDISTANCE,10);
      ObjectSetInteger(ChartID(),object,OBJPROP_SELECTABLE,false);
      ObjectSetInteger(ChartID(),object,OBJPROP_BACK,false);
      ObjectSetInteger(ChartID(),object,OBJPROP_HIDDEN,true);
      ObjectSetInteger(ChartID(),object,OBJPROP_CORNER,CORNER_RIGHT_LOWER);
      ObjectSetInteger(ChartID(),object,OBJPROP_ANCHOR,ANCHOR_RIGHT);
     }
  }
//--------------------------------------------------------------------
//| ScrollText                                                       |
//--------------------------------------------------------------------
void ScrollText(string text,
                int x=100,
                int y=200,
                int size=8,
                string font="Consolas",
                color clr=clrGray,
                bool back=true)
  {
   //long width=ChartGetInteger(0,CHART_WIDTH_IN_PIXELS,0);
   long height=ChartGetInteger(0,CHART_HEIGHT_IN_PIXELS,0);
   for(int i=ObjectsTotal()-1; i>=0; i--)
     {
      string object=ObjectName(i);
      if(StringSubstr(object,0,5)=="plot_")
        {
         long y_pos=ObjectGetInteger(ChartID(),object,OBJPROP_YDISTANCE);
         if(height<=y_pos) ObjectDelete(object);
         ObjectSetInteger(ChartID(),object,OBJPROP_YDISTANCE,y_pos-(size+2));
        }
     }
   string object="plot_"+text;
   if(ObjectCreate(ChartID(),object,OBJ_LABEL,0,0,0))
     {
      ObjectSetInteger(ChartID(),object,OBJPROP_XDISTANCE,x);
      ObjectSetInteger(ChartID(),object,OBJPROP_YDISTANCE,y);
      ObjectSetInteger(ChartID(),object,OBJPROP_SELECTABLE,false);
      ObjectSetInteger(ChartID(),object,OBJPROP_BACK,back);
      ObjectSetText(object,text,size,font,clr);
     }
   ChartRedraw();
  }
//+------------------------------------------------------------------+
//| PlotLabelPrice                                                   |
//+------------------------------------------------------------------+
void PlotLabelPrice(string name,
                    string text,
                    double price,
                    datetime time,
                    color txtclr=clrBlack,
                    color boxclr=clrLimeGreen)
{
   string font="Consolas";
   int x,y,fontsize=9;
   int width=(StringLen(text)*fontsize)+fontsize;
   int height=(int)(fontsize*2);
   if(!ChartTimePriceToXY(ChartID(),0,time,price,x,y))
      return;

   string box=name+"ptBox_";
   if(ObjectCreate(ChartID(),box,OBJ_RECTANGLE_LABEL,0,0,0))
     {
      ObjectSetInteger(ChartID(),box,OBJPROP_WIDTH,0);
      ObjectSetInteger(ChartID(),box,OBJPROP_BORDER_TYPE,BORDER_FLAT);
      ObjectSetInteger(ChartID(),box,OBJPROP_CORNER,CORNER_LEFT_UPPER);
      ObjectSetInteger(ChartID(),box,OBJPROP_STYLE,STYLE_SOLID);
      ObjectSetInteger(ChartID(),box,OBJPROP_SELECTABLE,false);
      ObjectSetInteger(ChartID(),box,OBJPROP_SELECTED,false);
      ObjectSetInteger(ChartID(),box,OBJPROP_BACK,false);
     }
   ObjectSetInteger(ChartID(),box,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(ChartID(),box,OBJPROP_YDISTANCE,y);
   ObjectSetInteger(ChartID(),box,OBJPROP_XSIZE,width);
   ObjectSetInteger(ChartID(),box,OBJPROP_YSIZE,height);
   ObjectSetInteger(ChartID(),box,OBJPROP_COLOR,boxclr);
   ObjectSetInteger(ChartID(),box,OBJPROP_BGCOLOR,boxclr);
   //---
   string txt=name+"ptTxt_";
   if(ObjectCreate(ChartID(),txt,OBJ_LABEL,0,0,0))
     {
      ObjectSetInteger(ChartID(),txt,OBJPROP_CORNER,CORNER_LEFT_UPPER);
      ObjectSetInteger(ChartID(),txt,OBJPROP_SELECTABLE,false);
      ObjectSetInteger(ChartID(),txt,OBJPROP_SELECTED,false);
      ObjectSetInteger(ChartID(),txt,OBJPROP_BACK,false);
     }
   ObjectSetInteger(ChartID(),txt,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(ChartID(),txt,OBJPROP_YDISTANCE,y);
   ObjectSetInteger(ChartID(),txt,OBJPROP_COLOR,txtclr);
   ObjectSetText(txt,text,fontsize,font,txtclr);
  }
//+------------------------------------------------------------------+
//| SymbolInfo                                                       |
//+------------------------------------------------------------------+
void SymbolInfo(const string sym=NULL)
  {
   string strTimeleft=TimeToStr(iTime(sym,PERIOD_CURRENT,0)+Period()*60-TimeCurrent(),TIME_MINUTES|TIME_SECONDS);
   string strSpread=DoubleToStr(MarketInfo(sym,MODE_SPREAD)/((int)MarketInfo(sym,MODE_DIGITS)%2==1? 10:1),1);
   string strPercentage=DoubleToStr(((MarketInfo(sym,MODE_BID)-iClose(sym,PERIOD_D1,1))/iClose(sym,PERIOD_D1,1))*100,2)+"%";
   PlotLabel("symbolInfo",strPercentage+" / "+strSpread+" / "+strTimeleft,120,20,clrOrange,8,"Calibri");
  }
//+------------------------------------------------------------------+
//| RGBToColor                                                       |
//+------------------------------------------------------------------+
int RGBToColor(int R,
               int G,
               int B)
  {
   return(256*(256*B+G)+R);
  }
//+------------------------------------------------------------------+
//| ColorToRGB                                                    |
//+------------------------------------------------------------------+
void ColorToRGB(color clr,
                int &R,
                int &G,
                int &B)
  {
   R=clr & 0x000000FF;
   G=(clr>>8) & 0x000000FF;
   B=(clr>>16) & 0x000000FF;
  }





//--------------------------------------------------------------------
//| NEWS                                                             |
//--------------------------------------------------------------------
#define NEWS_URL  "http://www.forexfactory.com/ffcal_week_this.xml"
#define TIMEOUT   5000
#define TITLE     0
#define COUNTRY   1
#define DATE      2
#define TIME      3
#define IMPACT    4
#define FORECAST  5
#define PREVIOUS  6
//--------------------------------------------------------------------
//| InitNewsArray                                                    |
//--------------------------------------------------------------------
void InitNewsArray(string curr,
                   bool news_high,
                   bool news_medium,
                   bool news_low,
                   string str_find,
                   string str_ignore,
                   int gmt_offset,
                   string &arr_news[][])
  {
   if(!IsConnected() || IsTesting()) return;
   string filedate=TimeToStr(iTime(NULL,PERIOD_W1,0),TIME_DATE);
   string filestring=StringSubstr(filedate,0,4)+StringSubstr(filedate,5,2)+StringSubstr(filedate,8,2);
   string filename=filestring+"-news.xml";
   //---
   static datetime lastupdate=-1;
   datetime dtmod=(datetime)FileGetInteger(filename,FILE_MODIFY_DATE,false);
   if(!FileIsExist(filename) || TimeDay(TimeCurrent())>TimeDay(dtmod))
     {
      string cookie=NULL,headers;
      char post[],result[];
      int dl=WebRequest("GET",NEWS_URL,cookie,NULL,TIMEOUT,post,0,result,headers);
      if(dl==-1)
        {
         MessageBox("Add the address '"+NEWS_URL+"' in the list of allowed URLs on tab 'Expert Advisors'",__FUNCTION__,MB_ICONINFORMATION);
         Print("error WebRequest ",GetError(GetLastError()));
         return;
        }
      else
        {
         int handle=FileOpen(filename,FILE_WRITE|FILE_BIN);
         if(handle!=INVALID_HANDLE)
           {
            FileWriteArray(handle,result,0,ArraySize(result));
            FileClose(handle);
            Print("newsfile has been successfully downloaded, filesize=",ArraySize(result)," bytes");
           }
         else
           {
            Print("error FileOpen ",GetError(GetLastError()));
            return;
           }
        }
     }
   //---
   if(ArraySize(arr_news)!=-1 && TimeCurrent()<lastupdate+(12*3600))
      return;

   ResetLastError();
   string sdata;
   int handle=FileOpen(filename,FILE_BIN|FILE_READ);
   if(handle!=INVALID_HANDLE)
     {
      ulong size=FileSize(handle);
      sdata=FileReadString(handle,(int)size);
      FileClose(handle);
      if(StringFind(sdata,"</weeklyevents>",0)<1)
        {
         FileDelete(filename);
         Print("error InitNews file ",filename," is corrupt!");
         return;
        }
     }
   else
     {
      Print("error FileOpen ",GetError(GetLastError()));
      return;
     }
   //---
   string stag[7]={"<title>","<country>","<date><![CDATA[","<time><![CDATA[","<impact><![CDATA[","<forecast><![CDATA[","<previous><![CDATA["};
   string etag[7]={"</title>","</country>","]]></date>","]]></time>","]]></impact>","]]></forecast>","]]></previous>"};
   string event="";
   int index=0;
   int data=0;
   int next=0;
   int begin=0;
   int end=0;
   bool skip=false;
   while(true)
     {
      skip=false;
      data=StringFind(sdata,"<event>",data);
      if(data==-1) break;
      data+=7;
      next=StringFind(sdata,"</event>",data);
      if(next==-1) break;
      event=StringSubstr(sdata,data,next-data);
      data=next;
      begin=0;
      ArrayResize(arr_news,index+1);
      for(int i=0; i<7; i++)
        {
         arr_news[index][i]="";
         next=StringFind(event,stag[i],begin);
         if(next==-1) continue;
         else
           {
            begin=next+StringLen(stag[i]);
            end=StringFind(event,etag[i],begin);
            if(end>begin && end!=-1)
              {
               arr_news[index][i]=StringSubstr(event,begin,end-begin);
               if(i==TIME)
                 {
                  datetime newtime=MakeDateTime(arr_news[index][DATE],arr_news[index][TIME],gmt_offset);
                  arr_news[index][DATE]=TimeToString(newtime,TIME_DATE);
                  arr_news[index][TIME]=TimeToString(newtime,TIME_MINUTES);
                 }
              }
           }
        }
      if(arr_news[index][IMPACT]=="High" && !news_high) skip=true;
      if(arr_news[index][IMPACT]=="Medium" && !news_medium) skip=true;
      if(arr_news[index][IMPACT]=="Low" && !news_low) skip=true;
      if(arr_news[index][IMPACT]=="Holiday") skip=true;
      if(arr_news[index][TIME]=="Tentative") skip=true;
      if(arr_news[index][TIME]=="All Day") skip=true;
      if(arr_news[index][TIME]=="") skip=true;
      if(curr=="") curr=StringSubstr(Symbol(),0,3)+","+StringSubstr(Symbol(),3,3);
      if(StringFind(curr,arr_news[index][COUNTRY],0)==-1) skip=true;
      if(str_ignore!="")
        {
         string ignore[];
         int k=StringSplit(str_ignore,StringGetCharacter(",",0),ignore);
         for(int i=0; i<k; i++)
           {
            if(StringFind(arr_news[index][TITLE],ignore[i],0)!=-1)
               skip=true;
           }
        }
      if(str_find!="")
        {
         bool match=false;
         string find[];
         int k=StringSplit(str_find,StringGetCharacter(",",0),find);
         for(int i=0; i<k; i++)
           {
            if(StringFind(arr_news[index][TITLE],find[i],0)!=-1)
               match=true;
           }
         if(match==false)
            skip=true;
        }
      //---
      if(skip==true)
        {
         for(int i=0; i<7; i++)
           {
            arr_news[index][i]="";
            continue;
           }
        }
      else
        {
         color clr=C'100,100,100';
         if(arr_news[index][IMPACT]=="High") clr=C'200,25,25';
         if(arr_news[index][IMPACT]=="Medium") clr=clrDarkGoldenrod;
         datetime dt=StrToTime(arr_news[index][DATE]+" "+arr_news[index][TIME]);
         string text=arr_news[index][COUNTRY]+" "+arr_news[index][IMPACT]+" "+arr_news[index][TITLE];
         string object="news "+TimeToString(dt);
         if(ObjectCreate(ChartID(),object,OBJ_VLINE,0,0,0))
           {
            ObjectSetInteger(ChartID(),object,OBJPROP_COLOR,clr);
            ObjectSetInteger(ChartID(),object,OBJPROP_STYLE,STYLE_SOLID);
            ObjectSetInteger(ChartID(),object,OBJPROP_WIDTH,1);
            ObjectSetInteger(ChartID(),object,OBJPROP_TIMEFRAMES,OBJ_PERIOD_M1|OBJ_PERIOD_M5|OBJ_PERIOD_M15|OBJ_PERIOD_M30|OBJ_PERIOD_H1);
            ObjectSetInteger(ChartID(),object,OBJPROP_SELECTABLE,false);
           }
         ObjectSetInteger(ChartID(),object,OBJPROP_TIME,dt);
         ObjectSetString(ChartID(),object,OBJPROP_TEXT,text);
         ObjectSetString(ChartID(),object,OBJPROP_TOOLTIP,text);
         index++;
        }
     }
   lastupdate=TimeCurrent();
   Print("initialized News");
  }
//--------------------------------------------------------------------
//| MakeDateTime                                                     |
//--------------------------------------------------------------------
datetime MakeDateTime(string date,
                      string time,
                      int offset)
  {
   int n1=StringFind(date,"-");
   int n2=StringFind(date,"-",n1+1);
   int pos=StringFind(time,":");
   string month=StringSubstr(date,0,2);
   string day=StringSubstr(date,3,2);
   string year=StringSubstr(date,6,4);
   string hour=StringSubstr(time,0,pos);
   string minute=StringSubstr(time,pos+1,2);
   string ampm=StringSubstr(time,StringLen(time)-2);
   int hour24=StrToInteger(hour);
   if((ampm=="am" || ampm=="AM") && hour24==12) hour24=0;
   if((ampm=="pm" || ampm=="PM") && hour24!=12) hour24+=12;
   return(StringToTime(year+"."+month+"."+day)+hour24*3600+(datetime)(StringToInteger(minute)*60)+offset*3600);
  }
//--------------------------------------------------------------------
//| IsNewsURL                                                        |
//--------------------------------------------------------------------
bool IsNewsURL()
  {
   if(!IsTesting())
     {
      string testc=NULL,testh;
      char testp[],testr[];
      int test=WebRequest("GET",NEWS_URL,testc,NULL,TIMEOUT,testp,0,testr,testh);
      if(test==-1)
        {
         MessageBox("Add the address '"+NEWS_URL+"' in the list of allowed URLs on tab 'Expert Advisors'",WindowExpertName(),MB_ICONINFORMATION);
         Print("error WebRequest ",GetError(GetLastError()));
         return(false);
        }
     }
   return(true);
  }
//+------------------------------------------------------------------+
//| IsNewsTime                                                       |
//+------------------------------------------------------------------+
bool IsNewsTime(int min_before,
                int min_after,
                string &arr_news[][])
  {
   if(!IsConnected() || IsTesting()) return(false);
   static datetime isnewstime=-1;
   if(TimeCurrent()<isnewstime-(60*min_before)) return(false);
   else if(isnewstime==-1 || TimeCurrent()>isnewstime+(60*min_after))
     {
      int size=ArrayRange(arr_news,0);
      for(int i=0; i<size; i++)
        {
         datetime prev=-1;
         datetime next=StrToTime(arr_news[i][DATE]+" "+arr_news[i][TIME]);
         if(i>0)  prev=StrToTime(arr_news[i-1][DATE]+" "+arr_news[i-1][TIME]);
         if(TimeCurrent()>prev && TimeCurrent()<next+(60*min_after))
           {
            isnewstime=next;
            break;
           }
        }
     }
   if(TimeCurrent()>isnewstime-(60*min_before) && TimeCurrent()<isnewstime+(60*min_after))
      return(true);
   return(false);
  }
//+------------------------------------------------------------------+
//| NextNewsTime                                                     |
//+------------------------------------------------------------------+
datetime NextNewsTime(int min_before,
                      int min_after,
                      string &arr_news[][])
  {
   if(!IsConnected() || IsTesting()) return(-1);
   static datetime nextnewstime=-1;
   if(TimeCurrent()<nextnewstime-(60*min_before)) return(nextnewstime);
   else if(nextnewstime==-1 || TimeCurrent()>nextnewstime+(60*min_after))
     {
      int index=-1;
      int size=ArrayRange(arr_news,0);
      for(int i=0; i<size; i++)
        {
         datetime prev=-1;
         datetime next=StrToTime(arr_news[i][DATE]+" "+arr_news[i][TIME]);
         if(i>0)  prev=StrToTime(arr_news[i-1][DATE]+" "+arr_news[i-1][TIME]);
         if(TimeCurrent()>prev && TimeCurrent()<next+(60*min_after))
           {
            index=i;
            break;
           }
        }
      if(index==-1) nextnewstime=-1;
      else          nextnewstime=StrToTime(arr_news[index][DATE]+" "+arr_news[index][TIME]);
     }
   return(nextnewstime);
  }
//+------------------------------------------------------------------+
//| NextNewsCurrTime                                                 |
//+------------------------------------------------------------------+
datetime NextNewsCurrTime(string curr,
                          int min_before,
                          int min_after,
                          string &arr_news[][])
  {
   if(!IsConnected() || IsTesting()) return(-1);
   static datetime nextnewstime=-1;
   if(TimeCurrent()<nextnewstime-(60*min_before)) return(nextnewstime);
   else if(nextnewstime==-1 || TimeCurrent()>nextnewstime+(60*min_after))
     {
      int index=-1;
      int size=ArrayRange(arr_news,0);
      for(int i=0; i<size; i++)
        {
         if(StringFind(curr,arr_news[i][COUNTRY],0)==-1) continue;
         datetime prev=-1;
         datetime next=StrToTime(arr_news[i][DATE]+" "+arr_news[i][TIME]);
         for(int j=0; j<i; j++)
           {
            if(StringFind(curr,arr_news[j][COUNTRY],0)==-1) continue;
            prev=StrToTime(arr_news[j][DATE]+" "+arr_news[j][TIME]);
           }
         if(TimeCurrent()>prev && TimeCurrent()<next+(60*min_after))
           {
            index=i;
            break;
           }
        }
      if(index==-1) nextnewstime=-1;
      else          nextnewstime=StrToTime(arr_news[index][DATE]+" "+arr_news[index][TIME]);
     }
   return(nextnewstime);
  }
//+------------------------------------------------------------------+
//| PlotNews                                                         |
//+------------------------------------------------------------------+
string PlotNews(const string &arr_news[][],
                string &info,
                string &event,
                string &list)
  {
   static datetime plotnewstime=-1;
   static string newsinfo;
   static string newsevent;
   static string newslist;
   datetime timeleft=plotnewstime-TimeCurrent();
   if(TimeCurrent()<plotnewstime && newsinfo!="") return(newsinfo);
   else if(TimeCurrent()>=plotnewstime && TimeCurrent()<plotnewstime+(60*15))
     {
      timeleft=plotnewstime+(15*60)-TimeCurrent();
      return("!! "+newsevent);
     }
   else if(TimeCurrent()>plotnewstime+(60*15))
     {
      int index=-1;
      int size=ArrayRange(arr_news,0);
      for(int i=0; i<size; i++)
        {
         datetime prev=-1;
         datetime next=StrToTime(arr_news[i][DATE]+" "+arr_news[i][TIME]);
         if(i>0)  prev=StrToTime(arr_news[i-1][DATE]+" "+arr_news[i-1][TIME]);
         if(TimeCurrent()>prev && TimeCurrent()<next+(60*15))
           {
            index=i;
            break;
           }
        }
      newslist="";
      for(int i=0; i<size; i++)
        {
         string nr=i==0? "":"\n";
         if(i==index) nr="\n> ";
         if(arr_news[i][TITLE]!="")
           {
            newslist+=nr+arr_news[i][COUNTRY]+" "+arr_news[i][TITLE];
           }
        }
      if(index==-1)
        {
         newsevent="";
         newslist+="\n> No more events this week..";
         newsinfo="No matching events. Waiting for newsfile to be updated.";
         return(newsinfo);
        }
      else
        {
         plotnewstime=StrToTime(arr_news[index][DATE]+" "+arr_news[index][TIME]);
         newsevent=arr_news[index][COUNTRY]+": "+arr_news[index][TITLE];
         newsinfo=arr_news[index][TIME]+" "+newsevent;
        }
     }
   return(newsinfo);
  }
//+------------------------------------------------------------------+
//| CheckNews (width alert)                                          |
//+------------------------------------------------------------------+
string CheckNews(string &arr_news[][],
                 bool alert=true,
                 int minutes=10)
  {
   static datetime plotnewstime=-1;
   static string nextevent;
   static string listevent;
   datetime timeleft=plotnewstime-TimeCurrent();
   //--- alert
   datetime m1=iTime(NULL,1,0);
   if(alert==true && m1!=GlobalVariableGet("lastalert") && m1==plotnewstime-(60*MathAbs(minutes)))
     {
      GlobalVariableSet("lastalert",m1);
      Alert(IntegerToString(MathAbs(minutes))," minutes to ",StringSubstr(nextevent,10,0));
     }
   //---
   if(TimeCurrent()<plotnewstime && nextevent!="") return(nextevent);
   else if(TimeCurrent()>=plotnewstime && TimeCurrent()<plotnewstime+(60*15))
     {
      timeleft=plotnewstime+(15*60)-TimeCurrent();
      return("!! "+nextevent);
     }
   else if(TimeCurrent()>plotnewstime+(60*15))
     {
      int index=-1;
      int size=ArrayRange(arr_news,0);
      for(int i=0; i<size; i++)
        {
         datetime prev=-1;
         datetime next=StrToTime(arr_news[i][DATE]+" "+arr_news[i][TIME]);
         if(i>0)  prev=StrToTime(arr_news[i-1][DATE]+" "+arr_news[i-1][TIME]);
         if(next!=prev && TimeCurrent()>prev && TimeCurrent()<next+(60*15))
           {
            index=i;
            break;
           }
        }
      listevent="";
      for(int i=0; i<size; i++)
        {
         string nr=i==0? "":"\n";
         if(i==index) nr="\n> ";
         if(arr_news[i][TITLE]!="")
           {
            nextevent+=DayToStr(TimeDayOfWeek(plotnewstime))+" "+arr_news[i][TIME]+" "+arr_news[i][COUNTRY]+" "+arr_news[i][IMPACT]+" "+arr_news[i][TITLE];
           }
        }
      if(index==-1 || arr_news[index][TITLE]=="")
        {
         listevent+="\n> No more events this week";
         nextevent="No more events this week";
         return(nextevent);
        }
      else
        {
         plotnewstime=StrToTime(arr_news[index][DATE]+" "+arr_news[index][TIME]);
         nextevent=DayToStr(TimeDayOfWeek(plotnewstime))+" "+arr_news[index][TIME]+" "+arr_news[index][COUNTRY]+" "+arr_news[index][IMPACT]+" "+arr_news[index][TITLE];
        }
     }
   return(nextevent);
  }





//--------------------------------------------------------------------
//| INDICATORS                                                       |
//--------------------------------------------------------------------
//--------------------------------------------------------------------
//| ZoneToString                                                     |
//--------------------------------------------------------------------
string ZoneToString(int type)
  {
   switch(type)
     {
      case 1: return("Support");
      case 2: return("Resistance");
      default: return("");
     }
  }
//--------------------------------------------------------------------
//| ZoneTypeToString                                                 |
//--------------------------------------------------------------------
string ZoneTypeToString(int type)
  {
   switch(type)
     {
      case 1: return("Untested");
      case 2: return("Proven");
      case 3: return("Turned");
      default: return("");
     }
  }
//--------------------------------------------------------------------
//| FindZones                                                        |
//--------------------------------------------------------------------
void FindZones(double &arr_hi[],
               double &arr_lo[],
               int &arr_hits[],
               bool &arr_turn[],
               int &arr_start[],
               int &arr_type[],
               int fast=2,
               int slow=6,
               int bars=1000,
               double fuzz=0.3,
               int tf=0,
               const string sym=NULL)
  {
   int limit=MathMin(iBars(sym,tf)-1,bars);
   double temp_hi[],temp_lo[];
   int temp_start[],temp_hits[],temp_count=0;
   bool temp_turn[];
   ArrayResize(temp_hi,limit);
   ArrayResize(temp_lo,limit);
   ArrayResize(temp_start,limit);
   ArrayResize(temp_hits,limit);
   ArrayResize(temp_turn,limit);
   for(int shift=limit-slow; shift>5; shift--)
     {
      bool isBust=false;
      if(iHighest(sym,0,MODE_HIGH,(slow*2)+1,shift-slow)==shift)
        {
         double fu=iATR(sym,tf,7,shift)/2*fuzz;
         double hival=iHigh(sym,tf,shift);
         double loval=MathMax(MathMin(iClose(sym,tf,shift),iHigh(sym,tf,shift)-fu),iHigh(sym,tf,shift)-fu*2);
         bool turned=false;
         bool hasturned=false;
         isBust=false;
         int bustcount=0;
         int testcount=0;
         for(int i=shift-1; i>=0; i--)
           {
            double ihi=(iHighest(sym,0,MODE_HIGH,(fast*2)+1,i-fast)==i)? iHigh(sym,tf,i):0;
            double ilo=(iLowest(sym,0,MODE_LOW,(fast*2)+1,i-fast)==i)? iLow(sym,tf,i):0;
            if((turned==false && ihi>0 && ihi>=loval && ihi<=hival) || (turned==true && ilo>0 && ilo<=hival && ilo>=loval))
              {
               bustcount=0;
               testcount++;
              }
            if((turned==false && iHigh(sym,tf,i)>hival) || (turned==true && iLow(sym,tf,i)<loval))
              {
               bustcount++;
               if(bustcount>1)
                 {
                  isBust=true;
                  break;
                 }
               if(turned==true) turned=false;
               else if(turned==false) turned=true;
               hasturned=true;
               testcount=0;
              }
           }
         if(isBust==false)
           {
            temp_hi[temp_count]=hival;
            temp_lo[temp_count]=loval;
            temp_hits[temp_count]=testcount;
            temp_turn[temp_count]=hasturned;
            temp_start[temp_count]=shift;
            temp_count++;
           }
        }
      else if(iLowest(sym,0,MODE_LOW,(slow*2)+1,shift-slow)==shift)
        {
         double fu=iATR(sym,tf,7,shift)/2*fuzz;
         double loval=iLow(sym,tf,shift);
         double hival=MathMin(MathMax(iClose(sym,tf,shift),iLow(sym,tf,shift)+fu),iLow(sym,tf,shift)+fu*2);
         bool turned=false;
         bool hasturned=false;
         isBust=false;
         int bustcount=0;
         int testcount=0;
         for(int i=shift-1; i>=0; i--)
           {
            double ihi=(iHighest(sym,0,MODE_HIGH,(fast*2)+1,i-fast)==i)? iHigh(sym,tf,i):0;
            double ilo=(iLowest(sym,0,MODE_LOW,(fast*2)+1,i-fast)==i)? iLow(sym,tf,i):0;
            if((turned==true && ihi>0 && ihi>=loval && ihi<=hival) || (turned==false && ilo>0 && ilo<=hival && ilo>=loval))
              {
               bustcount=0;
               testcount++;
              }
            if((turned==true && iHigh(sym,tf,i)>hival) || (turned==false && iLow(sym,tf,i)<loval))
              {
               bustcount++;
               if(bustcount>1)
                 {
                  isBust=true;
                  break;
                 }
               if(turned==true) turned=false;
               else if(turned==false) turned=true;
               hasturned=true;
               testcount=0;
              }
           }
         if(isBust==false)
           {
            temp_hi[temp_count]=hival;
            temp_lo[temp_count]=loval;
            temp_hits[temp_count]=testcount;
            temp_turn[temp_count]=hasturned;
            temp_start[temp_count]=shift;
            temp_count++;
           }
        }
     }
   //---
   int count=0;
   for(int i=0; i<temp_count; i++)
     {
      if(temp_hits[i]>=0 && count<limit)
        {
         ArrayResize(arr_hi,count+1);
         ArrayResize(arr_lo,count+1);
         ArrayResize(arr_hits,count+1);
         ArrayResize(arr_turn,count+1);
         ArrayResize(arr_start,count+1);
         ArrayResize(arr_type,count+1);
         arr_hi[count]=temp_hi[i];
         arr_lo[count]=temp_lo[i];
         arr_hits[count]=temp_hits[i];
         arr_turn[count]=temp_turn[i];
         arr_start[count]=temp_start[i];
         if(arr_hi[count]<iClose(sym,tf,4)) arr_type[count]=1;
         else if(arr_lo[count]>iClose(sym,tf,4)) arr_type[count]=2;
         else
           {
            for(int j=5; j<limit; j++)
              {
               if(iClose(sym,tf,j)<arr_lo[count])
                 {
                  arr_type[count]=1;
                  break;
                 }
               else if(iClose(sym,tf,j)>arr_hi[count])
                 {
                  arr_type[count]=2;
                  break;
                 }
              }
           }
         count++;
        }
     }
  }
//+------------------------------------------------------------------+
//| DrawZones                                                        |
//+------------------------------------------------------------------+
void DrawZones(double &arr_hi[],
               double &arr_lo[],
               int &arr_hits[],
               bool &arr_turn[],
               int &arr_start[],
               int &arr_type[],
                bool untested=true,
                bool proven=true,
                bool turned=true)
  {
   color UNTESTED=clrDarkSlateBlue;
   color PROVEN=clrIndigo;
   color TURNED=clrSteelBlue;
   ObjectsDeleteAll(ChartID(),"Support",0,OBJ_RECTANGLE);
   ObjectsDeleteAll(ChartID(),"Resistance",0,OBJ_RECTANGLE);
   //---
   int size=MathMax(ArraySize(arr_hi),ArraySize(arr_lo));
   for(int i=0; i<size; i++)
     {
      int type=0;
      if(arr_turn[i]==true)    type=3;
      else if(arr_hits[i]>0)   type=2;
      else                     type=1;
      if(!turned && type==3)   continue;
      if(!proven && type==2)   continue;
      if(!untested && type==1) continue;
      //---
      string object;
      if(arr_turn[i]==true)    object=(arr_type[i]==1? "Support":"Resistance")+" Turned "+TimeToString(Time[arr_start[i]]);
      else if(arr_hits[i]>0)   object=(arr_type[i]==1? "Support":"Resistance")+" Proven "+TimeToString(Time[arr_start[i]]);
      else                     object=(arr_type[i]==1? "Support":"Resistance")+" Untested "+TimeToString(Time[arr_start[i]]);
      ObjectCreate(ChartID(),object,OBJ_RECTANGLE,0,0,0,0,0);
      ObjectSetInteger(ChartID(),object,OBJPROP_TIME1,Time[arr_start[i]]);
      ObjectSetInteger(ChartID(),object,OBJPROP_TIME2,Time[0]);
      ObjectSetDouble(ChartID(),object,OBJPROP_PRICE1,arr_hi[i]);
      ObjectSetDouble(ChartID(),object,OBJPROP_PRICE2,arr_lo[i]);
      ObjectSetInteger(ChartID(),object,OBJPROP_WIDTH,1);
      ObjectSetInteger(ChartID(),object,OBJPROP_STYLE,STYLE_SOLID);
      ObjectSetInteger(ChartID(),object,OBJPROP_BACK,true);
      if(arr_type[i]==1)
        {
         if(arr_turn[i]==true)  ObjectSetInteger(ChartID(),object,OBJPROP_COLOR,TURNED);
         else if(arr_hits[i]>0) ObjectSetInteger(ChartID(),object,OBJPROP_COLOR,PROVEN);
         else                   ObjectSetInteger(ChartID(),object,OBJPROP_COLOR,UNTESTED);
        }
      else
        {
         if(arr_turn[i]==true)  ObjectSetInteger(ChartID(),object,OBJPROP_COLOR,TURNED);
         else if(arr_hits[i]>0) ObjectSetInteger(ChartID(),object,OBJPROP_COLOR,PROVEN);
         else                   ObjectSetInteger(ChartID(),object,OBJPROP_COLOR,UNTESTED);
        }
     }
  }
//+------------------------------------------------------------------+
//| ZoneAlerts                                                       |
//+------------------------------------------------------------------+
bool ZoneAlerts(double &arr_hi[],
                double &arr_lo[],
                int &arr_hits[],
                bool &arr_turn[],
                int &arr_start[],
                int &arr_type[],
                bool untested=true,
                bool proven=true,
                bool turned=true,
                int sh=0,
                int tf=0,
                const string sym=NULL)
  {
   static datetime lastalert=-1;
   datetime time=iTime(sym,tf,0);
   if(time==lastalert) return(false);
   //---
   int size=MathMax(ArraySize(arr_hi),ArraySize(arr_lo));
   for(int i=0; i<size; i++)
     {
      int type=0;
      if(arr_turn[i]==true)   type=3;
      else if(arr_hits[i]>0)  type=2;
      else                    type=1;
      if(!turned && type==3)  continue;
      if(!proven && type==2)  continue;
      if(!untested && type==1)continue;
      //---
      double close=iClose(sym,tf,sh);
      if(close>arr_lo[i] && close<arr_hi[i])
        {
         string strType;
         if(type==3)          strType="Turned";
         else if(type==2)     strType="Proven";
         else                 strType="Untested";
         if(arr_type[i]==1)
           {
            Alert(sym+TimeframeToString(tf)+": Entering ",strType," Support");
            lastalert=time;
            return(true);
           }
         else
           {
            Alert(sym+TimeframeToString(tf)+": Entering ",strType," Resistance");
            lastalert=time;
            return(true);
           }
        }
     }
   return(false);
  }
//--------------------------------------------------------------------
//| FindBlocks                                                       |
//--------------------------------------------------------------------
void FindBlocks(double &arr_hi[],
                double &arr_lo[],
                int &arr_hits[],
                bool &arr_turn[],
                int &arr_start[],
                int &arr_type[],
                int fast=1,
                int slow=3,
                int bars=200,
                int tf=0,
                const string sym=NULL)
  {
   int limit=MathMin(iBars(sym,tf)-1,bars);
   double temp_hi[],temp_lo[];
   int temp_start[],temp_hits[],temp_count=0;
   bool temp_turn[];
   ArrayResize(temp_hi,limit);
   ArrayResize(temp_lo,limit);
   ArrayResize(temp_start,limit);
   ArrayResize(temp_hits,limit);
   ArrayResize(temp_turn,limit);
   for(int shift=limit-slow; shift>slow; shift--)
     {
      bool touchOk=false;
      bool isBust=false;
      int sh=shift;
      if(iHighest(sym,0,MODE_OPEN,(slow*2)+1,shift-slow)==shift)
        {
         double hival=0;
         double loval=0;
         bool turned=false;
         bool hasturned=false;
         isBust=false;
         int bustcount=0;
         int testcount=0;
         for(int i=0; i<3; i++)
           {
            if(iOpen(sym,tf,shift+i)<iClose(sym,tf,shift+i))
              {
               double r=iHigh(sym,tf,shift+i)-iLow(sym,tf,shift+i);
               double b=iClose(sym,tf,shift+i)-iOpen(sym,tf,shift+i);
               if(b>r*0.3 || b>iATR(sym,tf,7,shift+i))
                 {
                  hival=iClose(sym,tf,shift+i);
                  loval=iOpen(sym,tf,shift+i);
                  sh=shift+i;
                  break;
                 }
              }
           }
         //---
         for(int i=shift-1; i>=0; i--)
           {
            double ihi=(iHighest(sym,0,MODE_HIGH,(fast*2)+1,i-fast)==i)? iHigh(sym,tf,i):0;
            double ilo=(iLowest(sym,0,MODE_LOW,(fast*2)+1,i-fast)==i)? iLow(sym,tf,i):0;
            if((turned==false && ihi>0 && ihi>=loval && ihi<=hival) || (turned==true && ilo>0 && ilo<=hival && ilo>=loval))
              {
               touchOk=true;
               for(int j=i+1; j<i+3; j++)
                 {
                  double jhi=(iHighest(sym,0,MODE_HIGH,(fast*2)+1,j-fast)==j)? iHigh(sym,tf,j):0;
                  double jlo=(iLowest(sym,0,MODE_LOW,(fast*2)+1,j-fast)==j)? iLow(sym,tf,j):0;
                  if((turned==false && jhi>=loval && jhi<=hival) || (turned==true && jlo<=hival && jlo>=loval))
                    {
                     touchOk=false;
                     break;
                    }
                 }
               if(touchOk==true)
                 {
                  bustcount=0;
                  testcount++;
                 }
              }
            if((turned==false && iHigh(sym,tf,i)>hival) || (turned==true && iLow(sym,tf,i)<loval))
              {
               bustcount++;
               if(bustcount>1)
                 {
                  isBust=true;
                  break;
                 }
               if(turned==true) turned=false;
               else if(turned==false) turned=true;
               hasturned=true;
               testcount=0;
              }
           }
         if(isBust==false)
           {
            temp_hi[temp_count]=hival;
            temp_lo[temp_count]=loval;
            temp_hits[temp_count]=testcount;
            temp_turn[temp_count]=hasturned;
            temp_start[temp_count]=sh;
            temp_count++;
           }
        }
      else if(iLowest(sym,0,MODE_OPEN,(slow*2)+1,shift-slow)==shift)
        {
         double hival=0;
         double loval=0;
         bool turned=false;
         bool hasturned=false;
         isBust=false;
         int bustcount=0;
         int testcount=0;

         for(int i=0; i<3; i++)
           {
            if(iOpen(sym,tf,shift+i)>iClose(sym,tf,shift+i))
              {
               double r=iHigh(sym,tf,shift+i)-iLow(sym,tf,shift+i);
               double b=iOpen(sym,tf,shift+i)-iClose(sym,tf,shift+i);
               if(b>r*0.3 || b>iATR(sym,tf,7,shift+i))
                 {
                  hival=iOpen(sym,tf,shift+i);
                  loval=iClose(sym,tf,shift+i);
                  sh=shift+i;
                  break;
                 }
              }
           }
         //---
         for(int i=shift-1; i>=0; i--)
           {
            double ihi=(iHighest(sym,0,MODE_HIGH,(fast*2)+1,i-fast)==i)? iHigh(sym,tf,i):0;
            double ilo=(iLowest(sym,0,MODE_LOW,(fast*2)+1,i-fast)==i)? iLow(sym,tf,i):0;
            if((turned==true && ihi>0 && ihi>=loval && ihi<=hival) || (turned==false && ilo>0 && ilo<=hival && ilo>=loval))
              {
               touchOk=true;
               for(int j=i+1; j<i+3; j++)
                 {
                  double jhi=(iHighest(sym,0,MODE_HIGH,(fast*2)+1,j-fast)==j)? iHigh(sym,tf,j):0;
                  double jlo=(iLowest(sym,0,MODE_LOW,(fast*2)+1,j-fast)==j)? iLow(sym,tf,j):0;
                  if((turned==true && jhi>=loval && jhi<=hival) || (turned==false && jlo<=hival && jlo>=loval))
                    {
                     touchOk=false;
                     break;
                    }
                 }
               if(touchOk==true)
                 {
                  bustcount=0;
                  testcount++;
                 }
              }
            if((turned==true && iHigh(sym,tf,i)>hival) || (turned==false && iLow(sym,tf,i)<loval))
              {
               bustcount++;
               if(bustcount>1)
                 {
                  isBust=true;
                  break;
                 }
               if(turned==true) turned=false;
               else if(turned==false) turned=true;
               hasturned=true;
               testcount=0;
              }
           }
         if(isBust==false)
           {
            temp_hi[temp_count]=hival;
            temp_lo[temp_count]=loval;
            temp_hits[temp_count]=testcount;
            temp_turn[temp_count]=hasturned;
            temp_start[temp_count]=sh;
            temp_count++;
           }
        }
     }
   //---
   int count=0;
   for(int i=0; i<temp_count; i++)
     {
      if(temp_hits[i]>=0 && count<limit)
        {
         ArrayResize(arr_hi,count+1);
         ArrayResize(arr_lo,count+1);
         ArrayResize(arr_hits,count+1);
         ArrayResize(arr_turn,count+1);
         ArrayResize(arr_start,count+1);
         ArrayResize(arr_type,count+1);
         arr_hi[count]=temp_hi[i];
         arr_lo[count]=temp_lo[i];
         arr_hits[count]=temp_hits[i];
         arr_turn[count]=temp_turn[i];
         arr_start[count]=temp_start[i];
         if(arr_hi[count]<iClose(sym,tf,slow-1)) arr_type[count]=1;
         else if(arr_lo[count]>iClose(sym,tf,slow-1)) arr_type[count]=2;
         else
           {
            for(int j=slow; j<limit; j++)
              {
               if(iClose(sym,tf,j)<arr_lo[count])
                 {
                  arr_type[count]=1;
                  break;
                 }
               else if(iClose(sym,tf,j)>arr_hi[count])
                 {
                  arr_type[count]=2;
                  break;
                 }
              }
           }
         count++;
        }
     }
  }
/*
//+------------------------------------------------------------------+
//| InitRenko                                                        |
//+------------------------------------------------------------------+
void InitRenko(string sym,
               int tf=PERIOD_CURRENT,
               int renkosize=100)
  {
double renkoPoints,renkoOpen,renkoClose,renkoHi,renkoLo;
datetime renko_bartime;

   int dig=(int)MarketInfo(sym,MODE_DIGITS);
   double pt=MarketInfo(sym,MODE_POINT);
   if(dig==3 || dig==5) pt*=10;
   renkoPoints=NormalizeDouble(renkosize*pt,dig);
   renkoOpen=NormalizeDouble(MathFloor(iClose(sym,tf,1)/renkoPoints)*renkoPoints,dig);
   renkoClose=renkoOpen+renkoPoints;
   renkoHi=iHigh(sym,tf,1);
   renkoLo=iLow(sym,tf,1);
  }
//+------------------------------------------------------------------+
//| CalcRenko                                                        |
//+------------------------------------------------------------------+
void CalcRenko(string sym,
               int tf=PERIOD_CURRENT)
  {
double renkoPoints,renkoOpen,renkoClose,renkoHi,renkoLo;
datetime renko_bartime;

   double price=MarketInfo(sym,MODE_BID);
   datetime bar_time=(datetime)SeriesInfoInteger(sym,tf,SERIES_LASTBAR_DATE);
   if(renko_bartime!=bar_time)
      renko_bartime=bar_time;

   renkoHi=MathMax(renkoHi,price);
   renkoLo=MathMin(renkoLo,price);
   while(price<(renkoOpen-renkoPoints) || NormalizeDouble(price-(renkoOpen-renkoPoints),8)==0)
     {
      renkoOpen-=renkoPoints;
      renkoClose-=renkoPoints;

      //FileRenkoWrite(Time[0],renkoClose,renkoLo,renkoHi,renkoOpen,0);
      renko_bartime=bar_time;

      renkoHi=renkoOpen;
      renkoLo=renkoOpen;
     }
   while(price>(renkoClose+renkoPoints) || NormalizeDouble(price-(renkoClose+renkoPoints),8)==0)
     {
      renkoOpen+=renkoPoints;
      renkoClose+=renkoPoints;

      //FileRenkoWrite(Time[0],renkoOpen,renkoLo,renkoHi,renkoClose,0);
      renko_bartime=bar_time;

      renkoHi=renkoClose;
      renkoLo=renkoClose;
     }
  }
*/
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void FillZigZag(double &arr_ext[],
                int &arr_pos[],
                int depth=12,
                int deviation=5,
                int backstep=3,
                int bars=500,
                bool draw=false)
  {
   int    i,whatlookfor=0;
   int    back,pos,lasthighpos=0,lastlowpos=0;
   double extrem;
   double curlow=0.0,curhigh=0.0,lasthigh=0.0,lastlow=0.0;
   double zzHigh[],zzLow[];

   static int limit=0;
   if(bars<depth || backstep>=depth || bars>Bars)
      return;

   ArrayResize(zzHigh,bars);
   ArrayResize(zzLow,bars);
   ArrayResize(arr_ext,bars);
   ArrayResize(arr_pos,bars);
   ArrayInitialize(zzHigh,0.0);
   ArrayInitialize(zzLow,0.0);
   ArrayInitialize(arr_ext,0.0);
   ArrayInitialize(arr_pos,0);
   limit=bars-depth;

   for(i=limit; i>=0; i--)
     {
      extrem=Low[iLowest(NULL,0,MODE_LOW,depth,i)];
      if(extrem==lastlow) extrem=0.0;
      else
        {
         lastlow=extrem;
         if(Low[i]-extrem>deviation*Point) extrem=0.0;
         else
           {
            for(back=1; back<=backstep; back++)
              {
               pos=i+back;
               if(zzLow[pos]!=0 && zzLow[pos]>extrem) zzLow[pos]=0.0;
              }
           }
        }
      if(Low[i]==extrem) zzLow[i]=extrem;
      else zzLow[i]=0.0;
      //---
      extrem=High[iHighest(NULL,0,MODE_HIGH,depth,i)];
      if(extrem==lasthigh) extrem=0.0;
      else
        {
         lasthigh=extrem;
         if(extrem-High[i]>deviation*Point) extrem=0.0;
         else
           {
            for(back=1; back<=backstep; back++)
              {
               pos=i+back;
               if(zzHigh[pos]!=0 && zzHigh[pos]<extrem) zzHigh[pos]=0.0;
              }
           }
        }
      if(High[i]==extrem) zzHigh[i]=extrem;
      else zzHigh[i]=0.0;
     }
   //--- final cutting 
   for(i=limit; i>=0; i--)
     {
      switch(whatlookfor)
        {
         case 0:
            if(zzHigh[i]!=0.0)
              {
               lasthigh=High[i];
               lasthighpos=i;
               whatlookfor=-1;
               arr_ext[i]=lasthigh;
               arr_pos[i]=i;
              }
            if(zzLow[i]!=0.0)
              {
               lastlow=Low[i];
               lastlowpos=i;
               whatlookfor=1;
               arr_ext[i]=lastlow;
               arr_pos[i]=i;
              }
         case 1:
            if(zzLow[i]!=0.0 && zzLow[i]<lastlow && zzHigh[i]==0.0)
              {
               arr_ext[lastlowpos]=0.0;
               lastlowpos=i;
               lastlow=zzLow[i];
               arr_ext[i]=lastlow;
               arr_pos[i]=i;
                  PlotTL("l",Time[lasthighpos],Time[lastlowpos],lasthigh,lastlow,clrRed,1);
              }
            if(zzHigh[i]!=0.0 && zzLow[i]==0.0)
              {
               lasthigh=zzHigh[i];
               lasthighpos=i;
               arr_ext[i]=lasthigh;
               arr_pos[i]=i;
               whatlookfor=-1;
                  PlotTL("h",Time[lastlowpos],Time[lasthighpos],lastlow,lasthigh,clrRed,1);
              }
            break;
         case -1:
            if(zzHigh[i]!=0.0 && zzHigh[i]>lasthigh && zzLow[i]==0.0)
              {
               arr_ext[lasthighpos]=0.0;
               lasthighpos=i;
               lasthigh=zzHigh[i];
               arr_ext[i]=lasthigh;
               arr_pos[i]=i;
                  PlotTL("h",Time[lastlowpos],Time[lasthighpos],lastlow,lasthigh,clrRed,1);
              }
            if(zzLow[i]!=0.0 && zzHigh[i]==0.0)
              {
               lastlow=zzLow[i];
               lastlowpos=i;
               arr_ext[i]=lastlow;
               arr_pos[i]=i;
               whatlookfor=1;
                  PlotTL("l",Time[lasthighpos],Time[lastlowpos],lasthigh,lastlow,clrRed,1);
              }
            break;
        }
     }
   return;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct STRUCT_ZZ
  {
   int pos;
   double price;
  };
//+------------------------------------------------------------------+
//| FillZZ                                                           |
//+------------------------------------------------------------------+
void FillZZ(STRUCT_ZZ &szz[],
            int depth=12,
            int deviation=5,
            int backstep=3,
            int bars=200)
  {
   int    i,whatlookfor=0;
   int    back,pos,lasthighpos=0,lastlowpos=0;
   double extrem;
   double curlow=0.0,curhigh=0.0,lasthigh=0.0,lastlow=0.0;
   double zzHigh[],zzLow[];

   static int limit=0;
   if(bars<depth || backstep>=depth || bars>Bars)
      return;

   ArrayFree(szz);
   ArrayResize(szz,bars);
   ArrayResize(zzHigh,bars);
   ArrayResize(zzLow,bars);
   ArrayInitialize(zzHigh,0.0);
   ArrayInitialize(zzLow,0.0);
   limit=bars-depth;

   for(i=limit; i>=0; i--)
     {
      extrem=Low[iLowest(NULL,0,MODE_LOW,depth,i)];
      if(extrem==lastlow) extrem=0.0;
      else
        {
         lastlow=extrem;
         if(Low[i]-extrem>deviation*Point) extrem=0.0;
         else
           {
            for(back=1; back<=backstep; back++)
              {
               pos=i+back;
               if(zzLow[pos]!=0 && zzLow[pos]>extrem) zzLow[pos]=0.0;
              }
           }
        }
      if(Low[i]==extrem) zzLow[i]=extrem;
      else zzLow[i]=0.0;
      //---
      extrem=High[iHighest(NULL,0,MODE_HIGH,depth,i)];
      if(extrem==lasthigh) extrem=0.0;
      else
        {
         lasthigh=extrem;
         if(extrem-High[i]>deviation*Point) extrem=0.0;
         else
           {
            for(back=1; back<=backstep; back++)
              {
               pos=i+back;
               if(zzHigh[pos]!=0 && zzHigh[pos]<extrem) zzHigh[pos]=0.0;
              }
           }
        }
      if(High[i]==extrem) zzHigh[i]=extrem;
      else zzHigh[i]=0.0;
     }
   //--- final cutting
   for(i=limit; i>=0; i--)
     {
      switch(whatlookfor)
        {
         case 0:
            if(zzHigh[i]!=0.0)
              {
               lasthigh=High[i];
               lasthighpos=i;
               whatlookfor=-1;
               szz[i].price=lasthigh;
               szz[i].pos=i;
              }
            if(zzLow[i]!=0.0)
              {
               lastlow=Low[i];
               lastlowpos=i;
               whatlookfor=1;
               szz[i].price=lastlow;
               szz[i].pos=i;
              }
         case 1:
            if(zzLow[i]!=0.0 && zzLow[i]<lastlow && zzHigh[i]==0.0)
              {
               szz[lastlowpos].pos=0.0;
               lastlowpos=i;
               lastlow=zzLow[i];
               szz[i].price=lastlow;
               szz[i].pos=i;
             }
            if(zzHigh[i]!=0.0 && zzLow[i]==0.0)
              {
               lasthigh=zzHigh[i];
               lasthighpos=i;
               szz[i].price=lasthigh;
               szz[i].pos=i;
               whatlookfor=-1;
              }
            break;
         case -1:
            if(zzHigh[i]!=0.0 && zzHigh[i]>lasthigh && zzLow[i]==0.0)
              {
               szz[lasthighpos].pos=0.0;
               lasthighpos=i;
               lasthigh=zzHigh[i];
               szz[i].price=lasthigh;
               szz[i].pos=i;
              }
            if(zzLow[i]!=0.0 && zzHigh[i]==0.0)
              {
               lastlow=zzLow[i];
               lastlowpos=i;
               szz[i].price=lastlow;
               szz[i].pos=i;
               whatlookfor=1;
              }
            break;
        }
     }
   //--- rebuild and draw
   int k=0;
   for(i=0; i<bars; i++)
     {
      if(szz[i].pos!=0.0)
        {
         szz[k].price=szz[i].price;
         szz[k].pos=szz[i].pos;
         if(k>0 && szz[k-1].pos!=0.0)
           {
            PlotTL((string)k,Time[szz[k-1].pos],Time[szz[k].pos],szz[k-1].price,szz[k].price,clrRed,1);
           }
         k++;
        }
     }
   return;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct STRUCT_CLEAR
  {
   double hh;
   double ll;
   double hl;
   double lh;
   double price;
   int state;
  };
//+------------------------------------------------------------------+
//| ClearState                                                       |
//+------------------------------------------------------------------+
int ClearState(string sym,
               int tf,
               int sh,
               STRUCT_CLEAR &array)
  {
   double high=iHigh(sym,tf,sh);
   double low=iLow(sym,tf,sh);
   if(array.state!=-1)
     {
      array.hh=MathMax(high,array.hh);
      array.hl=MathMax(low,array.hl);
      if(high<array.hl) // down swing
        {
         array.state=-1;
         array.ll=low;
         array.lh=high;
        }
     }
   else if(array.state!=1)
     {
      array.ll=MathMin(low,array.ll);
      array.lh=MathMin(high,array.lh);
      if(low>array.lh) // up swing
        {
         array.state=1;
         array.hh=high;
         array.hl=low;
        }
     }
   if(array.state==-1) array.price=array.lh;
   else                array.price=array.hl;
   return(array.state);
  }
//--------------------------------------------------------------------
//| IsNewBar                                                         |
//--------------------------------------------------------------------
bool IsNewBar(int tf,
              datetime &dt)
  {
   datetime now=iTime(NULL,tf,0);
   if(now==dt) return(false);
   dt=now;
   return(true);
  }
//+------------------------------------------------------------------+
//| CalcAvg                                                          |
//+------------------------------------------------------------------+
double CalcAvg(double &arr_val[],
               int sh,
               int per)
  {
   double sum=0;
   for(int i=sh; i<sh+per; i++)
      sum+=arr_val[i];
   if(sum>0) sum/=per;
   return(sum);
  }
//+------------------------------------------------------------------+
//| VolumeAvg                                                        |
//+------------------------------------------------------------------+
long VolumeAvg(int sh,
               int per,
               int tf=0,
               const string sym=NULL)
  {
   long sum=1;
   for(int i=sh; i<sh+per; i++)
      sum+=iVolume(sym,tf,i);
   return((sum/per)-1);
}
//+------------------------------------------------------------------+
//| SMAOnArray                                                       |
//+------------------------------------------------------------------+
double SMAOnArray(double &array[],
                  int per,
                  int pos)
  {
   double sum=0;
   for(int i=0; i<per; i++)
      sum+=array[pos+i];
   return(sum/per);
  }
//+------------------------------------------------------------------+
//| LWMAOnArray                                                      |
//+------------------------------------------------------------------+
double LWMAOnArray(double &array[],
                   int per,
                   int pos)
  {
   double sum=0;
   double weight=0;
   for (int i=0; i<per; i++)
     {
      weight+=(per-i);
      sum+=array[pos+i]*(per-i);
     }
   if(weight>0)
      return(sum/weight);
   return(0);
  }
//+------------------------------------------------------------------+
//| Session                                                          |
//+------------------------------------------------------------------+
double Session(datetime dt)
  {
   int ds=TimeDaylightSavings()? -1:0;
   int asia_start=0;
   int asia_stop=9;
   int euro_start=8+ds;
   int euro_stop=17+ds;
   int us_start=13+ds;
   int us_stop=22+ds;
   double session=0;
   if(TimeHour(dt)>=asia_start || (asia_start>asia_stop && TimeHour(dt)<asia_stop))
     {
      session=1;
     }
   if(TimeHour(dt)>=euro_start || (euro_start>euro_stop && TimeHour(dt)<euro_stop))
     {
      if(session>0) session=1.5;
      else          session=2;
     }
   //if((TimeHour(dt)>=us_start && TimeHour(dt)>euro_stop) || (us_start>us_stop && TimeHour(dt)<=us_stop))
   if(TimeHour(dt)>=us_start || (us_start>us_stop && TimeHour(dt)<us_stop))
     {
      if(session>0) session=2.5;
      else          session=3;
     }
   return(NormalizeDouble(session,1));
  }
//+------------------------------------------------------------------+
//| SessionAverageVolume                                             |
//+------------------------------------------------------------------+
long SessionAverageVolume(int sh,
                          int per,
                          int bars)
  {
   long sum=1;
   int i=sh,c=0;
   while(c<per)
     {
      if(Session(iTime(NULL,Period(),i))==Session(iTime(NULL,Period(),sh)))
        {
         sum+=iVolume(NULL,Period(),i);
         c++;
        }
      i++;
      if(i>2*bars)
         break;
   }
   return((sum/per)-1);
}
//+------------------------------------------------------------------+
//| LevelDistance                                                    |
//+------------------------------------------------------------------+
double LevelDistance(string sym,
                     double price,
                     int roundnumber)
  {
   double levels[2],level=0,distance=999999;
   double pt=MarketInfo(sym,MODE_POINT);
   ArrayInitialize(levels,0);
   int rn=(int)(price/pt);
   rn=rn-rn%roundnumber;
   for(int i=0; i<2; i++)
     {
      int tmp=rn+(i*roundnumber);
      levels[i]=tmp*pt;
      if(MathAbs(price-levels[i])<distance)
        {
         distance=MathAbs(price-levels[i]);
         level=levels[i];
        }
     }
   if(level>=price) return(distance);
   else return(0-distance);
  }
//+------------------------------------------------------------------+
//| NearestLevel                                                     |
//+------------------------------------------------------------------+
double NearestLevel(string sym,
                    double price,
                    int roundnumber)
  {
   double levels[2],level=0,distance=999999;
   double pt=MarketInfo(sym,MODE_POINT);
   ArrayInitialize(levels,0);
   int rn=(int)(price/pt);
   rn=rn-rn%roundnumber;
   for(int i=0; i<2; i++)
     {
      int tmp=rn+(i*roundnumber);
      levels[i]=tmp*pt;
      if(MathAbs(price-levels[i])<distance)
        {
         distance=MathAbs(price-levels[i]);
         level=levels[i];
        }
     }
   return(level);
  }
//+------------------------------------------------------------------+
//| DailyPivotDistance                                               |
//+------------------------------------------------------------------+
double DailyPivotDistance(string sym,
                          double price)
  {
   double pivots[7],pivot=0,distance=9999999;
   int shift=1;
   ArrayInitialize(pivots,0);
   datetime d1=iTime(sym,PERIOD_D1,shift);
   while(TimeDayOfWeek(d1)==0||TimeDayOfWeek(d1)==6)
     {
      shift+=1;
      d1=iTime(sym,PERIOD_D1,shift);
     }
   double yhigh=iHigh(sym,PERIOD_D1,shift);
   double ylow=iLow(sym,PERIOD_D1,shift);
   double yopen=iOpen(sym,PERIOD_D1,shift);
   double yclose=iClose(sym,PERIOD_D1,shift);
   double yrange=yhigh-ylow;
   pivots[0]=(yhigh+ylow+yclose)/3;
   pivots[1]=pivots[0]+(yrange*1.000);
   pivots[2]=pivots[0]+(yrange*0.618);
   pivots[3]=pivots[0]+(yrange*0.382);
   pivots[4]=pivots[0]-(yrange*0.382);
   pivots[5]=pivots[0]-(yrange*0.618);
   pivots[6]=pivots[0]-(yrange*1.000);
   for(int i=0;i<7;i++)
     {
      if(MathAbs(price-pivots[i])<distance)
        {
         distance=MathAbs(price-pivots[i]);
         pivot=pivots[i];
        }
     }
   if(pivot>=price) return(distance);
   else return(0-distance);
}
//+------------------------------------------------------------------+
//| WeeklyPivotDistance                                              |
//+------------------------------------------------------------------+
double WeeklyPivotDistance(string sym,
                           double price)
  {
   double pivots[7],pivot=0,distance=9999999;
   ArrayInitialize(pivots,0);
   double whigh=iHigh(sym,PERIOD_W1,1);
   double wlow=iLow(sym,PERIOD_W1,1);
   double wopen=iOpen(sym,PERIOD_W1,1);
   double wclose=iClose(sym,PERIOD_W1,1);
   double wrange=whigh-wlow;
   pivots[0]=(whigh+wlow+wclose)/3;
   pivots[1]=pivots[0]+(wrange*1.000);
   pivots[2]=pivots[0]+(wrange*0.618);
   pivots[3]=pivots[0]+(wrange*0.382);
   pivots[4]=pivots[0]-(wrange*0.382);
   pivots[5]=pivots[0]-(wrange*0.618);
   pivots[6]=pivots[0]-(wrange*1.000);
   for(int i=0;i<7;i++)
     {
      if(MathAbs(price-pivots[i])<distance)
        {
         distance=MathAbs(price-pivots[i]);
         pivot=pivots[i];
        }
     }
   if(pivot>=price) return(distance);
   else return(0-distance);
}
//--------------------------------------------------------------------
//| VolOsc                                                           |
//--------------------------------------------------------------------
int VolOsc(string sym,
           int per=13,
           int ob=40)
  {
   double vol_[];
   ArrayResize(vol_,per);
   ArrayInitialize(vol_,0);
   ArraySetAsSeries(vol_,false);

   double val=2.0/(1.0+per);
   double tv=0.0;
   double vp=0.0;
   for(int i=per-1; i>=0; i--)
     {
      double close0=iClose(sym,0,i);
      double close1=iClose(sym,0,i+1);
      double vol=(double)iVolume(sym,0,i);
      double v=0;
      if(close0<close1) v=-vol;
      else if(close0>close1) v=vol;
      if(i==per-1)
        {
         vp=v;
         tv=vol;
        }
      else
        {
         vp=val*v+(1-val)*vp;
         tv=val*vol+(1-val)*tv;
        }
      vol_[i]=100*vp/tv;
     }
   if(vol_[1]>ob) return(1);
   if(vol_[1]<0-ob) return(-1);
   return(0);
  }
//+------------------------------------------------------------------+
//| SaveFractal                                                      |
//+------------------------------------------------------------------+
void SaveFractal(string sym,
                 int tf,
                 int start,
                 int legs,
                 int lookback,
                 int &arr_hi[],
                 int &arr_lo[])
  {
   int limit=MathMin(iBars(sym,tf),lookback);
   ArrayResize(arr_hi,0);
   ArrayResize(arr_lo,0);
   ArrayInitialize(arr_hi,0);
   ArrayInitialize(arr_lo,0);
   for(int i=start; i<limit; i++)
     {
      if(iHighest(sym,0,MODE_HIGH,(legs*2)+1,i-legs)==i)
        {
         int s=ArraySize(arr_hi);
         ArrayResize(arr_hi,s+1);
         arr_hi[s]=i;
        }
      if(iLowest(sym,0,MODE_LOW,(legs*2)+1,i-legs)==i)
        {
         int s=ArraySize(arr_lo);
         ArrayResize(arr_lo,s+1);
         arr_lo[s]=i;
        }
     }
  }
//+------------------------------------------------------------------+
//| SaveFractals                                                     |
//+------------------------------------------------------------------+
void SaveFractals(string sym,
                  int legs,
                  int lookback,
                  double &arr_hi[],
                  double &arr_lo[])
  {
   int limit=MathMin(Bars,lookback);
   ArrayResize(arr_hi,lookback);
   ArrayResize(arr_lo,lookback);
   ArrayInitialize(arr_hi,0);
   ArrayInitialize(arr_lo,0);
   for(int i=0; i<limit; i++)
     {
      if(iHighest(sym,0,MODE_HIGH,(legs*2)+1,i-legs)==i) arr_hi[i]=NormalizeDouble(iHigh(sym,0,i),(int)MarketInfo(sym,MODE_DIGITS));
      if(iLowest(sym,0,MODE_LOW,(legs*2)+1,i-legs)==i) arr_lo[i]=NormalizeDouble(iLow(sym,0,i),(int)MarketInfo(sym,MODE_DIGITS));
     }
  }

//--------------------------------------------------------------------
//| CheckBreaks                                                      |
//--------------------------------------------------------------------
bool CheckPriceBreaks(string sym,
                      int tf,
                      double price,
                      double dev,
                      int from,
                      int to)
  {
   double pt=MarketInfo(sym,MODE_POINT);
   int resist=0,support=0;
   int crossup=0,crossdn=0;
   for(int i=from; i<to; i++)
     {
      double high=iHigh(sym,tf,i);
      double low=iLow(sym,tf,i);
      double open=iOpen(sym,tf,i);
      double close=iClose(sym,tf,i);
      if(MathAbs(high-price)<dev*pt) resist++;
      if(MathAbs(low-price)<dev*pt) support++;
      if(high>price && low<price)
        {
         if(open>close) crossdn++;
         else crossup++;
        }
     }
   if((support+resist)>(crossdn+crossup))
      return(true);
   return(false);
  }
//+------------------------------------------------------------------+
//| GetTrend                                                         |
//+------------------------------------------------------------------+
double GetTrend(string sym,
                int tf,
                int per,
                int mode=MODE_SMA,
                bool value=false,
                int offset=0)
  {
   int i=0;
   int p=(int)MathSqrt(per);
   int e=per*3;
   double vec_[];
   double dir_[];
   double buf_[];
   ArrayResize(vec_,e);
   ArrayResize(dir_,e);
   ArrayResize(buf_,e);
   ArraySetAsSeries(vec_,true);
   ArraySetAsSeries(dir_,true);
   ArraySetAsSeries(buf_,true);
   for(i=0; i<e; i++)
     {
      double wma1=iMA(sym,tf,per,0,MODE_LWMA,PRICE_CLOSE,i);
      double wma2=2*iMA(sym,tf,per/2,0,MODE_LWMA,PRICE_CLOSE,i);
      vec_[i]=NormalizeDouble(wma2-wma1,(int)MarketInfo(sym,MODE_DIGITS));
     }
   for(i=0; i<e-per; i++)
      buf_[i]=NormalizeDouble(iMAOnArray(vec_,0,p,0,mode,i),(int)MarketInfo(sym,MODE_DIGITS));
   for(i=e-per; i>=0; i--)
     {
      dir_[i]=dir_[i+1];
      if(buf_[i]>buf_[i+1]) dir_[i]=1;
      if(buf_[i]<buf_[i+1]) dir_[i]=-1;
      if(buf_[i]==buf_[i+1]) dir_[i]=0;
     }
   return((value? buf_[i+1+offset] : dir_[i+1+offset]));
  }
//+------------------------------------------------------------------+
//| NanningTrend                                                     |
//+------------------------------------------------------------------+
int NanningTrend(int sh,
                 int tf=1440,
                 const string sym=NULL)
  {
   double fast=iMA(sym,tf,9,2,MODE_EMA,PRICE_MEDIAN,sh);
   double slow=iMA(sym,tf,18,2,MODE_EMA,PRICE_MEDIAN,sh);
   if(iHigh(sym,tf,sh)>fast && iHigh(sym,tf,sh)>slow && iLow(sym,tf,sh)>fast && iLow(sym,tf,sh)>slow) return(1);
   if(iHigh(sym,tf,sh)<fast && iHigh(sym,tf,sh)<slow && iLow(sym,tf,sh)<fast && iLow(sym,tf,sh)<slow) return(-1);
   return(0);
  }





//--------------------------------------------------------------------
//| CANDCLES                                                         |
//--------------------------------------------------------------------
//+------------------------------------------------------------------+
//| GetFractalHi                                                     |
//+------------------------------------------------------------------+
int GetFractalHi(int sh,
                 int per,
                 int tf=0,
                 const string sym=NULL)
  {
   for(int i=sh; i<iBars(sym,tf)-per; i++)
     {
      if(iHighest(sym,tf,MODE_HIGH,(per*2)+1,i-per)==i)
         return(i);
     }
   return(-1);
  }
//+------------------------------------------------------------------+
//| GetFractalLo                                                     |
//+------------------------------------------------------------------+
int GetFractalLo(int sh,
                 int per,
                 int tf=0,
                 const string sym=NULL)
  {
   for(int i=sh; i<iBars(sym,tf)-per; i++)
     {
      if(iLowest(sym,tf,MODE_LOW,(per*2)+1,i-per)==i)
         return(i);
     }
   return(-1);
  }
//+------------------------------------------------------------------+
//| GetFractalHi                                                     |
//+------------------------------------------------------------------+
bool IsFractalHi(int sh,
                 int per,
                 int tf=0,
                 const string sym=NULL)
  {
   if(iHighest(sym,tf,MODE_HIGH,(per*2)+1,sh-per)==sh)
      return(true);
   return(false);
  }
//+------------------------------------------------------------------+
//| IsFractalLo                                                      |
//+------------------------------------------------------------------+
bool IsFractalLo(int sh,
                 int per,
                 int tf=0,
                 const string sym=NULL)
  {
   if(iLowest(sym,tf,MODE_LOW,(per*2)+1,sh-per)==sh)
      return(true);
   return(false);
  }
//+------------------------------------------------------------------+
//| iBody                                                            |
//+------------------------------------------------------------------+
double iBody(int sh,
             int tf=0,
             const string sym=NULL)
  {
   double open=iOpen(sym,tf,sh);
   double close=iClose(sym,tf,sh);
   return(MathMax(open,close)-(MathMin(open,close)));
  }
//+------------------------------------------------------------------+
//| iRange                                                           |
//+------------------------------------------------------------------+
double iRange(int sh,
              int tf=0,
              const string sym=NULL)
  {
   double high=iHigh(sym,tf,sh);
   double low=iLow(sym,tf,sh);
   return(high-low);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double iBodyLow(int sh,
                int tf=0,
                const string sym=NULL)
  {
   double open=iOpen(sym,tf,sh);
   double close=iClose(sym,tf,sh);
   return(MathMin(open,close));
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double iBodyHigh(int sh,
                 int tf=0,
                 const string sym=NULL)
  {
   double open=iOpen(sym,tf,sh);
   double close=iClose(sym,tf,sh);
   return(MathMax(open,close));
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool IsPinBuy(int sh,
              int tf=0,
              const string sym=NULL)
  {
   double open1=iOpen(sym,tf,sh+1);
   double open2=iOpen(sym,tf,sh+2);
   double open3=iOpen(sym,tf,sh+3);
   double close1=iClose(sym,tf,sh+1);
   double close2=iClose(sym,tf,sh+2);
   double close3=iClose(sym,tf,sh+3);
   if((iBody(sh+3)>iBody(sh+2)) && // Star body smaller than the previous one
      (iBody(sh+1)>iBody(sh+2)) && // Body of star smaller than bodies of first and last candles
      (close3<open3) && // First is a down candle
      (close1>open1) && // Third is an up candle
      (close1>(iBodyLow(sh+3)+iBody(sh+3)*0.5))) // The third candle closes above the midpoint of the first candle
      return(true);
   return(false);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool IsPinSell(int sh,
               int tf=0,
               const string sym=NULL)
  {
   double open1=iOpen(sym,tf,sh+1);
   double open3=iOpen(sym,tf,sh+3);
   double close1=iClose(sym,tf,sh+1);
   double close3=iClose(sym,tf,sh+3);
   if((iBody(sh+3)>iBody(sh+2)) && // Star iBody smaller than the previous one
      (iBody(sh+1)>iBody(sh+2)) && // iBody of star smaller than bodies of first and last candles
      (close3>open3) && // First is an up candle
      (close1<open1) && // Third is a down candle
      (close1<(iBodyHigh(sh+3)-iBody(sh+3)*0.5))) // The third candle closes below the midpoint of the first candle
      return(true);
   return(false);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool IsEngulfBuy(int sh,
                 int tf=0,
                 const string sym=NULL)
  {
   double open1=iOpen(sym,tf,sh);
   double open2=iOpen(sym,tf,sh+1);
   double close1=iClose(sym,tf,sh);
   double close2=iClose(sym,tf,sh+1);
   if((close2<open2) && // First is a down candle
      (close1>open1) && // Second is an up candle
      (iBody(sh+1)<iBody(sh))) // First engulfed by second
      return(true);
   return(false);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool IsEngulfSell(int sh,
                  int tf=0,
                  const string sym=NULL)
  {
   double open1=iOpen(sym,tf,sh);
   double open2=iOpen(sym,tf,sh+1);
   double close1=iClose(sym,tf,sh);
   double close2=iClose(sym,tf,sh+1);
   if((close2>open2) && // First is an up candle
      (close1<open1) && // Second is a down candle
      (iBody(sh+1)<iBody(sh))) // First engulfed by second
      return(true);
   return(false);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool IsBull(int sh,
            int tf=0,
            const string sym=NULL)
  {
   double open=iOpen(sym,tf,sh);
   double close=iClose(sym,tf,sh);
   if(close>open)
      return(true);
   return(false);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool IsBear(int sh,
            int tf=0,
            const string sym=NULL)
  {
   double open=iOpen(sym,tf,sh);
   double close=iClose(sym,tf,sh);
   if(close<open)
      return(true);
   return(false);
  }
