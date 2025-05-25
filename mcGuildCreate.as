package
{
   import fl.controls.*;
   import fl.events.*;
   import fl.motion.*;
   import flash.display.*;
   import flash.events.*;
   import flash.external.*;
   import flash.geom.*;
   import flash.text.TextField;
   import flash.utils.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3452")]
   public class mcGuildCreate extends MovieClip
   {
      
      public var rootClass:MovieClip = MovieClip(stage.getChildAt(0));
      
      public var strGuildNameInput:TextField;
      
      public var btnCreate:SimpleButton;
      
      public var btnClose:SimpleButton;
      
      public var baseBotColor:TextField;
      
      public var baseTopColor:TextField;
      
      public var baseBot:MovieClip;
      
      public var baseTop:MovieClip;
      
      public var container:Sprite = new Sprite();
      
      public function mcGuildCreate()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function frame1() : *
      {
         strGuildNameInput.text = "";
         btnCreate.addEventListener(MouseEvent.CLICK,onClick,false,0,true);
         btnClose.addEventListener(MouseEvent.CLICK,onClick,false,0,true);
         initColorPicker();
         addChild(container);
      }
      
      public function initColorPicker() : void
      {
         var _loc1_:ColorPicker = new ColorPicker();
         var _loc2_:ColorPicker = new ColorPicker();
         _loc1_.addEventListener(ColorPickerEvent.CHANGE,baseBotColorChangedHandler);
         _loc1_.x = 272.05;
         _loc1_.y = 97.4;
         container.addChild(_loc1_);
         _loc2_.addEventListener(ColorPickerEvent.CHANGE,baseTopColorChangedHandler);
         _loc2_.x = 272.05;
         _loc2_.y = 154.85;
         container.addChild(_loc2_);
      }
      
      internal function baseBotColorChangedHandler(param1:ColorPickerEvent) : void
      {
         var _loc4_:int = 0;
         var _loc2_:uint = uint(param1.target.selectedColor);
         var _loc3_:ColorTransform = baseBot.transform.colorTransform;
         _loc3_.color = _loc2_;
         baseBot.transform.colorTransform = _loc3_;
         _loc4_ = int(_loc2_);
         baseBotColor.text = String(_loc4_);
         trace("baseBotColor: " + _loc2_.toString());
      }
      
      internal function baseTopColorChangedHandler(param1:ColorPickerEvent) : void
      {
         var _loc4_:int = 0;
         var _loc2_:uint = uint(param1.target.selectedColor);
         var _loc3_:ColorTransform = baseTop.transform.colorTransform;
         _loc3_.color = _loc2_;
         baseTop.transform.colorTransform = _loc3_;
         _loc4_ = int(_loc2_);
         baseTopColor.text = String(_loc4_);
         trace("baseTopColor: " + _loc2_.toString());
      }
      
      public function createGuildRequest(param1:Object) : *
      {
         if(param1.accept)
         {
            rootClass.world.createGuild(strGuildNameInput.text,baseBotColor.text,baseTopColor.text);
         }
      }
      
      private function onClick(param1:Event) : void
      {
         rootClass.mixer.playSound("Click");
         switch(param1.currentTarget.name)
         {
            case "btnClose":
               MovieClip(parent).onClose();
               rootClass.clearModalStack();
               break;
            case "btnCreate":
               if(strGuildNameInput.text == "")
               {
                  rootClass.MsgBox.notify("Please specify the guild name HAHAHAHAHAAHAHHAHAHAAAHAHAHAHAAH!");
               }
               else
               {
                  modal = new ModalMC();
                  modalO = {};
                  modalO.strBody = "Do you want to create the guild " + strGuildNameInput.text + "?";
                  modalO.callback = createGuildRequest;
                  modalO.params = {};
                  modalO.btns = "dual";
                  rootClass.ui.ModalStack.addChild(modal);
                  modal.init(modalO);
                  trace(modalO.params);
               }
         }
      }
   }
}

