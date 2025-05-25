package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3458")]
   public dynamic class mcGuildMembers extends MovieClip
   {
      
      public var tRank:TextField;
      
      public var tName:TextField;
      
      public var tLevel:TextField;
      
      public var tStatus:TextField;
      
      public var mcUser:MovieClip;
      
      public var btnPreview:MovieClip;
      
      public function mcGuildMembers()
      {
         super();
         mcUser.visible = false;
         btnPreview.visible = false;
      }
   }
}

