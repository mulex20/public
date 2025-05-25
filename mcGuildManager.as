package
{
   import fl.motion.*;
   import flash.accessibility.*;
   import flash.display.*;
   import flash.errors.*;
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
   import liteAssets.draw.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3469")]
   public class mcGuildManager extends MovieClip
   {
      
      public var rootClass:MovieClip;
      
      public var displayGuildMembers:MovieClip;
      
      public var guild:Object;
      
      private var guildMembersList:*;
      
      public var scr:MovieClip;
      
      public var cntMask:MovieClip;
      
      public var optObj:*;
      
      public var optItem:*;
      
      public var Len:*;
      
      public var optionList:*;
      
      public var hRun:Number;
      
      public var dRun:Number;
      
      public var oy:Number;
      
      public var mDown:Boolean;
      
      public var mbY:int;
      
      public var mbD:int;
      
      public var mhY:int;
      
      public var pos:int;
      
      public var i:int;
      
      public var strGuildName:TextField;
      
      public var txtMemberOnlineCount:TextField;
      
      public var strSearchInput:TextField;
      
      public var txtLoading:TextField;
      
      public var color:Color = new Color();
      
      public var btnClose:SimpleButton;
      
      public var baseBot:MovieClip;
      
      public var baseTop:MovieClip;
      
      private var defaultCT:ColorTransform = new ColorTransform(1,1,1,1,0,0,0,0);
      
      private var greyCT:ColorTransform = new ColorTransform(0.4,0.4,0.4,1,-20,-20,-20,0);
      
      public function mcGuildManager()
      {
         super();
         rootClass = MovieClip(stage.getChildAt(0));
         guild = rootClass.world.myAvatar.objData.guild;
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         loadGuildMembers(guild.ul);
         loadGuildInformations();
         initButton();
         initSearch();
      }
      
      internal function initSearch() : void
      {
         strSearchInput.text = "";
         strSearchInput.addEventListener(Event.CHANGE,onSearch,false,0,true);
      }
      
      public function loadGuildInformations() : *
      {
         var _loc1_:ColorTransform = null;
         _loc1_ = baseBot.transform.colorTransform;
         _loc1_.color = guild.BotBannerColor;
         baseBot.transform.colorTransform = _loc1_;
         _loc1_ = baseTop.transform.colorTransform;
         _loc1_.color = guild.TopBannerColor;
         baseTop.transform.colorTransform = _loc1_;
         strGuildName.text = guild.Name;
         strGuildName.mouseEnabled = false;
      }
      
      private function initButton() : void
      {
         btnClose.addEventListener(MouseEvent.CLICK,onClick,false,0,true);
      }
      
      private function onClick(param1:Event) : void
      {
         rootClass.mixer.playSound("Click");
         switch(param1.currentTarget.name)
         {
            case "btnClose":
               MovieClip(parent).onClose();
               rootClass.clearModalStack();
               return;
            default:
               return;
         }
      }
      
      public function loadGuildMembers(param1:Array) : void
      {
         var _loc2_:int = 0;
         scr.SBar.h.y = 0;
         if(optionList != null)
         {
            displayGuildMembers.removeChild(optionList);
            optionList = null;
         }
         optionList = displayGuildMembers.addChild(new MovieClip());
         i = 0;
         while(i < param1.length)
         {
            optObj = param1[i];
            optItem = new mcGuildMembers();
            optItem.y = i * 25;
            optItem.mcUser.visible = true;
            optItem.btnPreview.visible = true;
            optItem.tRank.text = getRank(optObj.Rank);
            optItem.tName.text = optObj.userName;
            optItem.tLevel.text = optObj.Level;
            optItem.tStatus.htmlText = optObj.Server.toLowerCase() != "offline" ? "<font color=\'#00FF00\'>Online</font>" : optObj.Status;
            optItem.btnPreview.addEventListener(MouseEvent.CLICK,onListClick,false,0,true);
            optItem.btnPreview.addEventListener(MouseEvent.MOUSE_OUT,onOut,false,0,true);
            optItem.btnPreview.addEventListener(MouseEvent.MOUSE_OVER,onHover,false,0,true);
            if(optObj.Server.toLowerCase() != "offline")
            {
               _loc2_++;
            }
            else
            {
               optItem.tName.textColor = 6710886;
               optItem.tRank.textColor = 6710886;
               optItem.tLevel.textColor = 6710886;
               optItem.tStatus.textColor = 6710886;
            }
            txtMemberOnlineCount.text = String(_loc2_) + " / " + guild.MaxMembers + " ONLINE";
            optItem.useHandCursor = true;
            optItem = optionList.addChild(optItem);
            ++i;
         }
         txtLoading.visible = false;
         if(displayGuildMembers.height > cntMask.height)
         {
            hRun = scr.SBar.b.height - scr.SBar.h.height;
            dRun = optionList.height - cntMask.height + 5;
            oy = optionList.y;
            optionList.addEventListener(Event.ENTER_FRAME,hEF,false,0,true);
            optionList.addEventListener(Event.ENTER_FRAME,dEF,false,0,true);
            scr.SBar.h.addEventListener(MouseEvent.MOUSE_DOWN,onScrDown,false,0,true);
            scr.addEventListener(MouseEvent.MOUSE_UP,onScrUp,false,0,true);
            stage.addEventListener(MouseEvent.MOUSE_WHEEL,onWheel,false,0,true);
            scr.transform.colorTransform = defaultCT;
         }
         else
         {
            scr.SBar.h.removeEventListener(MouseEvent.MOUSE_DOWN,onScrDown);
            scr.removeEventListener(MouseEvent.MOUSE_UP,onScrUp);
            stage.removeEventListener(MouseEvent.MOUSE_WHEEL,onWheel);
            scr.transform.colorTransform = greyCT;
         }
         mDown = false;
      }
      
      public function onListClick(param1:MouseEvent) : void
      {
         var _loc2_:charPage = null;
         switch(this.currentLabel)
         {
            case "Main":
               if(param1.target == MovieClip(param1.currentTarget).btnPreview)
               {
                  _loc2_ = new charPage(rootClass,MovieClip(param1.currentTarget).tName.text);
                  rootClass.ui.addChild(_loc2_);
               }
         }
      }
      
      public function onHover(param1:MouseEvent) : *
      {
         color.brightness = 0.1;
         MovieClip(param1.currentTarget).transform.colorTransform = color;
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         color.brightness = 0;
         MovieClip(param1.currentTarget).transform.colorTransform = color;
      }
      
      public function onSearch(param1:Event) : void
      {
         var _loc3_:int = 0;
         var _loc2_:Array = new Array();
         while(_loc3_ < guild.ul.length)
         {
            if(guild.ul[_loc3_].Name.toLowerCase().indexOf(strSearchInput.text.toLowerCase()) > -1)
            {
               _loc2_.push(guild.ul[_loc3_]);
            }
            _loc3_++;
         }
         if(displayGuildMembers.height > cntMask.height)
         {
            scr.SBar.h.addEventListener(MouseEvent.MOUSE_DOWN,onScrDown,false,0,true);
            scr.SBar.h.useHandCursor = true;
            scr.addEventListener(MouseEvent.MOUSE_UP,onScrUp,false,0,true);
            stage.addEventListener(MouseEvent.MOUSE_WHEEL,onWheel,false,0,true);
            scr.transform.colorTransform = defaultCT;
         }
         else
         {
            scr.SBar.h.removeEventListener(MouseEvent.MOUSE_DOWN,onScrDown);
            scr.removeEventListener(MouseEvent.MOUSE_UP,onScrUp);
            stage.removeEventListener(MouseEvent.MOUSE_WHEEL,onWheel);
            scr.transform.colorTransform = greyCT;
         }
         loadGuildMembers(strSearchInput.text ? _loc2_ : guild.ul);
         _loc2_ = null;
      }
      
      private function onWheel(param1:MouseEvent) : void
      {
         var _loc2_:* = undefined;
         _loc2_ = scr.SBar;
         _loc2_.h.y = int(scr.SBar.h.y) + param1.delta * 15 * -1;
         if(_loc2_.h.y + _loc2_.h.height > _loc2_.b.height)
         {
            _loc2_.h.y = int(_loc2_.b.height - _loc2_.h.height);
         }
         if(_loc2_.h.y < 0)
         {
            _loc2_.h.y = 0;
         }
      }
      
      private function onScrDown(param1:MouseEvent) : *
      {
         mbY = int(mouseY);
         mhY = int(scr.SBar.h.y);
         mDown = true;
      }
      
      private function onScrUp(param1:MouseEvent) : void
      {
         mDown = false;
      }
      
      private function hEF(param1:Event) : *
      {
         var _loc2_:* = undefined;
         if(mDown)
         {
            _loc2_ = scr.SBar;
            mbD = int(mouseY) - mbY;
            _loc2_.h.y = mhY + mbD;
            if(_loc2_.h.y + 1 + _loc2_.h.height > _loc2_.b.height + 1)
            {
               _loc2_.h.y = int(_loc2_.b.height + 1 - _loc2_.h.height);
            }
            if(_loc2_.h.y < 1)
            {
               _loc2_.h.y = 1;
            }
         }
      }
      
      private function dEF(param1:Event) : *
      {
         var _loc2_:* = scr.SBar;
         var _loc3_:* = optionList;
         var _loc4_:* = -(_loc2_.h.y - 1) / hRun;
         var _loc5_:* = int(_loc4_ * dRun) + oy;
         if(Math.abs(_loc5_ - _loc3_.y) > 0.2)
         {
            _loc3_.y += (_loc5_ - _loc3_.y) / 4;
         }
         else
         {
            _loc3_.y = _loc5_;
         }
      }
      
      public function getRank(param1:int) : String
      {
         var _loc2_:String = "";
         switch(Number(param1))
         {
            case 0:
               _loc2_ = "Duffer";
               break;
            case 1:
               _loc2_ = "Member";
               break;
            case 2:
               _loc2_ = "Officer";
               break;
            case 3:
               _loc2_ = "Leader";
         }
         return _loc2_;
      }
   }
}

