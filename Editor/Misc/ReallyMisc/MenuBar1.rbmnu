#tag Menu
Begin Menu MenuBar1
   Begin MenuItem FileMenu
      SpecialMenu = 0
      Text = "&File"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem savereturn
         SpecialMenu = 0
         Text = "&Save changes and finish"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem discard
         SpecialMenu = 0
         Text = "&Discard changes and finish"
         Index = -2147483648
         AutoEnable = True
      End
   End
   Begin MenuItem EditMenu
      SpecialMenu = 0
      Text = "&Edit"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem UndoItem
         SpecialMenu = 0
         Text = "&Undo"
         Index = -2147483648
         ShortcutKey = "Z"
         Shortcut = "Cmd+Z"
         MenuModifier = True
         Icon = 1110892543
         AutoEnable = True
      End
      Begin MenuItem RedoMenu
         SpecialMenu = 0
         Text = "&Redo"
         Index = -2147483648
         ShortcutKey = "Y"
         Shortcut = "Cmd+Y"
         MenuModifier = True
         Icon = 1152741375
         AutoEnable = True
      End
      Begin MenuItem clearTool
         SpecialMenu = 0
         Text = "&Clear"
         Index = -2147483648
         ShortcutKey = "X"
         Shortcut = "Cmd+Shift+X"
         MenuModifier = True
         AltMenuModifier = True
         Icon = 1841897471
         AutoEnable = True
      End
      Begin MenuItem RotateMenu
         SpecialMenu = 0
         Text = "R&otate..."
         Index = -2147483648
         AutoEnable = True
      End
   End
   Begin MenuItem ToolsMenu
      SpecialMenu = 0
      Text = "&Tools"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem ScaleMenu
         SpecialMenu = 0
         Text = "&Resize..."
         Index = -2147483648
         Icon = 2086045695
         AutoEnable = True
      End
      Begin MenuItem MagMenu
         SpecialMenu = 0
         Text = "&Magnifier"
         Index = -2147483648
         Icon = 744163327
         AutoEnable = True
      End
      Begin MenuItem MakeTrans
         SpecialMenu = 0
         Text = "C&apture"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem ChangeColor
         SpecialMenu = 0
         Text = "&Change Drawing Color..."
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem ChangePen
         SpecialMenu = 0
         Text = "Change &Pen Size..."
         Index = -2147483648
         AutoEnable = True
      End
   End
End
#tag EndMenu
