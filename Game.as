package
{
   import com.adobe.serialization.json.JSON;
   import fl.motion.*;
   import flash.display.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import it.gotoandplay.smartfoxserver.*;
   import liteAssets.draw.*;
   import liteAssets.handlers.*;
   
   public class Game extends MovieClip
   {
      
      public static var root:Game;
      
      public static var serverName:String;
      
      public static var objLogin:Object;
      
      public static var mcUpgradeWindow:MovieClip;
      
      public static var mcACWindow:MovieClip;
      
      public static var strToken:String;
      
      public static var ISWEB:Boolean = true;
      
      public static var serverPort:int = 5588;
      
      public static var serverIP:String = "";
      
      public static var serverGamePath:String = "";
      
      public static var serverFilePath:String = "";
      
      public static var serverURL:String = "";
      
      public static var cLoginZone:String = "zone_master";
      
      public static var clientToken:String = "SPIDER#0001";
      
      public static var bPTR:Boolean = false;
      
      public static var loginInfo:Object = {};
      
      public static const ASSETS_LOADED:String = "main_assets_loaded";
      
      public static var ASSETS_READY:String = "";
      
      public static const FB_APP_NAME:String = "AQW";
      
      public static const FB_APP_URL:String = "www.aq.com";
      
      public static const FB_APP_ID:String = "51356733862";
      
      public static const FB_APP_SEC:String = "This should never be stored in the client";
      
      MovieClip.prototype.removeAllChildren = function():void
      {
         var _loc1_:* = this.numChildren - 1;
         while(_loc1_ >= 0)
         {
            this.removeChildAt(_loc1_);
            _loc1_--;
         }
      };
      
      public var MsgBox:MovieClip;
      
      public var mcAccount:MovieClip;
      
      public var ctr_watermark:MovieClip;
      
      public var mcExtSWF:MovieClip;
      
      public var ui:MovieClip;
      
      public var mcLogin:MovieClip;
      
      public var loader:*;
      
      public var csLoader:URLLoader;
      
      public var csbLoaded:Number;
      
      public var csbTotal:Number;
      
      public var clientVersion:Number = 3.01;
      
      public var sToken:String;
      
      public var world:World;
      
      public var bagSpace:String = "interface/spiderbagr2.swf";
      
      public var iMaxBagSlots:* = 400;
      
      public var iMaxBankSlots:* = 450;
      
      public var iMaxHouseSlots:* = 250;
      
      public var iMaxFriends:* = 225;
      
      public var iMaxLoadoutSlots:* = 20;
      
      private var swfObj:String = "AQWGame";
      
      public var showFB:Boolean = false;
      
      public var fbL:fbLinkWindow;
      
      public var titleDomain:ApplicationDomain;
      
      public var mcO:MovieClip;
      
      public var elmType:String;
      
      public var handleSessionEvent:Function;
      
      public var sfc:SmartFoxClient;
      
      public var chatF:*;
      
      public var sFilePath:String = "";
      
      public var userPreference:SharedObject;
      
      public var litePreference:SharedObject;
      
      public var objServerInfo:Object;
      
      public var sfcSocial:Boolean = false;
      
      public var ldrMC:LoaderMC;
      
      public var mcConnDetail:ConnDetailMC;
      
      public var querystring:Object;
      
      public var ts_login_server:Number;
      
      public var ts_login_client:Number;
      
      public var aaaloop:int = 0;
      
      public var totalPingTime:Number = 0;
      
      public var pingCount:int = 0;
      
      public var arrRanks:Array;
      
      public var iRankMax:int = 10;
      
      public var arrHP:Array;
      
      private var aswc:Apop;
      
      public var hasPreviewed:Boolean;
      
      public var intLevelCap:int;
      
      public var PCstBase:int;
      
      public var PCstRatio:Number;
      
      public var PCstGoal:int;
      
      public var GstBase:int;
      
      public var GstRatio:Number;
      
      public var GstGoal:int;
      
      public var PChpBase1:int;
      
      public var PChpBase100:int;
      
      public var PChpGoal1:int;
      
      public var PChpGoal100:int;
      
      public var PChpDelta:int;
      
      public var intHPperEND:int;
      
      public var intAPtoDPS:int;
      
      public var intSPtoDPS:int;
      
      public var bigNumberBase:int;
      
      public var resistRating:Number;
      
      public var modRating:Number;
      
      public var baseDodge:Number;
      
      public var baseBlock:Number;
      
      public var baseParry:Number;
      
      public var baseCrit:Number;
      
      public var baseHit:Number;
      
      public var baseHaste:Number;
      
      public var baseMiss:Number;
      
      public var baseResist:Number;
      
      public var baseCritValue:Number;
      
      public var baseBlockValue:Number;
      
      public var baseResistValue:Number;
      
      public var baseEventValue:Number;
      
      public var PCDPSMod:Number = 0.85;
      
      public var curveExponent:Number = 0.66;
      
      public var statsExponent:Number = 1.33;
      
      public var stats:Array;
      
      public var orderedStats:Array;
      
      public var ratiosBySlot:Object;
      
      public var I0pct:Number = 0.8;
      
      public var I2pct:Number = 1.25;
      
      public var classCatMap:Object;
      
      private var coreValues:Object;
      
      private var travelMapData:Object;
      
      private var WorldMapData:worldMap;
      
      private var skipR2:Boolean = false;
      
      private var apop_:apopCore;
      
      public var apopTree:Object;
      
      public var curID:String;
      
      public var serialCmdMode:Boolean = false;
      
      public var serialCmd:Object;
      
      private var conn:*;
      
      public var confirmTime:int = 0;
      
      public var quests:Boolean = false;
      
      public var bits:Array;
      
      private var fbc:MovieClip;
      
      public var mcGameMenu:MovieClip;
      
      public var firstMenu:Boolean = true;
      
      public var bPassword:Boolean = true;
      
      public var pDash:Boolean;
      
      internal var cancelTargetTimer:Timer;
      
      public var keyDict:Dictionary;
      
      private var travelLoaderMC:*;
      
      public var TRAVEL_DATA_READY:Boolean = false;
      
      private var bLoaded:Number = 0;
      
      private var bTotal:Number = 0;
      
      private var weakPass:Array;
      
      public var extCall:ExternalCalls;
      
      public var FBConnectCallback:Function;
      
      public var sBG:String = "generic2.swf";
      
      public var IsEU:Boolean = false;
      
      public var TempLoginName:* = "";
      
      public var TempLoginPass:* = "";
      
      public var mtcidNow:Number;
      
      public var intChatMode:int;
      
      public var serverPath:String;
      
      public var playerPollData:Object;
      
      private var characters:SharedObject;
      
      public var csShowServers:Boolean = false;
      
      public var mcCharSelect:*;
      
      internal var interfaceQueue:Array;
      
      internal var visualLoader:*;
      
      public var interfaceRef:Object;
      
      internal var interfaceLoaded:Number = 0;
      
      internal var interfaceTotal:Number = 0;
      
      public var newInstance:Boolean = false;
      
      public var BOOK_DATA_READY:* = null;
      
      public var bolLoader:Loader;
      
      public var bolContent:MovieClip;
      
      public var equipPotionOnSeia:Boolean;
      
      public var lastPing:Number = 0;
      
      public var lastPingTime:uint = 0;
      
      public var lastPingValues:Array;
      
      public var bankFiltersMC:bankFilters;
      
      public var pLoggerUI:packetlogger;
      
      public var cMenuUI:cellMenu;
      
      public var cDropsUI:customDrops;
      
      public var pAurasUI:playerAuras;
      
      public var tAurasUI:targetAuras;
      
      public var bAnalyzer:battleAnalyzer;
      
      public var cameraToolMC:cameraTool;
      
      internal var petDisable:Timer;
      
      public var portraitsCnt:Array;
      
      public var pinnedQuests:String;
      
      internal var disableTimer:Timer;
      
      public var regExLineSpace:RegExp;
      
      public var showServers:Boolean = false;
      
      public var baseClassStats:Object;
      
      private var statsNewClass:Boolean = false;
      
      private var mcStatsPanel:MovieClip;
      
      public var cVersion:String;
      
      public var failedServers:*;
      
      private var rn:RandomNumber;
      
      public var assetsDomain:ApplicationDomain;
      
      public var assetsContext:LoaderContext;
      
      public var interfaceDomain:ApplicationDomain;
      
      public var interfaceContext:LoaderContext;
      
      public const EMAIL_REGEX:RegExp;
      
      public var mixer:SoundFX;
      
      public var params:Object;
      
      public var uoPref:Object;
      
      public var litePref:Array;
      
      public var loginLoader:URLLoader;
      
      public var ctrlTrade:MovieClip;
      
      public var tradeItem1:MovieClip;
      
      public var tradeItem2:MovieClip;
      
      public var tradeItem3:MovieClip;
      
      public var auctionItem1:MovieClip;
      
      public var auctionItem2:MovieClip;
      
      public var auctionItem3:MovieClip;
      
      public var auctionLayout:MovieClip;
      
      public var auctionPanel:MovieClip;
      
      public var auctionTabs:MovieClip;
      
      public function Game()
      {
         /*
          * Error de decompilación
          * Tiempo de espera (1 minuto) alcanzado
          * Instruction count: 1138
          */
         throw new flash.errors.IllegalOperationError("No decompilado debido al tiempo de espera");
      }
      
      public static function gTrace(param1:*) : *
      {
         if(Game.ISWEB)
         {
            if(!ExternalInterface.available)
            {
               return;
            }
            ExternalInterface.call("console.log",param1);
         }
      }
      
      public static function trim(param1:String) : String
      {
         if(param1 == null)
         {
            return "";
         }
         return param1.replace(/^\s+|\s+$/g,"");
      }
      
      public static function XMLtoObject(param1:XML) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = {};
         for(_loc2_ in param1.attributes())
         {
            _loc5_[String(param1.attributes()[_loc2_].name())] = String(param1.attributes()[_loc2_]);
         }
         for(_loc3_ in param1.children())
         {
            _loc4_ = param1.children()[_loc3_].name();
            if(_loc5_[_loc4_] == undefined)
            {
               _loc5_[_loc4_] = [];
            }
            _loc5_[_loc4_].push(XMLtoObject(param1.children()[_loc3_]));
         }
         return _loc5_;
      }
      
      public static function convertXMLtoObject(param1:XML) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:XML = null;
         var _loc5_:* = undefined;
         var _loc6_:* = {};
         for(_loc2_ in param1.attributes())
         {
            _loc6_[String(param1.attributes()[_loc2_].name())] = String(param1.attributes()[_loc2_]);
         }
         for(_loc3_ in param1.children())
         {
            _loc4_ = param1.children()[_loc3_];
            if(_loc4_.nodeKind() == "text")
            {
               if(_loc4_ == parseFloat(_loc4_).toString())
               {
                  return parseFloat(_loc4_);
               }
               return _loc4_;
            }
            if(_loc4_.nodeKind() == "element")
            {
               _loc5_ = param1.children()[_loc3_].name();
               if(_loc6_[_loc5_] == null)
               {
                  _loc6_[_loc5_] = convertXMLtoObject(param1.children()[_loc3_]);
               }
               else
               {
                  if(!(_loc6_[_loc5_] is Array))
                  {
                     _loc6_[_loc5_] = [_loc6_[_loc5_]];
                  }
                  _loc6_[_loc5_].push(convertXMLtoObject(param1.children()[_loc3_]));
               }
            }
         }
         return _loc6_;
      }
      
      private static function makeGrayscale(param1:DisplayObject, param2:int = 0, param3:Number = 0.33) : void
      {
         var _loc4_:Color = null;
         if(param1 == null)
         {
            return;
         }
         var _loc5_:Array = [param3,param3,param3,0,0,param3,param3,param3,0,0,param3,param3,param3,0,0,param3,param3,param3,1,0];
         var _loc6_:ColorMatrixFilter = new ColorMatrixFilter(_loc5_);
         param1.filters = [_loc6_];
         if(param2 != 0)
         {
            _loc4_ = new Color();
            _loc4_.brightness = -(param2 / 100);
            param1.transform.colorTransform = _loc4_;
         }
      }
      
      public function onRemoveChildrens(param1:MovieClip) : *
      {
         var _loc2_:* = undefined;
         _loc2_ = param1.numChildren - 1;
         while(_loc2_ >= 0)
         {
            param1.removeChildAt(_loc2_);
            _loc2_--;
         }
      }
      
      public function onLoadMaster(param1:Function, param2:LoaderContext, param3:String, param4:Function = null, param5:Function = null) : Function
      {
         var _loc6_:URLLoader = null;
         _loc6_ = new URLLoader(new URLRequest(getFilePath() + param3));
         _loc6_.dataFormat = URLLoaderDataFormat.BINARY;
         if(param1 != null)
         {
            _loc6_.addEventListener(Event.COMPLETE,this.onLoadToBytes(param1,param2));
         }
         if(param4 != null)
         {
            _loc6_.addEventListener(ProgressEvent.PROGRESS,param4);
         }
         if(param5 != null)
         {
            _loc6_.addEventListener(IOErrorEvent.IO_ERROR,param5);
         }
      }
      
      public function onLoadToBytes(param1:Function, param2:LoaderContext) : Function
      {
         var onComplete:Function = param1;
         var context:LoaderContext = param2;
         return function(param1:Event):void
         {
            var _loc2_:* = undefined;
            var _loc3_:* = undefined;
            _loc2_ = URLLoader(param1.target).data as ByteArray;
            _loc3_ = new Loader();
            _loc3_.contentLoaderInfo.addEventListener(Event.COMPLETE,onComplete);
            _loc3_.loadBytes(_loc2_,context);
         };
      }
      
      public function loadAccountCreation(param1:String) : *
      {
         var _loc2_:Loader = null;
         mcAccount.removeChildAt(0);
         _loc2_ = new Loader();
         _loc2_.load(new URLRequest(Game.serverFilePath + param1),new LoaderContext(false,new ApplicationDomain(null)));
         mcAccount.addChild(_loc2_);
      }
      
      public function onCSComplete(param1:Event) : void
      {
         mcCharSelect = param1.currentTarget.content;
         this.addChildAt(mcCharSelect,1);
      }
      
      public function onCSProgress(param1:ProgressEvent) : void
      {
         var _loc2_:int = 0;
         csbLoaded = param1.bytesLoaded;
         csbTotal = param1.bytesTotal;
         _loc2_ = int(csbLoaded / csbTotal * 100);
         var _loc3_:Number = csbLoaded / csbTotal;
         loader.mcPct.text = _loc2_ + "%";
         if(csbLoaded >= csbTotal)
         {
            loader.parent.removeChild(loader);
            loader = null;
         }
      }
      
      public function onCSError(param1:IOErrorEvent) : void
      {
         if(loader)
         {
            loader.parent.removeChild(loader);
            loader = null;
         }
         gotoAndPlay("Login");
      }
      
      public function monsterTreeWrite(param1:int, param2:Object, param3:* = null) : void
      {
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:* = undefined;
         var _loc7_:Avatar = null;
         var _loc8_:Avatar = null;
         var _loc9_:Avatar = null;
         var _loc10_:Avatar = null;
         var _loc11_:MovieClip = null;
         var _loc12_:int = 0;
         var _loc13_:String = null;
         var _loc14_:int = 0;
         var _loc15_:String = null;
         var _loc16_:* = undefined;
         var _loc17_:* = undefined;
         var _loc18_:int = 0;
         var _loc19_:* = undefined;
         var _loc20_:Object = null;
         var _loc21_:Object = null;
         trace("MONSTER TREE WRITE");
         _loc19_ = "";
         _loc20_ = {};
         _loc21_ = world.monTree[param1];
         if(_loc21_ != null)
         {
            _loc12_ = -1;
            if(_loc21_ != null && _loc21_.intState != null)
            {
               _loc12_ = int(_loc21_.intState);
            }
            for(_loc13_ in param2)
            {
               _loc5_ = _loc13_;
               _loc6_ = param2[_loc13_];
               _loc20_[_loc5_] = _loc6_;
               if(_loc5_.toLowerCase().indexOf("int") > -1)
               {
                  _loc6_ = Number(_loc6_);
               }
               if(_loc5_ == "react")
               {
                  _loc6_ = _loc6_.split(",");
                  _loc14_ = 0;
                  while(_loc14_ < _loc6_.length)
                  {
                     _loc6_[_loc14_] = Number(_loc6_[_loc14_]);
                     _loc14_++;
                  }
               }
               _loc21_[_loc5_] = _loc6_;
            }
            _loc19_ = "";
            for(_loc19_ in _loc20_)
            {
               _loc5_ = _loc19_;
               _loc6_ = _loc20_[_loc19_];
               if(_loc5_.toLowerCase().indexOf("evt:") < 0)
               {
                  _loc9_ = world.getMonster(param1);
                  if(_loc9_ != null)
                  {
                     if(_loc5_.toLowerCase().indexOf("hp") > -1)
                     {
                        if(_loc9_ != null && _loc9_.objData != null)
                        {
                           _loc6_ = Number(_loc6_);
                           _loc9_.objData[_loc19_] = _loc6_;
                           if(world.myAvatar.target == _loc9_)
                           {
                              world.updatePortrait(_loc9_);
                           }
                           if(world.objLock != null && (_loc5_ == "intHP" && _loc6_ <= 0))
                           {
                              ++world.intKillCount;
                              world.updatePadNames();
                           }
                           if(_loc9_.objData != null && Boolean("boolean"))
                           {
                              if(_loc9_.objData.strFrame == world.strFrame)
                              {
                                 if(_loc6_ <= 0)
                                 {
                                    if(Boolean(bAnalyzer) && (param3 || _loc20_["targets"].length > 0))
                                    {
                                       if(bAnalyzer.isRunning())
                                       {
                                          for each(_loc15_ in param3 ? param3 : _loc20_["targets"])
                                          {
                                             if(world.myAvatar.objData.strUsername.toLowerCase() == _loc15_.toLowerCase())
                                             {
                                                bAnalyzer.addKill();
                                             }
                                          }
                                       }
                                    }
                                    if(litePreference.data.bDisSelfMAnim && world.myAvatar.target != null && world.myAvatar.target.dataLeaf.intState == 0)
                                    {
                                       world.cancelTarget();
                                    }
                                    _loc9_.pMC.stopWalking();
                                    world.removeAuraFX(_loc9_.pMC,"all");
                                    _loc9_.pMC.die();
                                    _loc21_.auras = [];
                                    _loc21_.targets = {};
                                    _loc9_.target = null;
                                    if("eventTrigger" in MovieClip(world.map))
                                    {
                                       world.map.eventTrigger({
                                          "cmd":"monDeath",
                                          "args":param1,
                                          "targets":param2.targets
                                       });
                                    }
                                    if(world.myAvatar.dataLeaf.targets[_loc9_.objData.MonMapID] != null)
                                    {
                                       delete world.myAvatar.dataLeaf.targets[_loc9_.objData.MonMapID];
                                    }
                                    if(world.strMapName == "trickortreat" && world.strFrame == "Enter")
                                    {
                                       world.TrickOrTreatMonsterDead = true;
                                       world.loadPlayerNPC();
                                    }
                                    if(world.strMapName == "caroling" && world.strFrame == "Enter")
                                    {
                                       world.CarolingMonsterKillCount += 1;
                                       if(world.CarolingMonsterKillCount >= 5)
                                       {
                                          world.setTarget(null);
                                          world.loadPlayerNPC();
                                       }
                                    }
                                 }
                              }
                           }
                        }
                     }
                     if(_loc5_.toLowerCase().indexOf("state") > -1)
                     {
                        if(_loc9_ != null && _loc9_.objData != null)
                        {
                           _loc6_ = Number(_loc6_);
                           _loc9_.objData[_loc19_] = _loc6_;
                           if(_loc6_ != 2)
                           {
                              _loc9_.dataLeaf.auras = [];
                           }
                           if(_loc9_.objData.strFrame != null && _loc9_.objData.strFrame == world.strFrame)
                           {
                              if(_loc6_ == 1 && _loc9_.pMC != null && (_loc9_.pMC.x != _loc9_.pMC.ox || _loc9_.pMC.y != _loc9_.pMC.oy))
                              {
                                 trace("STATE > WAKTO");
                                 _loc9_.pMC.walkTo(_loc9_.pMC.ox,_loc9_.pMC.oy,world.WALKSPEED);
                              }
                           }
                           if(_loc6_ != 2)
                           {
                              _loc21_.targets = {};
                           }
                        }
                     }
                     if(_loc5_.toLowerCase().indexOf("dx") > -1)
                     {
                        _loc6_ = Number(_loc6_);
                        if(_loc9_.objData != null && _loc9_.objData.strFrame != null && _loc9_.objData.strFrame == world.strFrame)
                        {
                           _loc16_ = int(world.monTree[param1].dx);
                           _loc17_ = int(world.monTree[param1].dy);
                           trace("DX > WAKTO");
                           _loc9_.pMC.walkTo(_loc16_,_loc17_,world.WALKSPEED);
                        }
                     }
                  }
               }
            }
         }
      }
      
      public function userTreeWrite(param1:String, param2:Object) : void
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:* = undefined;
         var _loc6_:Avatar = null;
         var _loc7_:Avatar = null;
         var _loc8_:Avatar = null;
         var _loc9_:Avatar = null;
         var _loc10_:MovieClip = null;
         var _loc11_:String = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:* = undefined;
         var _loc15_:Object = null;
         var _loc16_:Object = null;
         var _loc17_:Object = null;
         _loc14_ = "";
         _loc15_ = {};
         _loc16_ = {};
         _loc17_ = world.uoTree[param1.toLowerCase()];
         _loc9_ = world.getAvatarByUserName(param1);
         for(_loc11_ in param2)
         {
            _loc4_ = _loc11_;
            _loc5_ = param2[_loc11_];
            if(_loc4_.toLowerCase().indexOf("int") > -1 || _loc4_.toLowerCase() == "tx" || _loc4_.toLowerCase() == "ty" || _loc4_.toLowerCase() == "sp" || _loc4_.toLowerCase() == "pvpTeam")
            {
               _loc5_ = int(_loc5_);
            }
            if(sfcSocial && _loc17_ != null && world.myAvatar.dataLeaf != null && _loc4_.toLowerCase() == "inthp" && param1.toLowerCase() != sfc.myUserName && _loc17_.strFrame == world.myAvatar.dataLeaf.strFrame && (!world.bPvP || _loc17_.pvpTeam == world.myAvatar.dataLeaf.pvpTeam) && _loc5_ > 0 && world.getFirstHeal() != null)
            {
               if(_loc5_ <= _loc17_.intHP && (_loc17_.intHP - _loc5_ >= _loc17_.intHPMax * 0.15 || _loc5_ <= _loc17_.intHPMax * 0.5))
               {
                  try
                  {
                     _loc9_.pMC.showHealIcon();
                  }
                  catch(e:Error)
                  {
                  }
               }
               if(_loc5_ > Math.round(_loc17_.intHPMax * 0.5))
               {
                  try
                  {
                     if(_loc9_.pMC.getChildByName("HealIconMC") != null)
                     {
                        MovieClip(_loc9_.pMC.getChildByName("HealIconMC")).fClose();
                     }
                  }
                  catch(e:Error)
                  {
                  }
               }
            }
            if(_loc4_.toLowerCase() == "afk")
            {
               _loc5_ = _loc5_ == "true";
            }
            _loc15_[_loc4_] = _loc5_;
            _loc16_[_loc4_] = _loc5_;
         }
         _loc12_ = -1;
         if(world.uoTree[param1.toLowerCase()] != null)
         {
            _loc12_ = int(world.uoTree[param1.toLowerCase()].intState);
         }
         world.uoTreeLeafSet(param1,_loc16_);
         _loc17_ = world.uoTree[param1.toLowerCase()];
         if(world.isPartyMember(param1))
         {
            world.updatePartyFrame({"unm":_loc17_.strUsername});
         }
         _loc14_ = "";
         for(_loc14_ in _loc15_)
         {
            _loc5_ = _loc15_[_loc14_];
            if(_loc14_.toLowerCase() == "strframe")
            {
               world.manageAreaUser(param1,"+");
               if(_loc15_[_loc14_] != world.strFrame)
               {
                  _loc10_ = world.getMCByUserID(world.getUserByName(param1).getId());
                  if(_loc10_ != null && _loc10_.stage != null)
                  {
                     if(world.bPvP)
                     {
                        _loc10_.px = _loc15_.px;
                        _loc10_.py = _loc15_.py;
                        _loc10_.mvtd = _loc15_.mvtd;
                        _loc10_.mvts = _loc15_.mvts;
                        _loc10_.sp = _loc15_.sp;
                        _loc10_.walkTo(_loc15_.tx,_loc15_.ty,_loc15_.sp);
                     }
                     _loc10_.pAV.hideMC();
                     if(_loc10_.pAV == world.myAvatar.target)
                     {
                        world.setTarget(null);
                     }
                  }
               }
               else if(_loc15_.sp != null)
               {
                  _loc10_ = world.getMCByUserID(world.getUserByName(param1).getId());
                  if(_loc10_ != null)
                  {
                     _loc10_.walkTo(_loc15_.tx,_loc15_.ty,_loc15_.sp);
                  }
               }
               else
               {
                  world.objectByID(_loc17_.entID);
               }
            }
            if(_loc14_.toLowerCase() == "sp")
            {
               if(_loc15_.strFrame == world.strFrame)
               {
               }
            }
            if(_loc9_ != null)
            {
               if(_loc14_.toLowerCase().indexOf("inthp") > -1 || _loc14_.toLowerCase().indexOf("intmp") > -1)
               {
                  _loc5_ = Number(_loc5_);
                  if(_loc9_.objData != null)
                  {
                     _loc9_.objData[_loc14_] = _loc5_;
                  }
                  if(_loc9_.isMyAvatar || world.myAvatar.target == _loc9_)
                  {
                     world.updatePortrait(_loc9_);
                  }
                  if(_loc9_.isMyAvatar)
                  {
                     world.updateActBar();
                  }
                  if(_loc9_.pMC != null && world.showHPBar)
                  {
                     _loc9_.pMC.updateHPBar();
                  }
               }
               if(_loc9_.isMyAvatar)
               {
                  if(_loc14_.toLowerCase().indexOf("intsp") > -1)
                  {
                     _loc5_ = Number(_loc5_);
                     if(_loc9_.objData != null)
                     {
                        _loc9_.objData[_loc14_] = _loc5_;
                     }
                     if(_loc9_.isMyAvatar || world.myAvatar.target == _loc9_)
                     {
                        world.updatePortrait(_loc9_);
                     }
                     if(_loc9_.isMyAvatar)
                     {
                        world.updateActBar();
                     }
                     if(_loc9_.pMC != null && world.showHPBar)
                     {
                        _loc9_.pMC.updateHPBar();
                     }
                  }
               }
               if(_loc14_.toLowerCase().indexOf("intlevel") > -1)
               {
                  _loc5_ = Number(_loc5_);
                  if(_loc9_.objData != null)
                  {
                     _loc9_.objData[_loc14_] = _loc5_;
                     if(!_loc9_.isMyAvatar && world.myAvatar.target == _loc9_)
                     {
                        showPortraitBox(_loc9_,ui.mcPortraitTarget);
                     }
                  }
               }
               if(_loc14_.toLowerCase().indexOf("intstate") > -1)
               {
                  _loc5_ = int(_loc5_);
                  if(_loc9_.objData != null && world.uoTree[param1.toLowerCase()].strFrame == world.strFrame)
                  {
                     if(_loc5_ == 1 && _loc12_ == 0)
                     {
                        _loc9_.pMC.gotoAndStop("Idle");
                        _loc9_.pMC.scale(world.SCALE);
                     }
                     if(_loc5_ == 1 && _loc12_ == 2)
                     {
                        if("eventTrigger" in MovieClip(world.map))
                        {
                        }
                     }
                  }
                  if(_loc9_.objData != null)
                  {
                     _loc9_.objData[_loc14_] = _loc5_;
                  }
                  if(_loc5_ == 0 && world.uoTree[param1.toLowerCase()].strFrame == world.strFrame && _loc9_.pMC != null)
                  {
                     _loc9_.pMC.stopWalking();
                     _loc9_.pMC.mcChar.gotoAndPlay("Feign");
                     world.removeAuraFX(_loc9_.pMC,"all");
                     if(_loc9_.pMC.getChildByName("HealIconMC") != null)
                     {
                        MovieClip(_loc9_.pMC.getChildByName("HealIconMC")).fClose();
                     }
                     if(_loc9_.isMyAvatar)
                     {
                        world.cancelAutoAttack();
                        world.actionReady = false;
                        world.bitWalk = false;
                        world.map.transform.colorTransform = world.deathCT;
                        world.CHARS.transform.colorTransform = world.deathCT;
                        _loc9_.pMC.transform.colorTransform = world.defaultCT;
                        world.showResCounter();
                     }
                  }
                  if(_loc5_ != 2)
                  {
                     _loc17_.targets = {};
                  }
               }
               if(_loc14_.toLowerCase().indexOf("afk") > -1)
               {
                  if(_loc9_.pMC != null)
                  {
                     _loc9_.pMC.updateName();
                  }
               }
               if(_loc14_ == "showCloak")
               {
                  if(_loc9_.pMC != null)
                  {
                     _loc9_.pMC.setCloakVisibility(_loc5_);
                  }
               }
               if(_loc14_ == "showHelm")
               {
                  if(_loc9_.pMC != null)
                  {
                     _loc9_.pMC.setHelmVisibility(_loc5_);
                  }
               }
               if(_loc14_.toLowerCase().indexOf("cast") > -1)
               {
                  if(_loc9_.pMC != null)
                  {
                     if(_loc5_.t > -1)
                     {
                        _loc9_.pMC.stopWalking();
                        _loc9_.pMC.queueAnim("Use");
                     }
                     else
                     {
                        _loc9_.pMC.endAction();
                        if(_loc9_ == world.myAvatar)
                        {
                           ui.mcCastBar.fClose();
                        }
                     }
                  }
               }
            }
         }
      }
      
      public function doAnim(param1:Object, param2:Boolean = false, param3:* = null) : void
      {
         var _loc4_:Array = null;
         var _loc5_:uint = 0;
         var _loc6_:String = null;
         var _loc7_:MovieClip = null;
         var _loc8_:Object = null;
         var _loc9_:Object = null;
         var _loc10_:Avatar = null;
         var _loc11_:Avatar = null;
         var _loc12_:Object = null;
         var _loc13_:* = undefined;
         var _loc14_:* = undefined;
         var _loc15_:* = undefined;
         var _loc16_:String = null;
         var _loc17_:int = 0;
         var _loc18_:String = null;
         var _loc19_:int = 0;
         var _loc20_:String = null;
         var _loc21_:int = 0;
         var _loc22_:Array = null;
         var _loc23_:Array = null;
         var _loc24_:String = null;
         var _loc25_:Point = null;
         var _loc26_:Point = null;
         _loc13_ = undefined;
         _loc14_ = undefined;
         _loc15_ = undefined;
         _loc18_ = "";
         _loc19_ = -1;
         _loc20_ = "";
         _loc21_ = -1;
         _loc22_ = [];
         _loc23_ = [];
         _loc24_ = "";
         _loc11_ = null;
         _loc10_ = null;
         _loc25_ = new Point(0,0);
         _loc26_ = new Point(0,0);
         if(param1.cInf != null && param1.tInf != null)
         {
            _loc18_ = String(param1.cInf.split(":")[0]);
            _loc19_ = int(param1.cInf.split(":")[1]);
            switch(_loc18_)
            {
               case "p":
                  _loc11_ = world.getAvatarByUserID(_loc19_);
                  _loc8_ = world.getUoLeafById(_loc19_);
                  break;
               case "m":
                  _loc11_ = world.getMonster(_loc19_);
                  _loc8_ = world.monTree[_loc19_];
                  if(param1.msg != null)
                  {
                     if(param1.msg.indexOf("<mon>") > -1)
                     {
                        param1.msg = param1.msg.split("<mon>").join(_loc11_.objData.strMonName);
                     }
                     addUpdate(param1.msg);
                  }
            }
            _loc23_ = param1.tInf.split(",");
            _loc17_ = 0;
            while(_loc17_ < _loc23_.length)
            {
               _loc20_ = String(_loc23_[_loc17_].split(":")[0]);
               _loc21_ = int(_loc23_[_loc17_].split(":")[1]);
               switch(_loc20_)
               {
                  case "p":
                     _loc10_ = world.getAvatarByUserID(_loc21_);
                     _loc9_ = world.getUoLeafById(_loc21_);
                     break;
                  case "m":
                     _loc10_ = world.getMonster(_loc21_);
                     _loc9_ = world.monTree[_loc21_];
                     break;
               }
               _loc22_.push(_loc10_);
               _loc17_ += 1;
            }
            if(_loc22_[0] != null)
            {
               _loc10_ = _loc22_[0];
            }
            if(_loc10_ != null)
            {
               _loc9_ = _loc10_.dataLeaf;
            }
            if(_loc11_ != null && _loc11_.pMC != null && _loc10_ != null && _loc10_.pMC != null && _loc8_ != null && _loc9_ != null)
            {
               _loc12_ = {};
               for each(_loc12_ in _loc8_.auras)
               {
                  try
                  {
                     if(_loc12_.cat != null)
                     {
                        if(_loc12_.cat == "stun")
                        {
                           return;
                        }
                        if(_loc12_.cat == "stone")
                        {
                           return;
                        }
                        if(_loc12_.cat == "disabled")
                        {
                           return;
                        }
                     }
                  }
                  catch(e:Error)
                  {
                  }
               }
               _loc6_ = param1.animStr;
               switch(_loc18_)
               {
                  case "p":
                     if(_loc11_.objData != null)
                     {
                        if(_loc11_ != world.myAvatar)
                        {
                           _loc11_.target = _loc10_;
                        }
                        _loc24_ = String(_loc8_.strFrame);
                        if(_loc24_ != null && _loc24_ == world.strFrame && _loc8_.intState > 0)
                        {
                           if(_loc11_ != _loc10_)
                           {
                              if(_loc10_.pMC.x - _loc11_.pMC.x >= 0)
                              {
                                 _loc11_.pMC.turn("right");
                              }
                              else
                              {
                                 _loc11_.pMC.turn("left");
                              }
                           }
                           _loc11_.pMC.queueSpFX({
                              "strl":param1.strl,
                              "fx":param1.fx,
                              "avts":_loc22_
                           });
                           if(!isNaN(param3))
                           {
                              _loc11_.pMC.spellDur = param3;
                           }
                           if(_loc6_ != null)
                           {
                              if(_loc6_.indexOf(",") > -1)
                              {
                                 _loc6_ = _loc6_.split(",")[Math.round(Math.random() * (_loc6_.split(",").length - 1))];
                              }
                              if(_loc6_ != "Thrash" || _loc11_.pMC.mcChar.currentLabel != "Thrash")
                              {
                                 _loc11_.pMC.queueAnim(_loc6_);
                              }
                              if(param2 && Boolean(_loc11_.pMC.mcChar.weapon.mcWeapon.isProc))
                              {
                                 _loc11_.pMC.mcChar.weapon.mcWeapon.gotoAndPlay("Proc");
                              }
                           }
                        }
                     }
                     return;
                  case "m":
                     if(_loc11_.objData != null)
                     {
                        if(_loc11_ != world.myAvatar)
                        {
                           _loc11_.target = _loc10_;
                        }
                        _loc24_ = String(_loc8_.strFrame);
                        _loc25_ = _loc11_.pMC.mcChar.localToGlobal(new Point(0,0));
                        _loc26_ = _loc10_.pMC.mcChar.localToGlobal(new Point(0,0));
                        _loc25_ = world.CHARS.globalToLocal(_loc25_);
                        _loc26_ = world.CHARS.globalToLocal(_loc26_);
                        if(_loc24_ != null && _loc24_ == world.strFrame && _loc8_.intState > 0)
                        {
                           if(_loc11_ != _loc10_)
                           {
                              if(_loc26_.x - _loc25_.x >= 0)
                              {
                                 _loc11_.pMC.turn("right");
                              }
                              else
                              {
                                 _loc11_.pMC.turn("left");
                              }
                           }
                           if(param1.fx != "p" && param1.fx != "w" && param1.fx != "" && (Math.abs(_loc25_.x - _loc26_.x) * world.SCALE > 160 || Math.abs(_loc25_.y - _loc26_.y) * world.SCALE > 15))
                           {
                              _loc13_ = int(110 + Math.random() * 50);
                              _loc14_ = _loc26_.x - _loc25_.x >= 0 ? -_loc13_ : _loc13_;
                              _loc14_ = int(_loc14_ * world.SCALE);
                              if(_loc26_.x + _loc14_ < 0 || _loc26_.x + _loc14_ > 960)
                              {
                                 _loc14_ *= -1;
                              }
                              _loc13_ = int(Math.random() * 30 - 15);
                              _loc15_ = _loc26_.y - _loc25_.y >= 0 ? -_loc13_ : _loc13_;
                              _loc15_ = int(_loc15_ * world.SCALE);
                              _loc11_.pMC.walkTo(_loc26_.x + _loc14_,_loc26_.y + _loc15_,32);
                           }
                           if(_loc11_.pMC.spFX != null)
                           {
                              _loc11_.pMC.spFX.avt = _loc11_.target;
                           }
                           _loc25_ = _loc11_.pMC.mcChar.localToGlobal(new Point(0,0));
                           _loc26_ = _loc10_.pMC.mcChar.localToGlobal(new Point(0,0));
                           if(_loc11_ != _loc10_)
                           {
                              if(_loc26_.x - _loc25_.x >= 0)
                              {
                                 _loc11_.pMC.turn("right");
                              }
                              else
                              {
                                 _loc11_.pMC.turn("left");
                              }
                           }
                           if(litePreference.data.bDisMonAnim)
                           {
                              return;
                           }
                           if(_loc6_.length > 1)
                           {
                              if(_loc6_.indexOf(",") > -1)
                              {
                                 if(world.objExtra["bChar"] == 1)
                                 {
                                    _loc16_ = _loc11_.pMC.Animation;
                                    MovieClip(_loc11_.pMC.getChildAt(1)).gotoAndPlay(_loc16_);
                                 }
                                 else
                                 {
                                    _loc4_ = _loc6_.split(",");
                                    _loc5_ = uint(Math.round(Math.random() * (_loc4_.length - 1)));
                                    MovieClip(_loc11_.pMC.getChildAt(1)).gotoAndPlay(_loc4_[_loc5_]);
                                 }
                              }
                              else if(world.objExtra["bChar"] == 1)
                              {
                                 _loc16_ = _loc11_.pMC.Animation;
                                 MovieClip(_loc11_.pMC.getChildAt(1)).gotoAndPlay(_loc16_);
                              }
                              else
                              {
                                 MovieClip(_loc11_.pMC.getChildAt(1)).gotoAndPlay(_loc6_);
                              }
                           }
                        }
                     }
                     return;
               }
            }
         }
      }
      
      public function key_StageLogin(param1:KeyboardEvent) : *
      {
         if(param1.target == stage)
         {
            if(param1.keyCode == Keyboard.ENTER)
            {
               stage.focus = mcLogin.ni;
            }
         }
      }
      
      public function isSpecificItem(param1:String) : Boolean
      {
         switch(param1)
         {
            case "Lucky Suit Treasure Chest":
            case "Unlucky Suit Treasure Chest":
            case "Apocalyptic LichMoglin on your Back":
               return true;
            default:
               return false;
         }
      }
      
      public function hasBankItem() : Boolean
      {
         var _loc1_:* = undefined;
         for each(_loc1_ in world.myAvatar.items)
         {
            if(_loc1_.sName.indexOf(" Bank") > -1 || _loc1_.sType == "Pet" && _loc1_.sName.indexOf(" Moglin Plush Pet") > -1 || _loc1_.sDesc.indexOf(" Bank Pet ") > -1 || isSpecificItem(_loc1_.sName))
            {
               return true;
            }
         }
         return false;
      }
      
      public function key_StageGame(param1:KeyboardEvent) : *
      {
         var _loc2_:Array = null;
         var _loc3_:String = null;
         var _loc4_:uint = 0;
         var _loc5_:MovieClip = null;
         var _loc6_:MovieClip = null;
         var _loc7_:int = 0;
         if(Boolean(param1.target) && param1.target.name == "btnSetKeybindActive")
         {
            return;
         }
         if(!(param1.target is TextField || param1.currentTarget is TextField))
         {
            if(String.fromCharCode(param1.charCode) == "w" && world.myAvatar.isStaff())
            {
               if(stage.focus == null || stage.focus != null && !("text" in stage.focus))
               {
                  toggleTradePanel();
               }
            }
            if(String.fromCharCode(param1.charCode) == "m" && world.myAvatar.isStaff())
            {
               if(stage.focus == null || stage.focus != null && !("text" in stage.focus))
               {
                  toggleAuctionPanel();
               }
            }
            if(param1.keyCode == Keyboard.ENTER || String.fromCharCode(param1.charCode) == "/")
            {
               chatF.openMsgEntry();
            }
            if(isNumpadKey(param1.keyCode))
            {
               param1.keyCode -= 48;
            }
            if(param1.keyCode == litePreference.data.keys["Target Random Monster"])
            {
               if(stage.focus == null || stage.focus != null && !("text" in stage.focus))
               {
                  _loc2_ = world.getMonstersByCell(world.strFrame);
                  _loc3_ = world.strFrame;
                  if(_loc2_.length > 0)
                  {
                     _loc4_ = uint(Math.round(Math.random() * (_loc2_.length - 1)));
                     while(_loc2_.length > 1 && !_loc2_[_loc4_] && !_loc2_[_loc4_].pMC && _loc2_[_loc4_].dataLeaf.intState == 0 && world.myAvatar.target == _loc2_[_loc4_])
                     {
                        if(world.strFrame != _loc3_)
                        {
                           break;
                        }
                        _loc4_ = uint(Math.round(Math.random() * (_loc2_.length - 1)));
                     }
                     if(world.strFrame == _loc3_)
                     {
                        if(_loc2_[_loc4_] && _loc2_[_loc4_].pMC && _loc2_[_loc4_].dataLeaf.strFrame == world.strFrame && _loc2_[_loc4_].dataLeaf.intState != 0)
                        {
                           world.setTarget(_loc2_[_loc4_]);
                        }
                     }
                  }
               }
            }
            if(param1.keyCode == litePreference.data.keys["Travel Menu\'s Travel"])
            {
               if(stage.focus == null || stage.focus != null && !("text" in stage.focus))
               {
                  if(ui.getChildByName("mcTravelMenu"))
                  {
                     (ui.getChildByName("mcTravelMenu") as MovieClip).dispatchTravel();
                  }
               }
            }
            if(param1.keyCode == litePreference.data.keys["Camera Tool"])
            {
               if(stage.focus == null || stage.focus != null && !("text" in stage.focus))
               {
                  if(Boolean(stage.getChildByName("worldCameraMC")) || Boolean(getChildByName("cameraToolMC")))
                  {
                     return;
                  }
                  _loc5_ = new cameraTool(this);
                  _loc5_.name = "cameraToolMC";
                  _loc5_.x = -7;
                  addChild(_loc5_);
                  world.visible = false;
               }
            }
            if(param1.keyCode == litePreference.data.keys["World Camera"])
            {
               if(stage.focus == null || stage.focus != null && !("text" in stage.focus))
               {
                  if(Boolean(stage.getChildByName("worldCameraMC")) || Boolean(getChildByName("cameraToolMC")))
                  {
                     if(stage.getChildByName("worldCameraMC"))
                     {
                        MovieClip(stage.getChildByName("worldCameraMC")).dispatchExit();
                     }
                     return;
                  }
                  _loc6_ = new worldCamera(this);
                  _loc6_.name = "worldCameraMC";
                  stage.addChild(_loc6_);
               }
            }
            if(String.fromCharCode(param1.charCode) == ">")
            {
               if(stage.focus == null || stage.focus != null && !("text" in stage.focus))
               {
                  if(chatF.pmSourceA[0] != null && chatF.pmSourceA[0].length >= 1)
                  {
                     chatF.openPMsg(chatF.pmSourceA[0]);
                     if(intChatMode)
                     {
                        ui.mcInterface.ncText.text = "> ";
                     }
                     else
                     {
                        ui.mcInterface.te.text = "> ";
                     }
                  }
               }
            }
            if(param1.keyCode == litePreference.data.keys["Inventory"])
            {
               if(stage.focus == null || stage.focus != null && !("text" in stage.focus))
               {
                  ui.mcInterface.mcMenu.toggleInventory();
               }
            }
            if(param1.keyCode == litePreference.data.keys["Bank"] && (world.myAvatar.isStaff() || hasBankItem()))
            {
               if(stage.focus == null || stage.focus != null && !("text" in stage.focus))
               {
                  world.toggleBank();
               }
            }
            if(param1.keyCode == litePreference.data.keys["Quest Log"])
            {
               if(stage.focus != ui.mcInterface.te && stage.focus != ui.mcInterface.ncText && stage.focus != ui.mcInterface.ncText)
               {
                  world.toggleQuestLog();
               }
            }
            if(param1.keyCode == litePreference.data.keys["Friends List"])
            {
               if(stage.focus == null || stage.focus != null && !("text" in stage.focus))
               {
                  if(ui.mcOFrame.isOpen)
                  {
                     ui.mcOFrame.fClose();
                  }
                  else
                  {
                     world.showFriendsList();
                  }
               }
            }
            if(param1.keyCode == litePreference.data.keys["Character Panel"])
            {
               if(stage.focus == null || stage.focus != null && !("text" in stage.focus))
               {
                  toggleCharpanel("overview");
               }
            }
            if(param1.keyCode == litePreference.data.keys["Player HP Bar"])
            {
               if(stage.focus == null || stage.focus != null && !("text" in stage.focus))
               {
                  world.toggleHPBar();
               }
            }
            if(param1.keyCode == litePreference.data.keys["Options"])
            {
               if(stage.focus == null || stage.focus != null && !("text" in stage.focus))
               {
                  if(ui.mcPopup.currentLabel == "Option")
                  {
                     ui.mcPopup.onClose();
                  }
                  else
                  {
                     ui.mcPopup.fOpen("Option");
                  }
               }
            }
            if(param1.keyCode == litePreference.data.keys["Area List"])
            {
               if(stage.focus == null || stage.focus != null && !("text" in stage.focus))
               {
                  if(!ui.mcOFrame.isOpen)
                  {
                     world.sendWhoRequest();
                  }
                  else
                  {
                     ui.mcOFrame.fClose();
                  }
               }
            }
            if(param1.keyCode == litePreference.data.keys["Jump"])
            {
               if(stage.focus != ui.mcInterface.te && stage.focus != ui.mcInterface.ncText)
               {
                  world.myAvatar.pMC.mcChar.gotoAndPlay("Jump");
               }
            }
            if(param1.keyCode == litePreference.data.keys["Rest"])
            {
               if(param1.target != ui.mcInterface.te && param1.target != ui.mcInterface.ncText)
               {
                  world.rest();
               }
            }
            if(param1.keyCode == litePreference.data.keys["Hide Monsters"])
            {
               if(param1.target != ui.mcInterface.te && param1.target != ui.mcInterface.ncText)
               {
                  world.toggleMonsters();
               }
            }
            if(param1.keyCode == litePreference.data.keys["Hide Players"])
            {
               if(param1.target != ui.mcInterface.te && param1.target != ui.mcInterface.ncText)
               {
                  optionHandler.cmd(MovieClip(this),"Hide Players");
               }
            }
            if(param1.keyCode == litePreference.data.keys["Cancel Target"])
            {
               if(param1.target != ui.mcInterface.te && param1.target != ui.mcInterface.ncText)
               {
                  if(cancelTargetTimer.running)
                  {
                     return;
                  }
                  if(world.autoActionTimer != null && Boolean(world.autoActionTimer.running))
                  {
                     world.cancelAutoAttack();
                     world.myAvatar.pMC.mcChar.gotoAndStop("Idle");
                  }
                  if(world.myAvatar.target != null)
                  {
                     world.setTarget(null);
                  }
                  if(!cancelTargetTimer.hasEventListener(TimerEvent.TIMER))
                  {
                     cancelTargetTimer.addEventListener(TimerEvent.TIMER,hasCanceledAlready,false,0,true);
                  }
                  _loc7_ = int(parseInt(world.getActionByRef(world.actionMap[0]).cd));
                  cancelTargetTimer.delay = _loc7_ < 2000 ? 2000 : _loc7_;
                  cancelTargetTimer.start();
               }
            }
            if(param1.keyCode == litePreference.data.keys["Hide UI"])
            {
               if(param1.target != ui.mcInterface.te && param1.target != ui.mcInterface.ncText)
               {
                  optionHandler.cmd(MovieClip(this),"Hide UI");
               }
            }
            if(param1.keyCode == litePreference.data.keys["Battle Analyzer"])
            {
               if(param1.target != ui.mcInterface.te && param1.target != ui.mcInterface.ncText)
               {
                  optionHandler.cmd(MovieClip(this),"Battle Analyzer");
               }
            }
            if(param1.keyCode == litePreference.data.keys["Decline All Drops"])
            {
               if(param1.target != ui.mcInterface.te && param1.target != ui.mcInterface.ncText)
               {
                  optionHandler.cmd(MovieClip(this),"Decline All Drops");
               }
            }
            if(param1.keyCode == litePreference.data.keys["Stats Overview"])
            {
               if(param1.target != ui.mcInterface.te && param1.target != ui.mcInterface.ncText)
               {
                  toggleStatspanel();
               }
            }
            if(param1.keyCode == litePreference.data.keys["Battle Analyzer Toggle"])
            {
               if(param1.target != ui.mcInterface.te && param1.target != ui.mcInterface.ncText)
               {
                  if(bAnalyzer)
                  {
                     bAnalyzer.toggle();
                  }
               }
            }
            if(param1.keyCode == litePreference.data.keys["Custom Drops UI"])
            {
               if(param1.target != ui.mcInterface.te && param1.target != ui.mcInterface.ncText)
               {
                  if(Boolean(ui.mcPortrait.iconDrops) && Boolean(ui.mcPortrait.iconDrops.visible))
                  {
                     ui.mcPortrait.iconDrops.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                  }
               }
            }
            if(param1.keyCode == litePreference.data.keys["@ Debugger - Cell Menu"])
            {
               if(ui && ui.mcInterface && ui.mcInterface.te && param1.target != ui.mcInterface.te && param1.target != ui.mcInterface.ncText)
               {
                  if(cMenuUI)
                  {
                     cMenuUI.toggle();
                  }
               }
            }
            if(param1.keyCode == litePreference.data.keys["@ Debugger - Packet Logger"])
            {
               if(ui && ui.mcInterface && ui.mcInterface.te && param1.target != ui.mcInterface.te && param1.target != ui.mcInterface.ncText)
               {
                  if(Boolean(pLoggerUI) && Boolean(litePreference.data.dOptions["debugPacket"]))
                  {
                     pLoggerUI.visible = !pLoggerUI.visible;
                     pLoggerUI.toggle();
                  }
               }
            }
            if(param1.keyCode == litePreference.data.keys["Dash"])
            {
               if(ui && ui.mcInterface && ui.mcInterface.te && param1.target != ui.mcInterface.te && param1.target != ui.mcInterface.ncText)
               {
                  if(!world.uoTree[world.myAvatar.pnm].sta.$dsh)
                  {
                     world.uoTree[world.myAvatar.pnm].sta.$dsh = 100;
                  }
                  if(world.myAvatar.dataLeaf.intSP >= world.uoTree[world.myAvatar.pnm].sta.$dsh)
                  {
                     pDash = true;
                  }
               }
            }
            if(param1.keyCode == litePreference.data.keys["Outfits"])
            {
               if(ui && ui.mcInterface && ui.mcInterface.te && param1.target != ui.mcInterface.te && param1.target != ui.mcInterface.ncText)
               {
                  if(!getInterface("outfitSets"))
                  {
                     toggleOutfits();
                  }
               }
            }
            if(param1.keyCode == litePreference.data.keys["Friendships UI"])
            {
               if(ui && ui.mcInterface && ui.mcInterface.te && param1.target != ui.mcInterface.te && param1.target != ui.mcInterface.ncText)
               {
                  if(!getInterface("Friendships UI"))
                  {
                     showFriendshipUI();
                  }
               }
            }
         }
      }
      
      private function hasCanceledAlready(param1:TimerEvent) : void
      {
         cancelTargetTimer.removeEventListener(TimerEvent.TIMER,hasCanceledAlready);
         stage.focus = null;
      }
      
      public function key_TextLogin(param1:KeyboardEvent) : *
      {
         if(param1.target != stage)
         {
            if(param1.keyCode == Keyboard.ENTER)
            {
               onLoginClick(null);
            }
         }
      }
      
      public function key_ChatEntry(param1:KeyboardEvent) : *
      {
         if(param1.keyCode == Keyboard.ENTER)
         {
            chatF.submitMsg(intChatMode ? ui.mcInterface.ncText.text : ui.mcInterface.te.text,chatF.chn.cur.typ,chatF.pmNm);
         }
         if(param1.keyCode == Keyboard.ESCAPE)
         {
            chatF.closeMsgEntry();
         }
      }
      
      public function talk(param1:*) : *
      {
         if(param1.accept)
         {
            chatF.submitMsg(param1.emote1,"emote",sfc.myUserName);
         }
         else
         {
            chatF.submitMsg(param1.emote2,"emote",sfc.myUserName);
         }
      }
      
      public function isNumpadKey(param1:uint) : Boolean
      {
         return param1 >= 96 && param1 <= 105;
      }
      
      public function key_actBar(param1:KeyboardEvent) : *
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         var _loc4_:* = undefined;
         if(Boolean(param1.target) && param1.target.name == "btnSetKeybindActive")
         {
            return;
         }
         if(stage.focus == null || stage.focus != null && !("text" in stage.focus))
         {
            if(isNumpadKey(param1.keyCode))
            {
               param1.keyCode -= 48;
            }
            switch(param1.keyCode)
            {
               case litePreference.data.keys["Auto Attack"]:
                  _loc2_ = 0;
                  world.approachTarget();
                  return;
               case litePreference.data.keys["Skill 1"]:
                  _loc2_ = 1;
                  if(world.actionMap[_loc2_] != null)
                  {
                     _loc4_ = world.getActionByRef(world.actionMap[_loc2_]);
                     if(_loc4_.isOK)
                     {
                        world.testAction(_loc4_);
                     }
                  }
                  return;
               case litePreference.data.keys["Skill 2"]:
                  _loc2_ = 2;
                  if(world.actionMap[_loc2_] != null)
                  {
                     _loc4_ = world.getActionByRef(world.actionMap[_loc2_]);
                     if(_loc4_.isOK)
                     {
                        world.testAction(_loc4_);
                     }
                  }
                  return;
               case litePreference.data.keys["Skill 3"]:
                  _loc2_ = 3;
                  if(world.actionMap[_loc2_] != null)
                  {
                     _loc4_ = world.getActionByRef(world.actionMap[_loc2_]);
                     if(_loc4_.isOK)
                     {
                        world.testAction(_loc4_);
                     }
                  }
                  return;
               case litePreference.data.keys["Skill 4"]:
                  _loc2_ = 4;
                  if(world.actionMap[_loc2_] != null)
                  {
                     _loc4_ = world.getActionByRef(world.actionMap[_loc2_]);
                     if(_loc4_.isOK)
                     {
                        world.testAction(_loc4_);
                     }
                  }
                  return;
               case litePreference.data.keys["Skill 5"]:
                  _loc2_ = 5;
                  if(world.actionMap[_loc2_] != null)
                  {
                     _loc4_ = world.getActionByRef(world.actionMap[_loc2_]);
                     if(_loc4_.isOK)
                     {
                        world.testAction(_loc4_);
                     }
                  }
                  return;
            }
         }
      }
      
      public function getKeyboardDict() : Dictionary
      {
         var _loc1_:String = null;
         var _loc2_:XML = null;
         var _loc3_:XMLList = null;
         var _loc4_:Dictionary = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         _loc2_ = describeType(Keyboard);
         _loc3_ = _loc2_.constant.@name;
         _loc4_ = new Dictionary();
         _loc5_ = int(_loc3_.length());
         while(_loc6_ < _loc5_)
         {
            _loc1_ = _loc3_[_loc6_];
            if(_loc3_[_loc6_].indexOf("NUMBER_") > -1 || _loc3_[_loc6_].indexOf("STRING_") > -1 || _loc3_[_loc6_].indexOf("KEYNAME_") > -1)
            {
               _loc1_ = _loc3_[_loc6_].split("_")[1];
            }
            _loc4_[Keyboard[_loc3_[_loc6_]]] = _loc1_;
            _loc6_++;
         }
         return _loc4_;
      }
      
      public function decHex(param1:*) : *
      {
         return param1.toString(16);
      }
      
      public function hexDec(param1:*) : *
      {
         return parseInt(param1,16);
      }
      
      public function modColor(param1:*, param2:*, param3:*) : String
      {
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         _loc7_ = "";
         _loc8_ = 0;
         while(_loc8_ < 3)
         {
            _loc4_ = hexDec(param1.substr(_loc8_ * 2,2));
            _loc5_ = hexDec(param2.substr(_loc8_ * 2,2));
            switch(param3)
            {
               case "-":
               default:
                  _loc6_ = _loc4_ - _loc5_;
                  if(_loc6_ < 0)
                  {
                     _loc6_ = 0;
                  }
                  break;
               case "+":
                  _loc6_ = _loc4_ + _loc5_;
                  if(_loc6_ > 255)
                  {
                     _loc6_ = 255;
                  }
                  _loc6_ = decHex(_loc6_);
                  break;
            }
            _loc6_ = decHex(_loc6_);
            _loc7_ += String(_loc6_.length < 2 ? "0" + _loc6_ : _loc6_);
            _loc8_++;
         }
         return _loc7_;
      }
      
      internal function replaceString(param1:String, param2:String, param3:String) : String
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:* = undefined;
         _loc4_ = 0;
         _loc5_ = 0;
         _loc6_ = "";
         while(true)
         {
            _loc4_ = Number(param1.indexOf(param2,_loc4_));
            if(_loc4_ == -1)
            {
               break;
            }
            _loc6_ += param1.substring(_loc5_,_loc4_) + param3;
            _loc5_ = _loc4_ = _loc4_ + param2.length;
         }
         return _loc6_ == "" ? param1 : _loc6_;
      }
      
      public function stripWhite(param1:String) : String
      {
         param1 = param1.split("\r").join("");
         param1 = param1.split("\t").join("");
         return param1.split(" ").join("");
      }
      
      public function stripWhiteStrict(param1:String) : String
      {
         var _loc2_:int = 0;
         param1 = stripWhite(param1);
         while(_loc2_ < chatF.strictComparisonChars.length)
         {
            param1 = param1.split(chatF.strictComparisonChars.substr(_loc2_,1)).join("");
            _loc2_++;
         }
         return param1;
      }
      
      public function stripWhiteStrictB(param1:String) : String
      {
         var _loc2_:int = 0;
         param1 = stripWhite(param1);
         while(_loc2_ < chatF.strictComparisonCharsB.length)
         {
            param1 = param1.split(chatF.strictComparisonCharsB.substr(_loc2_,1)).join("");
            _loc2_++;
         }
         return param1;
      }
      
      public function stripMarks(param1:String) : String
      {
         var _loc2_:int = 0;
         while(_loc2_ < chatF.markChars.length)
         {
            param1 = param1.split(chatF.markChars.substr(_loc2_,1)).join("");
            _loc2_++;
         }
         return param1;
      }
      
      public function stripDuplicateVowels(param1:String) : String
      {
         param1 = param1.replace(chatF.regExpA,"a");
         param1 = param1.replace(chatF.regExpE,"e");
         param1 = param1.replace(chatF.regExpI,"i");
         param1 = param1.replace(chatF.regExpO,"o");
         param1 = param1.replace(chatF.regExpU,"u");
         return param1.replace(chatF.regExpSPACE," ");
      }
      
      public function maskStringBetween(param1:String, param2:Array) : String
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = undefined;
         _loc5_ = "";
         if(param2.length > 0 && param2.length % 2 == 0)
         {
            _loc3_ = 0;
            _loc4_ = 0;
            while(_loc4_ < param1.length)
            {
               if(_loc4_ >= param2[_loc3_] && _loc4_ <= param2[_loc3_ + 1])
               {
                  if(param1.charAt(_loc4_) == " ")
                  {
                     _loc5_ += " ";
                  }
                  else
                  {
                     _loc5_ += "*";
                  }
                  if(_loc4_ == param2[_loc3_ + 1])
                  {
                     _loc3_ += 2;
                  }
               }
               else
               {
                  _loc5_ += param1.charAt(_loc4_);
               }
               _loc4_++;
            }
         }
         return _loc5_;
      }
      
      public function arraySort(param1:String, param2:String) : int
      {
         if(param1 > param2)
         {
            return 1;
         }
         if(param1 < param2)
         {
            return -1;
         }
         return 0;
      }
      
      public function convertBubbleText(param1:String) : String
      {
         var _loc2_:String = null;
         _loc2_ = world.myAvatar.objData.strUsername;
         if(param1.indexOf("@name"))
         {
            param1 = param1.split("@name").join(_loc2_);
         }
         _loc2_ = String(world.myAvatar.objData.intLevel);
         if(param1.indexOf("@level"))
         {
            param1 = param1.split("@level").join(_loc2_);
         }
         _loc2_ = world.myAvatar.objData.strClassName;
         if(param1.indexOf("@class"))
         {
            param1 = param1.split("@class").join(_loc2_);
         }
         _loc2_ = world.myAvatar.objData.strGender.toLowerCase() == "m" ? "Mr." : "Mrs.";
         if(param1.indexOf("@prefix"))
         {
            param1 = param1.split("@prefix").join(_loc2_);
         }
         _loc2_ = world.myAvatar.objData.strGender.toLowerCase() == "m" ? "He" : "She";
         if(param1.indexOf("@He"))
         {
            param1 = param1.split("@prefix").join(_loc2_);
         }
         _loc2_ = world.myAvatar.objData.strGender.toLowerCase() == "m" ? "Him" : "Her";
         if(param1.indexOf("@Him"))
         {
            param1 = param1.split("@prefix").join(_loc2_);
         }
         _loc2_ = world.myAvatar.objData.strGender.toLowerCase() == "m" ? "His" : "Her";
         if(param1.indexOf("@His"))
         {
            param1 = param1.split("@prefix").join(_loc2_);
         }
         _loc2_ = world.myAvatar.objData.strGender.toLowerCase() == "m" ? "he" : "she";
         if(param1.indexOf("@he"))
         {
            param1 = param1.split("@prefix").join(_loc2_);
         }
         _loc2_ = world.myAvatar.objData.strGender.toLowerCase() == "m" ? "him" : "her";
         if(param1.indexOf("@him"))
         {
            param1 = param1.split("@prefix").join(_loc2_);
         }
         _loc2_ = world.myAvatar.objData.strGender.toLowerCase() == "m" ? "his" : "her";
         if(param1.indexOf("@his"))
         {
            param1 = param1.split("@prefix").join(_loc2_);
         }
         return param1;
      }
      
      public function strToProperCase(param1:String) : String
      {
         return param1.slice(0,1).toUpperCase() + param1.slice(1,param1.length).toLowerCase();
      }
      
      public function strSetCharAt(param1:String, param2:int, param3:String) : String
      {
         return param1.substring(0,param2) + param3 + param1.substring(param2 + 1,param1.length);
      }
      
      public function strNumWithCommas(param1:Number) : String
      {
         var _loc2_:* = undefined;
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         _loc2_ = "";
         _loc3_ = param1.toString();
         _loc4_ = _loc3_.length - 1;
         while(_loc4_ > -1)
         {
            if(_loc5_ == 3)
            {
               _loc5_ = 0;
               _loc2_ = _loc3_.charAt(_loc4_) + "," + _loc2_;
            }
            else
            {
               _loc2_ = _loc3_.charAt(_loc4_) + _loc2_;
            }
            _loc5_++;
            _loc4_--;
         }
         return _loc2_;
      }
      
      public function numToStr(param1:Number, param2:int = 2) : String
      {
         var _loc3_:* = null;
         var _loc4_:Array = null;
         _loc3_ = param1.toString();
         if(_loc3_.indexOf(".") == -1)
         {
            _loc3_ += ".";
         }
         _loc4_ = _loc3_.split(".");
         while(_loc4_[1].length < param2)
         {
            _loc4_[1] += "0";
         }
         if(_loc4_[1].length > param2)
         {
            _loc4_[1] = _loc4_[1].substr(0,param2);
         }
         if(param2 > 0)
         {
            _loc3_ = _loc4_[0] + "." + _loc4_[1];
         }
         else
         {
            _loc3_ = _loc4_[0];
         }
         return _loc3_;
      }
      
      public function copyObj(param1:Object) : Object
      {
         var _loc2_:ByteArray = null;
         _loc2_ = new ByteArray();
         _loc2_.writeObject(param1);
         _loc2_.position = 0;
         return _loc2_.readObject();
      }
      
      public function copyConstructor(param1:*) : *
      {
         var _loc2_:ByteArray = null;
         _loc2_ = new ByteArray();
         _loc2_.writeObject(param1);
         _loc2_.position = 0;
         return _loc2_.readObject() as Class;
      }
      
      public function distanceO(param1:*, param2:*) : Number
      {
         return Math.sqrt(Math.pow(int(param2.x - param1.x),2) + Math.pow(int(param2.y - param1.y),2));
      }
      
      public function distanceP(param1:*, param2:*, param3:*, param4:*) : Number
      {
         return Math.sqrt(Math.pow(param3 - param1,2) + Math.pow(param4 - param2,2));
      }
      
      public function distanceXY(param1:*, param2:*, param3:*, param4:*) : Object
      {
         return {
            "dx":param3 - param1,
            "dy":param4 - param2
         };
      }
      
      public function isHouseItem(param1:Object) : Boolean
      {
         return param1.sType == "House" || param1.sType == "Floor Item" || param1.sType == "Wall Item";
      }
      
      internal function validateArmor(param1:*) : *
      {
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:Array = null;
         var _loc6_:int = 0;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         var _loc11_:int = 0;
         _loc4_ = [];
         var _loc5_:Object = {};
         var _loc7_:int = 10;
         _loc8_ = true;
         _loc11_ = int(param1.ItemID);
         switch(_loc11_)
         {
            case 319:
            case 2083:
               _loc9_ = true;
               _loc4_ = [16,15654,407,20,15651,409];
               break;
            case 409:
               _loc10_ = true;
               _loc4_ = [20,15651];
               break;
            case 408:
               _loc10_ = true;
               _loc4_ = [17,15653];
               break;
            case 410:
               _loc10_ = true;
               _loc4_ = [18,15652];
               break;
            case 407:
               _loc10_ = true;
               _loc4_ = [16,15654];
         }
         if(_loc9_)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc4_.length)
            {
               if(world.myAvatar.getCPByID(_loc4_[_loc2_]) < 302500)
               {
                  _loc8_ = false;
               }
               else
               {
                  _loc8_ = true;
                  if(_loc2_ < 2)
                  {
                     _loc2_ = 2;
                  }
                  if(_loc2_ < 5 && _loc2_ > 2)
                  {
                     break;
                  }
               }
               _loc2_++;
            }
            return _loc8_;
         }
         if(_loc10_)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc4_.length)
            {
               if(world.myAvatar.getCPByID(_loc4_[_loc3_]) >= param1.iReqCP)
               {
                  return true;
               }
               _loc3_++;
            }
            return false;
         }
         return !(Number(param1.iClass) > 0 && world.myAvatar.getCPByID(param1.iClass) < param1.iReqCP);
      }
      
      public function getItemInfoString(param1:Object) : String
      {
         var _loc2_:int = 0;
         var _loc3_:* = undefined;
         var _loc4_:int = 0;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         var _loc10_:* = undefined;
         var _loc11_:* = undefined;
         var _loc12_:* = undefined;
         var _loc13_:* = undefined;
         var _loc14_:* = undefined;
         var _loc15_:* = undefined;
         _loc15_ = "<font size=\'14\'><b>" + param1.sName + "</b></font><br>";
         if(!validateArmor(param1) && param1.iClass > 0)
         {
            _loc15_ += "<font size=\'11\' color=\'#CC0000\'>";
            _loc2_ = getRankFromPoints(param1.iReqCP);
            _loc3_ = param1.iReqCP - arrRanks[_loc2_ - 1];
            if(_loc3_ > 0)
            {
               _loc15_ += "Requires " + _loc3_ + " Class Points on " + param1.sClass + ", Rank " + _loc2_ + ".";
            }
            else
            {
               _loc15_ += "Requires " + param1.sClass + ", Rank " + _loc2_ + ".";
            }
            _loc15_ += "</font><br>";
         }
         if(param1.FactionID > 1 && world.myAvatar.getRep(param1.FactionID) < param1.iReqRep)
         {
            _loc15_ += "<font size=\'11\' color=\'#CC0000\'>";
            _loc4_ = getRankFromPoints(param1.iReqRep);
            _loc5_ = param1.iReqRep - arrRanks[_loc2_ - 1];
            if(_loc5_ > 0)
            {
               _loc15_ += "Requires " + _loc5_ + " Reputation on " + param1.sFaction + ", Rank " + _loc4_ + ".";
            }
            else
            {
               _loc15_ += "Requires " + param1.sFaction + ", Rank " + _loc4_ + ".";
            }
            _loc15_ += "</font><br>";
         }
         if(param1.iQSindex >= 0 && world.getQuestValue(param1.iQSindex) < int(param1.iQSvalue))
         {
            _loc15_ += "<font size=\'11\' color=\'#CC0000\'>Requires completion of quest \"" + param1.sQuest + "\".</font><br>";
         }
         _loc15_ += "<font color=\'#009900\'><b>" + getDisplaysType(param1);
         if(param1.sES != "None" && param1.sES != "co" && param1.sES != "mi")
         {
            if(param1.EnhID > 0)
            {
               _loc15_ += ", Lvl " + param1.EnhLvl;
               if(param1.sES == "Weapon")
               {
                  _loc6_ = getBaseHPByLevel(param1.EnhLvl);
                  _loc7_ = 20;
                  _loc8_ = 1;
                  _loc9_ = param1.iRng / 100;
                  _loc10_ = 2;
                  _loc11_ = Math.round(_loc6_ / _loc7_ * _loc8_);
                  _loc12_ = Math.round(_loc11_ * _loc10_);
                  _loc13_ = Math.floor(_loc12_ - _loc12_ * _loc9_);
                  _loc14_ = Math.ceil(_loc12_ + _loc12_ * _loc9_);
                  _loc15_ += "<br>" + _loc13_ + " - " + _loc14_ + " " + param1.sElmt;
               }
            }
            else
            {
               _loc15_ += " Design";
            }
         }
         param1.sDesc = param1.sDesc.replace(regExLineSpace,"\n");
         return _loc15_ + ("</b></font>" + (litePreference.data.bDebugger ? "Item ID: " + param1.ItemID + "<br>" : "") + "<br>" + param1.sDesc + "<br>");
      }
      
      public function getItemInfoStringB(param1:Object) : String
      {
         var _loc2_:int = 0;
         var _loc3_:* = undefined;
         var _loc4_:int = 0;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         _loc6_ = "<font size=\'12\'><b>" + param1.sName + "</b></font><br>";
         if(!validateArmor(param1) && param1.iClass > 0)
         {
            _loc6_ += "<font size=\'10\' color=\'#CC0000\'>";
            _loc2_ = getRankFromPoints(param1.iReqCP);
            _loc3_ = param1.iReqCP - arrRanks[_loc2_ - 1];
            if(_loc3_ > 0)
            {
               _loc6_ += "Requires " + _loc3_ + " Class Points on " + param1.sClass + ", Rank " + _loc2_ + ".";
            }
            else
            {
               _loc6_ += "Requires " + param1.sClass + ", Rank " + _loc2_ + ".";
            }
            _loc6_ += "</font><br>";
         }
         if(param1.FactionID > 1 && world.myAvatar.getRep(param1.FactionID) < param1.iReqRep)
         {
            _loc6_ += "<font size=\'10\' color=\'#CC0000\'>";
            _loc4_ = getRankFromPoints(param1.iReqRep);
            _loc5_ = param1.iReqRep - arrRanks[_loc2_ - 1];
            if(_loc5_ > 0)
            {
               _loc6_ += "Requires " + _loc5_ + " Reputation on " + param1.sFaction + ", Rank " + _loc4_ + ".";
            }
            else
            {
               _loc6_ += "Requires " + param1.sFaction + ", Rank " + _loc4_ + ".";
            }
            _loc6_ += "</font><br>";
         }
         if(param1.iQSindex >= 0 && world.getQuestValue(param1.iQSindex) < int(param1.iQSvalue))
         {
            _loc6_ += "<font size=\'11\' color=\'#CC0000\'>Requires completion of quest \"" + param1.sQuest + "\".</font><br>";
         }
         if(param1.sMeta != null && getDisplaysType(param1) == "Pet" && param1.sMeta.indexOf("Necromancer") > -1)
         {
            _loc6_ += "<font color=\'#00CCFF\'><b>Battle " + getDisplaysType(param1);
         }
         else
         {
            _loc6_ += "<font color=\'#00CCFF\'><b>" + getDisplaysType(param1);
         }
         if(param1.sType.toLowerCase() == "enhancement")
         {
            _loc6_ += ", Level " + param1.iLvl;
         }
         if(param1.sES != "None" && param1.sES != "co" && param1.sES != "pe" && param1.sES != "mi")
         {
            if(param1.EnhID > 0)
            {
               _loc6_ += ", Level " + param1.EnhLvl;
               if(param1.sES == "ar")
               {
                  _loc6_ += "<br>Rank " + getRankFromPoints(param1.iQty);
               }
            }
            else if(param1.sType.toLowerCase() != "enhancement")
            {
               _loc6_ += " Design";
            }
         }
         if(param1.iStk > 1)
         {
            _loc6_ += " - " + param1.iQty + "/" + param1.iStk;
         }
         if(param1.sES == "Weapon" || param1.sES == "co" || param1.sES == "he" || param1.sES == "ba" || param1.sES == "pe" || param1.sES == "am" || param1.sES == "mi" || param1.sES == "hi" || param1.sES == "ho")
         {
            if(param1.sType.toLowerCase() != "enhancement")
            {
               _loc6_ += "<br>" + getRarityString(param1.iRty) + " Rarity";
            }
         }
         if(param1.sType.toLowerCase() != "enhancement")
         {
            param1.sDesc = param1.sDesc.replace(regExLineSpace,"\n");
            _loc6_ += "</b></font><br><font size=\'10\' color=\'#FFFFFF\'>" + (litePreference.data.bDebugger ? "Item ID: " + param1.ItemID + "<br>" : "") + param1.sDesc + "<br></font>";
         }
         else
         {
            _loc6_ += "</b></font><br><font size=\'10\' color=\'#FFFFFF\'>";
            _loc6_ = _loc6_ + "Enhancements are special items which can apply stats to your weapons and armor. Select a weapon or armor item from the list on the right, and click the <font color=\'#00CCFF\'>\"Enhancements\"</font> button that appears below its preview.";
         }
         return _loc6_;
      }
      
      public function getIconByType(param1:String) : String
      {
         var _loc2_:* = undefined;
         _loc2_ = "";
         switch(param1.toLowerCase())
         {
            case "axe":
            case "bow":
            case "dagger":
            case "gun":
            case "mace":
            case "polearm":
            case "staff":
            case "sword":
            case "wand":
            case "armor":
               _loc2_ = "iw" + param1.toLowerCase();
               break;
            case "cape":
            case "helm":
            case "pet":
            case "class":
               _loc2_ = "ii" + param1.toLowerCase();
               break;
            default:
               _loc2_ = "iibag";
         }
         return _loc2_;
      }
      
      public function getIconBySlot(param1:String) : String
      {
         var _loc2_:* = undefined;
         _loc2_ = "";
         switch(param1.toLowerCase())
         {
            case "weapon":
               _loc2_ = "iwsword";
               break;
            case "back":
            case "ba":
               _loc2_ = "iicape";
               break;
            case "head":
            case "he":
               _loc2_ = "iihelm";
               break;
            case "armor":
            case "ar":
               _loc2_ = "iiclass";
               break;
            case "class":
               _loc2_ = "iiclass";
               break;
            case "pet":
            case "pe":
               _loc2_ = "iipet";
               break;
            default:
               _loc2_ = "iibag";
         }
         return _loc2_;
      }
      
      public function getDisplaysType(param1:Object) : *
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         _loc2_ = param1.sType != null ? param1.sType : "Unknown";
         _loc3_ = _loc2_.toLowerCase();
         if(_loc3_ == "clientuse" || _loc3_ == "serveruse")
         {
            _loc2_ = "Item";
         }
         if(_loc3_ == "misc")
         {
            _loc2_ = "Ground";
         }
         return _loc2_;
      }
      
      public function stringToDate(param1:String) : Date
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         _loc2_ = Number(param1.substr(0,4));
         _loc3_ = Number(param1.substr(5,2)) - 1;
         _loc4_ = Number(param1.substr(8,2));
         _loc5_ = Number(param1.substr(11,2));
         _loc6_ = Number(param1.substr(14,2));
         _loc7_ = Number(param1.substr(17));
         return new Date(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_);
      }
      
      internal function traceObject(param1:*, param2:* = 1) : *
      {
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         _loc5_ = "";
         while(_loc5_.length < param2)
         {
            _loc5_ += " ";
         }
         param2++;
         if(typeof param1 == "object" && param1.length != null)
         {
            _loc3_ = 0;
            while(_loc3_ < param1.length)
            {
               _loc3_++;
            }
         }
         else
         {
            for(_loc4_ in param1)
            {
               if(typeof param1[_loc4_] == "object")
               {
                  traceObject(param1[_loc4_],param2);
               }
            }
         }
      }
      
      public function max(param1:int, param2:int) : int
      {
         if(param1 > param2)
         {
            return param1;
         }
         return param2;
      }
      
      public function clamp(param1:Number, param2:Number, param3:Number) : Number
      {
         if(param1 < param2)
         {
            return param2;
         }
         if(param1 > param3)
         {
            return param3;
         }
         return param1;
      }
      
      public function isValidEmail(param1:String) : Boolean
      {
         return Boolean(param1.match(EMAIL_REGEX));
      }
      
      public function closeToolTip() : void
      {
         var _loc1_:* = undefined;
         try
         {
            _loc1_ = MovieClip(stage.getChildAt(0)).ui.ToolTip;
            _loc1_.close();
         }
         catch(e:Error)
         {
         }
      }
      
      public function updateIcons(param1:Array, param2:Array, param3:Object = null) : *
      {
         var _loc4_:MovieClip = null;
         var _loc5_:Class = null;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         var _loc10_:* = undefined;
         var _loc11_:* = undefined;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         _loc12_ = 0;
         while(_loc12_ < param1.length)
         {
            _loc4_ = param1[_loc12_];
            _loc4_.cnt.removeChildAt(0);
            _loc4_.item = param3;
            if(_loc4_.item == null)
            {
               _loc4_.tQty.visible = false;
            }
            while(_loc13_ < param2.length)
            {
               _loc5_ = world.getClass(param2[_loc13_]) as Class;
               _loc6_ = new _loc5_();
               _loc7_ = _loc4_.cnt.addChild(_loc6_);
               _loc8_ = int(42 - 8 + 4 * _loc13_);
               _loc9_ = int(39 - 8 + 4 * _loc13_);
               _loc10_ = _loc7_.width;
               _loc11_ = _loc7_.height;
               if(_loc10_ > _loc11_)
               {
                  _loc7_.scaleX = _loc7_.scaleY = _loc8_ / _loc10_;
               }
               else
               {
                  _loc7_.scaleX = _loc7_.scaleY = _loc9_ / _loc11_;
               }
               _loc7_.x = _loc4_.bg.width / 2 - _loc7_.width / 2;
               _loc7_.y = _loc4_.bg.height / 2 - _loc7_.height / 2;
               _loc13_++;
            }
            _loc12_++;
         }
      }
      
      public function updateItemSkill() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < world.actions.active.length)
         {
            if(Boolean(world.actions.active[_loc1_]) && world.actions.active[_loc1_].ref == "i1")
            {
               updateActionObjIcon(world.actions.active[_loc1_]);
               return;
            }
            _loc1_++;
         }
      }
      
      public function updateActionObjIcon(param1:Object) : void
      {
         var _loc2_:MovieClip = null;
         var _loc3_:Object = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Array = null;
         var _loc7_:* = undefined;
         _loc6_ = world.getActIcons(param1);
         _loc7_ = 0;
         while(_loc7_ < _loc6_.length)
         {
            _loc2_ = _loc6_[_loc7_];
            _loc3_ = _loc2_.item;
            if(_loc3_ != null)
            {
               _loc4_ = 0;
               while(_loc5_ < world.myAvatar.items.length)
               {
                  if(world.myAvatar.items[_loc5_].ItemID == _loc3_.ItemID)
                  {
                     _loc4_ = int(world.myAvatar.items[_loc5_].iQty);
                  }
                  _loc5_++;
               }
               if(_loc4_ > 0)
               {
                  _loc2_.tQty.visible = true;
                  _loc2_.tQty.text = _loc4_;
               }
               else
               {
                  world.unequipUseableItem(_loc3_);
               }
            }
            _loc7_++;
         }
      }
      
      public function drawChainsSmooth(param1:Array, param2:int, param3:MovieClip) : void
      {
         var _loc4_:Point = null;
         var _loc5_:Point = null;
         var _loc6_:int = 0;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:Point = null;
         var _loc12_:Array = null;
         var _loc13_:MovieClip = null;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         _loc6_ = 1;
         while(_loc6_ < param1.length)
         {
            _loc4_ = new Point(0,0);
            _loc5_ = new Point(0,0);
            _loc4_ = param1[_loc6_ - 1].localToGlobal(_loc4_);
            _loc5_ = param1[_loc6_].localToGlobal(_loc5_);
            _loc7_ = [];
            _loc8_ = 0;
            _loc9_ = 0;
            _loc10_ = int(Math.ceil(Point.distance(_loc4_,_loc5_) / param2));
            if(_loc10_ % 2 == 1)
            {
               _loc10_ += 1;
            }
            _loc11_ = new Point();
            _loc12_ = [param3.fx0,param3.fx1,param3.fx2];
            _loc14_ = -1;
            _loc8_ = 0;
            while(_loc8_ < _loc12_.length)
            {
               _loc7_ = [];
               _loc14_ = int(Math.random() > 0.5 ? 1 : -1);
               _loc15_ = 0;
               _loc9_ = 1;
               while(_loc9_ < _loc10_)
               {
                  _loc11_ = Point.interpolate(_loc4_,_loc5_,1 - _loc9_ / _loc10_);
                  if(++_loc15_ % 2 == 1)
                  {
                     _loc11_.x += _loc14_ * Math.round(Math.random() * 30);
                     _loc11_.y += _loc14_ * Math.round(Math.random() * 30);
                     _loc14_ = -_loc14_;
                  }
                  _loc7_.push(_loc11_);
                  _loc9_++;
               }
               _loc7_.push(_loc5_);
               _loc13_ = _loc12_[_loc8_];
               _loc13_.graphics.lineStyle(2,16777215,1);
               _loc13_.graphics.moveTo(_loc4_.x,_loc4_.y);
               _loc9_ = 0;
               while(_loc9_ < _loc7_.length)
               {
                  _loc13_.graphics.curveTo(_loc7_[_loc9_].x,_loc7_[_loc9_].y,_loc7_[_loc9_ + 1].x,_loc7_[_loc9_ + 1].y);
                  _loc9_ += 2;
               }
               _loc8_++;
            }
            _loc6_++;
         }
      }
      
      public function drawChainsLinear(param1:Array, param2:int, param3:MovieClip) : void
      {
         var _loc4_:Point = null;
         var _loc5_:Point = null;
         var _loc6_:MovieClip = null;
         var _loc7_:MovieClip = null;
         var _loc8_:int = 0;
         var _loc9_:Array = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:Point = null;
         var _loc14_:Array = null;
         var _loc15_:MovieClip = null;
         _loc8_ = 1;
         while(_loc8_ < param1.length)
         {
            _loc6_ = param1[_loc8_ - 1];
            _loc7_ = param1[_loc8_];
            _loc4_ = new Point(0,-_loc6_.height * 0.5);
            _loc5_ = new Point(0,-_loc7_.height * 0.5);
            _loc4_ = _loc6_.localToGlobal(_loc4_);
            _loc5_ = _loc7_.localToGlobal(_loc5_);
            _loc9_ = [];
            _loc10_ = 0;
            _loc11_ = 0;
            _loc12_ = int(Math.ceil(Point.distance(_loc4_,_loc5_) / param2));
            _loc13_ = new Point();
            _loc14_ = [param3.fx0,param3.fx1,param3.fx2];
            _loc10_ = 0;
            while(_loc10_ < _loc14_.length)
            {
               _loc9_ = [];
               _loc11_ = 1;
               while(_loc11_ < _loc12_)
               {
                  _loc13_ = Point.interpolate(_loc4_,_loc5_,1 - _loc11_ / (_loc12_ + 1));
                  _loc13_.x += Math.round(Math.random() * 25 - 13);
                  _loc13_.y += Math.round(Math.random() * 25 - 13);
                  _loc9_.push(_loc13_);
                  _loc11_++;
               }
               _loc15_ = _loc14_[_loc10_];
               _loc15_.graphics.lineStyle(5,16777215,1);
               _loc15_.graphics.moveTo(_loc4_.x,_loc4_.y);
               _loc11_ = 0;
               while(_loc11_ < _loc9_.length)
               {
                  _loc15_.graphics.lineTo(_loc9_[_loc11_].x,_loc9_[_loc11_].y);
                  _loc11_++;
               }
               _loc15_.graphics.lineTo(_loc5_.x,_loc5_.y);
               _loc10_++;
            }
            _loc8_++;
         }
      }
      
      public function drawFunnel(param1:Array, param2:MovieClip) : void
      {
         var _loc3_:MovieClip = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         param2.numLines = 3;
         param2.lineThickness = 3;
         param2.lineColors = [10027178,0,2228326];
         param2.glowColors = [0];
         param2.glowStrength = 4;
         param2.glowSize = 4;
         param2.dur = 500;
         param2.del = 100;
         param2.p1StartingValue = 0.12;
         param2.p2StartingValue = 0.24;
         param2.p3StartingValue = 0.36;
         param2.p1EndingValue = 0.66;
         param2.p2EndingValue = 0.825;
         param2.p3EndingValue = 0.99;
         param2.p1ScaleFactor = 0.5;
         param2.p3ScaleFactor = 0.5;
         param2.easingExponent = 1.5;
         param2.targetMCs = param1;
         param2.filterArr = [];
         param2.fxArr = [];
         param2.ts = new Date().getTime();
         _loc4_ = 0;
         while(_loc4_ < param2.glowColors.length)
         {
            param2.filterArr.push([new GlowFilter(param2.glowColors[_loc4_],1,param2.glowSize,param2.glowSize,param2.glowStrength,1,false,false)]);
            _loc4_++;
         }
         _loc4_ = 0;
         _loc5_ = 0;
         while(_loc6_ < param2.numLines)
         {
            _loc3_ = param2.addChild(new MovieClip()) as MovieClip;
            _loc3_.filters = param2.filterArr[_loc4_];
            if(++_loc4_ >= param2.glowColors.length)
            {
               _loc4_ = 0;
            }
            _loc3_.lineColor = param2.lineColors[_loc5_];
            if(++_loc5_ >= param2.lineColors.length)
            {
               _loc5_ = 0;
            }
            param2.fxArr.push(_loc3_);
            _loc6_++;
         }
         param2.addEventListener(Event.ENTER_FRAME,funnelEF,false,0,true);
      }
      
      internal function funnelEF(param1:Event) : void
      {
         var _loc2_:MovieClip = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Point = null;
         var _loc6_:Point = null;
         var _loc7_:Point = null;
         var _loc8_:Point = null;
         var _loc9_:Point = null;
         var _loc10_:Point = null;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:MovieClip = null;
         var _loc15_:Number = NaN;
         var _loc16_:Point = null;
         var _loc17_:Point = null;
         var _loc18_:Point = null;
         var _loc19_:int = 0;
         var _loc20_:MovieClip = null;
         var _loc21_:MovieClip = null;
         var _loc22_:Point = null;
         var _loc23_:Point = null;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:Number = NaN;
         var _loc30_:int = 0;
         _loc14_ = MovieClip(param1.currentTarget);
         _loc15_ = Number(new Date().getTime());
         _loc16_ = new Point();
         _loc17_ = new Point();
         _loc18_ = new Point();
         _loc19_ = 1;
         _loc20_ = _loc14_.targetMCs[0];
         _loc21_ = _loc14_.targetMCs[1];
         _loc22_ = _loc20_.localToGlobal(new Point(0,-_loc20_.height / 2));
         _loc23_ = _loc21_.localToGlobal(new Point(0,-_loc21_.height / 2));
         var _loc24_:* = _loc21_.width;
         var _loc25_:* = _loc21_.height;
         var _loc26_:int = -1;
         _loc29_ = Math.atan2(_loc22_.y - _loc23_.y,_loc22_.x - _loc23_.x);
         _loc29_ = _loc29_ - Math.PI / 2;
         while(_loc30_ < _loc14_.fxArr.length)
         {
            _loc2_ = _loc14_.fxArr[_loc30_];
            _loc4_ = Number(_loc14_.ts);
            _loc3_ = _loc15_ - _loc30_ * _loc14_.del;
            if(_loc3_ > _loc4_ + _loc14_.dur)
            {
               if(_loc2_.visible)
               {
                  _loc2_.visible = false;
                  _loc2_.graphics.clear();
               }
               if(_loc30_ == _loc14_.fxArr.length - 1)
               {
                  _loc14_.removeEventListener(Event.ENTER_FRAME,funnelEF);
                  if(_loc14_.parent != null)
                  {
                     _loc14_.parent.removeChild(_loc14_);
                  }
               }
            }
            else if(_loc3_ >= _loc14_.ts)
            {
               _loc12_ = (_loc3_ - _loc4_) / _loc14_.dur;
               _loc12_ = Math.pow(1 - _loc12_,_loc14_.easingExponent);
               _loc19_ = _loc30_ % 2 == 0 ? 1 : -1;
               _loc5_ = new Point(Point.interpolate(_loc22_,_loc23_,_loc14_.p1StartingValue).x + Point.polar(_loc19_ * (_loc21_.height / _loc14_.p1ScaleFactor),_loc29_).x,Point.interpolate(_loc22_,_loc23_,_loc14_.p1StartingValue).y + Point.polar(_loc19_ * (_loc21_.height / _loc14_.p1ScaleFactor),_loc29_).y);
               _loc6_ = new Point(Point.interpolate(_loc22_,_loc23_,_loc14_.p1EndingValue).x,Point.interpolate(_loc22_,_loc23_,_loc14_.p1EndingValue).y);
               _loc7_ = new Point(Point.interpolate(_loc22_,_loc23_,_loc14_.p2StartingValue).x,_loc23_.y);
               _loc8_ = new Point(Point.interpolate(_loc22_,_loc23_,_loc14_.p2EndingValue).x,Point.interpolate(_loc22_,_loc23_,_loc14_.p2EndingValue).y);
               _loc9_ = new Point(Point.interpolate(_loc22_,_loc23_,_loc14_.p3StartingValue).x + Point.polar(-_loc19_ * (_loc21_.height / _loc14_.p3ScaleFactor),_loc29_).x,Point.interpolate(_loc22_,_loc23_,_loc14_.p3StartingValue).y + Point.polar(-_loc19_ * (_loc21_.height / _loc14_.p3ScaleFactor),_loc29_).y);
               _loc10_ = new Point(Point.interpolate(_loc22_,_loc23_,_loc14_.p3EndingValue).x,Point.interpolate(_loc22_,_loc23_,_loc14_.p3EndingValue).y);
               _loc16_ = Point.interpolate(_loc5_,_loc6_,_loc12_);
               _loc17_ = Point.interpolate(_loc7_,_loc8_,_loc12_);
               _loc18_ = Point.interpolate(_loc9_,_loc10_,_loc12_);
               _loc11_ = Number(_loc2_.lineColor);
               _loc2_.graphics.clear();
               _loc2_.graphics.lineStyle(_loc14_.lineThickness,_loc11_,1);
               _loc2_.graphics.moveTo(_loc23_.x,_loc23_.y);
               _loc2_.graphics.curveTo(_loc16_.x,_loc16_.y,_loc17_.x,_loc17_.y);
               _loc2_.graphics.curveTo(_loc18_.x,_loc18_.y,_loc22_.x,_loc22_.y);
               _loc13_ = Math.cos((_loc3_ - _loc4_) / _loc14_.dur * Math.PI * 2);
               _loc13_ = _loc13_ / 2 + 0.5;
               _loc13_ = 1 - _loc13_;
               _loc2_.alpha = _loc13_;
            }
            _loc30_++;
         }
      }
      
      public function updateCoreValues(param1:Object) : void
      {
         if(param1.intLevelCap != null)
         {
            intLevelCap = param1.intLevelCap;
         }
         if(param1.PCstBase != null)
         {
            PCstBase = param1.PCstBase;
         }
         if(param1.PCstRatio != null)
         {
            PCstRatio = param1.PCstRatio;
         }
         if(param1.PCstGoal != null)
         {
            PCstGoal = param1.PCstGoal;
         }
         if(param1.GstBase != null)
         {
            GstBase = param1.GstBase;
         }
         if(param1.GstRatio != null)
         {
            GstRatio = param1.GstRatio;
         }
         if(param1.GstGoal != null)
         {
            GstGoal = param1.GstGoal;
         }
         if(param1.PChpBase1 != null)
         {
            PChpBase1 = param1.PChpBase1;
         }
         if(param1.PChpBase100 != null)
         {
            PChpBase100 = param1.PChpBase100;
         }
         if(param1.PChpGoal1 != null)
         {
            PChpGoal1 = param1.PChpGoal1;
         }
         if(param1.PChpGoal100 != null)
         {
            PChpGoal100 = param1.PChpGoal100;
         }
         if(param1.PChpDelta != null)
         {
            PChpDelta = param1.PChpDelta;
         }
         if(param1.intHPperEND != null)
         {
            intHPperEND = param1.intHPperEND;
         }
         if(param1.intAPtoDPS != null)
         {
            intAPtoDPS = param1.intAPtoDPS;
         }
         if(param1.intSPtoDPS != null)
         {
            intSPtoDPS = param1.intSPtoDPS;
         }
         if(param1.bigNumberBase != null)
         {
            bigNumberBase = param1.bigNumberBase;
         }
         if(param1.resistRating != null)
         {
            resistRating = param1.resistRating;
         }
         if(param1.modRating != null)
         {
            modRating = param1.modRating;
         }
         if(param1.baseDodge != null)
         {
            baseDodge = param1.baseDodge;
         }
         if(param1.baseBlock != null)
         {
            baseBlock = param1.baseBlock;
         }
         if(param1.baseParry != null)
         {
            baseParry = param1.baseParry;
         }
         if(param1.baseCrit != null)
         {
            baseCrit = param1.baseCrit;
         }
         if(param1.baseHit != null)
         {
            baseHit = param1.baseHit;
         }
         if(param1.baseHaste != null)
         {
            baseHaste = param1.baseHaste;
         }
         if(param1.baseMiss != null)
         {
            baseMiss = param1.baseMiss;
         }
         if(param1.baseResist != null)
         {
            baseResist = param1.baseResist;
         }
         if(param1.baseCritValue != null)
         {
            baseCritValue = param1.baseCritValue;
         }
         if(param1.baseBlockValue != null)
         {
            baseBlockValue = param1.baseBlockValue;
         }
         if(param1.baseResistValue != null)
         {
            baseResistValue = param1.baseResistValue;
         }
         if(param1.baseEventValue != null)
         {
            baseEventValue = param1.baseEventValue;
         }
         if(param1.PCDPSMod != null)
         {
            PCDPSMod = param1.PCDPSMod;
         }
         if(param1.curveExponent != null)
         {
            curveExponent = param1.curveExponent;
         }
         if(param1.statsExponent != null)
         {
            statsExponent = param1.statsExponent;
         }
      }
      
      internal function spaceBy(param1:int, param2:int) : String
      {
         var _loc3_:* = null;
         _loc3_ = String(param1);
         while(_loc3_.length < param2)
         {
            _loc3_ += " ";
         }
         return _loc3_;
      }
      
      internal function spaceNumBy(param1:Number, param2:int) : String
      {
         var _loc3_:* = null;
         _loc3_ = param1.toString();
         _loc3_ = _loc3_.substr(0,param2);
         while(_loc3_.length < param2)
         {
            _loc3_ += " ";
         }
         return _loc3_;
      }
      
      internal function showRatings() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         var _loc10_:* = undefined;
         var _loc11_:* = undefined;
         var _loc12_:* = undefined;
         var _loc13_:* = undefined;
         var _loc14_:* = undefined;
         var _loc15_:* = undefined;
         _loc12_ = world.myAvatar.dataLeaf;
         _loc13_ = "";
         _loc14_ = 1;
         _loc15_ = 0;
         var _loc16_:* = 0;
         _loc14_ = 1;
         while(_loc14_ <= 35)
         {
            if(_loc14_ == 0)
            {
               _loc14_ = 1;
            }
            _loc1_ = getInnateStats(_loc14_);
            _loc2_ = getIBudget(_loc14_,1);
            _loc3_ = -1;
            _loc4_ = -1;
            _loc5_ = -1;
            _loc6_ = -1;
            _loc7_ = _loc12_.sCat;
            _loc8_ = copyObj(_loc12_.sta);
            resetTableValues(_loc8_);
            _loc9_ = getBaseHPByLevel(_loc14_);
            _loc10_ = _loc9_ / 20 * 0.7;
            _loc11_ = 2.25 * _loc10_ / (100 / intAPtoDPS) / 2;
            _loc15_ = 0;
            while(_loc15_ < stats.length)
            {
               _loc13_ = stats[_loc15_];
               _loc6_ = _loc8_["$" + _loc13_];
               switch(_loc13_)
               {
                  case "STR":
                     _loc3_ = _loc11_;
                     _loc8_.$ap += _loc6_ * 2;
                     _loc8_.$tcr += _loc6_ / _loc3_ / 100 * 0.4;
                     break;
               }
               _loc15_++;
            }
            _loc14_ += 1;
         }
      }
      
      public function applyCoreStatRatings(param1:Object, param2:Object) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = undefined;
         var _loc5_:Object = null;
         var _loc6_:int = 0;
         var _loc7_:* = undefined;
         var _loc9_:Number = NaN;
         var _loc12_:int = 0;
         var _loc13_:String = null;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:* = undefined;
         var _loc17_:Number = NaN;
         var _loc18_:int = 0;
         _loc3_ = 1;
         _loc4_ = 100;
         _loc5_ = world.myAvatar.getEquippedItemBySlot("Weapon");
         if(_loc5_ != null)
         {
            if(_loc5_.EnhLvl != null)
            {
               _loc3_ = int(_loc5_.EnhLvl);
            }
            if(_loc5_.EnhDPS != null)
            {
               _loc4_ = Number(_loc5_.EnhDPS);
            }
            if(_loc4_ == 0)
            {
               _loc4_ = 100;
            }
         }
         _loc4_ /= 100;
         _loc6_ = int(param2.intLevel);
         _loc7_ = "";
         var _loc8_:int = getInnateStats(_loc6_);
         _loc9_ = -1;
         var _loc10_:Number = -1;
         var _loc11_:Number = -1;
         _loc12_ = -1;
         _loc13_ = world.myAvatar.objData.sClassCat;
         _loc14_ = getBaseHPByLevel(_loc6_);
         _loc15_ = 20;
         _loc16_ = _loc14_ / 20 * 0.7;
         _loc17_ = 2.25 * _loc16_ / (100 / intAPtoDPS) / 2;
         resetTableValues(param1);
         while(_loc18_ < stats.length)
         {
            _loc7_ = stats[_loc18_];
            _loc12_ = param1["_" + _loc7_] + param1["^" + _loc7_];
            switch(_loc7_)
            {
               case "STR":
                  _loc9_ = _loc17_;
                  if(_loc13_ == "M1")
                  {
                     param1.$sbm -= _loc12_ / _loc9_ / 100 * 0.3;
                  }
                  if(_loc13_ == "S1")
                  {
                     param1.$ap += Math.round(_loc12_ * 1.4);
                  }
                  else
                  {
                     param1.$ap += _loc12_ * 2;
                  }
                  if(_loc13_ == "M1" || _loc13_ == "M2" || _loc13_ == "M3" || _loc13_ == "M4" || _loc13_ == "S1")
                  {
                     if(_loc13_ == "M4")
                     {
                        param1.$tcr += _loc12_ / _loc9_ / 100 * 0.7;
                     }
                     else
                     {
                        param1.$tcr += _loc12_ / _loc9_ / 100 * 0.4;
                     }
                  }
                  break;
               case "INT":
                  _loc9_ = _loc17_;
                  param1.$cmi -= _loc12_ / _loc9_ / 100;
                  if(_loc13_.substr(0,1) == "C" || _loc13_ == "M3")
                  {
                     param1.$cmo += _loc12_ / _loc9_ / 100;
                  }
                  if(_loc13_ == "S1")
                  {
                     param1.$sp += Math.round(_loc12_ * 1.4);
                  }
                  else
                  {
                     param1.$sp += _loc12_ * 2;
                  }
                  if(_loc13_ == "C1" || _loc13_ == "C2" || _loc13_ == "C3" || _loc13_ == "M3" || _loc13_ == "S1")
                  {
                     if(_loc13_ == "C2")
                     {
                        param1.$tha += _loc12_ / _loc9_ / 100 * 0.5;
                     }
                     else
                     {
                        param1.$tha += _loc12_ / _loc9_ / 100 * 0.3;
                     }
                  }
                  break;
               case "DEX":
                  _loc9_ = _loc17_;
                  if(_loc13_ == "M1" || _loc13_ == "M2" || _loc13_ == "M3" || _loc13_ == "M4" || _loc13_ == "S1")
                  {
                     if(_loc13_.substr(0,1) != "C")
                     {
                        param1.$thi += _loc12_ / _loc9_ / 100 * 0.2;
                     }
                     if(_loc13_ == "M2" || _loc13_ == "M4")
                     {
                        param1.$tha += _loc12_ / _loc9_ / 100 * 0.5;
                     }
                     else
                     {
                        param1.$tha += _loc12_ / _loc9_ / 100 * 0.3;
                     }
                     if(_loc13_ == "M1")
                     {
                        if(param1._tbl > 0.01)
                        {
                           param1.$tbl += _loc12_ / _loc9_ / 100 * 0.5;
                        }
                     }
                  }
                  if(_loc13_ != "M2" && _loc13_ != "M3")
                  {
                     param1.$tdo += _loc12_ / _loc9_ / 100 * 0.3;
                  }
                  else
                  {
                     param1.$tdo += _loc12_ / _loc9_ / 100 * 0.5;
                  }
                  break;
               case "WIS":
                  _loc9_ = _loc17_;
                  if(_loc13_ == "C1" || _loc13_ == "C2" || _loc13_ == "C3" || _loc13_ == "S1")
                  {
                     if(_loc13_ == "C1")
                     {
                        param1.$tcr += _loc12_ / _loc9_ / 100 * 0.7;
                     }
                     else
                     {
                        param1.$tcr += _loc12_ / _loc9_ / 100 * 0.4;
                     }
                     param1.$thi += _loc12_ / _loc9_ / 100 * 0.2;
                  }
                  param1.$tdo += _loc12_ / _loc9_ / 100 * 0.3;
                  break;
               case "LCK":
                  _loc9_ = _loc17_;
                  param1.$sem += _loc12_ / _loc9_ / 100 * 2;
                  if(_loc13_ == "S1")
                  {
                     param1.$ap += Math.round(_loc12_ * 1);
                     param1.$sp += Math.round(_loc12_ * 1);
                     param1.$tcr += _loc12_ / _loc9_ / 100 * 0.3;
                     param1.$thi += _loc12_ / _loc9_ / 100 * 0.1;
                     param1.$tha += _loc12_ / _loc9_ / 100 * 0.3;
                     param1.$tdo += _loc12_ / _loc9_ / 100 * 0.25;
                     param1.$scm += _loc12_ / _loc9_ / 100 * 2.5;
                  }
                  else
                  {
                     if(_loc13_ == "M1" || _loc13_ == "M2" || _loc13_ == "M3" || _loc13_ == "M4")
                     {
                        param1.$ap += Math.round(_loc12_ * 0.7);
                     }
                     if(_loc13_ == "C1" || _loc13_ == "C2" || _loc13_ == "C3" || _loc13_ == "M3")
                     {
                        param1.$sp += Math.round(_loc12_ * 0.7);
                     }
                     param1.$tcr += _loc12_ / _loc9_ / 100 * 0.2;
                     param1.$thi += _loc12_ / _loc9_ / 100 * 0.1;
                     param1.$tha += _loc12_ / _loc9_ / 100 * 0.1;
                     param1.$tdo += _loc12_ / _loc9_ / 100 * 0.1;
                     param1.$scm += _loc12_ / _loc9_ / 100 * 5;
                  }
                  break;
            }
            _loc18_++;
         }
         param1.wDPS = Math.round(getBaseHPByLevel(_loc3_) / _loc15_ * _loc4_ * PCDPSMod) + Math.round(param1.$ap / intAPtoDPS);
         param1.mDPS = Math.round(getBaseHPByLevel(_loc3_) / _loc15_ * _loc4_ * PCDPSMod) + Math.round(param1.$sp / intSPtoDPS);
      }
      
      public function coeffToPct(param1:Number) : String
      {
         return Number(param1 * 100).toFixed(2);
      }
      
      public function getIBudget(param1:int, param2:int) : int
      {
         if(param1 < 1)
         {
            param1 = 1;
         }
         if(param1 > intLevelCap)
         {
            param1 = intLevelCap;
         }
         if(param2 < 1)
         {
            param2 = 1;
         }
         param1 = Math.round(param1 + param2 - 1);
         return Math.round(GstBase + Math.pow((param1 - 1) / (intLevelCap - 1),statsExponent) * (GstGoal - GstBase));
      }
      
      public function getInnateStats(param1:int) : int
      {
         if(param1 < 1)
         {
            param1 = 1;
         }
         if(param1 > intLevelCap)
         {
            param1 = intLevelCap;
         }
         return Math.round(PCstBase + Math.pow((param1 - 1) / (intLevelCap - 1),statsExponent) * (PCstGoal - PCstBase));
      }
      
      public function getBaseHPByLevel(param1:*) : *
      {
         if(param1 < 1)
         {
            param1 = 1;
         }
         if(param1 > intLevelCap)
         {
            param1 = intLevelCap;
         }
         return Math.round(PChpBase1 + Math.pow((param1 - 1) / (intLevelCap - 1),curveExponent) * PChpDelta);
      }
      
      public function catCodeToName(param1:String) : String
      {
         switch(param1)
         {
            case "M1":
               return "Fighter";
            case "M2":
               return "Thief";
            case "M3":
               return "Hybrid";
            case "M4":
               return "Armsman";
            case "C1":
               return "Wizard";
            case "C2":
               return "Healer";
            case "C3":
               return "spellbreaker";
            case "S1":
               return "Lucky";
            default:
               return null;
         }
      }
      
      public function resetTableValues(param1:Object) : void
      {
         param1._ap = 0;
         param1.$ap = 0;
         param1._sp = 0;
         param1.$sp = 0;
         param1._tbl = 0;
         param1._tpa = 0;
         param1._tdo = 0;
         param1._tcr = 0;
         param1._thi = 0;
         param1._tha = 0;
         param1._tre = 0;
         param1.$tbl = baseBlock;
         param1.$tpa = baseParry;
         param1.$tdo = baseDodge;
         param1.$tcr = baseCrit;
         param1.$thi = baseHit;
         param1.$tha = baseHaste;
         param1.$tre = baseResist;
         param1._cpo = 1;
         param1._cpi = 1;
         param1._cao = 1;
         param1._cai = 1;
         param1._cmo = 1;
         param1._cmi = 1;
         param1._cdo = 1;
         param1._cdi = 1;
         param1._cho = 1;
         param1._chi = 1;
         param1._cmc = 1;
         param1.$cpo = 1;
         param1.$cpi = 1;
         param1.$cao = 1;
         param1.$cai = 1;
         param1.$cmo = 1;
         param1.$cmi = 1;
         param1.$cdo = 1;
         param1.$cdi = 1;
         param1.$cho = 1;
         param1.$chi = 1;
         param1.$cmc = 1;
         param1._scm = baseCritValue;
         param1._sbm = baseBlockValue;
         param1._srm = baseResistValue;
         param1._sem = baseEventValue;
         param1.$scm = baseCritValue;
         param1.$sbm = baseBlockValue;
         param1.$srm = baseResistValue;
         param1.$sem = baseEventValue;
         param1._shb = 0;
         param1._smb = 0;
         param1.$shb = 0;
         param1.$smb = 0;
      }
      
      public function getCategoryStats(param1:String, param2:int) : Object
      {
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:int = 0;
         _loc3_ = getInnateStats(param2);
         _loc4_ = classCatMap[param1].ratios;
         _loc5_ = {};
         _loc6_ = "";
         while(_loc7_ < stats.length)
         {
            _loc6_ = stats[_loc7_];
            _loc5_[_loc6_] = Math.round(_loc4_[_loc7_] * _loc3_);
            _loc7_++;
         }
         return _loc5_;
      }
      
      public function applyAuraEffect(param1:*, param2:*) : *
      {
         switch(param1.typ)
         {
            case "+":
               param2["$" + param1.sta] += Number(param1.val);
               return;
            case "-":
               param2["$" + param1.sta] -= Number(param1.val);
               return;
            case "*":
               param2["$" + param1.sta] = Math.round(param2["$" + param1.sta] * Number(param1.val));
               return;
            default:
               return;
         }
      }
      
      public function removeAuraEffect(param1:*, param2:*) : *
      {
         switch(param1.typ)
         {
            case "+":
               param2["$" + param1.sta] -= Number(param1.val);
               return;
            case "-":
               param2["$" + param1.sta] += Number(param1.val);
               return;
            case "*":
               param2["$" + param1.sta] = Math.round(param2["$" + param1.sta] / Number(param1.val));
         }
      }
      
      public function getStatsA(param1:Object, param2:String) : Object
      {
         var _loc3_:Object = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         var _loc10_:* = undefined;
         var _loc11_:* = undefined;
         var _loc12_:* = undefined;
         var _loc13_:int = 0;
         var _loc14_:Object = null;
         _loc4_ = param1.sType.toLowerCase() == "enhancement" ? int(param1.iLvl) : int(param1.EnhLvl);
         _loc5_ = param1.sType.toLowerCase() == "enhancement" ? int(param1.iRty) : int(param1.EnhRty);
         _loc6_ = Math.round(getIBudget(_loc4_,_loc5_) * ratiosBySlot[param2]);
         _loc7_ = -1;
         _loc8_ = ["iEND","iSTR","iINT","iDEX","iWIS","iLCK"];
         _loc9_ = 0;
         _loc10_ = "";
         _loc11_ = {};
         _loc12_ = 0;
         _loc14_ = {};
         world.initPatternTree();
         if(param1.PatternID != null)
         {
            _loc3_ = world.enhPatternTree[param1.PatternID];
         }
         if(param1.EnhPatternID != null)
         {
            _loc3_ = world.enhPatternTree[param1.EnhPatternID];
         }
         if(_loc3_ != null)
         {
            _loc13_ = 0;
            while(_loc13_ < stats.length)
            {
               _loc10_ = "i" + stats[_loc13_];
               if(_loc3_[_loc10_] != null)
               {
                  _loc11_[_loc10_] = Math.round(_loc6_ * _loc3_[_loc10_] / 100);
                  _loc12_ += _loc11_[_loc10_];
               }
               _loc13_++;
            }
            _loc9_ = 0;
            while(_loc12_ < _loc6_)
            {
               _loc10_ = _loc8_[_loc9_];
               if(_loc11_[_loc10_] != null)
               {
                  ++_loc11_[_loc10_];
                  _loc12_++;
               }
               if(++_loc9_ > _loc8_.length - 1)
               {
                  _loc9_ = 0;
               }
            }
            _loc13_ = 0;
            while(_loc13_ < stats.length)
            {
               _loc7_ = _loc11_["i" + stats[_loc13_]];
               if(_loc7_ != null && _loc7_ != "0")
               {
                  _loc14_["$" + stats[_loc13_]] = _loc7_;
               }
               _loc13_++;
            }
         }
         return _loc14_;
      }
      
      public function getDisplayEnhName(param1:Object) : String
      {
         if(Boolean(param1) && Boolean(param1.hasOwnProperty("DIS")))
         {
            switch(param1.sName)
            {
               case "Vim":
               case "Examen":
               case "Pneuma":
               case "Anima":
                  return param1.sName;
               case "Hearty":
                  return "Grimskull";
               default:
                  return "Forge";
            }
         }
         else
         {
            if(param1)
            {
               return param1.sName;
            }
            return "";
         }
      }
      
      public function getDisplayEnhTraitName(param1:Object) : String
      {
         switch(param1.sName)
         {
            case "Vim":
            case "Examen":
               return "Ether";
            case "Pneuma":
            case "Anima":
               return "Clairvoyance";
            default:
               return param1.sName;
         }
      }
      
      public function getFullStatName(param1:String) : String
      {
         var _loc2_:* = undefined;
         _loc2_ = "";
         param1 = param1.toLowerCase();
         if(param1.indexOf("str") > -1)
         {
            _loc2_ = "Strength";
         }
         if(param1.indexOf("int") > -1)
         {
            _loc2_ = "Intellect";
         }
         if(param1.indexOf("dex") > -1)
         {
            _loc2_ = "Dexterity";
         }
         if(param1.indexOf("wis") > -1)
         {
            _loc2_ = "Wisdom";
         }
         if(param1.indexOf("end") > -1)
         {
            _loc2_ = "Endurance";
         }
         if(param1.indexOf("lck") > -1)
         {
            _loc2_ = "Luck";
         }
         if(param1.indexOf("tha") > -1)
         {
            _loc2_ = "Haste";
         }
         if(param1.indexOf("thi") > -1)
         {
            _loc2_ = "Hit";
         }
         if(param1.indexOf("tcr") > -1)
         {
            _loc2_ = "Critcal Hit";
         }
         if(param1.indexOf("tcm") > -1)
         {
            _loc2_ = "Crit Value";
         }
         if(param1.indexOf("tdo") > -1)
         {
            _loc2_ = "Evasion";
         }
         return _loc2_;
      }
      
      public function getRarityString(param1:int) : String
      {
         var _loc2_:Object = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         _loc3_ = [{
            "val":0,
            "sName":"Unknown"
         },{
            "val":10,
            "sName":"Unknown"
         },{
            "val":11,
            "sName":"Common"
         },{
            "val":12,
            "sName":"Weird"
         },{
            "val":13,
            "sName":"Awesome"
         },{
            "val":14,
            "sName":"1% Drop"
         },{
            "val":15,
            "sName":"5% Drop"
         },{
            "val":16,
            "sName":"Boss Drop"
         },{
            "val":17,
            "sName":"Secret"
         },{
            "val":18,
            "sName":"Junk"
         },{
            "val":19,
            "sName":"Impossible"
         },{
            "val":20,
            "sName":"Artifact"
         },{
            "val":21,
            "sName":"Limited Time Drop"
         },{
            "val":68,
            "sName":"New Collection Chest"
         },{
            "val":23,
            "sName":"Crazy"
         },{
            "val":24,
            "sName":"Expensive"
         },{
            "val":30,
            "sName":"Rare"
         },{
            "val":35,
            "sName":"Epic"
         },{
            "val":40,
            "sName":"Import Item"
         },{
            "val":50,
            "sName":"Seasonal Item"
         },{
            "val":55,
            "sName":"Seasonal Rare"
         },{
            "val":60,
            "sName":"Event Item"
         },{
            "val":65,
            "sName":"Event Rare"
         },{
            "val":70,
            "sName":"Limited Rare"
         },{
            "val":75,
            "sName":"Collector\'s Rare"
         },{
            "val":80,
            "sName":"Promotional Item"
         },{
            "val":90,
            "sName":"Ultra Rare"
         },{
            "val":95,
            "sName":"Super Mega Ultra Rare"
         },{
            "val":100,
            "sName":"Legendary Item"
         }];
         _loc4_ = int(_loc3_.length - 1);
         while(_loc4_ > -1)
         {
            _loc2_ = _loc3_[_loc4_];
            if(param1 >= _loc2_.val)
            {
               return _loc2_.sName;
            }
            _loc4_--;
         }
         return "Common";
      }
      
      public function toggleItemEquip(param1:Object) : Boolean
      {
         var _loc2_:* = undefined;
         var _loc3_:Boolean = false;
         _loc2_ = world.getUoLeafById(world.myAvatar.uid);
         if(_loc2_.intState != 1)
         {
            MsgBox.notify("Action cannot be performed during combat!");
         }
         else if(world.bPvP)
         {
            MsgBox.notify("Items may not be equipped or unequipped during a PvP match!");
         }
         else if(param1.bEquip == 1)
         {
            if(param1.sES == "Weapon" || param1.sES == "ar")
            {
               MsgBox.notify("Selected Item cannot be unequipped!");
            }
            else
            {
               _loc3_ = true;
               if(param1.sType.toLowerCase() != "item")
               {
                  world.sendUnequipItemRequest(param1);
               }
               else
               {
                  world.unequipUseableItem(param1);
               }
            }
         }
         else if(param1.bUpg == 1 && !world.myAvatar.isUpgraded())
         {
            showUpgradeWindow();
         }
         else if(int(param1.EnhLvl) > int(world.myAvatar.objData.intLevel))
         {
            MsgBox.notify("Level requirement not met!");
         }
         else if(param1.sType.toLowerCase() != "item" && (param1.sES != "mi" && param1.sES != "co" && param1.sES != "pe" && param1.sES != "am" && param1.EnhID <= 0))
         {
            MsgBox.notify("Selected item requires enhancement!");
         }
         else if(param1.sType.toLowerCase() != "item")
         {
            _loc3_ = world.sendEquipItemRequest(param1);
         }
         else
         {
            _loc3_ = true;
            world.equipUseableItem(param1);
         }
         return _loc3_;
      }
      
      public function tryEnhance(param1:Array, param2:Object, param3:Boolean = false) : void
      {
         if(param1 != null && param2 != null)
         {
            if(param2.iLvl > world.myAvatar.objData.intLevel)
            {
               MsgBox.notify("Level requirement not met!");
            }
            else if(param1.EnhID == param2.ItemID)
            {
               MsgBox.notify("Selected Enhancement already applied to item!");
            }
            else if(param3)
            {
               world.sendEnhItemRequestShop(param1,param2);
            }
            else
            {
               world.sendEnhItemRequestLocal(param1,param2);
            }
         }
      }
      
      public function doIHaveEnhancements() : Boolean
      {
         var _loc1_:Object = null;
         for each(_loc1_ in world.myAvatar.items)
         {
            if(_loc1_.sType.toLowerCase() == "enhancement")
            {
               return true;
            }
         }
         return false;
      }
      
      public function isItemEnhanceable(param1:Object) : Boolean
      {
         return ["Weapon","he","ba","pe","ar"].indexOf(param1.sES) >= 0;
      }
      
      public function resetInvTreeByItemID(param1:int) : *
      {
         var _loc2_:Object = null;
         try
         {
            _loc2_ = world.invTree[param1];
            if("EnhID" in _loc2_)
            {
               _loc2_.EnhID = -1;
            }
            if("EnhRty" in _loc2_)
            {
               _loc2_.EnhRty = -1;
            }
            if("EnhDPS" in _loc2_)
            {
               _loc2_.EnhDPS = -1;
            }
            if("EnhRng" in _loc2_)
            {
               _loc2_.EnhRng = -1;
            }
            if("EnhLvl" in _loc2_)
            {
               _loc2_.EnhLvl = -1;
            }
            if("EnhPatternID" in _loc2_)
            {
               _loc2_.EnhPatternID = -1;
            }
         }
         catch(e:Error)
         {
         }
      }
      
      public function isMergeShop(param1:Object) : Boolean
      {
         var _loc2_:Object = null;
         for each(_loc2_ in param1.items)
         {
            if("turnin" in _loc2_)
            {
               return true;
            }
         }
         return false;
      }
      
      public function recursiveStop(param1:MovieClip) : void
      {
         var _loc2_:DisplayObject = null;
         var _loc3_:int = 0;
         while(_loc3_ < param1.numChildren)
         {
            _loc2_ = param1.getChildAt(_loc3_);
            if(_loc2_ is MovieClip)
            {
               param1 = MovieClip(_loc2_);
               if(param1.totalFrames > 1)
               {
                  param1.gotoAndStop(param1.totalFrames);
               }
               else
               {
                  param1.stop();
               }
               recursiveStop(MovieClip(_loc2_));
            }
            _loc3_++;
         }
      }
      
      public function getTravelMapData() : void
      {
         var _loc1_:String = null;
         var _loc2_:URLLoader = null;
         var _loc3_:URLRequest = null;
         if(ui.getChildByName("travelLoaderMC"))
         {
            return;
         }
         travelLoaderMC = new (world.getClass("mcLoader") as Class)();
         travelLoaderMC.x = 400;
         travelLoaderMC.y = 211;
         travelLoaderMC.name = "travelLoaderMC";
         ui.addChild(travelLoaderMC);
         _loc1_ = "api/data/travelmap?v=" + world.objInfo["sVersion"];
         _loc2_ = new URLLoader();
         if(this.loaderInfo.url.toLowerCase().indexOf("file://") >= 0 || this.loaderInfo.url.toLowerCase().indexOf("cdn.aq.com") >= 0 || this.loaderInfo.url.toLowerCase().indexOf("aqworldscdn.aq.com") >= 0)
         {
            _loc1_ = "https://game.aq.com/game/" + _loc1_;
         }
         else
         {
            _loc1_ = params.sURL + _loc1_;
         }
         _loc3_ = new URLRequest(_loc1_);
         _loc3_.method = URLRequestMethod.GET;
         _loc2_.addEventListener(Event.COMPLETE,onTravelMapComplete,false,0,true);
         _loc2_.addEventListener(ProgressEvent.PROGRESS,onTravelMapProgress,false,0,true);
         _loc2_.addEventListener(IOErrorEvent.IO_ERROR,onTravelError,false,0,true);
         _loc2_.load(_loc3_);
      }
      
      private function onTravelMapComplete(param1:Event) : void
      {
         var _loc2_:String = null;
         var _loc3_:Object = null;
         var _loc4_:Loader = null;
         _loc2_ = String(param1.target.data);
         _loc3_ = com.adobe.serialization.json.JSON.decode(_loc2_);
         travelMapData = _loc3_;
         WorldMapData = new worldMap(travelMapData);
         TRAVEL_DATA_READY = true;
         ui.mcPopup.mcMap.removeChildAt(0);
         _loc4_ = new Loader();
         _loc4_.load(new URLRequest(serverFilePath + world.objInfo.sMap),new LoaderContext(false,ApplicationDomain.currentDomain));
         ui.mcPopup.mcMap.addChild(_loc4_);
      }
      
      private function onTravelMapProgress(param1:ProgressEvent) : void
      {
         var _loc2_:int = 0;
         bLoaded = param1.bytesLoaded;
         bTotal = param1.bytesTotal;
         _loc2_ = int(bLoaded / bTotal * 100);
         var _loc3_:Number = bLoaded / bTotal;
         travelLoaderMC.mcPct.text = _loc2_ + "%";
         if(bLoaded >= bTotal)
         {
            travelLoaderMC.parent.removeChild(travelLoaderMC);
            travelLoaderMC = null;
         }
      }
      
      private function onTravelError(param1:IOErrorEvent) : void
      {
         if(travelLoaderMC)
         {
            travelLoaderMC.parent.removeChild(travelLoaderMC);
            travelLoaderMC = null;
         }
      }
      
      public function checkPasswordStrength(param1:String) : int
      {
         var _loc2_:Number = NaN;
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:uint = 0;
         var _loc6_:String = null;
         var _loc7_:Boolean = false;
         var _loc8_:String = null;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         _loc2_ = 0;
         _loc3_ = param1.split("");
         _loc4_ = [];
         _loc6_ = _loc3_[0];
         _loc8_ = param1.toLowerCase();
         while(_loc9_ < weakPass.length)
         {
            if(_loc8_ == weakPass[_loc9_])
            {
               return -1;
            }
            _loc9_++;
         }
         while(_loc10_ < _loc3_.length)
         {
            if(!_loc7_ && _loc6_ != _loc3_[_loc10_])
            {
               _loc7_ = true;
            }
            if(_loc10_ == 0)
            {
               _loc2_ += 4;
               _loc4_.push(_loc3_[_loc10_]);
            }
            else if(_loc10_ < 8)
            {
               if(!isRepeat(_loc4_,_loc3_[_loc10_]))
               {
                  _loc4_.push(_loc3_[_loc10_]);
                  _loc2_ += 2;
               }
               else
               {
                  _loc2_ += 2;
               }
            }
            else if(_loc10_ < 21)
            {
               if(!isRepeat(_loc4_,_loc3_[_loc10_]))
               {
                  _loc4_.push(_loc3_[_loc10_]);
                  _loc2_ += 1.5;
               }
               else
               {
                  _loc2_ += 1.5;
               }
            }
            else if(!isRepeat(_loc4_,_loc3_[_loc10_]))
            {
               _loc4_.push(_loc3_[_loc10_]);
               _loc2_ += 1;
            }
            else
            {
               _loc2_ += 1;
            }
            if(_loc5_ < 6 && !isAlphaChar(_loc3_[_loc10_]))
            {
               _loc2_++;
               _loc5_++;
            }
            _loc10_++;
         }
         return _loc7_ ? int(_loc2_) : -1;
      }
      
      private function isAlphaChar(param1:String) : Boolean
      {
         var _loc2_:uint = 0;
         _loc2_ = uint(param1.charCodeAt(0));
         return _loc2_ >= 65 && _loc2_ < 123 || _loc2_ >= 48 && _loc2_ < 58 ? true : false;
      }
      
      private function isRepeat(param1:Array, param2:String) : Boolean
      {
         var _loc3_:uint = 0;
         while(_loc3_ < param1.length)
         {
            if(param1[_loc3_] == param2)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function loadGameMenu() : void
      {
         onLoadMaster(gameMenuCallBack,assetsContext,"gameMenu/" + world.objInfo.gMenu,null,gameMenuErrorHandler);
      }
      
      public function MenuShow() : void
      {
         try
         {
            if(!mcGameMenu)
            {
               return;
            }
            if(mcGameMenu.currentLabel == "Open")
            {
               mcGameMenu.gotoAndPlay("Close");
            }
            else
            {
               mcGameMenu.gotoAndStop("Open");
            }
         }
         catch(e:*)
         {
         }
      }
      
      private function gameMenuCallBack(param1:Event) : void
      {
         var _loc2_:* = undefined;
         try
         {
            ui.removeChild(mcGameMenu);
         }
         catch(e:*)
         {
         }
         mcGameMenu = null;
         _loc2_ = assetsDomain.getDefinition("GameMenu") as Class;
         mcGameMenu = MovieClip(new _loc2_());
         mcGameMenu.name = "gameMenu";
         mcGameMenu.visible = world.strMapName != "reenstest";
         mcGameMenu.x = 750;
         ui.addChild(mcGameMenu);
      }
      
      private function gameMenuErrorHandler(param1:IOErrorEvent) : void
      {
      }
      
      public function menuClose() : void
      {
         try
         {
            if(firstMenu)
            {
               firstMenu = false;
            }
            else if(mcGameMenu.currentLabel != "Close")
            {
               mcGameMenu.gotoAndPlay("Close");
            }
         }
         catch(e:*)
         {
         }
      }
      
      public function openMenu() : void
      {
         try
         {
            if(mcGameMenu.currentLabel != "Open")
            {
               mcGameMenu.gotoAndPlay("Open");
            }
         }
         catch(e:*)
         {
         }
      }
      
      public function getFilePath() : String
      {
         return serverFilePath;
      }
      
      public function getGamePath() : String
      {
         return serverGamePath;
      }
      
      public function initWorld() : void
      {
         if(world != null)
         {
            world.killTimers();
            world.killListeners();
            this.removeChild(world);
            world = null;
         }
         world = new World(this);
         this.addChildAt(world,getChildIndex(ui));
      }
      
      public function grayAll(param1:DisplayObjectContainer) : void
      {
         var _loc2_:DisplayObjectContainer = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1 == null)
         {
            return;
         }
         if(param1 is MovieClip && param1 != this)
         {
            (param1 as MovieClip).stop();
         }
         if(param1.numChildren)
         {
            _loc4_ = param1.numChildren;
            while(_loc3_ < _loc4_)
            {
               if(param1.getChildAt(_loc3_) is DisplayObjectContainer)
               {
                  _loc2_ = param1.getChildAt(_loc3_) as DisplayObjectContainer;
                  if(_loc2_.numChildren)
                  {
                     makeGrayscale(_loc2_);
                  }
                  else if(_loc2_ is MovieClip)
                  {
                     makeGrayscale(_loc2_ as MovieClip);
                  }
               }
               _loc3_++;
            }
         }
      }
      
      public function testJSCallback() : void
      {
      }
      
      public function onAddedToStage(param1:Event) : void
      {
         Game.root = this;
         this.stage.showDefaultContextMenu = false;
         stage.stageFocusRect = false;
         mcConnDetail = new ConnDetailMC(this);
         serverGamePath = "http://25.48.2.105/";
         serverFilePath = serverGamePath + "gamefiles/";
         sFilePath = serverFilePath;
         gotoAndPlay(charCount() > 0 && Boolean(litePreference.data.bCharSelect) ? "Select" : "Login");
         if(userPreference.data.quality != "AUTO")
         {
            stage.quality = userPreference.data.quality;
         }
      }
      
      public function init() : void
      {
         var _loc1_:* = undefined;
         ISWEB = params.isWeb;
         extCall = new ExternalCalls(true,params.strSourceID,this as MovieClip);
         for(_loc1_ in params)
         {
         }
         if(MsgBox)
         {
            MsgBox.visible = false;
         }
         IsEU = params.isEU;
         readQueryString();
         if(Boolean(mcLogin) && Boolean(mcLogin.fbConnect))
         {
            mcLogin.fbConnect.visible = showFB;
         }
         extCall.setGameObject(swfObj);
         if(params.sURL == null)
         {
            params.sURL = "https://www.aq.com/game/";
         }
         serverPath = params.sURL;
         FacebookConnect.RegisterGame(this);
         if(params.doSignup)
         {
            params.doSignup = false;
            gotoAndPlay("Account");
         }
      }
      
      public function FBMessage(param1:*, param2:*) : *
      {
         FacebookConnect.handleFBMessage(param1,param2);
      }
      
      public function SendMessage(param1:*, param2:*) : *
      {
      }
      
      public function FB_showFeedDialog(param1:String, param2:String, param3:String) : void
      {
         if(ISWEB)
         {
            extCall.showFeedDialog(param1,param2,param3);
         }
      }
      
      public function toggleFullScreen() : void
      {
         var _loc1_:Rectangle = null;
         if(stage["displayState"] == StageDisplayState.NORMAL)
         {
            _loc1_ = new Rectangle(0,0,960,550);
            try
            {
               stage["fullScreenSourceRect"] = _loc1_;
               stage["displayState"] = StageDisplayState.FULL_SCREEN;
            }
            catch(error:Error)
            {
            }
         }
         else
         {
            stage["displayState"] = StageDisplayState.NORMAL;
         }
      }
      
      public function showBallyhooAd(param1:String) : void
      {
         stage["displayState"] = StageDisplayState.NORMAL;
         extCall.showIt(param1);
      }
      
      public function callJSFunction(param1:String) : void
      {
         extCall.callJSFunction(param1);
      }
      
      private function readQueryString() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:Array = null;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc8_:String = null;
         try
         {
            _loc1_ = "";
            if(ISWEB)
            {
               _loc1_ = extCall.getQueryString();
            }
            if(_loc1_)
            {
               _loc3_ = _loc1_.split("&");
               _loc4_ = 0;
               _loc5_ = -1;
               while(_loc4_ < _loc3_.length)
               {
                  _loc6_ = _loc3_[_loc4_];
                  _loc5_ = _loc6_.indexOf("=");
                  if(_loc5_ > 0)
                  {
                     _loc7_ = _loc6_.substring(0,_loc5_);
                     _loc8_ = _loc6_.substring(_loc5_ + 1);
                     querystring[_loc7_] = _loc8_;
                  }
                  _loc4_++;
               }
            }
            for(var _loc11_ in querystring)
            {
               _loc2_ = _loc11_;
               _loc11_;
            }
         }
         catch(e:Error)
         {
         }
      }
      
      public function initLogin() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         stage.removeEventListener(KeyboardEvent.KEY_DOWN,key_StageLogin);
         mcLogin.ni.tabIndex = 1;
         mcLogin.pi.tabIndex = 2;
         mcLogin.ni.removeEventListener(FocusEvent.FOCUS_IN,onUserFocus);
         mcLogin.ni.removeEventListener(KeyboardEvent.KEY_DOWN,key_TextLogin);
         mcLogin.pi.removeEventListener(KeyboardEvent.KEY_DOWN,key_TextLogin);
         mcLogin.btnLogin.removeEventListener(MouseEvent.CLICK,onLoginClick);
         mcLogin.btnFBLogin.removeEventListener(MouseEvent.CLICK,onFBLoginClick);
         mcLogin.mcForgotPassword.removeEventListener(MouseEvent.CLICK,onForgotPassword);
         stage.addEventListener(KeyboardEvent.KEY_DOWN,key_StageLogin);
         mcLogin.ni.addEventListener(FocusEvent.FOCUS_IN,onUserFocus);
         mcLogin.ni.addEventListener(KeyboardEvent.KEY_DOWN,key_TextLogin);
         mcLogin.pi.addEventListener(KeyboardEvent.KEY_DOWN,key_TextLogin);
         mcLogin.btnLogin.addEventListener(MouseEvent.CLICK,onLoginClick);
         mcLogin.btnFBLogin.addEventListener(MouseEvent.CLICK,onFBLoginClick);
         mcLogin.mcForgotPassword.addEventListener(MouseEvent.CLICK,onForgotPassword);
         mcLogin.mcManageAccount.addEventListener(MouseEvent.CLICK,onManageClick);
         loadUserPreference();
         mcLogin.warning.s = String("Sorry! You have been disconnected. \n You will be able to login after $s seconds.");
         mcLogin.warning.visible = false;
         mcLogin.warning.alpha = 0;
         if(params.sURL != null)
         {
            mcLogin.mcLogo.txtTitle.htmlText = "<font color=\"#FFB231\">New Release:</font> " + params.sTitle;
         }
         if("logoutWarningTS" in userPreference.data)
         {
            _loc1_ = Number(new Date().getTime());
            _loc2_ = userPreference.data.logoutWarningTS + userPreference.data.logoutWarningDur * 1000 - _loc1_;
            if(_loc2_ > 60000)
            {
               userPreference.data.logoutWarningDur = 60;
               userPreference.data.logoutWarningTS = _loc1_;
               try
               {
                  userPreference.flush();
               }
               catch(e:Error)
               {
               }
            }
            if(_loc2_ > 1000)
            {
               initLoginWarning();
            }
         }
      }
      
      public function onBtnDn(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         _loc2_ = params.test ? "https://www.aq.com/gamedesignnotes/AQW-Spider-OMGClient-PatchNotess-8456" : "https://www.aq.com/gamedesignnotes/AQW-Spider-AQWClient2-PatchNotes-8484";
         navigateToURL(new URLRequest(_loc2_),"_blank");
      }
      
      public function loadTitle() : void
      {
         var _loc1_:String = null;
         var _loc2_:String = null;
         var _loc3_:String = null;
         _loc1_ = "Generic2.swf";
         _loc2_ = "The Skyguard";
         _loc3_ = "https://www.aq.com/game/";
         if(params.sURL != null)
         {
            _loc3_ = params.sURL;
            _loc1_ = params.sBG;
            _loc2_ = params.sTitle;
         }
         else
         {
            params.sURL = _loc3_;
         }
         BGLoader.LoadBG(_loc3_,mcLogin,_loc1_,_loc2_);
         mcLogin.testClientAssets.visible = false;
         mcLogin.testClientAssets.cVersion.text = "Version " + cVersion;
         mcLogin.testClientAssets.dnBtn.addEventListener(MouseEvent.CLICK,onBtnDn,false,0,true);
         mcLogin.testClientAssets.banner.visible = params.test as Boolean;
      }
      
      private function initLoginWarning() : void
      {
         var _loc1_:MovieClip = null;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         _loc1_ = mcLogin.warning as MovieClip;
         _loc1_.visible = true;
         _loc1_.alpha = 100;
         mcLogin.btnLogin.visible = false;
         mcLogin.mcOr.visible = false;
         mcLogin.btnFBLogin.visible = false;
         mcLogin.mcForgotPassword.visible = false;
         mcLogin.mcPassword.visible = false;
         _loc2_ = Number(new Date().getTime());
         _loc3_ = Number(userPreference.data.logoutWarningTS);
         _loc4_ = Number(userPreference.data.logoutWarningDur);
         _loc1_.n = Math.round((_loc3_ + _loc4_ * 1000 - _loc2_) / 1000);
         _loc1_.ti.text = _loc1_.s.split("$s")[0] + _loc1_.n + _loc1_.s.split("$s")[1];
         _loc1_.timer = new Timer(1000);
         _loc1_.timer.addEventListener(TimerEvent.TIMER,loginWarningTimer,false,0,true);
         _loc1_.timer.start();
      }
      
      private function loginWarningTimer(param1:TimerEvent) : void
      {
         var _loc2_:MovieClip = null;
         _loc2_ = mcLogin.warning as MovieClip;
         if(_loc2_.n-- < 1)
         {
            _loc2_.visible = false;
            _loc2_.alpha = 0;
            mcLogin.mcPassword.visible = true;
            mcLogin.btnLogin.visible = true;
            mcLogin.mcOr.visible = true;
            mcLogin.btnFBLogin.visible = true;
            mcLogin.mcForgotPassword.visible = true;
            _loc2_.timer.removeEventListener(TimerEvent.TIMER,loginWarningTimer);
         }
         else
         {
            _loc2_.ti.text = _loc2_.s.split("$s")[0] + _loc2_.n + _loc2_.s.split("$s")[1];
            _loc2_.timer.reset();
            _loc2_.timer.start();
         }
      }
      
      private function onStageLeave(param1:Event) : void
      {
         stage.focus = null;
      }
      
      private function initInterface() : *
      {
         var _loc1_:int = 0;
         var _loc2_:* = undefined;
         updateCoreValues(coreValues);
         ctr_watermark.visible = false;
         ctr_watermark.mouseEnabled = ctr_watermark.mouseChildren = false;
         ui.mcFPS.visible = false;
         ui.mcRes.visible = false;
         ui.mcPopup.visible = false;
         ui.mcPortrait.visible = false;
         ui.mcPortrait.iconBoostXP.visible = false;
         ui.mcPortrait.iconBoostG.visible = false;
         ui.mcPortrait.iconBoostRep.visible = false;
         ui.mcPortrait.iconBoostCP.visible = false;
         ui.mcPopup.visible = false;
         hidePortraitTarget();
         ui.visible = false;
         ui.mcInterface.mcXPBar.mcXP.scaleX = 0;
         ui.mcInterface.mcRepBar.mcRep.scaleX = 0;
         ui.mcUpdates.uproto.visible = false;
         ui.mcUpdates.uproto.y = -400;
         ui.mcUpdates.mouseChildren = ui.mcUpdates.mouseEnabled = false;
         hideMCPVPQueue();
         stage.removeEventListener(Event.MOUSE_LEAVE,onStageLeave);
         stage.removeEventListener(KeyboardEvent.KEY_UP,key_actBar);
         stage.removeEventListener(KeyboardEvent.KEY_DOWN,key_StageGame);
         ui.mcInterface.mcXPBar.removeEventListener(MouseEvent.MOUSE_OVER,xpBarMouseOver);
         ui.mcInterface.mcXPBar.removeEventListener(MouseEvent.MOUSE_OUT,xpBarMouseOut);
         ui.mcInterface.mcRepBar.removeEventListener(MouseEvent.MOUSE_OVER,onRepBarMouseOver);
         ui.mcInterface.mcRepBar.removeEventListener(MouseEvent.MOUSE_OUT,onRepBarMouseOut);
         ui.mcPortraitTarget.removeEventListener(MouseEvent.CLICK,portraitClick);
         ui.mcPortrait.removeEventListener(MouseEvent.CLICK,portraitClick);
         ui.mcPortrait.iconBoostXP.removeEventListener(MouseEvent.MOUSE_OVER,oniconBoostXPOver);
         ui.mcPortrait.iconBoostXP.removeEventListener(MouseEvent.MOUSE_OUT,oniconBoostOut);
         ui.mcPortrait.iconBoostG.removeEventListener(MouseEvent.MOUSE_OVER,oniconBoostGoldOver);
         ui.mcPortrait.iconBoostG.removeEventListener(MouseEvent.MOUSE_OUT,oniconBoostOut);
         ui.mcPortrait.iconBoostRep.removeEventListener(MouseEvent.MOUSE_OVER,oniconBoostRepOver);
         ui.mcPortrait.iconBoostRep.removeEventListener(MouseEvent.MOUSE_OUT,oniconBoostOut);
         ui.mcPortrait.iconBoostCP.removeEventListener(MouseEvent.MOUSE_OVER,oniconBoostCPOver);
         ui.mcPortrait.iconBoostCP.removeEventListener(MouseEvent.MOUSE_OUT,oniconBoostOut);
         ui.btnTargetPortraitClose.removeEventListener(MouseEvent.CLICK,onTargetPortraitCloseClick);
         ui.btnMonster.removeEventListener(MouseEvent.CLICK,onBtnMonsterClick);
         ui.mcPVPQueue.removeEventListener(MouseEvent.CLICK,onMCPVPQueueClick);
         ui.mcInterface.tl.mouseEnabled = false;
         chatF.init();
         stage.addEventListener(Event.MOUSE_LEAVE,onStageLeave);
         stage.addEventListener(KeyboardEvent.KEY_UP,key_actBar);
         ui.mcInterface.mcXPBar.strXP.visible = false;
         ui.mcInterface.mcXPBar.addEventListener(MouseEvent.MOUSE_OVER,xpBarMouseOver);
         ui.mcInterface.mcXPBar.addEventListener(MouseEvent.MOUSE_OUT,xpBarMouseOut);
         ui.mcInterface.mcRepBar.strRep.visible = false;
         ui.mcInterface.mcRepBar.addEventListener(MouseEvent.MOUSE_OVER,onRepBarMouseOver);
         ui.mcInterface.mcRepBar.addEventListener(MouseEvent.MOUSE_OUT,onRepBarMouseOut);
         ui.mcPortraitTarget.addEventListener(MouseEvent.CLICK,portraitClick);
         ui.mcPortrait.addEventListener(MouseEvent.CLICK,portraitClick);
         ui.mcPortrait.iconBoostXP.addEventListener(MouseEvent.MOUSE_OVER,oniconBoostXPOver);
         ui.mcPortrait.iconBoostXP.addEventListener(MouseEvent.MOUSE_OUT,oniconBoostOut);
         ui.mcPortrait.iconBoostG.addEventListener(MouseEvent.MOUSE_OVER,oniconBoostGoldOver);
         ui.mcPortrait.iconBoostG.addEventListener(MouseEvent.MOUSE_OUT,oniconBoostOut);
         ui.mcPortrait.iconBoostRep.addEventListener(MouseEvent.MOUSE_OVER,oniconBoostRepOver);
         ui.mcPortrait.iconBoostRep.addEventListener(MouseEvent.MOUSE_OUT,oniconBoostOut);
         ui.mcPortrait.iconBoostCP.addEventListener(MouseEvent.MOUSE_OVER,oniconBoostCPOver);
         ui.mcPortrait.iconBoostCP.addEventListener(MouseEvent.MOUSE_OUT,oniconBoostOut);
         ui.btnTargetPortraitClose.addEventListener(MouseEvent.CLICK,onTargetPortraitCloseClick);
         ui.btnMonster.addEventListener(MouseEvent.CLICK,onBtnMonsterClick);
         ui.mcPVPQueue.addEventListener(MouseEvent.CLICK,onMCPVPQueueClick);
         ui.iconQuest.visible = false;
         ui.iconQuest.buttonMode = true;
         ui.iconQuest.addEventListener(MouseEvent.CLICK,oniconQuestClick);
         ui.mcInterface.tl.mouseEnabled = false;
         ui.mcInterface.areaList.mouseEnabled = false;
         ui.mcInterface.areaList.title.mouseEnabled = false;
         ui.mcInterface.areaList.title.bMinMax.addEventListener(MouseEvent.CLICK,areaListClick);
         if(litePreference.data.bCustomDrops)
         {
            if(cDropsUI)
            {
               cDropsUI.cleanup();
            }
            cDropsUI = new customDrops(this);
         }
         if(litePreference.data.bDebugger)
         {
            if(cMenuUI)
            {
               cMenuUI.cleanup();
            }
            cMenuUI = new cellMenu(this);
            if(pLoggerUI)
            {
               pLoggerUI.cleanup();
            }
            if(litePreference.data.dOptions["debugPacket"])
            {
               pLoggerUI = new packetlogger(this);
            }
         }
         if(Boolean(litePreference.data.bAuras) && !ui.mcInterface.getChildByName("playerAuras"))
         {
            pAurasUI = new playerAuras(this);
            ui.mcPortrait.addChild(pAurasUI);
            tAurasUI = new targetAuras(this);
            ui.mcPortraitTarget.addChild(tAurasUI);
         }
         if(intChatMode)
         {
            ui.mcInterface.bMinMax.visible = false;
            ui.mcInterface.bShortTall.visible = false;
            ui.mcInterface.bCannedChat.visible = false;
            ui.mcInterface.tt.visible = false;
            ui.mcInterface.tebg.visible = false;
            ui.mcInterface.bsend.visible = false;
            ui.nc.visible = true;
            ui.mcInterface.ncModeChat.visible = true;
            ui.mcInterface.ncCannedChat.visible = true;
            ui.mcInterface.ncHistory.visible = true;
            ui.mcInterface.ncTxtBG.visible = true;
            ui.mcInterface.ncPrefix.visible = true;
            ui.mcInterface.ncText.visible = true;
            ui.mcInterface.ncSendText.visible = true;
         }
         else
         {
            ui.mcInterface.bMinMax.visible = true;
            ui.mcInterface.bShortTall.visible = true;
            ui.mcInterface.bCannedChat.visible = true;
            ui.mcInterface.tt.visible = true;
            ui.mcInterface.tebg.visible = true;
            ui.mcInterface.bsend.visible = true;
            ui.nc.visible = false;
            ui.mcInterface.ncModeChat.visible = false;
            ui.mcInterface.ncCannedChat.visible = false;
            ui.mcInterface.ncHistory.visible = false;
            ui.mcInterface.ncTxtBG.visible = false;
            ui.mcInterface.ncPrefix.visible = false;
            ui.mcInterface.ncText.visible = false;
            ui.mcInterface.ncSendText.visible = false;
         }
         keyDict = getKeyboardDict();
         _loc1_ = 0;
         while(_loc1_ < 6)
         {
            _loc2_ = ui.mcInterface.getChildByName("keyA" + _loc1_);
            if(_loc1_ == 0)
            {
               _loc2_.text = litePreference.data.keys["Auto Attack"] ? keyDict[litePreference.data.keys["Auto Attack"]] : " ";
            }
            else
            {
               _loc2_.text = litePreference.data.keys["Skill " + _loc1_] ? keyDict[litePreference.data.keys["Skill " + _loc1_]] : " ";
            }
            _loc2_.mouseEnabled = false;
            _loc1_++;
         }
      }
      
      public function traceHack(param1:String) : void
      {
         chatF.pushMsg("server",param1,"SERVER","",0);
      }
      
      private function onUserFocus(param1:FocusEvent) : *
      {
         if(mcLogin.ni.text == "click here")
         {
            mcLogin.ni.text = "";
         }
      }
      
      private function loadUserPreference() : *
      {
         if(userPreference.data.bitCheckedUsername)
         {
            mcLogin.ni.text = TempLoginName != "" ? TempLoginName : userPreference.data.strUsername;
            mcLogin.chkUserName.bitChecked = true;
         }
         if(userPreference.data.bitCheckedPassword)
         {
            mcLogin.pi.text = TempLoginPass != "" ? TempLoginPass : userPreference.data.strPassword;
            mcLogin.chkPassword.bitChecked = true;
         }
         mcLogin.chkUserName.checkmark.visible = mcLogin.chkUserName.bitChecked;
         mcLogin.chkPassword.checkmark.visible = mcLogin.chkPassword.bitChecked;
      }
      
      private function saveUserPreference() : *
      {
         userPreference.data.bitCheckedUsername = mcLogin.chkUserName.bitChecked;
         userPreference.data.bitCheckedPassword = mcLogin.chkPassword.bitChecked;
         if(mcLogin.chkUserName.bitChecked)
         {
            userPreference.data.strUsername = mcLogin.ni.text;
         }
         else
         {
            userPreference.data.strUsername = "";
         }
         if(mcLogin.chkPassword.bitChecked)
         {
            userPreference.data.strPassword = mcLogin.pi.text;
         }
         else
         {
            userPreference.data.strPassword = "";
         }
         try
         {
            userPreference.flush();
         }
         catch(e:Error)
         {
         }
      }
      
      private function onCreateNewAccount(param1:MouseEvent) : void
      {
         mixer.playSound("Click");
         gotoAndPlay("Account");
      }
      
      private function onForgotPassword(param1:MouseEvent) : void
      {
         navigateToURL(new URLRequest("https://account.aq.com/Login/Forgot"));
      }
      
      private function onManageClick(param1:MouseEvent) : void
      {
         navigateToURL(new URLRequest("https://account.aq.com/"));
      }
      
      private function onAccountRecovery(param1:MouseEvent) : void
      {
         mixer.playSound("Click");
         navigateToURL(new URLRequest("https://www.aq.com/help/aw-account-recovery.asp"));
      }
      
      private function onLoginClick(param1:MouseEvent) : void
      {
         if("btnLogin" in mcLogin && Boolean(mcLogin.btnLogin.visible))
         {
            if(mcLogin.ni.text != "" && mcLogin.pi.text != "")
            {
               try
               {
                  saveUserPreference();
               }
               catch(e:*)
               {
               }
               if(FacebookConnect.isLoggedIn)
               {
                  FacebookConnect.Logout();
               }
               login(mcLogin.ni.text.toLowerCase(),mcLogin.pi.text);
            }
         }
      }
      
      public function CallFBConnect(param1:Function) : void
      {
         this.addEventListener(FacebookConnectEvent.ONCONNECT,FBLoginCreate);
         FBConnectCallback = param1;
         FacebookConnect.RequestFBConnect();
      }
      
      public function GetFBMe() : Object
      {
         return FacebookConnect.Me;
      }
      
      public function isFBLoggedIn() : Boolean
      {
         return FacebookConnect.isLoggedIn;
      }
      
      public function FBIP() : String
      {
         return FacebookConnect.IPAddr;
      }
      
      public function GetFBToken() : String
      {
         return FacebookConnect.AccessToken;
      }
      
      private function onFBLoginClick(param1:MouseEvent) : void
      {
         if("btnLogin" in mcLogin && Boolean(mcLogin.btnLogin.visible))
         {
            mcConnDetail.showConn("Connecting to Facebook");
            this.addEventListener(FacebookConnectEvent.ONCONNECT,FBLogin);
            FacebookConnect.RequestFBConnect();
         }
      }
      
      public function FBLogin(param1:FacebookConnectEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:URLRequest = null;
         var _loc4_:URLVariables = null;
         var _loc5_:URLLoader = null;
         this.removeEventListener(FacebookConnectEvent.ONCONNECT,FBLogin);
         if(param1.params.success)
         {
            params.FBID = FacebookConnect.Me.id;
            params.token = FacebookConnect.AccessToken;
            _loc2_ = Number(rn.rand());
            mcConnDetail.showConn("Loading Server List...");
            _loc3_ = new URLRequest(params.loginURL);
            _loc4_ = new URLVariables();
            _loc4_.fbid = FacebookConnect.Me.id;
            _loc4_.fbtoken = FacebookConnect.AccessToken;
            FacebookConnect.isLoggedIn = true;
            _loc3_.data = _loc4_;
            _loc3_.method = URLRequestMethod.POST;
            _loc5_ = new URLLoader();
            _loc5_.addEventListener(Event.COMPLETE,onLoginComplete);
            _loc5_.load(_loc3_);
         }
         else
         {
            mcConnDetail.showError(param1.params.message);
         }
      }
      
      public function FBLoginCreate(param1:FacebookConnectEvent) : void
      {
         this.removeEventListener(FacebookConnectEvent.ONCONNECT,FBLoginCreate);
         if(this.FBConnectCallback != null)
         {
            try
            {
               FBConnectCallback();
            }
            catch(e:Error)
            {
            }
         }
         FBConnectCallback = null;
      }
      
      public function getFBUser() : void
      {
         if(ISWEB)
         {
            extCall.getFBUser();
         }
      }
      
      public function login(param1:String, param2:String) : *
      {
         var _loc3_:Number = NaN;
         var _loc4_:URLRequest = null;
         var _loc5_:URLVariables = null;
         mcConnDetail.showConn("Authenticating Account Info...");
         loginInfo.strUsername = param1;
         loginInfo.strPassword = param2;
         _loc3_ = Number(rn.rand());
         _loc4_ = new URLRequest(params.loginURL + "?ran=" + _loc3_);
         _loc5_ = new URLVariables();
         _loc5_.user = param1;
         _loc5_.pass = param2;
         _loc5_.option = ISWEB ? "0" : "1";
         if(checkPasswordStrength(param2) < 18)
         {
            bPassword = false;
         }
         if(params.strSourceID == "FACEBOOK")
         {
            _loc5_.strSourceID = params.strSourceID;
            _loc5_.fbid = params.FBID;
            _loc5_.fbtoken = params.token;
         }
         else if(params.strSourceID == "TAGGED")
         {
            _loc5_.strSourceID = params.strSourceID;
            _loc5_.SrcUserID = params.SrcUserID;
            _loc5_.token = params.token;
         }
         _loc4_.data = _loc5_;
         _loc4_.method = URLRequestMethod.POST;
         loginLoader.removeEventListener(Event.COMPLETE,onLoginComplete);
         loginLoader.addEventListener(Event.COMPLETE,onLoginComplete);
         loginLoader.addEventListener(IOErrorEvent.IO_ERROR,onLoginError,false,0,true);
         try
         {
            loginLoader.load(_loc4_);
         }
         catch(error:Error)
         {
         }
      }
      
      public function onLoginError(param1:Event) : void
      {
      }
      
      public function onLoginComplete(param1:Event) : void
      {
         var _loc2_:Object = null;
         try
         {
            _loc2_ = com.adobe.serialization.json.JSON.decode(param1.target.data);
            if(_loc2_.login)
            {
               objLogin = _loc2_.login;
               objLogin.servers = _loc2_.servers;
               playerPollData = _loc2_.polldata;
            }
            else
            {
               objLogin = _loc2_;
            }
            loginLoader.removeEventListener(Event.COMPLETE,onLoginComplete);
            if(objLogin.bSuccess == 1)
            {
               try
               {
                  loginInfo.strUsername = objLogin.unm.toLowerCase();
               }
               catch(e:*)
               {
               }
               if(loginInfo.strUsername != null)
               {
                  if(loginInfo.strUsername.toLowerCase() == "iterator" || loginInfo.strUsername.toLowerCase() == "iterator2" || loginInfo.strUsername.toLowerCase() == "iterator3" || loginInfo.strUsername.toLowerCase() == "iterator4")
                  {
                     serialCmdMode = true;
                  }
                  else
                  {
                     serialCmdMode = false;
                  }
               }
               else
               {
                  serialCmdMode = false;
               }
               if(objLogin.FBID != null)
               {
                  if(FacebookConnect.Me == null)
                  {
                     FacebookConnect.Me = {};
                  }
                  FacebookConnect.Me.id = objLogin.FBID;
                  if(objLogin.FBName != null)
                  {
                     FacebookConnect.Me.name = objLogin.FBName;
                  }
               }
               if(fbL != null)
               {
                  fbL.destroy();
               }
               if(ISWEB)
               {
                  extCall.getFBUser();
               }
               mcConnDetail.hideConn();
               loginInfo.strToken = objLogin.sToken;
               sToken = loginInfo.strToken;
               strToken = loginInfo.strToken;
               if(ISWEB)
               {
                  extCall.setToken(loginInfo);
               }
               if(serialCmdMode)
               {
                  mcLogin.testClientAssets.visible = false;
                  mcLogin.gotoAndStop("Iterator");
               }
               else
               {
                  mcLogin.gotoAndStop("Servers");
               }
            }
            else if(objLogin.sMsg.indexOf("Facebook") > -1)
            {
               mcConnDetail.hideConn();
               fbL = new fbLinkWindow(mcLogin.fbConnect,this as MovieClip);
               mcLogin.fbConnect.visible = true;
            }
            else
            {
               mcConnDetail.showError(objLogin.sMsg);
            }
         }
         catch(e:*)
         {
         }
         resetsOnNewSession();
      }
      
      public function resetsOnNewSession() : void
      {
         if(Boolean(litePreference.data.bDebugger) && objLogin.iAccess < 30)
         {
            optionHandler.cmd(MovieClip(this),"@ Debugger");
         }
      }
      
      public function deepCopy(param1:*, param2:*) : void
      {
         var _loc3_:* = undefined;
         for(var _loc6_ in param2)
         {
            _loc3_ = _loc6_;
            _loc6_;
            if(typeof (param2 as Object)[_loc3_] == "object")
            {
               (param1 as Object)[_loc3_] = {};
               deepCopy((param1 as Object)[_loc3_],(param2 as Object)[_loc3_]);
            }
            else if((param2 as Object)[_loc3_])
            {
               (param1 as Object)[_loc3_] = (param2 as Object)[_loc3_];
            }
         }
      }
      
      public function deepCopyArr(param1:*, param2:*) : void
      {
         var _loc3_:* = undefined;
         for each(var _loc6_ in param2)
         {
            _loc3_ = _loc6_;
            _loc6_;
            param1.push(_loc3_);
         }
      }
      
      public function saveChar() : void
      {
         var _loc1_:Object = null;
         var _loc2_:int = 0;
         var _loc3_:* = undefined;
         var _loc4_:Object = null;
         if(FacebookConnect.isLoggedIn || !litePreference.data.bCharSelect)
         {
            return;
         }
         _loc1_ = {};
         _loc1_["strGender"] = world.myAvatar.objData.strGender;
         _loc1_["strHairFilename"] = world.myAvatar.objData.strHairFilename;
         _loc1_["strHairName"] = world.myAvatar.objData.strHairName;
         _loc1_["eqp"] = {};
         deepCopy(_loc1_["eqp"],world.myAvatar.objData.eqp);
         _loc1_["intGold"] = world.myAvatar.objData.intGold;
         _loc1_["intCoins"] = world.myAvatar.objData.intCoins;
         _loc1_["strClassName"] = world.myAvatar.objData.strClassName;
         _loc1_["iCP"] = world.myAvatar.objData.iCP;
         _loc1_["intLevel"] = world.myAvatar.objData.intLevel;
         _loc1_["strUsername"] = world.myAvatar.objData.strUsername;
         _loc1_["intAccessLevel"] = world.myAvatar.objData.intAccessLevel;
         _loc1_["iUpgDays"] = world.myAvatar.objData.iUpgDays;
         _loc1_["intColorSkin"] = world.myAvatar.objData.intColorSkin;
         _loc1_["intColorHair"] = world.myAvatar.objData.intColorHair;
         _loc1_["intColorEye"] = world.myAvatar.objData.intColorEye;
         _loc1_["intColorBase"] = world.myAvatar.objData.intColorBase;
         _loc1_["intColorTrim"] = world.myAvatar.objData.intColorTrim;
         _loc1_["intColorAccessory"] = world.myAvatar.objData.intColorAccessory;
         if(world.myAvatar.objData.guild != null)
         {
            _loc1_["guild"] = {};
            _loc1_["guild"]["Name"] = world.myAvatar.objData.guild.Name;
         }
         _loc1_["showHelm"] = world.myAvatar.dataLeaf.showHelm;
         _loc1_["showCloak"] = world.myAvatar.dataLeaf.showCloak;
         if(Boolean(characters.data.users) && Boolean(characters.data.users[world.myAvatar.pnm.toLowerCase()]))
         {
            (characters.data.users[world.myAvatar.pnm.toLowerCase()] as Object).data = _loc1_;
            (characters.data.users[world.myAvatar.pnm.toLowerCase()] as Object).server = objServerInfo.sName;
         }
         else
         {
            _loc2_ = 0;
            for(var _loc7_ in characters.data.users)
            {
               _loc3_ = _loc7_;
               _loc7_;
               _loc2_++;
            }
            if(_loc2_ >= 5)
            {
               return;
            }
            (loginInfo as Object).bAsk = false;
            _loc4_ = {};
            deepCopy(_loc4_,loginInfo);
            characters.data.users[world.myAvatar.pnm.toLowerCase()] = {
               "index":-1,
               "data":_loc1_,
               "server":objServerInfo.sName,
               "loginInfo":_loc4_
            };
         }
         characters.flush();
      }
      
      public function charCount() : int
      {
         var _loc1_:int = 0;
         var _loc2_:* = undefined;
         if(!characters.data.users)
         {
            characters.data.users = {};
            characters.data.retro = true;
            characters.flush();
            return 0;
         }
         _loc1_ = 0;
         for(var _loc5_ in characters.data.users)
         {
            _loc2_ = _loc5_;
            _loc5_;
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function retroLowercase() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:* = undefined;
         var _loc3_:int = 0;
         if(charCount() == 0)
         {
            return;
         }
         if(characters.data.retro)
         {
            return;
         }
         _loc1_ = false;
         for(var _loc6_ in characters.data.users)
         {
            _loc2_ = _loc6_;
            _loc6_;
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               if(_loc2_.charAt(_loc3_) != _loc2_.charAt(_loc3_).toLowerCase())
               {
                  _loc1_ = true;
                  break;
               }
               _loc3_++;
            }
            if(_loc1_)
            {
               break;
            }
         }
         if(_loc1_)
         {
            resetChars();
         }
         else
         {
            characters.data.retro = true;
         }
      }
      
      public function resetChars() : void
      {
         characters.data.users = null;
         delete characters.data.users;
         characters.flush();
      }
      
      private function loadExternalAssets() : void
      {
         mcConnDetail.showConn("Initializing Client...");
         onLoadMaster(assetsLoaderCallback,assetsContext,"interface/Assets/" + world.objInfo.sAssets,null,assetsLoaderErrorHandler);
      }
      
      private function assetsLoaderCallback(param1:Event) : void
      {
         ASSETS_READY = world.objInfo.sAssets;
         resumeOnLoginResponse();
      }
      
      private function resumeOnLoginResponse() : void
      {
         var _loc1_:int = 0;
         mcConnDetail.showConn("Joining Lobby..");
         sfc.sendXtMessage("zm","firstJoin",[],"str",1);
         if(chatF.ignoreList.data.users.length > 0)
         {
            _loc1_ = 0;
            while(_loc1_ < chatF.ignoreList.data.users.length)
            {
               if(chatF.ignoreList.data.users[_loc1_].toLowerCase() == loginInfo.strUsername.toLowerCase())
               {
                  chatF.ignoreList.data.users.splice(_loc1_,1);
                  break;
               }
               _loc1_++;
            }
            sfc.sendXtMessage("zm","cmd",["ignoreList",chatF.ignoreList.data.users],"str",1);
         }
         else
         {
            sfc.sendXtMessage("zm","cmd",["ignoreList","$clearAll"],"str",1);
         }
      }
      
      private function assetsLoaderErrorHandler(param1:IOErrorEvent) : void
      {
         mcConnDetail.showError("Client Initialization Failed!");
      }
      
      public function connectTo(param1:String, param2:int = 5588) : *
      {
         serverIP = param1;
         mixer.playSound("ClickBig");
         mcConnDetail.showConn("Connecting to game server...");
         if(sfc.isConnected)
         {
            sfc.disconnect();
         }
         sfc.connect(param1,param2);
         gotoAndPlay("Game");
      }
      
      public function displayCharPage(param1:String) : void
      {
         var _loc2_:* = undefined;
         _loc2_ = new _loc2_(this,param1);
         ui.addChild(_loc2_);
      }
      
      public function togglePolls() : void
      {
         requestInterface("polls/pollingsystem.swf","pollingSystem");
      }
      
      public function requestInterface(param1:String, param2:String) : void
      {
         removeDeadInterfaces();
         interfaceQueue.push({
            "nam":param2,
            "intrf":param1
         });
         if(interfaceQueue.length == 1)
         {
            checkInterfaceQueue();
         }
      }
      
      public function checkInterfaceQueue() : void
      {
         var _loc1_:Loader = null;
         if(interfaceQueue.length < 1)
         {
            return;
         }
         visualLoader = new mcLoader();
         visualLoader.x = 400;
         visualLoader.y = 211;
         this.addChild(visualLoader);
         onLoadMaster(onInterfaceComplete,interfaceContext,"interface/" + interfaceQueue[0].intrf + "?v=" + world.objInfo["sVersion"],onInterfaceProgress,onInterfaceError);
      }
      
      public function onInterfaceComplete(param1:Event) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         _loc2_ = new MovieClip();
         _loc2_.addChild(MovieClip(Loader(param1.target.loader).content));
         _loc2_.name = interfaceQueue[0].nam;
         _loc3_ = this.addChild(_loc2_);
         if(interfaceRef.hasOwnProperty(interfaceQueue[0].nam))
         {
            if(interfaceRef[interfaceQueue[0].nam])
            {
               if(interfaceRef[interfaceQueue[0].nam].parent)
               {
                  MovieClip(interfaceRef[interfaceQueue[0].nam].parent).removeChild(interfaceRef[interfaceQueue[0].nam]);
               }
            }
         }
         interfaceRef[interfaceQueue[0].nam] = _loc3_;
         interfaceQueue.shift();
         checkInterfaceQueue();
         this.setChildIndex(MsgBox,numChildren - 1);
         if(_loc2_.name == "pony_engine")
         {
            world.myAvatar.swapMorphs(true);
         }
      }
      
      public function cleanupInterfaces() : void
      {
         var _loc1_:* = undefined;
         for each(var _loc4_ in interfaceRef)
         {
            _loc1_ = _loc4_;
            _loc4_;
            if(_loc1_)
            {
               if(_loc1_.parent)
               {
                  MovieClip(_loc1_.parent).removeChild(_loc1_);
               }
            }
         }
         interfaceRef = {};
      }
      
      public function removeDeadInterfaces() : void
      {
         var _loc1_:String = null;
         var _loc2_:Array = null;
         var _loc3_:* = undefined;
         _loc2_ = [];
         for(var _loc6_ in interfaceRef)
         {
            _loc1_ = _loc6_;
            _loc6_;
            _loc3_ = interfaceRef[_loc1_];
            if(_loc3_)
            {
               if(!_loc3_.parent)
               {
                  _loc2_.push(_loc1_);
               }
            }
         }
         for each(_loc6_ in _loc2_)
         {
            _loc1_ = _loc6_;
            _loc6_;
            delete interfaceRef[_loc1_];
         }
      }
      
      public function getInterface(param1:String) : *
      {
         var _loc2_:* = undefined;
         _loc2_ = interfaceRef[param1];
         if(_loc2_)
         {
            if(_loc2_.parent)
            {
               return _loc2_;
            }
            delete interfaceRef[param1];
         }
         return null;
      }
      
      public function onInterfaceProgress(param1:ProgressEvent) : void
      {
         var _loc2_:int = 0;
         interfaceLoaded = param1.bytesLoaded;
         interfaceTotal = param1.bytesTotal;
         _loc2_ = int(interfaceLoaded / interfaceTotal * 100);
         var _loc3_:Number = interfaceLoaded / interfaceTotal;
         visualLoader.mcPct.text = _loc2_ + "%";
         if(interfaceLoaded >= interfaceTotal)
         {
            visualLoader.parent.removeChild(visualLoader);
            visualLoader = null;
         }
      }
      
      public function onInterfaceError(param1:IOErrorEvent) : void
      {
      }
      
      public function requestAPI(param1:String, param2:*, param3:*, param4:*, param5:Boolean = false) : void
      {
         var _loc6_:URLLoader = null;
         var _loc7_:Array = null;
         var _loc8_:URLVariables = null;
         var _loc9_:URLRequest = null;
         var _loc10_:* = undefined;
         _loc6_ = new URLLoader();
         _loc6_.addEventListener(Event.COMPLETE,param3,false,0,true);
         _loc6_.addEventListener(IOErrorEvent.IO_ERROR,param4,false,0,true);
         _loc7_ = [new URLRequestHeader("ccid",world.myAvatar.objData.CharID),new URLRequestHeader("token",loginInfo.strToken)];
         _loc8_ = new URLVariables();
         if(param2 != null)
         {
            for(var _loc13_ in param2)
            {
               _loc10_ = _loc13_;
               _loc13_;
               _loc8_[_loc10_] = _loc10_ == "layout" ? com.adobe.serialization.json.JSON.encode(param2[_loc10_]) : param2[_loc10_];
            }
         }
         _loc9_ = new URLRequest(serverGamePath + "api/char/" + param1 + (param5 ? "?v=" + Math.random() : ""));
         _loc9_.requestHeaders = _loc7_;
         if(param2 != null)
         {
            _loc9_.data = _loc8_;
         }
         _loc9_.method = URLRequestMethod.POST;
         _loc6_.load(_loc9_);
      }
      
      public function getBank() : void
      {
         requestAPI("bank",{"layout":{"cat":"all"}},onBankComplete,onBankError,true);
      }
      
      public function onBankComplete(param1:Event) : void
      {
         world.addItemsToBank(com.adobe.serialization.json.JSON.decode(param1.target.data));
      }
      
      public function onBankError(param1:IOErrorEvent) : void
      {
         mcConnDetail.showConn("Error loading bank information");
      }
      
      public function retrieveInfo(param1:Array) : void
      {
         var _loc2_:URLLoader = null;
         _loc2_ = new URLLoader();
         _loc2_.addEventListener(Event.COMPLETE,onInfoComplete,false,0,true);
         _loc2_.addEventListener(IOErrorEvent.IO_ERROR,onInfoError,false,0,true);
         _loc2_.load(new URLRequest(serverGamePath + "api/game/clientvars?v=" + Math.random()));
      }
      
      public function retrieveBook() : void
      {
         var _loc1_:URLLoader = null;
         if(ui.getChildByName("travelLoaderMC"))
         {
            return;
         }
         travelLoaderMC = new (world.getClass("mcLoader") as Class)();
         travelLoaderMC.x = 400;
         travelLoaderMC.y = 211;
         travelLoaderMC.name = "travelLoaderMC";
         ui.addChild(travelLoaderMC);
         _loc1_ = new URLLoader();
         _loc1_.addEventListener(Event.COMPLETE,onBoLComplete,false,0,true);
         _loc1_.addEventListener(ProgressEvent.PROGRESS,onBoLProgress,false,0,true);
         _loc1_.addEventListener(IOErrorEvent.IO_ERROR,onBoLError,false,0,true);
         _loc1_.load(new URLRequest(serverGamePath + "api/data/booklore?v=" + world.objInfo["sVersion"]));
      }
      
      public function onInfoComplete(param1:Event) : void
      {
         var _loc2_:Object = null;
         var _loc3_:* = undefined;
         _loc2_ = com.adobe.serialization.json.JSON.decode(param1.target.data);
         for(var _loc6_ in _loc2_)
         {
            _loc3_ = _loc6_;
            _loc6_;
            world.objInfo[_loc3_] = _loc2_[_loc3_];
         }
         world.jsonStringy(_loc2_);
         iMaxBagSlots = Number(_loc2_["iMaxBagSlots"]);
         iMaxBankSlots = Number(_loc2_["iMaxBankSlots"]);
         iMaxHouseSlots = Number(_loc2_["iMaxHouseSlots"]);
         iMaxFriends = Number(_loc2_["iMaxFriends"]);
         iMaxLoadoutSlots = Number(_loc2_["iMaxLoadoutSlots"]);
         if(ASSETS_READY == _loc2_["sAssets"])
         {
            BOOK_DATA_READY = null;
            resumeOnLoginResponse();
         }
         else
         {
            BOOK_DATA_READY = null;
            loadExternalAssets();
         }
      }
      
      public function onInfoError(param1:IOErrorEvent) : void
      {
         mcConnDetail.showConn("Error loading client vars");
      }
      
      public function onBoLComplete(param1:Event) : void
      {
         var _loc2_:Object = null;
         _loc2_ = com.adobe.serialization.json.JSON.decode(param1.target.data);
         world.bookData = _loc2_;
         BOOK_DATA_READY = _loc2_;
         ui.mcPopup.mcBook.removeChildAt(0);
         if(bolContent)
         {
            if(newInstance)
            {
               newInstance = false;
               bolContent.gotoAndStop("NavMenu");
            }
            ui.mcPopup.mcBook.addChild(bolContent);
            return;
         }
         bolLoader = new Loader();
         bolLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,onBoLContentComplete,false,0,true);
         bolLoader.load(new URLRequest(Game.serverFilePath + world.objInfo.sBook),new LoaderContext(false,ApplicationDomain.currentDomain));
      }
      
      public function onBoLContentComplete(param1:Event) : void
      {
         bolContent = param1.currentTarget.content;
         ui.mcPopup.mcBook.addChild(bolContent);
      }
      
      private function onBoLProgress(param1:ProgressEvent) : void
      {
         var _loc2_:int = 0;
         bLoaded = param1.bytesLoaded;
         bTotal = param1.bytesTotal;
         _loc2_ = int(bLoaded / bTotal * 100);
         var _loc3_:Number = bLoaded / bTotal;
         travelLoaderMC.mcPct.text = _loc2_ + "%";
         if(bLoaded >= bTotal)
         {
            travelLoaderMC.parent.removeChild(travelLoaderMC);
            travelLoaderMC = null;
         }
      }
      
      private function onBoLError(param1:IOErrorEvent) : void
      {
         if(travelLoaderMC)
         {
            travelLoaderMC.parent.removeChild(travelLoaderMC);
            travelLoaderMC = null;
         }
      }
      
      public function serialCmdInit(param1:String) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         _loc2_ = mcLogin.il;
         _loc3_ = _loc2_.cmd;
         _loc3_.btnUnselectAll.visible = false;
         _loc3_.btnSelectAll.visible = false;
         _loc3_.btnGo.visible = false;
         serialCmd.si = 0;
         serialCmd.cmd = param1;
         serialCmd.active = true;
         serialCmdNext();
      }
      
      private function serialCmdNext() : void
      {
         var _loc1_:Date = null;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         _loc1_ = new Date();
         _loc2_ = mcLogin.il.iClass;
         var _loc4_:* = mcLogin.il.cmd;
         if(serialCmd.si > 0)
         {
            _loc3_ = _loc2_.getServerItemByIP(serialCmd.servers[serialCmd.si - 1].sIP,serialCmd.servers[serialCmd.si - 1].iPort);
            if(_loc3_ != null)
            {
               _loc2_.serverOn(_loc3_);
               _loc3_.t3.text = (_loc1_.getTime() - serialCmd.ts) / 1000 + " s";
               _loc3_.t3.visible = true;
            }
         }
         if(serialCmd.si < serialCmd.servers.length)
         {
            sfc.connect(serialCmd.servers[serialCmd.si].sIP,serialCmd.servers[serialCmd.si].iPort);
            serialCmd.si++;
            serialCmd.ts = _loc1_.getTime();
         }
         else
         {
            serialCmdDone();
         }
      }
      
      private function serialCmdDone() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         _loc1_ = mcLogin.il;
         _loc2_ = _loc1_.cmd;
         _loc2_.btnUnselectAll.visible = true;
         _loc2_.btnSelectAll.visible = true;
         _loc2_.btnGo.visible = true;
         serialCmd.active = false;
      }
      
      public function readIA1Preferences() : void
      {
         uoPref.bCloak = world.getAchievement("ia1",0) == 0;
         uoPref.bHelm = world.getAchievement("ia1",1) == 0;
         uoPref.bPet = world.getAchievement("ia1",2) == 0;
         uoPref.bWAnim = world.getAchievement("ia1",3) == 0;
         uoPref.bGoto = world.getAchievement("ia1",4) == 0;
         uoPref.bMusicOn = world.getAchievement("ia1",6) == 0;
         uoPref.bFriend = world.getAchievement("ia1",7) == 0;
         uoPref.bParty = world.getAchievement("ia1",8) == 0;
         uoPref.bGuild = world.getAchievement("ia1",9) == 0;
         uoPref.bWhisper = world.getAchievement("ia1",10) == 0;
         uoPref.bTT = world.getAchievement("ia1",11) == 0;
         uoPref.bFBShare = world.getAchievement("ia1",12) == 1;
         uoPref.bDuel = world.getAchievement("ia1",13) == 0;
         world.hideAllCapes = world.getAchievement("ia1",14) == 1;
         world.hideOtherPets = world.getAchievement("ia1",15) == 1;
         world.showAnimations = world.getAchievement("ia1",17) == 0;
         uoPref.bProf = world.getAchievement("ia1",18) == 0;
         uoPref.bFBShard = false;
         mixer.stf = new SoundTransform(litePreference.data.dOptions["iSoundFX"] != null ? Number(litePreference.data.dOptions["iSoundFX"]) : 1);
         SoundMixer.soundTransform = new SoundTransform(litePreference.data.dOptions["iSoundAll"] != null ? Number(litePreference.data.dOptions["iSoundAll"]) : 1);
      }
      
      public function inituoPref() : void
      {
         uoPref.bCloak = true;
         uoPref.bHelm = true;
         uoPref.bPet = true;
         uoPref.bWAnim = true;
         uoPref.bGoto = true;
         uoPref.bMusicOn = true;
         uoPref.bFriend = true;
         uoPref.bParty = true;
         uoPref.bGuild = true;
         uoPref.bWhisper = true;
         uoPref.bTT = true;
         uoPref.bFBShare = false;
         uoPref.bDuel = true;
      }
      
      public function initKeybindPref(param1:Boolean = false) : void
      {
         if(Boolean(litePreference.data.keys) && !litePreference.data.keys["Dash"])
         {
            litePreference.data.keys["Dash"] = 32;
            litePreference.data.keys["Jump"] = null;
         }
         if(Boolean(litePreference.data.keys) && !param1)
         {
            return;
         }
         litePreference.data.keys = {};
         litePreference.data.keys["Camera Tool"] = 219;
         litePreference.data.keys["World Camera"] = 221;
         litePreference.data.keys["Target Random Monster"] = 84;
         litePreference.data.keys["Inventory"] = 73;
         litePreference.data.keys["Bank"] = 66;
         litePreference.data.keys["Quest Log"] = 76;
         litePreference.data.keys["Friends List"] = 70;
         litePreference.data.keys["Character Panel"] = 67;
         litePreference.data.keys["Player HP Bar"] = 86;
         litePreference.data.keys["Options"] = 79;
         litePreference.data.keys["Area List"] = 85;
         litePreference.data.keys["Jump"] = null;
         litePreference.data.keys["Auto Attack"] = 49;
         litePreference.data.keys["Skill 1"] = 50;
         litePreference.data.keys["Skill 2"] = 51;
         litePreference.data.keys["Skill 3"] = 52;
         litePreference.data.keys["Skill 4"] = 53;
         litePreference.data.keys["Skill 5"] = 54;
         litePreference.data.keys["Travel Menu\'s Travel"] = 89;
         litePreference.data.keys["World Camera\'s Hide"] = 72;
         litePreference.data.keys["Rest"] = 88;
         litePreference.data.keys["Hide Monsters"] = null;
         litePreference.data.keys["Hide Players"] = null;
         litePreference.data.keys["Cancel Target"] = 27;
         litePreference.data.keys["Hide UI"] = null;
         litePreference.data.keys["Battle Analyzer"] = null;
         litePreference.data.keys["Decline All Drops"] = null;
         litePreference.data.keys["Stats Overview"] = null;
         litePreference.data.keys["Battle Analyzer Toggle"] = null;
         litePreference.data.keys["Custom Drops UI"] = null;
         litePreference.data.keys["@ Debugger - Cell Menu"] = 192;
         litePreference.data.keys["@ Debugger - Packet Logger"] = null;
         litePreference.data.keys["Dash"] = 32;
         litePreference.data.keys["Outfits"] = null;
         litePreference.data.keys["Friendships UI"] = null;
      }
      
      public function debugMessage(param1:String) : void
      {
         if(!litePreference.data.bDebugger)
         {
            return;
         }
         chatF.pushMsg("warning",param1,"SERVER","",0);
      }
      
      public function initlitePref() : void
      {
         if(litePreference.data.dOptions == null)
         {
            litePreference.data.dOptions = {};
         }
         if(litePreference.data.dOptions["termsAgree"] == null)
         {
            litePreference.data.dOptions["termsAgree"] = true;
         }
         litePref = [{
            "strName":"@ Debugger",
            "bEnabled":litePreference.data.bDebugger,
            "sDesc":"Debug Mode!\nPress ` (Changeable in Keybinds) to hide/show the cell & pads menu!",
            "minAccess":30,
            "extra":[{
               "strName":"Disable Linkage Errors",
               "bEnabled":litePreference.data.dOptions["debugLinkage"],
               "sDesc":"Avoid receiving linkage error messages"
            },{
               "strName":"Disable Color Coded Items",
               "bEnabled":litePreference.data.dOptions["debugColor"],
               "sDesc":"Prevents color coding of item entries\nRed item = costs 0 ac/gold\nRed item = item is AC and > 12k\nYellow item = is staff"
            },{
               "strName":"Packet Logger",
               "bEnabled":litePreference.data.dOptions["debugPacket"],
               "sDesc":"View all packets sent to the client.\nMust be enabled to use.\nSet a keybind to hide/show the packet logger window."
            }]
         },{
            "strName":"Allow Quest Log Turn-Ins",
            "bEnabled":litePreference.data.bQuestLog,
            "sDesc":"Allows you to turn-in quests using your quest log on the bottom right screen!"
         },{
            "strName":"Auto-Untarget Dead Targets",
            "bEnabled":litePreference.data.bUntargetDead,
            "sDesc":"This will untarget targets that are dead."
         },{
            "strName":"Auto-Untarget Self",
            "bEnabled":litePreference.data.bUntargetSelf,
            "sDesc":"This will prevent you from targetting yourself."
         },{
            "strName":"Battle Analyzer",
            "extra":"btn",
            "sDesc":"This will allow you to monitor your damage dealt, gold earned, and many more!"
         },{
            "strName":"Battlepets",
            "bEnabled":litePreference.data.bBattlepet,
            "sDesc":"Allows your battlepet to fight alongside you without a battlepet class equipped."
         },{
            "strName":"Static Player Art",
            "bEnabled":litePreference.data.bCachePlayers,
            "sDesc":"Reduces the graphics of other players. \n!WARNING! Having this enabled may or may not show some of the other player\'s colors. You will not be able to see their equipment changes with this enabled either.\nYou must change rooms after turning this feature off in order for changes to take effect"
         },{
            "strName":"Char Page",
            "special":1,
            "sDesc":"Search Character Pages"
         },{
            "strName":"Character Select Screen",
            "bEnabled":litePreference.data.bCharSelect,
            "sDesc":"Allows you to replace the login screen with a character select screen."
         },{
            "strName":"Chat Settings",
            "bEnabled":litePreference.data.bChatFilter,
            "sDesc":"Allow the customization of the game\'s chat window with the options below!",
            "extra":[{
               "strName":"Timestamps",
               "bEnabled":litePreference.data.dOptions["timeStamps"],
               "sDesc":"Adding timestamps to chat messages (Server Time)\nOnly works on the old chat ui!"
            },{
               "strName":"Disable Red Messages",
               "bEnabled":litePreference.data.dOptions["disRed"],
               "sDesc":"Avoid receiving combat warning messages in chat"
            }]
         },{
            "strName":"Chat UI",
            "bEnabled":litePreference.data.bChatUI,
            "sDesc":"If enabled, you will switch to the new Chat UI.",
            "extra":[{
               "strName":"Minimal Mode",
               "bEnabled":litePreference.data.dOptions["chatMinimal"],
               "sDesc":"Less intrusive on your gameplay!\nHover over the message box to make the messages visible\nScroll over the message box to scroll!"
            },{
               "strName":"Disable AutoScroll to Bottom",
               "bEnabled":litePreference.data.dOptions["chatScroll"],
               "sDesc":"The Chat UI will not automatically scroll to the bottom on a new message"
            }]
         },{
            "strName":"Class Actives/Auras UI",
            "bEnabled":litePreference.data.bAuras,
            "sDesc":"Work in Progress. No proper stack limit and icons yet.\nAllows you to view your buffs/auras underneath your player portrait and for your enemies as well!",
            "extra":[{
               "strName":"Disable ToolTips",
               "bEnabled":litePreference.data.dOptions["disAuraTips"],
               "sDesc":"Prevents you from seeing tooltips when hovering over an aura."
            },{
               "strName":"Disable Aura Text",
               "bEnabled":litePreference.data.dOptions["disAuraText"],
               "sDesc":"Prevents you from seeing the yellow aura text on you or other players."
            }]
         },{
            "strName":"Color Sets",
            "bEnabled":litePreference.data.bColorSets,
            "sDesc":"Save your colors with this tool that appears when you go customizing your hair or armor colors!"
         },{
            "strName":"Custom Drops UI",
            "bEnabled":litePreference.data.bCustomDrops,
            "sDesc":"Shift+Click to block an item drop!\nYour bank items must be loaded to detect if you already have an item",
            "extra":[{
               "strName":"Invert Menu",
               "bEnabled":litePreference.data.dOptions["invertMenu"],
               "sDesc":"The drop menu will appear at the top of the screen rather than appearing at the bottom"
            },{
               "strName":"Warn When Declining A Drop",
               "bEnabled":litePreference.data.dOptions["warnDecline"],
               "sDesc":"A confirmation box will appear to confirm if you want to decline an item drop"
            },{
               "strName":"Hide Drop Notifications",
               "bEnabled":litePreference.data.dOptions["hideDrop"],
               "sDesc":"This will hide regular drop notifications"
            },{
               "strName":"Hide Temporary Drop Notifications",
               "bEnabled":litePreference.data.dOptions["hideTemp"],
               "sDesc":"This will hide temporary drop notifications"
            },{
               "strName":"Opened Menu",
               "bEnabled":litePreference.data.dOptions["openMenu"],
               "sDesc":"The Custom Drops UI will start up opened rather than closed"
            },{
               "strName":"Draggable Mode",
               "bEnabled":litePreference.data.dOptions["dragMode"],
               "sDesc":"The Custom Drops UI will be draggable rather than being attached to the screen"
            },{
               "strName":"Lock Position",
               "bEnabled":litePreference.data.dOptions["lockMode"],
               "sDesc":"The draggable Custom Drops UI will not be moved from where it was last placed"
            },{
               "strName":"Reset Position",
               "extra":"btn",
               "sDesc":"If the Drop UI somehow goes off-screen and you can\'t see it, then use this to get it back!\nWorks only for \"Draggable Mode\""
            },{
               "strName":"Quantity Warnings",
               "bEnabled":litePreference.data.dOptions["termsAgree"],
               "sDesc":"By disabling this feature you understand help from player support for unaccepted drops will be limited"
            }]
         },{
            "strName":"Disable Chat Scrolling",
            "bEnabled":litePreference.data.bDisChatScroll,
            "sDesc":"Prevents you from scrolling the chat\nOnly works on the old chat ui!"
         },{
            "strName":"Disable Damage Numbers",
            "bEnabled":litePreference.data.bDisDmgDisplay,
            "sDesc":"Disables all damage numbers from showing as well as the white flash/strobe effect"
         },{
            "strName":"Disable Damage Strobe",
            "bEnabled":litePreference.data.bDisDmgStrobe,
            "sDesc":"Prevents the white flash/strobe effect whenever a monster or player is damaged!"
         },{
            "strName":"Disable Monster Animations",
            "bEnabled":litePreference.data.bDisMonAnim,
            "sDesc":"Disables monster animations with the benefit of performance"
         },{
            "strName":"Disable Self Animations",
            "bEnabled":litePreference.data.bDisSelfMAnim,
            "sDesc":"Disables your player\'s movement animations except for walking for the benefit of performance"
         },{
            "strName":"Disable Skill Animations",
            "bEnabled":litePreference.data.bDisSkillAnim,
            "sDesc":"There are two types of animations: Class Skill Animations & Player Movement Animations\nThis feature disables Class Skill Animations only while the regular \"Animations\" setting will disable both Class Skill Animations & Player Movement Animations",
            "extra":[{
               "strName":"Show Your Skill Animations Only",
               "bEnabled":litePreference.data.dOptions["animSelf"],
               "sDesc":"Only works if \"Disable Skill Animations\" is enabled!\nAdds an exception to \"Disable Skill Animations\" to show your skill animations only"
            }]
         },{
            "strName":"Disable Quest Popup",
            "bEnabled":litePreference.data.bDisQPopup,
            "sDesc":"Prevent the Quest Complete Popup if it becomes too intrusive"
         },{
            "strName":"Disable Quest Tracker",
            "bEnabled":litePreference.data.bDisQTracker,
            "sDesc":"Prevent the Quest Tracker from opening"
         },{
            "strName":"Disable Weapon Animations",
            "bEnabled":litePreference.data.bDisWepAnim,
            "sDesc":"Disables weapon animations\nYou can disable a specific player\'s weapon animations by targetting them and clicking on their portrait!",
            "extra":[{
               "strName":"Keep Your Weapon Animations Only",
               "bEnabled":litePreference.data.dOptions["wepSelf"],
               "sDesc":"Only works if \"Disable Weapon Animation\" is enabled!\nHaving this enabled will allow your weapon animations to continue working while others have theirs disabled"
            }]
         },{
            "strName":"Decline All Drops",
            "extra":"btn",
            "sDesc":"Declines all the drops on your screen"
         },{
            "strName":"Display FPS",
            "extra":"btn",
            "sDesc":"Toggles the Frames Per Second Display"
         },{
            "strName":"Draggable Drops",
            "bEnabled":litePreference.data.bDraggable,
            "sDesc":"Allows you to drag, or move around, the drops on your screen\nToggling this on with drops already on your screen will not make those drops draggable\nOnly works if \"Custom Drops UI\" is not enabled"
         },{
            "strName":"Freeze / Lock Monster Position",
            "bEnabled":litePreference.data.bFreezeMons,
            "sDesc":"This will freeze monsters on the map in place to prevent players from luring/dragging monsters all over the map"
         },{
            "strName":"Invisible Monsters",
            "bEnabled":litePreference.data.bHideMons,
            "sDesc":"Make monsters invisible. You can target them by clicking on their shadow"
         },{
            "strName":"Hide Players",
            "bEnabled":litePreference.data.bHidePlayers,
            "sDesc":"This will hide players on the map\nYou can hide specific players by clicking on their portraits (targetting them)!",
            "extra":[{
               "strName":"Show Name Tags",
               "bEnabled":litePreference.data.dOptions["showNames"],
               "sDesc":"Only works if \"Hide Players\" is enabled!\nHaving this enabled will allow you to still see name tags of players even though they\'re hidden."
            },{
               "strName":"Show Shadows",
               "bEnabled":litePreference.data.dOptions["showShadows"],
               "sDesc":"Only works if \"Hide Players\" is enabled!\nHaving this enabled will allow you to still see player shadows and clicking on the shadows will target them."
            }]
         },{
            "strName":"Hide Player Names",
            "bEnabled":litePreference.data.bHideNames,
            "sDesc":"Hides player names\nHover over a player to reveal their name & guild",
            "extra":[{
               "strName":"Hide Guild Names Only",
               "bEnabled":litePreference.data.dOptions["hideGuild"],
               "sDesc":"Player names will be visible, and guild names will be hidden"
            },{
               "strName":"Hide Your Name Only",
               "bEnabled":litePreference.data.dOptions["hideSelf"],
               "sDesc":"Only your name will be hidden.\nEnabling this setting will not make \"Hide Guild Names Only\" work."
            }]
         },{
            "strName":"Hide UI",
            "bEnabled":litePreference.data.bHideUI,
            "sDesc":"Hides player & target portraits located on the top left as well as the map name & area list located on the bottom right"
         },{
            "strName":"Item Drops Block List",
            "extra":"btn",
            "sDesc":"Shift+Click dropped items while using \"Custom Drops UI\" to add items to block!"
         },{
            "strName":"Keybinds",
            "extra":"btn",
            "sDesc":"Customize game keybinds.\nYou can not bind ENTER or /.\nUse BACKSPACE to delete a bind."
         },{
            "strName":"Reaccept Quest After Turn-In",
            "bEnabled":litePreference.data.bReaccept,
            "sDesc":"After turning in a quest, it will try to reaccept the quest if possible"
         },{
            "strName":"Show Monster Type",
            "bEnabled":litePreference.data.bMonsType,
            "sDesc":"Display the monster\'s type as a tag under their name"
         },{
            "strName":"Smooth Background",
            "bEnabled":litePreference.data.bSmoothBG,
            "sDesc":"Removes map background pixelation\nYou must reload the map or move to a new area to see changes take affect"
         },{
            "strName":"Travel Menu",
            "extra":"btn",
            "sDesc":"Jump between multiple maps with a press of a button!\nThe keybind to jump maps is rebindable within \"Keybinds\"!"
         },{
            "strName":"Quest Pinner",
            "bEnabled":litePreference.data.bQuestPin,
            "sDesc":"1. Open quests from any NPC\n2. Press the \"Pin Quests\" button (left)\n3. You can now access it from anywhere by clicking on the yellow (!) quest log icon at the top left!\nShift+Click the yellow (!) quest log icon to open the Quest Tracker!\nShift+Click the quest pinner icon to clear your pinned quests!"
         },{
            "strName":"Quest Progress Notifications",
            "bEnabled":litePreference.data.bQuestNotif,
            "sDesc":"Quest Progress will continue to notify/update you even when you\'ve completed the quest"
         },{
            "strName":"Visual Skill CDs",
            "bEnabled":litePreference.data.bSkillCD,
            "sDesc":"Visual skill cooldowns!"
         },{
            "strName":"Hide Ground Items",
            "bEnabled":litePreference.data.bDisGround,
            "sDesc":"Hides the item type \'Ground\' from other players",
            "extra":[{
               "strName":"Show Your Ground Item Only",
               "bEnabled":litePreference.data.dOptions["groundSelf"],
               "sDesc":"Other players\' ground items will be hidden, while yours remains visible"
            }]
         },{
            "strName":"Hide Healing Bubbles",
            "bEnabled":litePreference.data.bDisHealBubble,
            "sDesc":"Hides the green healing bubbles above players when they\'re low on health"
         }];
      }
      
      public function isTestClient() : Boolean
      {
         var _loc1_:Array = null;
         var _loc2_:* = undefined;
         _loc1_ = ["Dev Grotto","Dev04"];
         for each(var _loc5_ in _loc1_)
         {
            _loc2_ = _loc5_;
            _loc5_;
            if(objServerInfo.sName.toLowerCase() == _loc2_.toLowerCase())
            {
               return true;
            }
         }
         return false;
      }
      
      public function castSpellFX(param1:*, param2:*, param3:*, param4:*) : *
      {
         cameraToolMC.castSpellFX();
      }
      
      public function movieClipStopAll(param1:MovieClip) : void
      {
         var _loc2_:uint = 0;
         _loc2_ = 0;
         while(_loc2_ < param1.numChildren)
         {
            if(param1.getChildAt(_loc2_) is MovieClip)
            {
               try
               {
                  (param1.getChildAt(_loc2_) as MovieClip).gotoAndStop(0);
                  movieClipStopAll(param1.getChildAt(_loc2_) as MovieClip);
               }
               catch(exception:*)
               {
               }
            }
            _loc2_++;
         }
      }
      
      public function rasterizePart(param1:DisplayObject) : Bitmap
      {
         var _loc2_:Matrix = null;
         var _loc3_:Rectangle = null;
         var _loc4_:Point = null;
         var _loc5_:BitmapData = null;
         var _loc6_:Bitmap = null;
         _loc2_ = param1.transform.matrix;
         _loc3_ = param1.getBounds(param1.parent);
         _loc4_ = new Point(param1.x - _loc3_.left,param1.y - _loc3_.top);
         _loc2_.tx = _loc4_.x;
         _loc2_.ty = _loc4_.y;
         _loc5_ = new BitmapData(_loc3_.width,_loc3_.height,true,0);
         _loc5_.draw(param1,_loc2_,param1.transform.colorTransform,null,null,true);
         _loc6_ = new Bitmap(_loc5_);
         _loc6_.smoothing = true;
         _loc6_.x = _loc6_.x - _loc4_.x;
         _loc6_.y = _loc6_.y - _loc4_.y;
         return _loc6_;
      }
      
      public function rasterize(param1:MovieClip) : void
      {
         movieClipRasterizeInner(param1);
      }
      
      public function movieClipRasterizeInner(param1:MovieClip) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:MovieClip = null;
         var _loc4_:Sprite = null;
         var _loc5_:* = undefined;
         _loc2_ = 0;
         while(_loc2_ < param1.numChildren)
         {
            if(param1.getChildAt(_loc2_) is MovieClip)
            {
               try
               {
                  _loc3_ = param1.getChildAt(_loc2_) as MovieClip;
                  if(_loc3_.visible != false)
                  {
                     _loc3_.getChildAt(0).visible = false;
                     _loc4_ = new Sprite();
                     _loc4_.addChild(rasterizePart(_loc3_.getChildAt(0)));
                     _loc5_ = _loc3_.addChildAt(_loc4_,0);
                     movieClipRasterizeInner(param1.getChildAt(_loc2_) as MovieClip);
                  }
               }
               catch(exception:*)
               {
               }
            }
            _loc2_++;
         }
      }
      
      public function getQuestValidationString(param1:Object) : String
      {
         var _loc2_:int = 0;
         var _loc3_:* = undefined;
         var _loc4_:int = 0;
         var _loc5_:* = undefined;
         var _loc6_:String = null;
         var _loc7_:int = 0;
         var _loc8_:Object = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = undefined;
         if(param1.sField != null && world.getAchievement(param1.sField,param1.iIndex) != 0)
         {
            if(param1.sField == "im0")
            {
               return "Monthly Quests are only available once per month.";
            }
            if(param1.sField == "iw0")
            {
               return "Weekly Quests are only available once per week.";
            }
            return "Daily Quests are only available once per day.";
         }
         if(param1.bUpg == 1 && !world.myAvatar.isUpgraded())
         {
            return "Upgrade is required for this quest!";
         }
         if(param1.iSlot >= 0 && world.getQuestValue(param1.iSlot) < param1.iValue - 1)
         {
            return "Quest has not been unlocked!";
         }
         if(param1.iLvl > world.myAvatar.objData.intLevel)
         {
            return "Unlocks at Level " + param1.iLvl + ".";
         }
         if(param1.iClass > 0 && world.myAvatar.getCPByID(param1.iClass) < param1.iReqCP)
         {
            _loc2_ = getRankFromPoints(param1.iReqCP);
            _loc3_ = param1.iReqCP - arrRanks[_loc2_ - 1];
            if(_loc3_ > 0)
            {
               return "Requires " + _loc3_ + " Class Points on " + param1.sClass + ", Rank " + _loc2_ + ".";
            }
            return "Requires " + param1.sClass + ", Rank " + _loc2_ + ".";
         }
         if(param1.FactionID > 1 && world.myAvatar.getRep(param1.FactionID) < param1.iReqRep)
         {
            _loc4_ = getRankFromPoints(param1.iReqRep);
            _loc5_ = param1.iReqRep - arrRanks[_loc4_ - 1];
            if(_loc5_ > 0)
            {
               return "Requires " + _loc5_ + " Reputation for " + param1.sFaction + ", Rank " + _loc4_ + ".";
            }
            return "Requires " + param1.sFaction + ", Rank " + _loc4_ + ".";
         }
         if(param1.reqd != null && !hasRequiredItemsForQuest(param1))
         {
            _loc6_ = "Required Item(s): ";
            _loc7_ = 0;
            while(_loc7_ < param1.reqd.length)
            {
               _loc8_ = world.invTree[param1.reqd[_loc7_].ItemID];
               _loc9_ = int(param1.reqd[_loc7_].iQty);
               if(_loc8_.sES == "ar")
               {
                  _loc10_ = getRankFromPoints(_loc9_);
                  _loc11_ = _loc9_ - arrRanks[_loc10_ - 1];
                  if(_loc11_ > 0)
                  {
                     _loc6_ = _loc6_ + (_loc11_ + " Class Points on ");
                  }
                  _loc6_ = _loc6_ + (_loc8_.sName + ", Rank " + _loc10_);
               }
               else
               {
                  _loc6_ = _loc6_ + _loc8_.sName;
                  if(_loc9_ > 1)
                  {
                     _loc6_ = _loc6_ + ("x" + _loc9_);
                  }
               }
               _loc6_ = _loc6_ + ", ";
               _loc7_++;
            }
            return _loc6_.substr(0,_loc6_.length - 2) + ".";
         }
         return "";
      }
      
      private function hasRequiredItemsForQuest(param1:Object) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:* = undefined;
         var _loc4_:int = 0;
         if(param1.reqd != null && param1.reqd.length > 0)
         {
            _loc2_ = 0;
            while(_loc2_ < param1.reqd.length)
            {
               _loc3_ = param1.reqd[_loc2_].ItemID;
               _loc4_ = int(param1.reqd[_loc2_].iQty);
               if(world.invTree[_loc3_] == null || int(world.invTree[_loc3_].iQty) < _loc4_)
               {
                  return false;
               }
               _loc2_++;
            }
         }
         return true;
      }
      
      public function xTryMe(param1:Object) : *
      {
         var _loc2_:String = null;
         switch(param1.sES)
         {
            case "Weapon":
            case "he":
            case "ba":
            case "pe":
            case "ar":
            case "co":
            case "mi":
               _loc2_ = param1.sES;
               _loc2_ = _loc2_ == "ar" ? "co" : _loc2_;
               if(_loc2_ == "pe")
               {
                  if(world.myAvatar.objData.eqp["pe"])
                  {
                     world.myAvatar.unloadPet();
                  }
               }
               if(!world.myAvatar.objData.eqp[_loc2_])
               {
                  world.myAvatar.objData.eqp[_loc2_] = {};
                  world.myAvatar.objData.eqp[_loc2_].wasCreated = true;
               }
               if(Boolean(world.myAvatar.objData.eqp[_loc2_].isPreview) || Boolean(world.myAvatar.objData.eqp[_loc2_].wasCreated))
               {
                  if(world.myAvatar.objData.eqp[_loc2_].sFile == param1.sFile && world.myAvatar.objData.eqp[_loc2_].sType == param1.sType)
                  {
                     if(world.myAvatar.objData.eqp[_loc2_].wasCreated)
                     {
                        delete world.myAvatar.objData.eqp[_loc2_];
                        world.myAvatar.unloadMovieAtES(_loc2_);
                     }
                     else if(world.myAvatar.objData.eqp[_loc2_].isPreview)
                     {
                        if(_loc2_ == "pe")
                        {
                           if(world.myAvatar.objData.eqp["pe"])
                           {
                              world.myAvatar.unloadPet();
                           }
                        }
                        world.myAvatar.objData.eqp[_loc2_].sType = world.myAvatar.objData.eqp[_loc2_].oldType;
                        world.myAvatar.objData.eqp[_loc2_].sFile = world.myAvatar.objData.eqp[_loc2_].oldFile;
                        world.myAvatar.objData.eqp[_loc2_].sLink = world.myAvatar.objData.eqp[_loc2_].oldLink;
                        world.myAvatar.loadMovieAtES(_loc2_,world.myAvatar.objData.eqp[_loc2_].oldFile,world.myAvatar.objData.eqp[_loc2_].oldLink);
                        world.myAvatar.objData.eqp[_loc2_].isPreview = null;
                     }
                     return;
                  }
               }
               if(!world.myAvatar.objData.eqp[_loc2_].isPreview)
               {
                  world.myAvatar.objData.eqp[_loc2_].isPreview = true;
                  if(!world.myAvatar.objData.eqp[_loc2_].isShowable)
                  {
                     if("sType" in param1)
                     {
                        world.myAvatar.objData.eqp[_loc2_].oldType = world.myAvatar.objData.eqp[_loc2_].sType;
                     }
                     world.myAvatar.objData.eqp[_loc2_].oldFile = world.myAvatar.objData.eqp[_loc2_].sFile;
                     world.myAvatar.objData.eqp[_loc2_].oldLink = world.myAvatar.objData.eqp[_loc2_].sLink;
                  }
               }
               if("sType" in param1)
               {
                  world.myAvatar.objData.eqp[_loc2_].sType = param1.sType;
               }
               world.myAvatar.objData.eqp[_loc2_].sFile = param1.sFile == "undefined" ? "" : param1.sFile;
               world.myAvatar.objData.eqp[_loc2_].sLink = param1.sLink;
               world.myAvatar.loadMovieAtES(_loc2_,param1.sFile,param1.sLink);
               if(_loc2_ == "pe" && param1.sName.indexOf("Bank Pet") != -1)
               {
                  petDisable.addEventListener(TimerEvent.TIMER,onPetDisable,false,0,true);
                  petDisable.start();
               }
               hasPreviewed = true;
               return;
            default:
               return;
         }
      }
      
      internal function onPetDisable(param1:TimerEvent) : void
      {
         if(!world.myAvatar.petMC.mcChar)
         {
            return;
         }
         world.myAvatar.petMC.mcChar.mouseEnabled = false;
         world.myAvatar.petMC.mcChar.mouseChildren = false;
         world.myAvatar.petMC.mcChar.enabled = false;
         petDisable.reset();
         petDisable.removeEventListener(TimerEvent.TIMER,onPetDisable);
      }
      
      public function showPortrait(param1:Avatar) : *
      {
         if(litePreference.data.bHideUI)
         {
            return;
         }
         showPortraitBox(param1,ui.mcPortrait);
         world.updatePortrait(param1);
         ui.iconQuest.visible = true;
         ui.monsterIcon.visible = true;
      }
      
      public function hidePortrait() : void
      {
         ui.monsterIcon.visible = false;
         ui.mcPortrait.visible = false;
         ui.iconQuest.visible = false;
      }
      
      public function showPortraitTarget(param1:Avatar) : *
      {
         if(litePreference.data.bHideUI)
         {
            return;
         }
         showPortraitBox(Number(world.objExtra["bChar"]) == 1 ? world.myAvatar : param1,ui.mcPortraitTarget);
         ui.mcPortraitTarget.pvpIcon.visible = world.bPvP;
         world.updatePortrait(param1);
         ui.btnTargetPortraitClose.visible = true;
      }
      
      public function hidePortraitTarget() : void
      {
         var _loc1_:MovieClip = null;
         var _loc2_:DisplayObject = null;
         _loc1_ = ui.mcPortraitTarget.mcHead as MovieClip;
         _loc2_ = _loc1_.head.getChildByName("face");
         if(_loc2_ != null)
         {
            _loc1_.head.removeChild(_loc2_);
         }
         while(_loc1_.backhair.numChildren > 0)
         {
            _loc1_.backhair.removeChildAt(0);
         }
         while(_loc1_.head.hair.numChildren > 0)
         {
            _loc1_.head.hair.removeChildAt(0);
         }
         while(_loc1_.head.helm.numChildren > 0)
         {
            _loc1_.head.helm.removeChildAt(0);
         }
         ui.mcPortraitTarget.visible = false;
         ui.btnTargetPortraitClose.visible = false;
      }
      
      public function showPortraitBox(param1:Avatar, param2:MovieClip) : *
      {
         var AssetClass:Class = null;
         var mc:MovieClip = null;
         var child:DisplayObject = null;
         var bBackHair:Boolean = false;
         var sSkinLink:String = null;
         var AssetClass2:Class = null;
         var avt:Avatar = param1;
         var mcPortraitBox:MovieClip = param2;
         mc = mcPortraitBox.mcHead as MovieClip;
         bBackHair = false;
         mcPortraitBox.pAV = avt;
         if(avt.npcType == "monster")
         {
            AssetClass = world.getClass("mcHead" + avt.objData.strLinkage);
            child = mc.head.getChildByName("face");
            if(child != null)
            {
               mc.head.removeChild(child);
            }
            mc.head.addChildAt(new AssetClass(),0).name = "face";
            mc.head.hair.visible = false;
            mc.head.helm.visible = false;
            mc.backhair.visible = false;
         }
         else
         {
            try
            {
               sSkinLink = avt.objData.eqp.ar.sLink;
               if(avt.objData.eqp.co != null)
               {
                  sSkinLink = avt.objData.eqp.co.sLink;
               }
               AssetClass = world.getClass(sSkinLink + avt.objData.strGender + "Head");
               child = mc.head.getChildByName("face");
               if(child != null)
               {
                  mc.head.removeChild(child);
               }
               mc.head.addChildAt(new AssetClass(),0).name = "face";
            }
            catch(err:Error)
            {
               AssetClass = world.getClass("mcHead" + avt.objData.strGender);
               child = mc.head.getChildByName("face");
               if(child != null)
               {
                  mc.head.removeChild(child);
               }
               mc.head.addChildAt(new AssetClass(),0).name = "face";
            }
            AssetClass = world.getClass(avt.objData.strHairName + avt.objData.strGender + "Hair");
            onRemoveChildrens(mc.head.hair);
            try
            {
               mc.head.hair.addChild(new AssetClass());
               mc.head.hair.cacheAsBitmap = true;
            }
            catch(e:Error)
            {
            }
            mc.head.hair.visible = true;
            try
            {
               AssetClass = world.getClass(avt.objData.strHairName + avt.objData.strGender + "HairBack");
               while(mc.backhair.numChildren > 0)
               {
                  mc.backhair.removeChildAt(0);
               }
               mc.backhair.addChild(new AssetClass());
               mc.backhair.visible = true;
               bBackHair = true;
            }
            catch(err:Error)
            {
               mc.backhair.visible = false;
            }
            if(avt.objData.eqp.he != null && avt.objData.eqp.he.sLink != null)
            {
               try
               {
                  AssetClass = world.getClass(avt.objData.eqp.he.sLink);
                  AssetClass2 = world.getClass(avt.objData.eqp.he.sLink + "_backhair") as Class;
                  while(mc.head.helm.numChildren > 0)
                  {
                     mc.head.helm.removeChildAt(0);
                  }
                  mc.head.helm.addChild(new AssetClass());
                  mc.head.helm.visible = avt.dataLeaf.showHelm;
                  mc.head.hair.visible = !mc.head.helm.visible;
                  if(AssetClass2 != null)
                  {
                     if(avt.dataLeaf.showHelm)
                     {
                        if(mc.backhair.numChildren > 0)
                        {
                           mc.backhair.removeChildAt(0);
                        }
                        mc.backhair.visible = true;
                        mc.backhair.addChild(new AssetClass2());
                     }
                  }
                  else
                  {
                     mc.backhair.visible = mc.head.hair.visible && bBackHair;
                  }
               }
               catch(err:Error)
               {
                  mc.head.helm.visible = false;
               }
            }
            else
            {
               mc.head.helm.visible = false;
            }
         }
         mcPortraitBox.visible = true;
         ui.mcPortrait.iconDrops.initRoot(this);
         ui.mcPortrait.iconDrops.visible = litePreference.data.bCustomDrops;
      }
      
      public function oniconQuestClick(param1:MouseEvent) : void
      {
         if(litePreference.data.bQuestPin)
         {
            if(param1.shiftKey)
            {
               ui.mcQTracker.toggle();
               return;
            }
            world.showQuests(pinnedQuests,"q");
         }
         else
         {
            ui.mcQTracker.toggle();
         }
      }
      
      public function manageXPBoost(param1:Object) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         ui.mcPortrait.iconBoostXP.visible = param1.op == "+";
         if(param1.op == "+")
         {
            world.myAvatar.objData.iBoostXP = param1.iSecsLeft;
            ui.mcPortrait.iconBoostXP.boostTS = new Date().getTime();
            ui.mcPortrait.iconBoostXP.iBoostXP = param1.iSecsLeft;
            ui.mcPortrait.iconBoostXP.bShowShop = param1.bShowShop;
            addUpdate("You have activated the Experience Boost!  All Experience rewards are doubled while the effect holds.");
            chatF.pushMsg("server","You have activated the Experience Boost!  All Experience rewards are doubled while the effect holds. " + Math.ceil(param1.iSecsLeft / 60) + " minute(s) remaining.","SERVER","",0);
         }
         else
         {
            delete world.myAvatar.objData.iBoostXP;
            delete ui.mcPortrait.iconBoostXP.boostTS;
            delete ui.mcPortrait.iconBoostXP.iBoostXP;
            addUpdate("The Experience Boost has faded!  Experience rewards are no longer doubled.");
            chatF.pushMsg("server","The Experience Boost has faded!  Experience rewards are no longer doubled.","SERVER","",0);
            if(ui.mcPortrait.iconBoostXP.bShowShop != null && Boolean(ui.mcPortrait.iconBoostXP.bShowShop))
            {
               _loc2_ = new ModalMC();
               _loc3_ = {};
               _loc3_.strBody = "Your Experience Boost has faded!\tExperience rewards are no longer doubled.  Would you like to purchase a new Experience Boost?";
               _loc3_.params = {};
               _loc3_.callback = openExpBoostStore;
               _loc3_.glow = "red,medium";
               ui.ModalStack.addChild(_loc2_);
               _loc2_.init(_loc3_);
            }
         }
      }
      
      public function manageGBoost(param1:Object) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         ui.mcPortrait.iconBoostG.visible = param1.op == "+";
         if(param1.op == "+")
         {
            world.myAvatar.objData.iBoostG = param1.iSecsLeft;
            ui.mcPortrait.iconBoostG.boostTS = new Date().getTime();
            ui.mcPortrait.iconBoostG.iBoostG = param1.iSecsLeft;
            ui.mcPortrait.iconBoostG.bShowShop = param1.bShowShop;
            addUpdate("You have activated the Gold Boost!  All Gold rewards are doubled while the effect holds.");
            chatF.pushMsg("server","You have activated the Gold Boost!  All Gold rewards are doubled while the effect holds. " + Math.ceil(param1.iSecsLeft / 60) + " minute(s) remaining.","SERVER","",0);
         }
         else
         {
            delete world.myAvatar.objData.iBoostG;
            delete ui.mcPortrait.iconBoostG.boostTS;
            delete ui.mcPortrait.iconBoostG.iBoostG;
            addUpdate("The Gold Boost has faded!  Gold rewards are no longer doubled.");
            chatF.pushMsg("server","The Gold Boost has faded!  Gold rewards are no longer doubled.","SERVER","",0);
            if(ui.mcPortrait.iconBoostG.bShowShop != null && Boolean(ui.mcPortrait.iconBoostG.bShowShop))
            {
               _loc2_ = new ModalMC();
               _loc3_ = {};
               _loc3_.strBody = "Your Gold Boost has faded!  Gold rewards are no longer doubled.  Would you like to purchase a new Gold Boost?";
               _loc3_.params = {};
               _loc3_.callback = openExpBoostStore;
               _loc3_.glow = "red,medium";
               ui.ModalStack.addChild(_loc2_);
               _loc2_.init(_loc3_);
            }
         }
      }
      
      public function manageRepBoost(param1:Object) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         ui.mcPortrait.iconBoostRep.visible = param1.op == "+";
         if(param1.op == "+")
         {
            world.myAvatar.objData.iBoostRep = param1.iSecsLeft;
            ui.mcPortrait.iconBoostRep.boostTS = new Date().getTime();
            ui.mcPortrait.iconBoostRep.iBoostRep = param1.iSecsLeft;
            ui.mcPortrait.iconBoostRep.bShowShop = param1.bShowShop;
            addUpdate("You have activated the Reputation Boost!  All Reputation rewards are doubled while the effect holds.");
            chatF.pushMsg("server","You have activated the Reputation Boost!  All Reputation rewards are doubled while the effect holds. " + Math.ceil(param1.iSecsLeft / 60) + " minute(s) remaining.","SERVER","",0);
         }
         else
         {
            delete world.myAvatar.objData.iBoostRep;
            delete ui.mcPortrait.iconBoostRep.boostTS;
            delete ui.mcPortrait.iconBoostRep.iBoostRep;
            addUpdate("The Reputation Boost has faded!  Reputation rewards are no longer doubled.");
            chatF.pushMsg("server","The Reputation Boost has faded!  Reputation rewards are no longer doubled.","SERVER","",0);
            if(ui.mcPortrait.iconBoostRep.bShowShop != null && Boolean(ui.mcPortrait.iconBoostRep.bShowShop))
            {
               _loc2_ = new ModalMC();
               _loc3_ = {};
               _loc3_.strBody = "Your Reputation Boost has faded!\tReputation rewards are no longer doubled.  Would you like to purchase a new Reputation Boost?";
               _loc3_.params = {};
               _loc3_.callback = openExpBoostStore;
               _loc3_.glow = "red,medium";
               ui.ModalStack.addChild(_loc2_);
               _loc2_.init(_loc3_);
            }
         }
      }
      
      public function manageCPBoost(param1:Object) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         ui.mcPortrait.iconBoostCP.visible = param1.op == "+";
         if(param1.op == "+")
         {
            world.myAvatar.objData.iBoostCP = param1.iSecsLeft;
            ui.mcPortrait.iconBoostCP.boostTS = new Date().getTime();
            ui.mcPortrait.iconBoostCP.iBoostCP = param1.iSecsLeft;
            ui.mcPortrait.iconBoostCP.bShowShop = param1.bShowShop;
            addUpdate("You have activated the ClassPoint Boost!  All ClassPoint rewards are doubled while the effect holds.");
            chatF.pushMsg("server","You have activated the ClassPoint Boost!  All ClassPoint rewards are doubled while the effect holds. " + Math.ceil(param1.iSecsLeft / 60) + " minute(s) remaining.","SERVER","",0);
         }
         else
         {
            delete world.myAvatar.objData.iBoostCP;
            delete ui.mcPortrait.iconBoostCP.boostTS;
            delete ui.mcPortrait.iconBoostCP.iBoostCP;
            addUpdate("The ClassPoint Boost has faded!  ClassPoint rewards are no longer doubled.");
            chatF.pushMsg("server","The ClassPoint Boost has faded!  ClassPoint rewards are no longer doubled.","SERVER","",0);
            if(ui.mcPortrait.iconBoostCP.bShowShop != null && Boolean(ui.mcPortrait.iconBoostCP.bShowShop))
            {
               _loc2_ = new ModalMC();
               _loc3_ = {};
               _loc3_.strBody = "Your ClassPoint Boost has faded!\tClassPoint rewards are no longer doubled.  Would you like to purchase a new ClassPoint Boost?";
               _loc3_.params = {};
               _loc3_.callback = openExpBoostStore;
               _loc3_.glow = "red,medium";
               ui.ModalStack.addChild(_loc2_);
               _loc2_.init(_loc3_);
            }
         }
      }
      
      public function oniconBoostXPOver(param1:MouseEvent) : void
      {
         var _loc2_:MovieClip = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         _loc2_ = MovieClip(param1.currentTarget);
         _loc3_ = Number(new Date().getTime());
         _loc4_ = Math.max(_loc2_.boostTS + _loc2_.iBoostXP * 1000 - _loc3_,0);
         _loc5_ = 0;
         _loc6_ = "All Experience gains are doubled.\n";
         if(_loc4_ < 120000)
         {
            _loc5_ = int(Math.floor(_loc4_ / 60000));
            _loc6_ = _loc6_ + String(_loc5_ + " minute(s), ");
            _loc5_ = int(Math.round(_loc4_ % 60000 / 1000));
            _loc6_ = _loc6_ + String(_loc5_ + " second(s) remaining.");
         }
         else
         {
            _loc5_ = int(Math.round(_loc4_ / 60000));
            _loc6_ = _loc6_ + String(_loc5_ + " minutes remaining.");
         }
         ui.ToolTip.openWith({"str":_loc6_});
      }
      
      public function oniconBoostGoldOver(param1:MouseEvent) : void
      {
         var _loc2_:MovieClip = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         _loc2_ = MovieClip(param1.currentTarget);
         _loc3_ = Number(new Date().getTime());
         _loc4_ = Math.max(_loc2_.boostTS + _loc2_.iBoostG * 1000 - _loc3_,0);
         _loc5_ = 0;
         _loc6_ = "All Gold gains are doubled.\n";
         if(_loc4_ < 120000)
         {
            _loc5_ = int(Math.floor(_loc4_ / 60000));
            _loc6_ = _loc6_ + String(_loc5_ + " minute(s), ");
            _loc5_ = int(Math.round(_loc4_ % 60000 / 1000));
            _loc6_ = _loc6_ + String(_loc5_ + " second(s) remaining.");
         }
         else
         {
            _loc5_ = int(Math.round(_loc4_ / 60000));
            _loc6_ = _loc6_ + String(_loc5_ + " minutes remaining.");
         }
         ui.ToolTip.openWith({"str":_loc6_});
      }
      
      public function oniconBoostRepOver(param1:MouseEvent) : void
      {
         var _loc2_:MovieClip = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         _loc2_ = MovieClip(param1.currentTarget);
         _loc3_ = Number(new Date().getTime());
         _loc4_ = Math.max(_loc2_.boostTS + _loc2_.iBoostRep * 1000 - _loc3_,0);
         _loc5_ = 0;
         _loc6_ = "All Reputation gains are doubled.\n";
         if(_loc4_ < 120000)
         {
            _loc5_ = int(Math.floor(_loc4_ / 60000));
            _loc6_ = _loc6_ + String(_loc5_ + " minute(s), ");
            _loc5_ = int(Math.round(_loc4_ % 60000 / 1000));
            _loc6_ = _loc6_ + String(_loc5_ + " second(s) remaining.");
         }
         else
         {
            _loc5_ = int(Math.round(_loc4_ / 60000));
            _loc6_ = _loc6_ + String(_loc5_ + " minutes remaining.");
         }
         ui.ToolTip.openWith({"str":_loc6_});
      }
      
      public function oniconBoostCPOver(param1:MouseEvent) : void
      {
         var _loc2_:MovieClip = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         _loc2_ = MovieClip(param1.currentTarget);
         _loc3_ = Number(new Date().getTime());
         _loc4_ = Math.max(_loc2_.boostTS + _loc2_.iBoostCP * 1000 - _loc3_,0);
         _loc5_ = 0;
         _loc6_ = "All ClassPoint gains are doubled.\n";
         if(_loc4_ < 120000)
         {
            _loc5_ = int(Math.floor(_loc4_ / 60000));
            _loc6_ = _loc6_ + String(_loc5_ + " minute(s), ");
            _loc5_ = int(Math.round(_loc4_ % 60000 / 1000));
            _loc6_ = _loc6_ + String(_loc5_ + " second(s) remaining.");
         }
         else
         {
            _loc5_ = int(Math.round(_loc4_ / 60000));
            _loc6_ = _loc6_ + String(_loc5_ + " minutes remaining.");
         }
         ui.ToolTip.openWith({"str":_loc6_});
      }
      
      public function openExpBoostStore(param1:Object) : void
      {
         if(param1.accept)
         {
            world.sendLoadShopRequest(184);
         }
      }
      
      public function oniconBoostOut(param1:MouseEvent) : void
      {
         ui.ToolTip.close();
      }
      
      public function updateXPBar() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         _loc1_ = world.myAvatar.objData.intExp / world.myAvatar.objData.intExpToLevel;
         ui.mcInterface.mcXPBar.mcXP.scaleX = _loc1_ > 1 ? 1 : _loc1_;
         _loc2_ = world.myAvatar.objData;
         _loc3_ = _loc2_.intExp;
         _loc4_ = _loc2_.intExpToLevel;
         _loc5_ = int(_loc3_ / _loc4_ * 100);
         if(_loc5_ >= 100)
         {
            _loc5_ = 100;
         }
         ui.mcInterface.mcXPBar.strXP.text = "Level " + world.myAvatar.objData.intLevel + " : " + _loc3_ + " / " + _loc4_ + "  (" + _loc5_ + "%)";
      }
      
      public function xpBarMouseOver(param1:MouseEvent) : *
      {
         MovieClip(param1.currentTarget).strXP.visible = true;
      }
      
      public function xpBarMouseOut(param1:MouseEvent) : *
      {
         MovieClip(param1.currentTarget).strXP.visible = false;
      }
      
      public function updateRepBar() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         _loc1_ = world.myAvatar.objData.iCurCP;
         _loc2_ = world.myAvatar.objData.iCPToRank;
         if(_loc2_ <= 0)
         {
            ui.mcInterface.mcRepBar.mcRep.scaleX = 0.1;
            ui.mcInterface.mcRepBar.mcRep.visible = false;
            ui.mcInterface.mcRepBar.strRep.text = world.myAvatar.objData.strClassName + ", Rank " + world.myAvatar.objData.iRank;
         }
         else
         {
            _loc3_ = int(_loc1_ / _loc2_ * 100);
            if(_loc3_ >= 100)
            {
               _loc3_ = 100;
            }
            ui.mcInterface.mcRepBar.mcRep.scaleX = _loc1_ / _loc2_;
            ui.mcInterface.mcRepBar.mcRep.visible = true;
            ui.mcInterface.mcRepBar.strRep.text = world.myAvatar.objData.strClassName + ", Rank " + world.myAvatar.objData.iRank + " : " + _loc1_ + "/" + _loc2_ + "  (" + _loc3_ + "%)";
         }
      }
      
      public function onRepBarMouseOver(param1:MouseEvent) : *
      {
         MovieClip(param1.currentTarget).strRep.visible = true;
      }
      
      public function onRepBarMouseOut(param1:MouseEvent) : *
      {
         MovieClip(param1.currentTarget).strRep.visible = false;
      }
      
      public function disabledDelay(param1:TimerEvent) : void
      {
      }
      
      public function actIconClick(param1:MouseEvent) : *
      {
         var _loc2_:* = undefined;
         _loc2_ = MovieClip(param1.currentTarget).actObj;
         if(_loc2_.auto != null && _loc2_.auto == true)
         {
            world.approachTarget();
         }
         else
         {
            world.testAction(_loc2_);
         }
      }
      
      public function determineIndex(param1:Number) : Number
      {
         var _loc2_:Number = NaN;
         _loc2_ = 10;
         if(param1 <= 3)
         {
            _loc2_ = param1;
         }
         else if(param1 == 4)
         {
            _loc2_ = 5;
         }
         else if(param1 <= 6)
         {
            _loc2_ = 4;
         }
         return _loc2_;
      }
      
      public function actIconOver(param1:MouseEvent) : *
      {
         var _loc2_:MovieClip = null;
         var _loc3_:* = undefined;
         var _loc4_:String = null;
         _loc2_ = MovieClip(param1.currentTarget);
         if(Boolean(uoPref.bTT) || world.myAvatar.dataLeaf.intState != 2)
         {
            if(_loc2_.item == null)
            {
               _loc3_ = _loc2_.actObj;
               if(_loc3_ != null)
               {
                  _loc3_.desc = _loc3_.desc.replace(regExLineSpace,"\n");
                  _loc4_ = "<b>" + _loc3_.nam + "</b>\n";
                  if(!_loc3_.isOK)
                  {
                     _loc4_ = _loc4_ + ("<font color=\'#FF0000\'>Unlocks at Rank " + String(determineIndex(_loc2_.actionIndex)) + "!</font>\n");
                  }
                  if(_loc3_.typ != "passive")
                  {
                     if(_loc3_.mp > 0)
                     {
                        _loc4_ = _loc4_ + ("<font color=\'#0033AA\'>" + _loc3_.mp + "</font> mana, ");
                     }
                     _loc4_ = _loc4_ + ("<font color=\'#AA3300\'>" + _loc3_.cd / 1000 + "</font> sec cooldown" + "\n");
                  }
                  switch(_loc3_.typ)
                  {
                     case "p":
                     case "ph":
                     case "aa":
                        _loc4_ = _loc4_ + "Physical";
                        break;
                     case "m":
                        _loc4_ = _loc4_ + "Magical";
                        break;
                     case "ma":
                        _loc4_ = _loc4_ + "True Damage";
                        break;
                     case "pm":
                     case "mp":
                        _loc4_ = _loc4_ + "Hybrid";
                        break;
                     case "passive":
                        _loc4_ = _loc4_ + "<font color=\'#0033AA\'>Passive Ability</font>";
                  }
                  _loc4_ = _loc4_ + "\n";
                  if(_loc3_.typ != "passive")
                  {
                     if(_loc3_.range <= 301)
                     {
                        _loc4_ = _loc4_ + "A <font color=\'#AA3300\'>short range</font> ";
                     }
                     else if(_loc3_.range >= 3000)
                     {
                        _loc4_ = _loc4_ + "An <font color=\'#0033AA\'>infinite range</font> ";
                     }
                     else if(_loc3_.range >= 808)
                     {
                        _loc4_ = _loc4_ + "A <font color=\'#0033AA\'>long range</font> ";
                     }
                     else
                     {
                        _loc4_ = _loc4_ + "A <font color=\'#AA3300\'>medium range</font> ";
                     }
                     if(!_loc3_.damage)
                     {
                        _loc4_ = _loc4_ + "status skill that applies to ";
                     }
                     else
                     {
                        _loc4_ = _loc4_ + ((_loc3_.damage < 0 ? "skill" : "attack") + " that " + (_loc3_.damage < 0 ? "heals " : "deals damage to "));
                     }
                     if(_loc3_.tgt == "f")
                     {
                        _loc4_ = _loc4_ + ("<font color=\'#0033AA\'>" + (_loc3_.tgtMax || 1));
                        _loc4_ = _loc4_ + (_loc3_.tgtMax > 1 ? " friendly targets.</font>" : " target.</font>");
                     }
                     else if(_loc3_.tgt == "s")
                     {
                        _loc4_ = _loc4_ + "<font color=\'#0033AA\'>yourself.</font>";
                     }
                     else
                     {
                        _loc4_ = _loc4_ + ("<font color=\'#AA3300\'>" + (_loc3_.tgtMax || 1));
                        _loc4_ = _loc4_ + (_loc3_.tgtMax > 1 ? " hostile targets.</font>" : " target.</font>");
                     }
                     _loc4_ = _loc4_ + "\n\n";
                  }
                  if(_loc3_.sArg2 != "")
                  {
                     _loc4_ = _loc4_ + _loc3_.sArg2;
                  }
                  else
                  {
                     _loc4_ = _loc4_ + _loc3_.desc;
                  }
                  ui.ToolTip.openWith({
                     "str":_loc4_,
                     "lowerright":true
                  });
               }
            }
            else
            {
               ui.ToolTip.openWith({
                  "str":_loc2_.item.sName + "\n" + "<font color=\'#AA3300\'>" + _loc2_.actObj.cd / 1000 + "</font> sec cooldown\n" + _loc2_.item.sDesc,
                  "lowerright":true
               });
            }
         }
      }
      
      public function actIconOut(param1:MouseEvent) : *
      {
         var _loc2_:* = undefined;
         _loc2_ = MovieClip(stage.getChildAt(0)).ui.ToolTip;
         _loc2_.close();
      }
      
      public function portraitClick(param1:MouseEvent) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         _loc2_ = MovieClip(param1.currentTarget);
         if(_loc2_.pAV.npcType == "player")
         {
            _loc3_ = {};
            _loc3_.ID = _loc2_.pAV.objData.CharID;
            _loc3_.strUsername = _loc2_.pAV.objData.strUsername;
            if(_loc2_.pAV != world.myAvatar)
            {
               ui.cMenu.fOpenWith("user",_loc3_);
            }
            else
            {
               ui.cMenu.fOpenWith("self",_loc3_);
            }
         }
         else if(_loc2_.pAV.npcType == "monster")
         {
            _loc3_ = {};
            _loc3_.ID = _loc2_.pAV.objData.MonMapID;
            _loc3_.strUsername = _loc2_.pAV.objData.strMonName;
            _loc3_.target = world.getMonster(_loc3_.ID).pMC;
            ui.cMenu.fOpenWith("mons",_loc3_);
         }
      }
      
      private function onTargetPortraitCloseClick(param1:MouseEvent) : void
      {
         world.cancelTarget();
      }
      
      private function onBtnMonsterClick(param1:MouseEvent) : void
      {
         world.toggleMonsters();
      }
      
      public function showMap() : void
      {
         ui.mcInterface.mcMenu.mcMenuButtons.visible = true;
         ui.mcPopup.fOpen("Map");
      }
      
      public function logout() : void
      {
         if(Boolean(intChatMode) && Boolean(chatF.bTall))
         {
            ui.mcInterface.ncModeChat.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
         }
         if(litePreference.data.bCharSelect)
         {
            saveChar();
         }
         sfc.sendXtMessage("zm","cmd",["logout"],"str",1);
      }
      
      public function showServerList() : void
      {
         if(Boolean(intChatMode) && Boolean(chatF.bTall))
         {
            ui.mcInterface.ncModeChat.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
         }
         if(litePreference.data.bCharSelect)
         {
            saveChar();
         }
         showServers = true;
         sfc.sendXtMessage("zm","cmd",["logout"],"str",1);
      }
      
      public function showUpgradeWindow(param1:Object = null) : void
      {
         var _loc2_:MovieClip = null;
         if(mcUpgradeWindow == null)
         {
            mcUpgradeWindow = new MCUpgradeWindow();
         }
         _loc2_ = mcUpgradeWindow as MovieClip;
         var _loc3_:* = param1 != null ? param1 : world.myAvatar.objData;
         _loc2_.btnClose.addEventListener(MouseEvent.CLICK,hideUpgradeWindow,false,0,true);
         _loc2_.btnClose2.addEventListener(MouseEvent.CLICK,hideUpgradeWindow,false,0,true);
         _loc2_.btnBuy.addEventListener(MouseEvent.CLICK,onUpgradeClick,false,0,true);
         addChild(mcUpgradeWindow);
         try
         {
            ui.mouseChildren = false;
            world.mouseChildren = false;
         }
         catch(e:Error)
         {
         }
         try
         {
            mcLogin.sl.mouseChildren = false;
         }
         catch(e:Error)
         {
         }
      }
      
      public function hideUpgradeWindow(param1:MouseEvent) : void
      {
         removeChild(mcUpgradeWindow);
         try
         {
            ui.mouseChildren = true;
            world.mouseChildren = true;
         }
         catch(e:Error)
         {
         }
         try
         {
            mcLogin.sl.mouseChildren = true;
         }
         catch(e:Error)
         {
         }
      }
      
      public function onUpgradeClick(param1:Event) : void
      {
         var _loc2_:String = null;
         mixer.playSound("Click");
         if(ISWEB)
         {
            extCall.setUpPayment(sToken);
         }
         else
         {
            _loc2_ = "https://www.aq.com/order-now/direct/default.asp?cid=" + world.myAvatar.objData.CharID + "&token=" + loginInfo.strToken;
            navigateToURL(new URLRequest(_loc2_),"_blank");
         }
      }
      
      public function showACWindow() : void
      {
         var _loc1_:MovieClip = null;
         if(mcACWindow == null)
         {
            mcACWindow = new MCACWindow();
         }
         _loc1_ = mcACWindow as MovieClip;
         _loc1_.btnClose.addEventListener(MouseEvent.CLICK,hideACWindow,false,0,true);
         _loc1_.btnClose2.addEventListener(MouseEvent.CLICK,hideACWindow,false,0,true);
         _loc1_.btnBuy.addEventListener(MouseEvent.CLICK,onUpgradeClick,false,0,true);
         _loc1_.btnUpgrade.addEventListener(MouseEvent.CLICK,onUpgradeClick,false,0,true);
         addChild(mcACWindow);
         try
         {
            ui.mouseChildren = false;
            world.mouseChildren = false;
         }
         catch(e:Error)
         {
         }
         try
         {
            mcLogin.sl.mouseChildren = false;
         }
         catch(e:Error)
         {
         }
      }
      
      public function hideACWindow(param1:MouseEvent) : void
      {
         removeChild(mcACWindow);
         try
         {
            ui.mouseChildren = true;
            world.mouseChildren = true;
         }
         catch(e:Error)
         {
         }
         try
         {
            mcLogin.sl.mouseChildren = true;
         }
         catch(e:Error)
         {
         }
      }
      
      public function initArrHP() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Number = NaN;
         var _loc11_:* = undefined;
         _loc1_ = 100;
         _loc2_ = 550;
         _loc3_ = 275;
         _loc4_ = 0.8;
         _loc5_ = 720;
         _loc6_ = 200;
         _loc7_ = 0.92;
         _loc8_ = 350;
         _loc9_ = 3650;
         _loc10_ = 1.1;
         _loc11_ = 0;
         while(_loc11_ < _loc1_)
         {
            if(_loc11_ > 19)
            {
               arrHP.push(Math.round(_loc8_ + Math.pow(_loc11_ / _loc1_,_loc10_) * _loc9_));
            }
            else if(_loc11_ > 7)
            {
               arrHP.push(Math.round(_loc5_ + Math.pow(_loc11_ / 20,_loc7_) * _loc6_));
            }
            else
            {
               arrHP.push(Math.round(_loc2_ + Math.pow(_loc11_ / 8,_loc4_) * _loc3_));
            }
            _loc11_++;
         }
      }
      
      public function initArrRep() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = undefined;
         _loc1_ = 0;
         _loc2_ = 1;
         while(_loc2_ < 10)
         {
            _loc1_ = Math.pow(_loc2_ + 1,3) * 100;
            if(_loc2_ > 1)
            {
               arrRanks.push(_loc1_ + arrRanks[_loc2_ - 1]);
            }
            else
            {
               arrRanks.push(_loc1_ + 100);
            }
            _loc2_++;
         }
      }
      
      public function getRankFromPoints(param1:int) : int
      {
         var _loc2_:int = 0;
         var _loc3_:* = undefined;
         _loc2_ = 1;
         if(param1 < 0)
         {
            param1 = 0;
         }
         _loc3_ = 1;
         while(_loc3_ < arrRanks.length)
         {
            if(param1 < arrRanks[_loc3_])
            {
               return _loc2_;
            }
            _loc2_++;
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function attachOnModalStack(param1:String) : MovieClip
      {
         var _loc2_:MovieClip = null;
         var _loc3_:Class = null;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         _loc3_ = world.getClass(param1) as Class;
         _loc4_ = true;
         if(ui.ModalStack.numChildren)
         {
            _loc2_ = MovieClip(ui.ModalStack.getChildAt(0));
            _loc5_ = _loc2_.constructor as Class;
            if(_loc5_ == _loc3_)
            {
               _loc4_ = false;
            }
         }
         if(_loc4_)
         {
            clearModalStack();
            _loc2_ = MovieClip(ui.ModalStack.addChild(new _loc3_()));
            ui.ModalStack.mouseChildren = true;
         }
         return _loc2_;
      }
      
      public function getInstanceFromModalStack(param1:String) : MovieClip
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < ui.ModalStack.numChildren)
         {
            if(getQualifiedClassName(ui.ModalStack.getChildAt(_loc2_) == param1))
            {
               return ui.ModalStack.getChildAt(_loc2_);
            }
            _loc2_++;
         }
         return null;
      }
      
      public function isDialoqueUp() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         _loc1_ = 0;
         while(_loc1_ < world.FG.numChildren)
         {
            _loc2_ = world.FG.getChildAt(_loc1_);
            _loc3_ = String(_loc2_ as MovieClip);
            if(_loc3_.indexOf("dlg_") > -1)
            {
               return true;
            }
            _loc1_++;
         }
         return false;
      }
      
      public function clearModalStack() : Boolean
      {
         var _loc1_:int = 0;
         if(isGreedyModalInStack())
         {
            return false;
         }
         _loc1_ = 0;
         while(ui.ModalStack.numChildren > 0 && _loc1_ < 100)
         {
            _loc1_++;
            ui.ModalStack.removeChildAt(0);
         }
         stage.focus = null;
         return true;
      }
      
      public function closeModalByStrBody(param1:String) : void
      {
         var _loc2_:int = 0;
         var _loc3_:MovieClip = null;
         _loc2_ = 0;
         _loc2_ = 0;
         while(_loc2_ < ui.ModalStack.numChildren)
         {
            _loc3_ = ui.ModalStack.getChildAt(_loc2_) as MovieClip;
            if(_loc3_.cnt.strBody.htmlText.indexOf(param1) > -1 && _loc3_.currentLabel != "out")
            {
               _loc3_.fClose();
            }
            _loc2_++;
         }
      }
      
      public function isGreedyModalInStack() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         _loc1_ = 0;
         _loc1_ = 0;
         while(_loc1_ < ui.ModalStack.numChildren)
         {
            _loc2_ = ui.ModalStack.getChildAt(_loc1_) as MovieClip;
            if("greedy" in _loc2_ && _loc2_.greedy != null && _loc2_.greedy == true)
            {
               return true;
            }
            _loc1_++;
         }
         return false;
      }
      
      public function clearPopups(param1:Array = null) : void
      {
         if(ui.mcPopup.currentLabel == "House")
         {
            ui.mcPopup.mcHouseMenu.hideItemHandle();
         }
         if(param1 == null || param1.indexOf(ui.mcPopup.currentLabel) < 0)
         {
            ui.mcPopup.onClose();
         }
         world.removeMovieFront();
         clearModalStack();
      }
      
      public function clearPopupsQ() : void
      {
         if(ui.mcPopup.currentLabel != "House" && ui.mcPopup.currentLabel != "HouseShop")
         {
            ui.mcPopup.onClose();
         }
      }
      
      public function addUpdate(param1:String, param2:Boolean = false) : void
      {
         var _loc3_:MovieClip = null;
         var _loc4_:MovieClip = null;
         var _loc5_:int = 0;
         _loc3_ = ui.mcUpdates;
         _loc4_ = _loc3_.addChildAt(new uProto(),1) as MovieClip;
         _loc4_.y = 0;
         _loc4_.x = _loc3_.uproto.x;
         _loc4_.t1.ti.text = param1;
         if(param2)
         {
            _loc4_.t1.ti.textColor = 16711680;
         }
         _loc4_.gotoAndPlay("in");
         _loc5_ = 2;
         if(_loc3_.numChildren > 2)
         {
            _loc5_ = 2;
            while(_loc5_ < _loc3_.numChildren)
            {
               if(_loc5_ < 4)
               {
                  _loc3_.getChildAt(_loc5_).y = _loc3_.getChildAt(_loc5_).y - 18;
               }
               else
               {
                  MovieClip(_loc3_.getChildAt(_loc5_)).stop();
                  _loc3_.removeChildAt(_loc5_);
                  _loc5_--;
               }
               _loc5_++;
            }
         }
      }
      
      public function clearUpdates() : void
      {
         var _loc1_:MovieClip = null;
         _loc1_ = ui.mcUpdates;
         while(_loc1_.numChildren > 1)
         {
            _loc1_.removeChildAt(1);
         }
      }
      
      public function showItemDrop(param1:*, param2:*) : void
      {
         var _loc3_:* = undefined;
         if(Boolean(litePreference.data.bCustomDrops) && (param1.bTemp == 0 && param2))
         {
            cDropsUI.showItem(param1);
            return;
         }
         if(Boolean(litePreference.data.dOptions["hideDrop"]) && Boolean(litePreference.data.bCustomDrops) && param1.bTemp == 0)
         {
            return;
         }
         if(Boolean(litePreference.data.dOptions["hideTemp"]) && Boolean(litePreference.data.bCustomDrops) && param1.bTemp != 0)
         {
            return;
         }
         if(Boolean(litePreference.data.bCustomDrops) && (param1.bTemp == 0 && !param2))
         {
            _loc3_ = new DFrameMC(param1);
            ui.dropStack.addChild(_loc3_);
            _loc3_.init();
            _loc3_.fY = _loc3_.y = -(_loc3_.fHeight + 8);
            _loc3_.fX = _loc3_.x = -(_loc3_.fWidth / 2);
            cleanDropStack();
            return;
         }
         if(param1.bTemp != 0 || !param2)
         {
            _loc3_ = new DFrameMC(param1);
         }
         else
         {
            _loc3_ = new DFrame2MC(param1);
         }
         ui.dropStack.addChild(_loc3_);
         _loc3_.init();
         _loc3_.fY = _loc3_.y = -(_loc3_.fHeight + 8);
         _loc3_.fX = _loc3_.x = -(_loc3_.fWidth / 2);
         cleanDropStack();
      }
      
      public function cleanDropStack() : void
      {
         var _loc1_:MovieClip = null;
         var _loc2_:MovieClip = null;
         var _loc3_:* = undefined;
         _loc1_ = null;
         _loc2_ = null;
         _loc3_ = ui.dropStack.numChildren - 2;
         while(_loc3_ > -1)
         {
            _loc1_ = ui.dropStack.getChildAt(_loc3_) as MovieClip;
            _loc2_ = ui.dropStack.getChildAt(_loc3_ + 1) as MovieClip;
            _loc1_.fY = _loc1_.y = _loc2_.fY - (_loc2_.fHeight + 8);
            _loc3_--;
         }
      }
      
      public function dropStackBoost() : void
      {
         ui.dropStack.y = 438;
      }
      
      public function dropStackReset() : void
      {
         ui.dropStack.y = 493;
      }
      
      public function showAchievement(param1:String, param2:int) : void
      {
         var _loc3_:mcAchievement = null;
         var _loc4_:MovieClip = null;
         _loc3_ = new mcAchievement();
         _loc4_ = ui.dropStack.addChild(_loc3_) as MovieClip;
         _loc4_.cnt.tBody.text = param1;
         _loc4_.cnt.tPts.text = param2;
         _loc4_.fWidth = 348;
         _loc4_.fHeight = 90;
         _loc4_.fX = _loc4_.x = -(_loc4_.fWidth / 2);
         _loc4_.fY = _loc4_.y = -(_loc4_.fHeight + 8);
         cleanDropStack();
      }
      
      public function showQuestpopup(param1:Object) : void
      {
         var _loc2_:mcQuestpopup = null;
         var _loc3_:MovieClip = null;
         var _loc4_:String = null;
         var _loc5_:Object = null;
         var _loc6_:int = 0;
         if(litePreference.data.bDisQPopup)
         {
            return;
         }
         _loc2_ = new mcQuestpopup();
         _loc2_.cnt.mcAC.visible = false;
         _loc3_ = ui.dropStack.addChild(_loc2_) as MovieClip;
         _loc3_.cnt.tName.text = param1.sName;
         _loc3_.cnt.rewards.tRewards.htmlText = "";
         _loc4_ = "";
         _loc5_ = param1.rewardObj;
         if("intCoins" in _loc5_ && _loc5_.intCoins > 0)
         {
            _loc4_ = "<font color=\'#FFFFFF\'>" + _loc5_.intCoins + "</font>";
            _loc4_ = _loc4_ + "<font color=\'#FFCC00\'>ac</font>";
         }
         if("intGold" in _loc5_ && _loc5_.intGold > 0)
         {
            if(_loc4_.length > 0)
            {
               _loc4_ = _loc4_ + "<font color=\'#FFFFFF\'>, </font>";
            }
            _loc4_ = _loc4_ + ("<font color=\'#FFFFFF\'>" + _loc5_.intGold + "</font>");
            _loc4_ = _loc4_ + "<font color=\'#FFCC00\'>g</font>";
         }
         if("intExp" in _loc5_ && _loc5_.intExp > 0)
         {
            if(_loc4_.length > 0)
            {
               _loc4_ = _loc4_ + "<font color=\'#FFFFFF\'>, </font>";
            }
            _loc4_ = _loc4_ + ("<font color=\'#FFFFFF\'>" + _loc5_.intExp + "</font>");
            _loc4_ = _loc4_ + "<font color=\'#FF00FF\'>xp</font>";
         }
         if("iRep" in _loc5_ && _loc5_.iRep > 0)
         {
            if(_loc4_.length > 0)
            {
               _loc4_ = _loc4_ + "<font color=\'#FFFFFF\'>, </font>";
            }
            _loc4_ = _loc4_ + ("<font color=\'#FFFFFF\'>" + _loc5_.iRep + "</font>");
            _loc4_ = _loc4_ + "<font color=\'#00CCFF\'>rep</font>";
         }
         if("guildRep" in _loc5_ && _loc5_.guildRep > 0)
         {
            if(_loc4_.length > 0)
            {
               _loc4_ = _loc4_ + "<font color=\'#FFFFFF\'>, </font>";
            }
            _loc4_ = _loc4_ + ("<font color=\'#FFFFFF\'>" + _loc5_.guildRep + "</font>");
            _loc4_ = _loc4_ + "<font color=\'#00CCFF\'>guild rep</font>";
         }
         _loc3_.cnt.rewards.tRewards.htmlText = _loc4_;
         _loc3_.fWidth = 240;
         _loc3_.fHeight = 70;
         _loc6_ = _loc3_.cnt.rewards.tRewards.x + _loc3_.cnt.rewards.tRewards.textWidth;
         _loc3_.cnt.rewards.x = Math.round(_loc3_.fWidth / 2 - _loc6_ / 2);
         _loc3_.fX = _loc3_.x = -(_loc3_.fWidth / 2);
         _loc3_.fY = _loc3_.y = -(_loc3_.fHeight + 8);
         mixer.playSound("Good");
         cleanDropStack();
      }
      
      public function toggleCharpanel(param1:String = "") : void
      {
         var _loc2_:MovieClip = null;
         _loc2_ = ui.mcPopup;
         if(!isGreedyModalInStack())
         {
            if(_loc2_.currentLabel != "Charpanel")
            {
               clearPopups();
               clearPopupsQ();
               _loc2_.fData = {"typ":param1};
               _loc2_.visible = true;
               _loc2_.gotoAndPlay("Charpanel");
            }
            else
            {
               _loc2_.mcCharpanel.fClose();
            }
         }
      }
      
      public function toggleStatspanel(param1:String = "") : void
      {
         if(ui.getChildByName("mcStatsPanel"))
         {
            mcStatsPanel.cleanup();
            mcStatsPanel = null;
            return;
         }
         mcStatsPanel = new statsPanel(this);
         ui.addChild(mcStatsPanel);
         mcStatsPanel.name = "mcStatsPanel";
         mcStatsPanel.x = 474;
         mcStatsPanel.y = 240;
      }
      
      public function toggleTradePanel(param1:String = "") : void
      {
         var _loc2_:MovieClip = null;
         _loc2_ = ui.mcPopup;
         if(!isGreedyModalInStack())
         {
            if(_loc2_.currentLabel != "Trade")
            {
               clearPopups();
               clearPopupsQ();
               _loc2_.tradeId = param1;
               _loc2_.visible = true;
               _loc2_.gotoAndPlay("Trade");
            }
            else
            {
               _loc2_.onClose();
            }
         }
      }
      
      public function toggleAuctionPanel(param1:String = "") : void
      {
         var _loc2_:MovieClip = null;
         _loc2_ = ui.mcPopup;
         if(!isGreedyModalInStack())
         {
            if(_loc2_.currentLabel != "Auction")
            {
               clearPopups();
               clearPopupsQ();
               _loc2_.fData = {"typ":param1};
               _loc2_.visible = true;
               _loc2_.gotoAndPlay("Auction");
            }
            else
            {
               _loc2_.onClose();
            }
         }
      }
      
      public function toggleRedeemCode() : void
      {
         var _loc1_:MovieClip = null;
         _loc1_ = ui.mcPopup;
         if(!isGreedyModalInStack())
         {
            if(_loc1_.currentLabel != "RedeemCode")
            {
               clearPopups();
               clearPopupsQ();
               _loc1_.visible = true;
               _loc1_.gotoAndPlay("RedeemCode");
            }
            else
            {
               _loc1_.onClose();
            }
         }
      }
      
      public function toggleWheel() : void
      {
         var _loc1_:MovieClip = null;
         _loc1_ = ui.mcPopup;
         if(!isGreedyModalInStack())
         {
            if(_loc1_.currentLabel != "Wheel")
            {
               clearPopups();
               clearPopupsQ();
               _loc1_.visible = true;
               _loc1_.gotoAndPlay("Wheel");
            }
            else
            {
               _loc1_.onClose();
            }
         }
      }
      
      public function toggleTitles() : void
      {
         var _loc1_:MovieClip = null;
         _loc1_ = ui.mcPopup;
         if(!isGreedyModalInStack())
         {
            if(_loc1_.currentLabel != "Titles")
            {
               clearPopups();
               clearPopupsQ();
               _loc1_.visible = true;
               _loc1_.gotoAndPlay("Titles");
            }
            else
            {
               _loc1_.onClose();
            }
         }
      }
      
      public function toggleOutfits(param1:String = "") : void
      {
         if(world.myAvatar.dataLeaf.intState != 1)
         {
            return;
         }
         if(world.bPvP)
         {
            return;
         }
         requestInterface(params.sLoadout,"outfitSets");
      }
      
      public function showFriendshipUI(param1:String = "") : void
      {
         if(!world.coolDown("friendshipStats"))
         {
            return;
         }
         requestInterface("friendship/friendship_ui.swf","friendship_ui");
      }
      
      public function togglePVPPanel(param1:String = "") : void
      {
         var _loc2_:MovieClip = null;
         _loc2_ = ui.mcPopup;
         if(!isGreedyModalInStack())
         {
            if(_loc2_.currentLabel != "PVPPanel")
            {
               clearPopups();
               clearPopupsQ();
               _loc2_.fData = {"typ":param1};
               _loc2_.visible = true;
               _loc2_.gotoAndPlay("PVPPanel");
            }
            else
            {
               _loc2_.onClose();
            }
         }
      }
      
      public function showPVPScore() : void
      {
         var _loc1_:MovieClip = null;
         var _loc2_:int = 0;
         var _loc3_:Object = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         ui.mcPVPScore.visible = true;
         ui.mcPVPScore.y = 2;
         _loc2_ = 0;
         _loc4_ = [{"sName":"Team A"},{"sName":"Team B"}];
         _loc5_ = 200;
         if(world.PVPFactions.length > 0)
         {
            _loc4_ = world.PVPFactions;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc4_.length)
         {
            _loc3_ = _loc4_[_loc2_];
            try
            {
               _loc1_ = ui.mcPVPScore.getChildByName("bar" + _loc2_);
               _loc1_.tTeam.text = _loc3_.sName;
               if(_loc1_.tTeam.x + _loc1_.tTeam.width - _loc1_.tTeam.textWidth - 6 < _loc5_)
               {
                  _loc5_ = Math.round(_loc1_.tTeam.x + _loc1_.tTeam.width - _loc1_.tTeam.textWidth - 6);
               }
            }
            catch(e:Error)
            {
            }
            _loc2_ = _loc2_ + 1;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc4_.length)
         {
            _loc3_ = _loc4_[_loc2_];
            try
            {
               _loc1_ = ui.mcPVPScore.getChildByName("bar" + _loc2_);
               _loc1_.cap.x = _loc5_;
            }
            catch(e:Error)
            {
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      
      public function hidePVPScore() : void
      {
         ui.mcPVPScore.visible = false;
         ui.mcPVPScore.y = -300;
      }
      
      public function showMCPVPQueue() : void
      {
         var _loc1_:Object = null;
         _loc1_ = world.getWarzoneByWarzoneName(world.PVPQueue.warzone);
         ui.mcPVPQueue.t1.text = _loc1_.nam;
         ui.mcPVPQueue.removeEventListener(Event.ENTER_FRAME,MCPVPQueueEF);
         ui.mcPVPQueue.t2label.visible = false;
         ui.mcPVPQueue.t2.visible = false;
         if(world.PVPQueue.avgWait > -1)
         {
            ui.mcPVPQueue.t2label.visible = true;
            ui.mcPVPQueue.t2.visible = true;
            ui.mcPVPQueue.addEventListener(Event.ENTER_FRAME,MCPVPQueueEF,false,0,true);
         }
         ui.mcPVPQueue.visible = true;
         ui.mcPVPQueue.y = 84;
      }
      
      public function hideMCPVPQueue() : void
      {
         ui.mcPVPQueue.removeEventListener(Event.ENTER_FRAME,MCPVPQueueEF);
         ui.mcPVPQueue.visible = false;
         ui.mcPVPQueue.y = -300;
      }
      
      public function onMCPVPQueueClick(param1:MouseEvent) : void
      {
         var _loc2_:* = undefined;
         _loc2_ = {};
         try
         {
            _loc2_.strUsername = world.myAvatar.objData.strUsername;
            ui.cMenu.fOpenWith("pvpqueue",_loc2_);
         }
         catch(e:Error)
         {
         }
      }
      
      public function MCPVPQueueEF(param1:Event) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:* = undefined;
         _loc2_ = Number(new Date().getTime());
         _loc3_ = Math.ceil((world.PVPQueue.avgWait * 1000 - (_loc2_ - world.PVPQueue.ts)) / 1000 / 60);
         ui.mcPVPQueue.t2.htmlText = "<font color=\"#FFFFFF\"" + _loc3_ + "</font><font color=\"#999999\"m</font>";
         if(_loc3_ <= 1)
         {
            ui.mcPVPQueue.t2.htmlText = "<" + ui.mcPVPQueue.t2.htmlText;
         }
      }
      
      public function updatePVPScore(param1:Array) : void
      {
         var _loc2_:Object = null;
         var _loc3_:MovieClip = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         _loc2_ = {};
         _loc4_ = 0;
         while(_loc4_ < param1.length)
         {
            _loc2_ = param1[_loc4_];
            _loc3_ = ui.mcPVPScore.getChildByName("bar" + _loc4_) as MovieClip;
            if(_loc3_ != null)
            {
               _loc3_.ti.text = _loc2_.v + "/1000";
               _loc5_ = int(int(_loc2_.v / 1000 * _loc3_.bar.width));
               _loc5_ = Math.max(Math.min(_loc5_,_loc3_.bar.width),0);
               _loc3_.bar.x = -_loc3_.bar.width + _loc5_;
            }
            _loc4_++;
         }
      }
      
      public function relayPVPEvent(param1:Object) : void
      {
         if(param1.typ == "kill")
         {
            if(param1.team == world.myAvatar.dataLeaf.pvpTeam)
            {
               if(param1.val == "Restorer")
               {
                  addUpdate(getPVPMessage(param1.val,true));
               }
               if(param1.val == "Brawler")
               {
                  addUpdate(getPVPMessage(param1.val,true));
               }
               if(param1.val == "Captain")
               {
                  addUpdate(getPVPMessage(param1.val,true));
               }
               if(param1.val == "General")
               {
                  addUpdate("Victory! The enemy general has been defeated!");
               }
               if(param1.val == "Knight")
               {
                  addUpdate("A knight of the enemy has fallen! Victory draws closer!");
               }
            }
            else
            {
               if(param1.val == "Restorer")
               {
                  addUpdate(getPVPMessage(param1.val,false),true);
               }
               if(param1.val == "Brawler")
               {
                  addUpdate(getPVPMessage(param1.val,false),true);
               }
               if(param1.val == "Captain")
               {
                  addUpdate(getPVPMessage(param1.val,false),true);
               }
               if(param1.val == "General")
               {
                  addUpdate("Oh no!  Our general has been defeated!",true);
               }
               if(param1.val == "Knight")
               {
                  addUpdate("A knight has fallen to the enemy!");
               }
            }
         }
      }
      
      private function getPVPMessage(param1:String, param2:Boolean) : String
      {
         switch(param1)
         {
            case "Restorer":
               if(param2)
               {
                  return world.strMapName == "dagepvp" ? "An enemy Blade Master has been defeated! Dage\'s healing powers are waning!" : "An enemy Restorer has been defeated! The Captain\'s healing powers are waning!";
               }
               return world.strMapName == "dagepvp" ? "A Blade Master has been defeated!\t Dage\'s healing powers are waning!" : "A Restorer has been defeated!\t Our Captain\'s healing powers are waning!";
               break;
            case "Brawler":
               if(param2)
               {
                  return world.strMapName == "dagepvp" ? "An enemy Legion Guard has been defeated!  Dage\'s attacks grow weaker!" : "An enemy Brawler has been defeated!  The Captain\'s attacks grow weaker!";
               }
               return world.strMapName == "dagepvp" ? "A Legion Guard has been defeated!\tRally to Dage\'s defense!" : "A Brawler has been defeated!\tRally to the Captain\'s defense!";
               break;
            case "Captain":
               if(param2)
               {
                  return world.strMapName == "dagepvp" ? "Dage has been defeated!" : "The enemy captain has been defeated!";
               }
               return world.strMapName == "dagepvp" ? "Dage has been fallen to the enemy!" : "Our Captain has been fallen to the enemy!";
               break;
            default:
               return "";
         }
      }
      
      public function mcSetColor(param1:MovieClip, param2:String, param3:String) : *
      {
         var _loc4_:MovieClip = null;
         var _loc5_:String = null;
         var _loc6_:Boolean = false;
         if(currentLabel == "Select")
         {
            mcCharSelect.mcSetColor(param1,param2,param3);
            return;
         }
         _loc4_ = param1;
         _loc5_ = "none";
         while(_loc4_ != null && _loc4_.parent != null && _loc4_.parent != _loc4_.stage)
         {
            if("pAV" in _loc4_)
            {
               if(_loc4_.name.indexOf("previewMC") > -1)
               {
                  _loc5_ = "e";
               }
               else if(_loc4_.name.indexOf("Dummy") > -1)
               {
                  _loc5_ = "d";
               }
               else if(_loc4_.name.indexOf("mcPortraitTarget") > -1)
               {
                  _loc5_ = "c";
               }
               else if(_loc4_.name.indexOf("mcPortrait") > -1)
               {
                  _loc5_ = "b";
               }
               else
               {
                  _loc5_ = "a";
               }
               break;
            }
            _loc4_ = MovieClip(_loc4_.parent);
         }
         if(_loc5_ != "none")
         {
            _loc4_.pAV.pMC.setColor(param1,_loc5_,param2,param3);
         }
      }
      
      public function registerAttackFrame(param1:MovieClip) : *
      {
         var _loc2_:MovieClip = null;
         _loc2_ = param1;
         while(_loc2_ != null && _loc2_.parent != null && _loc2_.parent != _loc2_.stage)
         {
            if("pAV" in _loc2_)
            {
               break;
            }
            _loc2_ = MovieClip(_loc2_.parent);
         }
         if("pAV" in _loc2_)
         {
            if(!("attackFrames" in _loc2_.pAV.pMC))
            {
               return;
            }
            if(Boolean(_loc2_.pAV.pMC.attackFrames) && _loc2_.pAV.pMC.attackFrames.indexOf(param1) != -1)
            {
               _loc2_.pAV.pMC.attackFrames.splice(_loc2_.pAV.pMC.attackFrames.indexOf(param1),1);
            }
            _loc2_.pAV.pMC.attackFrames.push(param1);
         }
      }
      
      public function areaListClick(param1:MouseEvent) : void
      {
         var _loc2_:* = undefined;
         _loc2_ = MovieClip(param1.currentTarget.parent.parent);
         switch(_loc2_.currentLabel)
         {
            case "init":
               _loc2_.gotoAndPlay("in");
               return;
            case "hold":
               _loc2_.gotoAndPlay("out");
               return;
            default:
               return;
         }
      }
      
      public function updateAreaName() : void
      {
         var _loc1_:String = null;
         _loc1_ = String(world.areaUsers.length) + " player";
         if(world.areaUsers.length > 1)
         {
            _loc1_ = _loc1_ + "(s)";
         }
         _loc1_ = _loc1_ + " in <font color =\'#FFFF00\'>";
         if(world.strAreaName.indexOf(":") > -1)
         {
            _loc1_ = _loc1_ + (world.strAreaName.split(":")[0] + " (party)");
         }
         else
         {
            _loc1_ = _loc1_ + world.strAreaName;
         }
         _loc1_ = _loc1_ + "</font>";
         ui.mcInterface.areaList.title.t1.htmlText = _loc1_;
      }
      
      public function areaListGet() : void
      {
         var _loc1_:Object = null;
         var _loc2_:Object = null;
         var _loc3_:String = null;
         var _loc4_:* = undefined;
         _loc1_ = {};
         _loc2_ = sfc.getRoom(world.curRoom).getUserList();
         for(var _loc7_ in _loc2_)
         {
            _loc3_ = _loc7_;
            _loc7_;
            _loc4_ = world.uoTree[_loc2_[_loc3_].getName()];
            if(_loc4_ != null)
            {
               _loc1_[_loc3_] = {
                  "strUsername":_loc4_.strUsername,
                  "intLevel":_loc4_.intLevel
               };
            }
         }
         areaListShow(_loc1_);
      }
      
      public function areaListNameClick(param1:MouseEvent) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         _loc2_ = MovieClip(param1.currentTarget);
         _loc3_ = {};
         _loc3_.ID = _loc2_.objData.ID;
         _loc3_.strUsername = _loc2_.objData.strUsername;
         if(_loc2_.objData.strUsername == world.myAvatar.objData.strUsername)
         {
            ui.cMenu.fOpenWith("self",_loc3_);
         }
         else
         {
            ui.cMenu.fOpenWith("user",_loc3_);
         }
      }
      
      public function areaListShow(param1:Object) : void
      {
         var _loc2_:MovieClip = null;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:* = undefined;
         _loc2_ = ui.mcInterface.areaList;
         if(_loc2_.currentLabel == "hold")
         {
            while(_loc2_.cnt.numChildren > 0)
            {
               _loc2_.cnt.removeChildAt(0);
            }
         }
         _loc3_ = 0;
         for(var _loc8_ in param1)
         {
            _loc4_ = _loc8_;
            _loc8_;
            _loc5_ = _loc2_.cnt.addChild(new aProto());
            _loc5_.objData = param1[_loc4_];
            _loc5_.txtName.text = param1[_loc4_].strUsername;
            _loc5_.txtLevel.text = param1[_loc4_].intLevel;
            _loc5_.addEventListener(MouseEvent.CLICK,areaListNameClick,false,0,true);
            _loc5_.buttonMode = true;
            _loc5_.y = -int(_loc3_ * 14);
            _loc3_++;
         }
         _loc2_.cnt.iproto.visible = _loc2_.currentLabel == "hold";
         _loc2_.visible = true;
      }
      
      public function showFBShare(param1:Object) : void
      {
         var _loc2_:FacebookTabMC = null;
         var _loc4_:Class = null;
         var _loc3_:MovieClip = MovieClip(param1.parent);
         _loc4_ = getDefinitionByName("FacebookTabMC") as Class;
         if(Boolean(uoPref.bFBShare) && Boolean(param1.isActive))
         {
            try
            {
               _loc2_ = param1.parent.getChildByName("fbTab") as FacebookTabMC;
            }
            catch(error:Error)
            {
            }
            if(_loc2_ == null)
            {
               _loc2_ = new _loc4_();
               _loc2_.name = "fbTab";
               _loc2_.filters = [new GlowFilter(12892822,1,10,10,2,2,false,false)];
               param1.parent.addChild(_loc2_);
            }
            _loc2_.init(param1);
            _loc2_.visible = true;
            if("position" in param1)
            {
               _loc2_.positionBy(param1);
            }
         }
         else
         {
            try
            {
               param1.parent.getChildByName("fbTab").visible = false;
            }
            catch(error:Error)
            {
            }
         }
      }
      
      public function closeFBC() : void
      {
         if(fbc != null)
         {
            fbc.fClose();
         }
      }
      
      public function getAppName() : String
      {
         return Game.FB_APP_NAME;
      }
      
      public function getAppID() : String
      {
         return Game.FB_APP_ID;
      }
      
      public function getAppSec() : String
      {
         return Game.FB_APP_SEC;
      }
      
      public function getAppURL() : String
      {
         return Game.FB_APP_URL;
      }
      
      public function getUserName() : String
      {
         if(world != null && world.myAvatar != null && world.myAvatar.objData != null && "strUserName" in world.myAvatar.objData)
         {
            return world.myAvatar.objData.strUserName;
         }
         return "";
      }
      
      public function toggleFaction() : void
      {
         if(ui.mcPopup.currentLabel != "Faction")
         {
            ui.mcPopup.fOpen("Faction");
         }
         else if("cnt" in MovieClip(ui.mcPopup))
         {
            MovieClip(MovieClip(ui.mcPopup).cnt).xClick();
         }
      }
      
      public function hideInterface() : void
      {
         ui.visible = false;
      }
      
      public function showInterface() : void
      {
         ui.visible = true;
      }
      
      public function loadExternalSWF(param1:String) : void
      {
         if(param1.indexOf("https://") == -1 || param1.indexOf("https://") == -1)
         {
            if(param1.length > 1 && param1.charAt(0) == "/")
            {
               param1 = param1.substr(1,param1.length - 1);
            }
            param1 = "maps/" + param1;
         }
         ldrMC.loadFile(mcExtSWF,param1,"Game Files");
         hideInterface();
         world.visible = false;
      }
      
      public function clearExternamSWF() : void
      {
         while(mcExtSWF.numChildren > 0)
         {
            mcExtSWF.removeChildAt(0);
         }
         world.visible = true;
         showInterface();
      }
      
      public function openCharacterCustomize() : void
      {
         ui.mcPopup.fOpen("Customize");
      }
      
      public function openArmorCustomize() : void
      {
         ui.mcPopup.fOpen("ArmorColor");
      }
      
      public function showFactionInterface() : void
      {
         ui.mcPopup.fOpen("Faction");
      }
      
      public function showConfirmtaionBox(param1:String, param2:Function) : void
      {
         var modal:* = undefined;
         var modalO:* = undefined;
         var sMsg:String = param1;
         var fHandler:Function = param2;
         modal = undefined;
         modalO = undefined;
         modal = new ModalMC();
         modalO = {};
         modalO.strBody = sMsg;
         modalO.btns = "dual";
         modalO.params = {};
         modalO.callback = function(param1:Object):*
         {
            fHandler(param1.accept);
         };
         ui.ModalStack.addChild(modal);
         modal.init(modalO);
      }
      
      public function showMessageBox(param1:String, param2:Function = null) : void
      {
         var modal:* = undefined;
         var modalO:* = undefined;
         var sMsg:String = param1;
         var fHandler:Function = param2;
         modal = undefined;
         modalO = undefined;
         modal = new ModalMC();
         modalO = {};
         modalO.strBody = sMsg;
         modalO.btns = "mono";
         modalO.params = {};
         modalO.callback = function(param1:Object):*
         {
            if(fHandler != null)
            {
               fHandler();
            }
         };
         ui.ModalStack.addChild(modal);
         modal.init(modalO);
      }
      
      public function getServerTime() : Date
      {
         var _loc1_:Date = null;
         var _loc2_:* = undefined;
         _loc1_ = new Date();
         _loc2_ = ts_login_server + (_loc1_.getTime() - ts_login_client);
         return new Date(_loc2_);
      }
      
      public function get date_server() : Date
      {
         return getServerTime();
      }
      
      public function showTracking(param1:String) : void
      {
         var _loc2_:* = undefined;
         try
         {
            _loc2_ = objLogin.userid != null ? objLogin.userid : 0;
            extCall.logQuestProgress(_loc2_,param1);
         }
         catch(e:*)
         {
         }
      }
      
      public function removeApop() : void
      {
         if(apop == null)
         {
            return;
         }
         apop_ = null;
         world.removeMovieFront();
      }
      
      public function createApop() : void
      {
         if(apop_ != null)
         {
            removeApop();
         }
         apop_ = new apopCore(this as MovieClip,apopTree[curID]);
         apop_.x = 270;
         apop_.y = 20;
         world.FG.addChild(apop_);
         world.FG.mouseChildren = true;
      }
      
      public function rand(param1:Number = 0, param2:Number = 1) : Number
      {
         return rn.rand(param1,param2);
      }
      
      public function mcHeadMale() : mcHeadM
      {
         return new mcHeadM();
      }
      
      public function mcHeadFemale() : mcHeadF
      {
         return new mcHeadF();
      }
      
      public function get TravelMap() : Object
      {
         return travelMapData;
      }
      
      public function get apop() : apopCore
      {
         return apop_;
      }
      
      public function get objWorldMap() : *
      {
         return WorldMapData;
      }
      
      public function getLogin() : Object
      {
         return objLogin;
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame12() : *
      {
         init();
         showTracking("2");
      }
      
      internal function frame13() : *
      {
         loadTitle();
         if(showServers)
         {
            if(FacebookConnect.isLoggedIn && loginInfo.strPassword == null && ISWEB)
            {
               extCall.fbLogin();
            }
            else
            {
               login(loginInfo.strUsername,loginInfo.strPassword);
            }
            showServers = false;
         }
         else if(csShowServers)
         {
            mcLogin.gotoAndPlay("Servers");
            csShowServers = false;
         }
         stop();
      }
      
      internal function frame22() : *
      {
         initInterface();
         initWorld();
         stop();
      }
      
      internal function frame32() : *
      {
         if(params.vars != null)
         {
            loadAccountCreation("newuser/" + params.vars.sCharCreate);
         }
         else
         {
            loadAccountCreation("newuser/AQW-Landing-MERGETEST.swf");
         }
         stop();
      }
      
      internal function frame43() : *
      {
         init();
         if(mcCharSelect)
         {
            mcCharSelect = null;
         }
         loader = new mcLoader();
         loader.x = 400;
         loader.y = 211;
         this.addChild(loader);
         onLoadMaster(onCSComplete,assetsContext,params.sCharSelect + "?v=" + params.vars.sVersion,onCSProgress,onCSError);
         csbLoaded = 0;
         csbTotal = 0;
         stop();
      }
   }
}

