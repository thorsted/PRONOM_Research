#!/bin/sh
# MetaCard 2.1 stack
# The following is not ASCII text,
# so now would be a good time to q out of more
exec mc $0 "$@"
                                                                                                                                  � MetaCard Demo2 � �pQ�--This is a general warning to those looking at the scripts in thoughout this project:
--They were done at speed, and are therefore very poorly written in places.
--The entire project could be made *much* simpler to do if it was split into a
--number of  handlers to handle common tasks, e.g. on the miniscreen.
--Unforunately, the thing simply had to be done as fast as possible,
--and its quicker to type out and paste in lines than to neatly organise the work.
--That said, there are a few bits done well, and some decent examples can be
--picked out if you want to look.
--Note that i've done this with "the explicitvars" set the true.  Thus all the
--variables (even local ones) have been declared before use.  This was simply in case
--someone was viewing this with "explicitvars" (the "Require variable declarations and
--quoted literals) on.
--Also, beware - there are very few comments anywhere.
--Kevin Miller, 4th July 1997

on preopenstack
  global return_windows, return_backdrop
  if the short name of this stack is not "metacard demo2" then exit preopenstack
  local i
  if the platform is "MacOS" then hide menubar
  set the loc of this stack to screenloc()
  put the backdrop into return_backdrop
  lock messages
  put "" into return_windows
  get the windows
  repeat for each line i in it
    if i is "metacard demo2" then next repeat
    put i&","&(the mode of stack i)&cr after return_windows
    close stack i
  end repeat
  unlock messages
  if the vis of image "xcheck2" of stack "settings" then
    set the backdrop to "black"
  else
    set the backdrop to "none"
  end if
end preopenstack

on reset_miniscreen
  --reset the miniscreen to be normal (include L+F)
  select empty
  set the rect of fld "field example label" to 415,187,577,253
  set the rect of fld "field example2 label" to 415,256,576,282
  put empty into fld "field example"
  put empty into fld "field example2"
  put empty into fld "field example label"
  put empty into fld "field example2 label"
  set the menuhistory of btn "field_tab" to 2
  set the showborder of fld "field example2 label" to true
  set the showborder of fld "field example label" to true
  set the rect of fld "field example2" to 415,256,416,258
  set the rect of btn "button example" to 316,220,318,222
  set the icon of btn "cursor" to 302
  put empty into fld "field name"
  put "" into fld "message_field"
  set the rect of fld "field example" to 415,187,417,189
  set the rect of scrollbar "scrollbar example" to 487,257,489,259
  set the rect of grc "oval example" to 216,246,218,248
  set the hilitedbuttonname of group "icons" to "browse"
  set the showlines of fld "field example" to false
  put "" into fld "script text"
  set the hilite of btn "showlines" of group "field properties" to false
  set the hilitedbuttonname of group "fstyle" to "rectangle"
  set the hilitedbuttonname of group "bstyle" to "rectangle"
  set the style of fld "field example" to "rectangle"
  put "" into fld "tab_titles"
  set the text of btn "button example" to ""
  set the style of btn "button example" to "rectangle"
  set the hilite of btn "hscrollbar" to false
  set the hscrollbar of fld "field example" to false
  if the lookandfeel is "motif" then
    hide image "windows_imageprop"
    show image "motif_imageprop"
    hide image "windows_importer"
    show image "motif bar"
    hide image "windows_answer"
    show image "motif button properties"
    hide image "windows bar"
    hide image "windows button properties"
    show image "motif field properties"
    hide image "windows field properties"
    show image "motif script editor"
    hide image "windows script editor"
    show image "motif message box"
    hide image "windows message box"
    set the loc of btn "close box marker" to 173,169
  else
    set the loc of btn "close box marker" to 597,169
    hide image "motif_importer"
    hide image "motif_imageprop"
    show image "windows_imageprop"
    hide image "motif_answer"
    hide image "motif button properties"
    hide image "motif bar"
    show image "windows bar"
    show image "windows button properties"
    show image "windows field properties"
    hide image "motif field properties"
    show image "windows script editor"
    hide image "motif script editor"
    show image "windows message box"
    hide image "motif message box"
  end if
  set the rect of grc "border" to 154,45,613,390
  put "New button" into fld "name" of group "button properties"
  set the label of btn "button example" to "New button"
  set the showname of btn "button example" to true
  set the menuhistory of btn "button properties" to 1
  put empty into fld "importer_file"
  set the rect of group "Menubar group" to 170,48,576,160
end reset_miniscreen

--its actually easier to do some of the arming stuff than I thought, but I don't have
--time to make this simpler now
on menu_choice the_menu, the_item
  local group_name
  move btn "cursor" to the loc of btn the_menu in 1 second
  wait until the loc of btn "cursor" is the loc of btn the_menu
  click_sound
  lock screen
  if the lookandfeel is "motif" then
    set the borderwidth of btn the_menu to 2
    set the arm of btn the_menu to true
  else
    set the borderwidth of btn the_menu to 0
    set the hilite of btn the_menu to true
    set the textcolor of btn the_menu to "white"
  end if
  unlock screen
  put the_menu & " group" into group_name
  show group group_name
  set the movespeed to 150
  move btn "cursor" to the loc of btn the_item
  wait until the loc of btn "cursor" is the loc of btn the_item
  click_sound
  lock screen
  if the lookandfeel is "motif" then
    set the showborder of btn the_item to true
    set the borderwidth of btn the_item to 2
  else
    set the borderwidth of btn the_item to 0
    set the hilite of btn the_item to true
    set the textcolor of btn the_item to "white"
  end if
  unlock screen
  wait 20 ticks
  lock screen
  set the hilite of btn the_item to false
  set the textcolor of btn the_item to "black"
  set the showborder of btn the_item to false
  set the arm of btn the_menu to false
  unlock screen
  hide group group_name
  set the hilite of btn the_item to false
  set the hilite of btn the_menu to false
  set the textcolor of btn the_menu to "black"
  set the showborder of btn the_menu to false
end menu_choice

on reset_cursor
  if the icon of btn "cursor" is not 302 then
    move btn "cursor" to the loc of btn "browse" in 1 second
    click_sound
    set the hilitedbuttonname of group "icons" to "browse"
    set the icon of btn "cursor" to 302
    select empty
  end if
  select empty
  move btn "cursor" to 180,203 in 1 second
  wait until the loc of btn "cursor" is 180,203
end reset_cursor

on  show_window
  if the lookAndFeel is "Windows 95" or the lookAndFeel is "Macintosh" then show image "windows stack" else show image "motif stack"
end show_window

--if you're looking at these scripts to see "how it was done", please note that
--this next script is not an example to be followed!
--a few customprops would make it much shorter
on expand_miniscreen
  local tborder_rect, tborder_distance, tstart_time, tcurrent_time, tcurrent_figure, torig_rect, ttotal_time
  local t_menu_orig_loc, tmenu_current_loc, tmenu_distance, tcursor_orig_loc, tcursor_current_loc, tcursor_distance
  local t_menu_current_loc, tproperties_distance, tproperties_current_loc, t_window_orig_loc, twindow_current_loc, twindow_distance, tmenu_orig_loc, twindow_orig_loc, tproperties_orig_loc
  set the rect of grc "border" to "154,45,613,390"
  put "154,45,613,390" into torig_rect
  put "154,45,613,390" into tborder_rect
  put "145,35,19,82" into tborder_distance
  
  put "800" into ttotal_time
  
  put "373,100" into tmenu_orig_loc
  put "373,100" into tmenu_current_loc
  put "158,36" into tmenu_distance
  
  put "386,268" into twindow_orig_loc
  put "386,268" into twindow_current_loc
  put "127,35" into twindow_distance
  
  put "383,270" into tproperties_orig_loc
  put "394,341" into tproperties_current_loc
  put "11,71" into tproperties_distance
  
  put the milliseconds into tstart_time
  repeat
    put the milliseconds - tstart_time into tcurrent_time
    if tcurrent_time > ttotal_time then exit repeat
    
    lock screen
    put (tcurrent_time/ttotal_time)*item 1 of tborder_distance into tcurrent_figure
    put round(item 1 of torig_rect-tcurrent_figure) into item 1 of tborder_rect
    
    put (tcurrent_time/ttotal_time)*item 2 of tborder_distance into tcurrent_figure
    put round(item 2 of torig_rect-tcurrent_figure) into item 2 of tborder_rect
    
    put (tcurrent_time/ttotal_time)*item 3 of tborder_distance into tcurrent_figure
    put round(item 3 of torig_rect+tcurrent_figure) into item 3 of tborder_rect
    
    put (tcurrent_time/ttotal_time)*item 4 of tborder_distance into tcurrent_figure
    put round(item 4 of torig_rect+tcurrent_figure) into item 4 of tborder_rect
    
    set the rect of grc "border" to tborder_rect
    
    
    put (tcurrent_time/ttotal_time)*item 1 of tmenu_distance into tcurrent_figure
    put round(item 1 of tmenu_orig_loc-tcurrent_figure) into item 1 of t_menu_current_loc
    
    put (tcurrent_time/ttotal_time)*item 2 of tmenu_distance into tcurrent_figure
    put round(item 2 of tmenu_orig_loc-tcurrent_figure) into item 2 of t_menu_current_loc
    
    set the loc of group "menubar group" to t_menu_current_loc
    
    
    put (tcurrent_time/ttotal_time)*item 1 of twindow_distance into tcurrent_figure
    put round(item 1 of twindow_orig_loc-tcurrent_figure) into item 1 of twindow_current_loc
    
    put (tcurrent_time/ttotal_time)*item 2 of twindow_distance into tcurrent_figure
    put round(item 2 of twindow_orig_loc-tcurrent_figure) into item 2 of twindow_current_loc
    
    set the loc of group "window group" to twindow_current_loc
    
    
    put (tcurrent_time/ttotal_time)*item 1 of tproperties_distance into tcurrent_figure
    put round(item 1 of tproperties_orig_loc+tcurrent_figure) into item 1 of tproperties_current_loc
    
    put (tcurrent_time/ttotal_time)*item 2 of tproperties_distance into tcurrent_figure
    put round(item 2 of tproperties_orig_loc+tcurrent_figure) into item 2 of tproperties_current_loc
    
    set the loc of group "properties" to tproperties_current_loc
    unlock screen
  end repeat
  lock screen
  set the rect of grc "border" to "9,10,632,472"
  set the loc of group "menubar group" to "215,64"
  set the loc of group "window group" to "259,233"
  set the loc of group "properties" to "394,341"
  unlock screen
  wait 1 second
end expand_miniscreen



on contract_miniscreen
  local tborder_rect, tborder_distance, tstart_time, tcurrent_time, tcurrent_figure, torig_rect, ttotal_time
  local t_menu_orig_loc, tmenu_current_loc, tmenu_distance, tcursor_orig_loc, tcursor_current_loc, tcursor_distance
  local t_window_orig_loc, twindow_current_loc, twindow_distance
  local t_menu_current_loc, tproperties_distance, tproperties_current_loc, t_window_orig_loc, twindow_current_loc, twindow_distance, tmenu_orig_loc, twindow_orig_loc, tproperties_orig_loc
  set the rect of grc "border" to "9,10,632,472"
  put "9,10,632,472" into torig_rect
  put "9,10,632,472" into tborder_rect
  put "145,35,19,82" into tborder_distance
  put "800" into ttotal_time
  
  put "215,64" into tmenu_orig_loc
  put "215,64" into tmenu_current_loc
  put "158,36" into tmenu_distance
  
  put "259,233" into twindow_orig_loc
  put "259,233" into twindow_current_loc
  put "127,35" into twindow_distance
  
  put "394,341" into tproperties_orig_loc
  put "394,341" into tproperties_current_loc
  put "11,71" into tproperties_distance
  
  put the milliseconds into tstart_time
  repeat
    put the milliseconds - tstart_time into tcurrent_time
    if tcurrent_time > ttotal_time then exit repeat
    
    lock screen
    
    put (tcurrent_time/ttotal_time)*item 1 of tborder_distance into tcurrent_figure
    put round(item 1 of torig_rect+tcurrent_figure) into item 1 of tborder_rect
    
    put (tcurrent_time/ttotal_time)*item 2 of tborder_distance into tcurrent_figure
    put round(item 2 of torig_rect+tcurrent_figure) into item 2 of tborder_rect
    
    put (tcurrent_time/ttotal_time)*item 3 of tborder_distance into tcurrent_figure
    put round(item 3 of torig_rect-tcurrent_figure) into item 3 of tborder_rect
    
    put (tcurrent_time/ttotal_time)*item 4 of tborder_distance into tcurrent_figure
    put round(item 4 of torig_rect-tcurrent_figure) into item 4 of tborder_rect
    
    set the rect of grc "border" to tborder_rect
    
    
    put (tcurrent_time/ttotal_time)*item 1 of tmenu_distance into tcurrent_figure
    put round(item 1 of tmenu_orig_loc+tcurrent_figure) into item 1 of t_menu_current_loc
    
    put (tcurrent_time/ttotal_time)*item 2 of tmenu_distance into tcurrent_figure
    put round(item 2 of tmenu_orig_loc+tcurrent_figure) into item 2 of t_menu_current_loc
    
    set the loc of group "menubar group" to t_menu_current_loc
    
    
    --  put (tcurrent_time/ttotal_time)*item 1 of tcursor_distance into tcurrent_figure
    --   put round(item 1 of tcursor_orig_loc+tcurrent_figure) into item 1 of t_cursor_current_loc
    --
    --  put (tcurrent_time/ttotal_time)*item 2 of tcursor_distance into tcurrent_figure
    --   put round(item 2 of tcursor_orig_loc+tcurrent_figure) into item 2 of t_cursor_current_loc
    --
    --  set the loc of btn "cursor" to t_cursor_current_loc
    
    
    put (tcurrent_time/ttotal_time)*item 1 of twindow_distance into tcurrent_figure
    put round(item 1 of twindow_orig_loc+tcurrent_figure) into item 1 of twindow_current_loc
    
    put (tcurrent_time/ttotal_time)*item 2 of twindow_distance into tcurrent_figure
    put round(item 2 of twindow_orig_loc+tcurrent_figure) into item 2 of twindow_current_loc
    
    set the loc of group "window group" to twindow_current_loc
    
    
    put (tcurrent_time/ttotal_time)*item 1 of tproperties_distance into tcurrent_figure
    put round(item 1 of tproperties_orig_loc-tcurrent_figure) into item 1 of tproperties_current_loc
    
    put (tcurrent_time/ttotal_time)*item 2 of tproperties_distance into tcurrent_figure
    put round(item 2 of tproperties_orig_loc-tcurrent_figure) into item 2 of tproperties_current_loc
    
    set the loc of group "properties" to tproperties_current_loc
    unlock screen
  end repeat
  lock screen
  set the rect of grc "border" to "154,45,613,390"
  set the loc of group "menubar group" to "373,100"
  set the loc of group "window group" to "386,268"
  set the loc of group "properties" to "383,270"
  unlock screen
end contract_miniscreen

on click_sound
  play "click.wav"
  --  get mcisendstring("play E:click.wav")
end click_sound

on tap_sound
  click_sound
end tap_sound


on exit_h
  modal "halt"
  wait 10 ticks
  switch the cResult of stack "halt"
  case "cancel"
    exit to metacard
    exit switch
  case "play"
    exit exit_h
    exit switch
  case "next"
    send "next_cd" to me in 10 milliseconds
    exit to metacard
    exit switch
  case "previous"
    send "prev_cd" to me in 10 milliseconds
    exit to metacard
    exit switch
  case "this"
    send "this_one" to me in 10 milliseconds
    exit to metacard
    exit switch
  case "menu"
    send "go_menu" to me in 10 milliseconds
    exit to metacard
    exit switch
  end switch
end exit_h

on next_cd
  switch the num of this cd
  case 5
    visual effect dissolve
    go next cd
    exit switch
  case 13
    visual effect wipe down to black
    visual effect wipe up to card
    go cd 4
    exit switch
  case 16
  case 9
    visual effect dissolve
    go cd 10
    exit switch
  default
    visual effect wipe down to black
    visual effect wipe up to card
    go next cd
    exit switch
  end switch
end next_cd

on prev_cd
  global advanced_user
  switch the num of this cd
  case 2
  case 7
    visual effect dissolve
    go prev cd
    exit switch
  case 4
    if advanced_user is true then
      visual effect wipe down to black
      visual effect wipe up to card
      go cd 13
    else
      visual effect wipe down to black
      visual effect wipe up to card
      go prev cd
    end if
    exit switch
  case 11
    visual effect dissolve
    go cd 1
    exit switch
  case 14
    visual effect dissolve
    go cd 6
    exit switch
  default
    visual effect wipe down to black
    visual effect wipe up to card
    go prev cd
    exit switch
  end switch
end prev_cd

on go_menu
  visual effect dissolve
  go cd 1
end go_menu

on this_one
  lock screen
  send "preopencard" to this cd
  unlock screen
  send "opencard" to this cd
end this_one

on spin_logo which
  set the defaultstack to "metacard demo2"
  if the num of this cd is not 1 and the num of this cd is not 6 and the num of this cd is not 10 then
    contract_small_group
    exit spin_logo
  end if
  if the width of btn "logo" is 1 then
    contract_item which
    hide control which
    show control "logo"
    expand_item "logo"
  else
    hide control which
    contract_item "logo"
    hide control "logo"
    show control which
    expand_item which
  end if
end spin_logo

on contract_item which
  local orig_loc, it, start_time, current_time, image1_loc, image2_loc
  put 1 into it
  set the width of control which to 100
  if "group" is in which then
    put the loc of control 1 of group which into image1_loc
    put the loc of control 2 of group which into image2_loc
  end if
  put the loc of control which into orig_loc
  put the milliseconds into start_time
  --300 milliseconds to draw over
  repeat
    put round(100-((the milliseconds-start_time)/3)) into current_time
    if current_time > 100 then put 100 into current_time
    if current_time < 1 then exit repeat
    lock screen
    set the width of control which to current_time
    set the loc of control which to orig_loc
    if "group" is in which then
      set the loc of control 1 of group which to image1_loc
      set the loc of control 2 of group which to image2_loc
    end if
    unlock screen
  end repeat
  lock screen
  set the width of control which to 1
  set the loc of control which to orig_loc
  if "group" is in which then
    set the loc of control 1 of group which to image1_loc
    set the loc of control 2 of group which to image2_loc
  end if
  unlock screen
end contract_item


on contract_small_group
  local orig_loc, it, start_time, current_time, image1_loc, image2_loc
  put 1 into it
  set the width of button 1 of group "small_settings" to 100
  put the loc of button 1 of group "small_settings" into orig_loc
  put the milliseconds into start_time
  --300 milliseconds to draw over
  repeat
    put round(100-((the milliseconds-start_time)/3)) into current_time
    if current_time > 100 then put 100 into current_time
    if current_time < 1 then exit repeat
    lock screen
    set the width of button 1 of group "small_settings" to current_time
    set the loc of button 1 of group "small_settings" to orig_loc
    unlock screen
  end repeat
  lock screen
  set the width of button 1 of group "small_settings" to 1
  set the loc of button 1 of group "small_settings" to orig_loc
  unlock screen
  hide group "small_settings"
end contract_small_group

on expand_item which
  local orig_loc, it, start_time, current_time, image1_loc, image2_loc
  set the width of control which to 1
  if "group" is in which then
    put the loc of control 1 of group which into image1_loc
    put the loc of control 2 of group which into image2_loc
  end if
  put the loc of control which into orig_loc
  put the milliseconds into start_time
  repeat
    put round((the milliseconds-start_time)/3) into current_time
    if current_time < 1 then put 1 into current_time
    if current_time > 100 then exit repeat
    lock screen
    set the width of control which to current_time
    set the loc of control which to orig_loc
    if "group" is in which then
      set the loc of control 1 of group which to image1_loc
      set the loc of control 2 of group which to image2_loc
    end if
    unlock screen
  end repeat
  lock screen
  set the width of control which to 100
  set the loc of control which to orig_loc
  if "group" is in which then
    set the loc of control 1 of group which to image1_loc
    set the loc of control 2 of group which to image2_loc
  end if
  unlock screen
end expand_item

on fixit
  repeat with i = 1 to the num of cds
    if "typingrate" is in the script of cd i then edit script of cd i
  end repeat
end fixit

on commandKeyDown which
  if the optionKey is down then
    switch which
    case "S"
      edit script of the topStack
      break
    case "C"
      edit script of this card of the topStack
      break
    default
      pass commandKeyDown
    end switch
  else
    if which is "m" then
      modeless "message box"
      exit commandKeyDown
    end if
  end if
  pass commandKeyDown
end commandKeyDown
       @��         MetaCard Demo      �  U 
Helvetica   W 
Helvetica   U Arial   U Arial  
 U Arial  
 U 
Helvetica   U 
Wingdings   U Charter   U Lucida   U Clean   U Courier   U LucidaBright   U LucidaTypewriter   U New Century Schoolbook   U Symbol   U Times   U 
Helvetica   U Courier New   U fixed   U 	Fixedsys   U 
Helvetica   W 
Helvetica  W 
Helvetica  U 
Helvetica  U Courier  U 
Helvetica   U 
Helvetica   W 
Helvetica  W 
Helvetica  U 
Helvetica   U 
Helvetica  " U 
Helvetica  ! U 
Helvetica    U 
Helvetica   U 
Helvetica   U 
Helvetica   U 
Helvetica   U 
Helvetica   U 
Helvetica   U 
Helvetica   U 
Helvetica   U 
Helvetica   U 
Helvetica   U 
Helvetica   U 
Helvetica   U 
Helvetica   U 
Helvetica   U 
Helvetica  6 U 
Helvetica  5 U 
Helvetica  4 U 
Helvetica  3 U 
Helvetica  2 U 
Helvetica  1 U 
Helvetica  0 U 
Helvetica  / U 
Helvetica  . U 
Helvetica  - U 
Helvetica  , U 
Helvetica  + U 
Helvetica  * U 
Helvetica  ) U 
Helvetica  ( U 
Helvetica  ' U 
Helvetica  & U 
Helvetica  % U 
Helvetica  $ U 
Helvetica  # U 
Helvetica  T U 
Helvetica  � U 
Helvetica � U 
Helvetica � U 
Helvetica � U 
Helvetica � U 
Helvetica � U 
Helvetica � U 
Helvetica � U 
Helvetica � U 
Helvetica � U 
Helvetica � U 
Helvetica � U 
Helvetica � U 
Helvetica � U 
Helvetica | U 
Helvetica r U 
Helvetica h U 
Helvetica ^ U 
Helvetica T U 
Helvetica J U 
Helvetica @ U 
Helvetica 6 U 
Helvetica , U 
Helvetica " U 
Helvetica  U 
Helvetica  U 
Helvetica  U 
Helvetica  � U 
Helvetica  � U 
Helvetica  � U 
Helvetica  � U 
Helvetica  � U 
Helvetica  � U 
Helvetica  � U 
Helvetica  � U 
Helvetica  � U 
Helvetica  � U 
Helvetica  � U 
Helvetica  � U 
Helvetica  � U 
Helvetica  x U 
Helvetica  n U 
Helvetica  d U 
Helvetica  Z U 
Helvetica  P U 
Helvetica  F U 
Helvetica  < U 
Helvetica    U 
Helvetica  U Charter  U Charter  U Clean  U Clean  U Courier  U Lucida  U Lucida  U LucidaBright  U LucidaBright  U LucidaTypewriter  U LucidaTypewriter  U New Century Schoolbook  U New Century Schoolbook  U Symbol  U Symbol  U Times  U Times  W 
Helvetica  U 
Helvetica  W 
Helvetica  	W 
Helvetica  	W 
Helvetica   W 
Helvetica   W Lucida   W Courier   W Courier  " W 
Helvetica  
 W 
Helvetica  W 
Helvetica  U 
Helvetica  PU 
Helvetica  @W 
Helvetica  DW 
Helvetica  HW 
Helvetica  @U 
Helvetica   W 
Helvetica  W 
Helvetica  W 
Helvetica   W 
Helvetica   U 
Helvetica  $personal organiser,demo/persorg.mc
   � 	Contents   P&local exit_now, been_here

on test
  visual effect reveal down to black
  go next cd
end test

on test2
  
end test2

on preopencard
  if been_here is true then pass preopencard
  auto_update
  hide group "map_group"
  set the width of btn "logo" to 100
end preopencard

on auto_update
  repeat with i = 1 to the num of controls
    if "autoloc" is in the customkeys of control i then set the loc of control i to the autoloc of control i
    if "autovisible" is in the customkeys of control i then set the visible of control i to the autovisible of control i
  end repeat
end auto_update

on opencard
  if been_Here is true then pass opencard
  put true into been_here
  set cursor to none
  if the platform is "MacOS"
  then play videoclip "demo/introan.mov"
  else play videoclip "demo/introan.avi"
  repeat
    if the movie is "done" then exit repeat
    --get past bug in MC without taking up too much time moving the mouse
    --mouse must move or movie function never returns done!
    get the random of 10
    if it = 2 then
      get the screenMouseLoc
      add 1 to item 1 of it
      set the screenMouseLoc to it
    end if
    if the mouseclick then
      play stop videoclip
      finish_card
      exit opencard
    end if
  end repeat
  if the mouseclick then finish_card
  move image "bottomborder.gif" relative -640,0 in 600 milliseconds
  if the mouseclick then finish_card
  if exit_now is true then exit opencard
  move image "leftborder.gif" relative 0,-480 in 600 milliseconds
  if the mouseclick then finish_card
  if exit_now is true then exit opencard
  move image "topborder.gif" relative 640,0 in 600 milliseconds
  if the mouseclick then finish_card
  if exit_now is true then exit opencard
  move image "rightborder.gif" relative 0,480 in 600 milliseconds
  if the mouseclick then finish_card
  if exit_now is true then exit opencard
  finish_card true
end opencard

on finish_card allow_dissolve
  play stop
  lock screen
  unlock screen
  lock screen
  show image "map_normal"
  show image "backdrop (less colors).gif"
  show image "big1_normal"
  show image "big2_normal"
  show btn "logo"
  show image "text1.gif"
  show btn "arrow1"
  show btn "arrow2"
  show image "text2.gif"
  show image "sidebar.gif"
  show image "small1_normal"
  show image "small2_normal"
  show image "small3_normal"
  set the loc of image "bottomborder.gif" to 320,479
  set the loc of image "leftborder.gif" to 0,240
  set the loc of image "rightborder.gif" to 639,240
  set the loc of image "topborder.gif" to 320,0
  if allow_dissolve is true then unlock screen with visual effect dissolve
  else unlock screen
  exit to metacard
end finish_card

on focusIn
end focusIn

on focusOut
end focusOut

on mouseup
  if not the vis of image "small1_normal" then --not finished
    put true into exit_now
    finish_card false
  end if
end mouseup
          black       ��  �    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  
%  
(  
)  E  I  O  ]  �  �  �  � 
beginner1   	P	�on preopenCard
  auto_update
end preopenCard

on opencard
  set the screenmouseloc to -10,-10
  set cursor to hand
  move control "title" to 504,27 in 1 second
  if the mouseclick then exit_h
  wait 1 second
  if the mouseclick then exit_h
  show fld "sub title" with visual effect wipe right with sound "swish.wav"
  wait 1 second
  if the mouseclick then exit_h
  show fld "header1" with visual effect wipe right with sound "swish.wav"
  show group "viewing area" with visual effect wipe right
  wait 1 second
  if the mouseclick then exit_h
  show group "bullet1a" with visual effect plain with sound "realthud.wav"
  show control "address book" with visual effect dissolve
  wait 2.5 seconds
  if the mouseclick then exit_h
  hide control "address book" with visual effect dissolve
  show group "bullet2a" with visual effect plain with sound "realthud.wav"
  show control "catalogue" with visual effect dissolve
  wait 2.5 seconds
  if the mouseclick then exit_h
  hide control "catalogue" with visual effect dissolve
  show group "bullet3a" with visual effect plain with sound "realthud.wav"
  show control "slide show" with visual effect dissolve
  wait 2.5 seconds
  if the mouseclick then exit_h
  hide control "slide show" with visual effect dissolve
  wait 200 milliseconds
  if the mouseclick then exit_h
  show fld "header2" with visual effect wipe right with sound "swish.wav"
  wait 1 second
  if the mouseclick then exit_h
  show group "bullet4a" with visual effect plain with sound "realthud.wav"
  show control "training package" with visual effect dissolve
  wait 2.5 seconds
  if the mouseclick then exit_h
  hide control "training package" with visual effect dissolve
  show group "bullet5a" with visual effect plain with sound "realthud.wav"
  show control "cdROM" with visual effect dissolve
  wait 2.5 seconds
  if the mouseclick then exit_h
  hide control "cdrom" with visual effect dissolve
  wait 1 second
  if the mouseclick then exit_h
  wait 2 seconds
  if the mouseclick then exit_h
  visual effect wipe down to black
  visual effect wipe up to card
  go next cd
end opencard

on auto_update
  repeat with i = 1 to the num of controls
    if "autoloc" is in the customkeys of control i then set the loc of control i to the autoloc of control i
    if "autovisible" is in the customkeys of control i then set the visible of control i to the autovisible of control i
  end repeat
end auto_update


on run
  send "run2" to me in 2 seconds
end run

on run2
  edit script of fld 1 of stack "message box"
end run2
           ~�  �  �  �  �  �  �  �  �  �  ~  %  �  	  *  	�  +  )  	�  ]  � 
beginner2   P!con preopenCard
  auto_update
  set the icon of btn "elephant animation" to 2226
  field_settup
end preopenCard

on opencard
  move control "title" to 500,29 in 1 second
  if the mouseclick then exit_h
  wait 1 second
  if the mouseclick then exit_h
  show fld "sub title" with visual effect wipe right with sound "swish.wav"
  show group "viewing area" with visual effect wipe right
  wait 1 second
  if the mouseclick then exit_h
  show group "bullet1b" with visual effect plain with sound "realthud.wav"
  wait 3 seconds
  if the mouseclick then exit_h
  show fld "bullet1extra"
  show fld "a field"
  wait 50 ticks
  if the mouseclick then exit_h
  hide fld "a field"
  wait 20 ticks
  if the mouseclick then exit_h
  show fld "bullet2extra"
  show grc "a graphic"
  wait 50 ticks
  if the mouseclick then exit_h
  hide grc "a graphic"
  wait 20 ticks
  if the mouseclick then exit_h
  show fld "bullet3extra"
  show scrollbar "a scrollbar"
  wait 50 ticks
  if the mouseclick then exit_h
  hide scrollbar "a scrollbar"
  wait 20 ticks
  if the mouseclick then exit_h
  show fld "bullet4extra"
  show image "an image"
  wait 50 ticks
  if the mouseclick then exit_h
  hide image "an image"
  wait 20 ticks
  if the mouseclick then exit_h
  show fld "bullet5extra"
  show btn "a button"
  wait 50 ticks
  if the mouseclick then exit_h
  hide btn "a button"
  wait 1 second
  if the mouseclick then exit_h
  
  show group "bullet2b" with visual effect plain with sound "realthud.wav"
  show fld "bullet3text"
  send "scroll_test2" to me
  if the mouseclick then exit_h
  wait 1 second
  if the mouseclick then exit_h
  lock screen
  show group "bullet3b"
  show fld "dinner"
  put "scripting language." into fld "dinner"
  unlock screen with visual effect plain with sound "realthud.wav"
  wait 1 seconds
  if the mouseclick then exit_h
  test
  wait 1 second
  if the mouseclick then exit_h
  wait 2 seconds
  if the mouseclick then exit_h
  visual effect wipe down to black
  visual effect wipe up to card
  go next cd
end opencard

on earthquake
  local i
  get the loc of this stack
  put 1 into i
  repeat 30
    add 0.25 to i
    -- add 1 to i
    add round(i) to item 1 of it
    add round(i) to item 2 of it
    set the loc of this stack to it
    subtract round(i) from item 1 of it
    subtract round(i) from item 2 of it
    set the loc of this stack to it
  end repeat
end earthquake

on auto_update
  repeat with i = 1 to the num of controls
    if "autoloc" is in the customkeys of control i then set the loc of control i to the autoloc of control i
    if "autovisible" is in the customkeys of control i then set the visible of control i to the autovisible of control i
  end repeat
end auto_update

--on scroll_test
--  local i, wait_until, not_beyond, start_milliseconds, add_num
--  put 10 into i
--  put 10 into wait_until
--  put the formattedwidth of fld "bullet3text" into not_beyond
--  put the milliseconds into start_milliseconds
-- put 0.002 into add_num
--  repeat
--   set the hscroll of fld "bullet3text" to round(i)
--   add 1+(i*add_num) to i
--   add 1+(wait_until*0.002) to wait_until
--  if the milliseconds < (start_milliseconds+(i*2.99)) then add 1 to add_num
--   wait until (the milliseconds > (start_milliseconds+(wait_until*3)))
--   if i > not_beyond then exit repeat
--  end repeat
--end scroll_test

on scroll_test2
  local frame_list, current_frame, start_time, this_control, next_control_frame, current_time, tcurrent
  put 0 into current_frame
  put the milliseconds into start_time
  put 0 into this_control
  put 147 into next_control_frame
  put "135,271,406,541,676,812,947,1082,1218,1353,1488,1624,1759,1894,2029,2165,2300" into frame_list
  repeat
    put (the milliseconds-start_time) into current_time
    put round((current_time*current_time)*0.00000625) into current_frame
    set the hscroll of fld "bullet3text" to current_frame
    if current_frame > next_control_frame then
      if this_control is not 0 then hide control this_control of group "scrollingobjects"
      add 1 to this_control
      show control this_control of group "scrollingobjects"
      -- at 486,240
      put item (this_control+1) of frame_list into next_control_frame
      if next_control_frame is empty then put 4000 into next_control_frame
    end if
    if current_time > 22000 then exit repeat
  end repeat
end scroll_test2

on maths
  local listx
  local list
  local tcurrent, add_num, x
  put 0 into tcurrent
  put 2500/17 into add_num
  repeat 17
    add add_num to tcurrent
    put sqrt(tcurrent/6.25) into x
    put round(x)&"," after list
  end repeat
  put list
  wait until the mouse is down
  put 0 into tcurrent
  repeat for each item tcurrent in list
    put round((tcurrent*tcurrent)*6.25)&"," after listx
  end repeat
  put listx
end maths

on maths2
  local list, tcurrent, add_num
  put 0 into tcurrent
  put 2300/17 into add_num
  repeat 17
    add add_num to tcurrent
    put round(tcurrent)&"," after list
  end repeat
  put list
end maths2

--local start_time
--on mouseUp
put the milliseconds into start_time
moveit
end mouseUp

--on moveit
put (the milliseconds-start_time) into current_time
if current_time < 20000 then send "moveit" to me in 32 milliseconds
set the hscroll of fld "bullet3text" to \
    round((current_time*current_time)*0.00000625)
end moveit

on do_it
  repeat with i = 1 to the num of cds
    if i = 1 then next repeat
    place background "backdrop_group" onto card i
    lock messages
    go cd i
    set the layer of group "backdrop_group" of cd i to 1
  end repeat
end do_it

on test
  set the loc of btn "elephant animation" to 481,242
  set the icon of btn "elephant animation" to 2226
  wait 5 ticks
  set the icon of btn "elephant animation" to 2550
  lock screen
  show btn "elephant animation"
  hide control 17 of group "scrollingobjects"
  unlock screen
  --set the loc of fld "dinner" to 256,305
  --wait until the mouseclick
  move btn "elephant animation" to ((item 1 of the loc btn "elephant animation"-10) & "," & (item 2 of the loc of fld"dinner"-53)) in 40 ticks
  set the icon of btn "elephant animation" to 2550
  wait 5 ticks
  set the icon of btn "elephant animation" to 2551
  wait 5 ticks
  set the icon of btn "elephant animation" to 2552
  wait 5 ticks
  set the icon of btn "elephant animation" to 2553
  wait 5 ticks
  get the formattedwidth of fld "dinner"
  move fld "dinner" relative ((41 - (it-136) div 2)&",0") in 1 second
  repeat 19
    delete last char of fld "dinner"
    eat_anim
  end repeat
  set the icon of btn "elephant animation" to 2554
  wait 5 ticks
  set the icon of btn "elephant animation" to 2553
  wait 5 ticks
  set the icon of btn "elephant animation" to 2552
  wait 5 ticks
  set the icon of btn "elephant animation" to 2551
  wait 5 ticks
  set the icon of btn "elephant animation" to 2550
  wait 5 ticks
  move btn "elephant animation" to (item 1 of the autoloc of btn "elephant animation"+4&","&item 2 of the autoloc of btn "elephant animation")
  set the icon of btn "elephant animation" to 2226
end test

on eat_anim
  local frame_list
  local frame_num, tTimer
  put "2554,2556,2558,2560,2562,2564,2566" into frame_list
  put the milliseconds into tTimer
  repeat
    put the milliseconds-tTimer into frame_num
    put round(frame_num/35) into frame_num
    if frame_num is 0 then put 1 into frame_num
    put item frame_num of frame_list into frame_num
    if frame_num is empty then exit repeat
    set the icon of btn "elephant animation" to frame_num
  end repeat
end eat_anim

on field_settup
  put "scripting language." into fld "dinner"
  get the formattedwidth of fld "first_field"
  set the width of fld "first_field" to it
  get the formattedheight of fld "first_field"
  set the height of fld "first_field" to it
  
  get the formattedwidth of fld "second_field"
  set the width of fld "second_field" to it
  get the formattedheight of fld "second_field"
  set the height of fld "second_field" to it
  
  get the formattedwidth of fld "dinner"
  set the width of fld "dinner" to it
  get the formattedheight of fld "dinner"
  set the height of fld "dinner" to it
  
  set the topleft of fld "first_field" to 43,273
  set the topleft of fld "second_field" to the bottomleft of fld "first_field"
  get the loc of fld "second_field"
  subtract 8 from item 2 of it
  set the loc of fld "second_field" to it
  set the topleft of fld "dinner" to the topright of fld "second_field"
  get the loc of fld "dinner"
  subtract 8 from item 1 of it
  set the loc of fld "dinner" to it
end field_settup
           ~�  �  �  �  �  �  ~  �  �  �  �  �  �  �  �  �  �  �  �  �  �  	  	�  	�  	�  	�  	�  	�  	�  
   
  
  
  
  d 
beginner3   	P7on preopenCard
  auto_update
end preopenCard

on opencard
  move control "title" to 477,30 in 1 second
  if the mouseclick then exit_h
  wait 1 second
  if the mouseclick then exit_h
  show fld "sub title" with visual effect wipe right with sound "swish.wav"
  show group "viewing area" with visual effect wipe right
  if the mouseclick then exit_h
  wait 1 second
  if the mouseclick then exit_h
  show group "bullet1c" with visual effect plain with sound "realthud.wav"
  show image "money bag" with visual effect dissolve
  wait 2 seconds
  hide image "money bag" with visual effect dissolve
  if the mouseclick then exit_h
  show group "bullet2c" with visual effect plain with sound "realthud.wav"
  wait 1 second
  show image "computer1" with visual effect dissolve
  if the mouseclick then exit_h
  wait 1 second
  lock screen
  hide image "computer1"
  show image "computer3"
  unlock screen with visual effect dissolve slow
  wait 1 second
  lock screen
  hide image "computer3"
  show image "computer2"
  unlock screen with visual effect dissolve slow
  wait 1 second
  hide image "computer2" with visual effect dissolve slow
  if the mouseclick then exit_h
  show group "bullet3c" with visual effect plain with sound "realthud.wav"
  show image "internet" with visual effect dissolve slow
  wait 3 seconds
  hide image "internet" with visual effect dissolve
  if the mouseclick then exit_h
  wait 2 seconds
  if the mouseclick then exit_h
  visual wipe down to black
  visual effect wipe up
  go next cd
end opencard


on auto_update
  repeat with i = 1 to the num of controls
    if "autoloc" is in the customkeys of control i then set the loc of control i to the autoloc of control i
    if "autovisible" is in the customkeys of control i then set the visible of control i to the autovisible of control i
  end repeat
end auto_update
           ~�  �  f  g  j  m  ~  �  �  	  	*  	+  	-  	~  	�  H 
beginner4   	PBlocal string_list, current_character, return_rate, mname

on preopenCard
  put the typingrate into return_rate
  set the typingrate to 100
  hide fld "sub title"
  set the dontrefresh of the templateVideoClip to false
  if the platform is "MacOS"
  then put "demo/mananim.mov" into mname
  else put "demo/mananim.avi" into mname
  prepare videoclip mname at 210,302
  auto_update
end preopenCard

on opencard
  global return_number
  put empty into return_number
  move control "title" to 490,30 in 1 second
  if the mouseclick then exit_h
  wait 1 second
  if the mouseclick then exit_h
  show fld "sub title" with visual effect wipe right with sound "swish.wav"
  wait 1 second
  if the mouseclick then exit_h
  show group "bullet1d" with visual effect plain with sound "realthud.wav"
  wait 3 seconds
  if the mouseclick then exit_h
  show group "bullet2d" with visual effect plain with sound "realthud.wav"
  wait 3 seconds
  if the mouseclick then exit_h
  show group "bullet3d" with visual effect plain with sound "realthud.wav"
  wait 3 seconds
  if the mouseclick then exit_h
  show group "bullet4d" with visual effect plain with sound "realthud.wav"
  wait 1 second
  if the mouseclick then exit_h
  show group "bullet5d" with visual effect plain with sound "static2.wav"
  wait 50 ticks
  if the mouseclick then exit_h
  show group "bullet6d" with visual effect plain with sound "static1.wav"
  wait 30 ticks
  show group "bullet7d" with visual effect plain with sound "static2.wav"
  wait 20 ticks
  if the mouseclick then exit_h
  show group "bullet8d" with visual effect plain with sound "static2.wav"
  wait 10 ticks
  show group "bullet9d" with visual effect plain with sound "static1.wav"
  wait 5 ticks
  show group "bullet10d" with visual effect plain with sound "static2.wav"
  wait 5 ticks
  if the mouseclick then exit_h
  show group "bullet11d" with visual effect plain with sound "static1.wav"
  wait 5 ticks
  show group "bullet12d" with visual effect plain with sound "static1.wav"
  wait 5 ticks
  show group "bullet13d" with visual effect plain with sound "static2.wav"
  wait 5 ticks
  show group "bullet14d" with visual effect plain with sound "static2.wav"
  wait 5 ticks
  if the mouseclick then exit_h
  show group "bullet15d"  with visual effect plain with sound "badstatic.wav"
  --320,532  arm image
  --320,480  intersect
  --320,450  end
  
  --308,424   group begin
  --308,394   group end
  wait 45 ticks
  play "earthquake.wav"
  earthquake2
  if the mouseclick then exit_h
  
  -- get mcisendstring("play E:motorsound.wav")
  
  --  move image "arm" to 320,480 in 350 milliseconds
  --  move group "bullet15d" to 308,404 in 250 milliseconds
  --  move image "arm" to 320,460 in 300 milliseconds
  --  move group "bullet15d" to 308,394 in 150 milliseconds
  --  move image "arm" to 320,532 in 500 milliseconds
  -- if the mouseclick then exit_h
  
  show image "frame1"
  move image "frame1" to 182,282 in 2 seconds
  play videoclip mname at 210,302
  set the dontrefresh of the templatevideoClip to true
  wait until the movie is "done"
  show image "frame2"
  hide image "frame1"
  move image "frame2" to the autoloc of image "frame1" in 2 seconds
  if the mouseclick then exit_h
  wait 1 second
  end_card
end opencard

on auto_update
  repeat with i = 1 to the num of controls
    if "autoloc" is in the customkeys of control i then set the loc of control i to the autoloc of control i
    if "autovisible" is in the customkeys of control i then set the visible of control i to the autovisible of control i
  end repeat
end auto_update

on earthquake2
  local i, tframe_list, tcurrentframe, tmodify_position, tstack_position, tstart_time
  put 1 into i
  repeat 30
    put i+0.25 into i
    put round(i)&"," after tframe_list
  end repeat
  put 8.5 into i
  repeat 15
    subtract 0.25 from i
    put round(i)&"," after tframe_list
  end repeat
  delete last char of tframe_list
  -- answer tframe_list
  get the loc of this stack
  put it into tstack_position
  put the milliseconds into tstart_time
  repeat
    put (the milliseconds-tstart_time)*0.0225 into tcurrentframe
    if tcurrentframe > 45 then exit repeat
    put item tcurrentframe of tframe_list into tcurrentframe
    
    put tstack_position into tmodify_position
    add tcurrentframe to item 1 of tmodify_position
    add tcurrentframe to item 2 of tmodify_position
    set the loc of this stack to tmodify_position
    subtract tcurrentframe from item 1 of tmodify_position
    subtract tcurrentframe from item 2 of tmodify_position
    set the loc of this stack to tmodify_position
  end repeat
end earthquake2

on mad_move the_object, the_distance
  local i, tframes, x, ttarget_obj
  if the_object = "bullet7d" then set the movespeed to 0 else set the movespeed to 500
  repeat with i = 1 to the_distance
    put i & "," after tframes
    put 0-i & "," after tframes
  end repeat
  delete last char of tframes
  repeat with i = 1 to (the_distance*2)
    repeat with x = 1 to ((char 7 of the_object)-2)
      put "bullet"& (x+2) &"d" into ttarget_obj
      if the movespeed is not 0 then move group ttarget_obj relative (item i of tframes&","&item i of tframes) in (the_distance*4) milliseconds
      else move group ttarget_obj relative (item i of tframes&","&item i of tframes)
    end repeat
  end repeat
end mad_move


on end_card
  global return_to
  put 6 into return_to
  visual effect dissolve
  go cd 18
end end_card
     �     ~�   current_day  yxpat  1the_record  1  �  N  O  R  U  X  [  `  �  �  �  �  �  �  �  �  �  �  	  �  	   Z  	!  r 
contents2   	P \on preopenCard
  hide group "map_group"
  hide image "organiser_depressed"
end preopenCard
           ~�  
�  
�  
  
�  
  
&  
'  
�  I  ]  E  O  �  �  �  �  � beginnerteach1   	P*�on preopenCard
  auto_update
  reset_miniscreen
  set the movespeed to 300
end preopencard

on opencard
  set the screenmouseloc to -10,-10
  set cursor to 8
  move control "title" to 487,28 in 1 second
  if the mouseclick then exit_h
  wait 1 second
  if the mouseclick then exit_h
  show group "bullet1e" with visual effect wipe right
  wait 800 milliseconds
  if the mouseclick then exit_h
  show group "miniscreen" with visual effect dissolve very fast
  wait 600 milliseconds
  if the mouseclick then exit_h
  menu_choice "file","new stack"
  show_window
  if the mouseclick then exit_h
  reset_cursor
  if the mouseclick then exit_h
  hide group "bullet1e"
  show control "bullet2" with visual effect wipe right
  wait 3.5 seconds
  if the mouseclick then exit_h
  repeat 3
    show grc "card_marker"
    wait 8 ticks
    hide grc "card_marker"
    wait 8 ticks
  end repeat
  show grc "card_marker"
  if the mouseclick then exit_h
  wait 4 seconds
  if the mouseclick then exit_h
  hide grc "card_marker"
  hide control "bullet2"
  
  show control "bullet2a" with visual effect wipe right
  wait 3 seconds
  if the mouseclick then exit_h
  show control "bullet3" with visual effect wipe right
  wait 30 ticks
  show control "bullet4" with visual effect wipe right
  wait 70 ticks
  if the mouseclick then exit_h
  show control "buttontooltip"
  repeat 2
    wait 10 ticks
    hide control "buttontooltip"
    wait 10 ticks
    show control "buttontooltip"
  end repeat
  move btn "cursor" to the loc of btn "button" in 400 milliseconds
  click_sound
  set the hilitedbuttonname of group "icons" to "button"
  set the icon of btn "cursor" to 1282
  hide control "buttontooltip"
  move btn "cursor" to the loc of btn "button example"
  click_sound
  show btn "button example"
  repeat 7
    get the loc of btn "cursor"
    add 10 to item 1 of it
    add 10 to item 2 of it
    move btn "cursor" to it
    get the rect of btn "Button example"
    add 10 to item 3 of it
    add 10 to item 4 of it
    set the rect of btn "button example" to it
  end repeat
  click_sound
--move btn "cursor" relative -20,-20 in 200 milliseconds
  if the mouseclick then exit_h
  
  hide control "bullet4"
  show control "bullet5" with visual effect wipe right
  wait 70 ticks
  if the mouseclick then exit_h
  show control "fieldtooltip"
  repeat 2
    wait 1 ticks
    hide control "fieldtooltip"
    wait 1 ticks
    show control "fieldtooltip"
  end repeat
  move btn "cursor" to the loc of btn "field" in 300 milliseconds
  click_sound
  set the hilitedbuttonname of group "icons" to "field"
  set the icon of btn "cursor" to 1282
  hide control "fieldtooltip"
  move btn "cursor" to the loc of fld "field example"
  if the mouseclick then exit_h
  click_sound
  show fld "field example"
  repeat 8
    get the loc of btn "cursor"
    add 20 to item 1 of it
    add 8 to item 2 of it
    move btn "cursor" to it
    wait until the loc of btn "cursor" is it
    get the rect of fld "field example"
    add 20 to item 3 of it
    add 8 to item 4 of it
    set the rect of fld "field example" to it
  end repeat
  click_sound
-- move btn "cursor" relative -20,-20 in 200 milliseconds
  
  if the mouseclick then exit_h
  hide control "bullet5"
  show control "bullet6" with visual effect wipe right
  wait 40 ticks
  if the mouseclick then exit_h
  show control "scrollbartooltip"
  repeat 2
    wait 2 ticks
    hide control "scrollbartooltip"
    wait 2 ticks
    show control "scrollbartooltip"
  end repeat
  move btn "cursor" to the loc of btn "scrollbar" in 200 milliseconds
  click_sound
  set the hilitedbuttonname of group "icons" to "scrollbar"
  set the icon of btn "cursor" to 1282
  hide control "scrollbartooltip"
  if the mouseclick then exit_h
  move btn "cursor" to the loc of scrollbar "scrollbar example"
  wait until the loc of btn "cursor" is the loc of scrollbar "scrollbar example"
  click_sound
  show scrollbar "scrollbar example"
  repeat 4
    get the loc of btn "cursor"
    add 4 to item 1 of it
    add 22 to item 2 of it
    move btn "cursor" to it
    wait until the loc of btn "cursor" is it
    get the rect of scrollbar "scrollbar example"
    add 4 to item 3 of it
    add 22 to item 4 of it
    set the rect of scrollbar "scrollbar example" to it
  end repeat
  click_sound
--move btn "cursor" relative -20,-20 in 200 milliseconds
  
  if the mouseclick then exit_h
  hide control "bullet6"
  show control "bullet7" with visual effect wipe right
  wait 30 ticks
  if the mouseclick then exit_h
  show control "ovaltooltip"
  repeat 2
    wait 2 tick
    hide control "ovaltooltip"
    wait 2 tick
    show control "ovaltooltip"
  end repeat
  move btn "cursor" to the loc of btn "oval" in 200 milliseconds
  click_sound
  set the hilitedbuttonname of group "icons" to "oval"
  set the icon of btn "cursor" to 1282
  hide control "ovaltooltip"
  move btn "cursor" to the loc of grc "oval example"
  if the mouseclick then exit_h
  click_sound
  show grc "oval example"
  repeat 3
    get the loc of btn "cursor"
    add 11 to item 1 of it
    add 11 to item 2 of it
    move btn "cursor" to it
    wait until the loc of btn "cursor" is it
    get the rect of grc "oval example"
    add 11 to item 3 of it
    add 11 to item 4 of it
    set the rect of grc "oval example" to it
  end repeat
  click_sound
--  move btn "cursor" relative -20,-20 in 200 milliseconds
  
  if the mouseclick then exit_h
  wait 2 seconds
  if the mouseclick then exit_h
  lock screen
  hide control "bullet2a"
  hide control "bullet3"
  hide control "bullet7"
  unlock screen
  show control "bullet7b" with visual effect wipe right
  wait 4 seconds
  if the mouseclick then exit_h
  reset_cursor
  if the mouseclick then exit_h
  wait 3 seconds
  if the mouseclick then exit_h
  hide control "bullet7b"
  
  
  show control "bullet8" with visual effect wipe right
  wait 2 seconds
  if the mouseclick then exit_h
  move btn "cursor" to the loc of btn "pointer" in 300 milliseconds
  click_sound
  set the hilitedbuttonname of group "icons" to "pointer"
  set the icon of btn "cursor" to 301
  move btn "cursor" to the bottomright of btn "button example" in 250 milliseconds
  if the mouseclick then exit_h
  click_sound
  select btn "button example"
  repeat 3
    get the loc of btn "cursor"
    subtract 10 from item 2 of it
    move btn "cursor" to it
    wait until the loc of btn "cursor" is it
    get the rect of btn "Button example"
    subtract 10 from item 4 of it
    set the rect of btn "button example" to it
  end repeat
  click_sound
  select empty
  
  if the mouseclick then exit_h
  move btn "cursor" to the bottomright of scrollbar "scrollbar example" in 200 milliseconds
  click_sound
  select scrollbar "scrollbar example"
  repeat 6
    get the loc of btn "cursor"
    add 10 to item 1 of it
    subtract 10 from item 2 of it
    move btn "cursor" to it
    wait until the loc of btn "cursor" is it
    get the rect of scrollbar "scrollbar example"
    add 10 to item 3 of it
    subtract 10 from item 4 of it
    set the rect of scrollbar "scrollbar example" to it
  end repeat
  click_sound
  select empty
  
  if the mouseclick then exit_h
  move btn "cursor" to the loc of control "oval example" in 400 milliseconds
  click_sound
  select control "oval example"
  repeat 6
    get the loc of btn "cursor"
    add 10 to item 1 of it
    add 10 to item 2 of it
    move btn "cursor" to it
    wait until the loc of btn "cursor" is it
    get the loc of control "oval example"
    add 10 to item 1 of it
    add 10 to item 2 of it
    set the loc of control "oval example" to it
  end repeat
  click_sound
  select empty
  if the mouseclick then exit_h
  reset_cursor
  if the mouseclick then exit_h
  hide control "bullet8"
  
  if the mouseclick then exit_h
  wait 4 seconds
  if the mouseclick then exit_h
  visual effect wipe down to black
  visual effect wipe up to card
  go next cd
end opencard

on auto_update
  repeat with i = 1 to the num of controls
    if "autoloc" is in the customkeys of control i then set the loc of control i to the autoloc of control i
    if "autovisible" is in the customkeys of control i then set the visible of control i to the autovisible of control i
  end repeat
end auto_update

on drop_in_test
  local tnumber
  hide fld "Bullet4"
  wait 1 second
  set the textsize of fld "bullet4" to 500
  show fld "bullet4"
  put 500 into tnumber
  repeat 50
    subtract 10 from tnumber
    set the textsize of fld "Bullet4" to tnumber
  end repeat
end drop_in_test

on dropin2
  set the rect of grc "test" to 20,20,420,420
  repeat 20
    lock screen
    get the rect of grc "test"
    add 10 to item 1 of it
    add 10 to item 2 of it
    subtract 10 from item 3 of it
    subtract 10 from item 4 of it
    set the rect of grc "test" to it
    set the linesize of grc "test" to round(the width of grc "test"/20)
    unlock screen
  end repeat
end dropin2

on drop3
  local tfinal_rect, torig_rect
  put "16,219,67,230" into tfinal_rect
  put "-2428,-34,2626,500" into torig_rect
  
  local tline_orig, tline_distance, tline_current, tborder_rect, tborder_distance, tstart_time, tcurrent_time, tcurrent_figure, torig_rect, ttotal_time
  
  put 50 into tline_orig
  put 50 into tline_distance
  put 50 into tline_current
  lock screen
  set the linesize of grc "bullet4" to 50
  set the rect of grc "bullet4" to "-2428,-34,2626,500"
  unlock screen
  put "-2428,-34,2626,500" into torig_rect
  put "-2428,-34,2626,500" into tborder_rect
  put "2444,253,2559,270" into tborder_distance
  put "4000" into ttotal_time
  
  put the milliseconds into tstart_time
  repeat
    put the milliseconds - tstart_time into tcurrent_time
    if tcurrent_time > ttotal_time then exit repeat
    
    put (tcurrent_time/ttotal_time)*item 1 of tborder_distance into tcurrent_figure
    put round(item 1 of torig_rect+tcurrent_figure) into item 1 of tborder_rect
    
    put (tcurrent_time/ttotal_time)*item 2 of tborder_distance into tcurrent_figure
    put round(item 2 of torig_rect+tcurrent_figure) into item 2 of tborder_rect
    
    put (tcurrent_time/ttotal_time)*item 3 of tborder_distance into tcurrent_figure
    put round(item 3 of torig_rect-tcurrent_figure) into item 3 of tborder_rect
    
    put (tcurrent_time/ttotal_time)*item 4 of tborder_distance into tcurrent_figure
    put round(item 4 of torig_rect-tcurrent_figure) into item 4 of tborder_rect
    lock screen
    
    put (tcurrent_time/ttotal_time)*tline_distance into tcurrent_figure
    put round(tline_orig-tcurrent_figure) into tline_current
    
    set the linesize of grc "bullet4" to tline_current
    set the rect of grc "bullet4" to tborder_rect
    unlock screen
  end repeat
  lock screen
  set the linesize of grc "bullet4" to 1
  set the rect of grc "bullet4" to tfinal_rect
  unlock screen
end drop3

on test
  put the clickloc
  repeat 10
    put the clickloc
    wait 10 ticks
  end repeat
  put the clickloc
  beep
end test
           ~�  �  �  �  �  �  	  
  �  �  �  �     �  	6  	7  	  �  	J  	M  ]   beginnerteach2   	Pmon opencard
  move control "title" to 529,29 in 1 second
  if the mouseclick then exit_h
  wait 1 second
  if the mouseclick then exit_h
  show control "bullet1" with visual effect wipe right
  wait 5 seconds
  if the mouseclick then exit_h
  hide control "bullet1"
  show control "bullet2" with visual effect wipe right
  wait 1500 milliseconds
  if the mouseclick then exit_h
  show group "miniscreen" with visual effect dissolve
  move btn "cursor" to the loc of btn "pointer" in 400 milliseconds
  click_sound
  set the hilitedbuttonname of group "icons" to "pointer"
  set the icon of btn "cursor" to 301
  if the mouseclick then exit_h
  move btn "cursor" to the loc of fld "field example" in 400 milliseconds
  select fld "field example"
  click_sound
  wait 10 ticks
  click_sound
  show group "properties"
  show group "field properties"
  wait 2 seconds
  if the mouseclick then exit_h
  hide control "bullet2"
  show control "bullet3" with visual effect wipe right
  wait 2 seconds
  if the mouseclick then exit_h
  expand_miniscreen
  move btn "cursor" to the loc of control "showlines" of group "field properties" in 1 second
  click_sound
  set the hilite of btn "showlines" of group "field properties" to true
  set the showlines of fld "field example" to true
  repeat 4
    wait 8 ticks
    set the showlines of fld "field example" to false
    wait 9 ticks
    set the showlines of fld "field example" to true
  end repeat
  wait 800 milliseconds
  if the mouseclick then exit_h
  move btn "cursor" to the loc of control "shadow" of group "field properties" in 1200 milliseconds
  click_sound
  set the hilitedbuttonname of group "fstyle" to "shadow"
  set the style of fld "field example" to "shadow"
  wait 8 ticks
  repeat 3
    set the style of fld "field example" to "rectangle"
    wait 8 ticks
    set the style of fld "field example" to "shadow"
    wait 8 ticks
  end repeat
  wait 800 milliseconds
  if the mouseclick then exit_h
  move btn "cursor" to the loc of control "hscrollbar" of group "field properties" in 1200 milliseconds
  click_sound
  set the hilite of btn "hscrollbar" to true
  set the hscrollbar of fld "field example" to true
  wait 8 ticks
  repeat 2
    set the hscrollbar of fld "field example" to false
    wait 8 ticks
    set the hscrollbar of fld "field example" to true
    wait 9 ticks
  end repeat
  if the mouseclick then exit_h
  if the lookandfeel is not "motif" then move btn "cursor" to the loc of btn "close box marker" in 900 milliseconds \
    else move btn "cursor" to 182,242 in 900 milliseconds
wait 20 ticks
if the mouseclick then exit_h
click_sound
hide group "field properties"
if the mouseclick then exit_h
wait 1 second


move btn "cursor" to the topleft of btn "button example" in 400 milliseconds
move btn "cursor" relative 10,11 in 100 milliseconds
if the mouseclick then exit_h
click_sound
select empty
select btn "button example"
repeat 7
  get the loc of btn "cursor"
  subtract 5 from item 2 of it
  subtract 10 from item 1 of it
  move btn "cursor" to it
  get the rect of btn "Button example"
  subtract 5 from item 2 of it
  subtract 10 from item 1 of it
  set the rect of btn "button example" to it
end repeat
click_sound
if the mouseclick then exit_h

move btn "cursor" to the loc of btn "button example" in 500 milliseconds
click_sound
wait 10 ticks
click_sound
show group "button properties"
wait 1 second
if the mouseclick then exit_h

move btn "cursor" to the loc of fld "name" of group "button properties"
click_sound
wait 10 ticks
click_sound
if the mouseclick then exit_h
select text of fld "name" of group "button properties"
type "Tabbed button"
select text of fld "off screen" --check for a better way to do this
move btn "cursor" relative -220,-5 in 20 ticks
click_sound
set the label of btn "button example" to "Tabbed button"
wait 2 seconds
if the mouseclick then exit_h
show field "tab_info"
wait 2 seconds
if the mouseclick then exit_h
repeat 3
  show grc "tab_alert"
  wait 8 ticks
  hide grc "tab_alert"
  wait 8 ticks
end repeat
show grc "tab_alert"
wait 1200 milliseconds
if the mouseclick then exit_h
hide grc "tab_alert"
hide fld "tab_info"
move btn "cursor" to the loc of btn "appearance_marker" in 300 milliseconds
click_sound
lock screen
set the menuhistory of btn "button properties" to 2
hide group "button name group"
show group "button_appearance"
unlock screen
wait 1 second
if the mouseclick then exit_h
move btn "cursor" to the loc of btn "tabbed"
click_sound
set the hilitedbuttonname of group "bstyle" to "tabbed"
set the style of btn "button example" to "menu"
set the showname of btn "button example" to false
wait 1 second
if the mouseclick then exit_h
move btn "cursor" to the loc of btn "extras marker" in 1 second
wait 20 ticks
click_sound
lock screen
set the menuhistory of btn "button properties" to 5
hide group "button_appearance"
show group "button_extras"
unlock screen
wait 1 second
if the mouseclick then exit_h
move btn "cursor" to the loc of fld "tab_titles" in 500 milliseconds
click_sound
select text of fld "tab_titles"
type "Tab1"&cr&"Tab2"&cr&"Easy!"
move btn "cursor" relative -100,-5
click_sound
select text of fld "off screen"
set the text of btn "button example" to "Tab1"&cr&"Tab2"&cr&"Easy!"
if the mouseclick then exit_h
if the lookandfeel is not "motif" then move btn "cursor" to the loc of btn "close box marker" in 900 milliseconds \
  else move btn "cursor" to 182,242 in 900 milliseconds
                             wait 20 ticks
                             if the mouseclick then exit_h
                             click_sound
                             hide group "button properties"
                             wait 1 second
                             if the mouseclick then exit_h
                             select empty
                             reset_cursor
                             if the mouseclick then exit_h
                             hide control "bullet3"
                             if the mouseclick then exit_h
                             contract_miniscreen
                             if the mouseclick then exit_h
                             wait 30 ticks
                             show control "bullet4" with visual effect wipe right
                             wait 5 seconds
                             if the mouseclick then exit_h
                             wait 3 seconds
                             if the mouseclick then exit_h
                             visual effect wipe down to black
                             visual effect wipe up to card
                             go next cd
                             end opencard
                             
                             on auto_update
  repeat with i = 1 to the num of controls
    if "autoloc" is in the customkeys of control i then set the loc of control i to the autoloc of control i
    if "autovisible" is in the customkeys of control i then set the visible of control i to the autovisible of control i
  end repeat
end auto_update

on preopencard
  auto_update
  reset_miniscreen
  set the rect of control "oval example" to "276,306,311,341"
  set the rect of control "button example" to "316,220,388,262"
  set the rect of control "field example" to "415,187,577,253"
  set the rect of control "scrollbar example" to "487,257,565,287"
  set the loc of control "button example" to 352,244
  show control "scrollbar example"
  show control "button example"
  show control "field example"
  show control "oval example"
  show_window
end preopencard
           ~�  �      3  �  	  �  �  �  �   beginnerteach3   	P�on preopencard
  auto_update
  reset_miniscreen
end preopencard

on auto_update
  repeat with i = 1 to the num of controls
    if "autoloc" is in the customkeys of control i then set the loc of control i to the autoloc of control i
    if "autovisible" is in the customkeys of control i then set the visible of control i to the autovisible of control i
  end repeat
end auto_update

on opencard
  move control "title" to 565,28 in 1 second
  if the mouseclick then exit_h
  wait 1 second
  if the mouseclick then exit_h
  show control "bullet1" with visual effect wipe right
  wait 4 seconds
  if the mouseclick then exit_h
  show control "bullet2" with visual effect wipe right
  wait 4 seconds
  if the mouseclick then exit_h
  show control "bullet2a" with visual effect wipe right
  wait 7 seconds
  if the mouseclick then exit_h
  lock screen
  hide control "bullet1"
  hide control "bullet2"
  hide control "bullet2a"
  unlock screen
  show control "bullet3" with visual effect wipe right
  if the mouseclick then exit_h
  wait 6 seconds
  if the mouseclick then exit_h
  show control "bullet4" with visual effect wipe right
  show_window
  show group "miniscreen" with visual effect dissolve
  if the mouseclick then exit_h
  move btn "cursor" to the loc of btn "button" in 400 milliseconds
  click_sound
  set the hilitedbuttonname of group "icons" to "button"
  set the icon of btn "cursor" to 1282
  move btn "cursor" to the loc of btn "button example"
  if the mouseclick then exit_h
  click_sound
  show btn "button example"
  set the movespeed to 600
  repeat 7
    get the loc of btn "cursor"
    add 10 to item 1 of it
    add 10 to item 2 of it
    move btn "cursor" to it
    get the rect of btn "Button example"
    add 10 to item 3 of it
    add 10 to item 4 of it
    set the rect of btn "button example" to it
  end repeat
  click_sound
  select btn "button example"
  set the hilitedbuttonname of group "icons" to "pointer"
  set the icon of btn "cursor" to 301
  show control "bullet5" with visual effect wipe right
  wait 1 second
  if the mouseclick then exit_h
  move btn "cursor" to the loc of btn "button example" in 200 milliseconds
  click_sound
  wait 10 ticks
  click_sound
  show group "properties"
  show group "button properties"
  set the icon of btn "cursor" to 302
  move btn "cursor" to the loc of btn "behaviour marker" in 300 milliseconds
  if the mouseclick then exit_h
  click_sound
  lock screen
  set the menuhistory of btn "button properties" to 3
  hide group "button name group"
  show group "behaviour group"
  unlock screen
  wait 1 second
  if the mouseclick then exit_h
  move btn "cursor" to this loc of btn "script..."
  click_sound
  set the hilite of btn "script..." to true
  set the hilite of btn "script..." to false
  show group "script editor group"
  if the mouseclick then exit_h
  select text of fld "script text"
  lock screen
  hide control "bullet3"
  hide control "bullet4"
  hide control "bullet5"
  unlock screen
  show control "bullet6" with visual effect wipe right
  wait 2 seconds
  if the mouseclick then exit_h
  show control "bullet7" with visual effect wipe right
  wait 1 second
  if the mouseclick then exit_h
  type "on mouseUp"&cr
  wait 1 second
  if the mouseclick then exit_h
  show control "bullet8" with visual effect wipe right
  wait 1 second
  if the mouseclick then exit_h
  type "  hide me"&cr
  wait 1 second
  if the mouseclick then exit_h
  show control "bullet9" with visual effect wipe right
  wait 1 second
  if the mouseclick then exit_h
  type "  wait for 1 second"&cr
  wait 1 second
  if the mouseclick then exit_h
  show control "bullet10" with visual effect wipe right
  wait 1 second
  if the mouseclick then exit_h
  type "  beep"&cr
  wait 1 second
  if the mouseclick then exit_h
  show control "bullet11" with visual effect wipe right
  wait 1 second
  if the mouseclick then exit_h
  type "  show me"&cr
  wait 1 second
  if the mouseclick then exit_h
  show control "bullet12" with visual effect wipe right
  wait 1 second
  if the mouseclick then exit_h
  type "end mouseUp"
  wait 2 seconds
  if the mouseclick then exit_h
  lock screen
  hide control "bullet6"
  hide control "bullet7"
  hide control "bullet8"
  hide control "bullet9"
  hide control "bullet10"
  hide control "bullet11"
  hide control "bullet12"
  unlock screen
  show control "bullet13" with visual effect wipe right
  wait 1500 milliseconds
  if the mouseclick then exit_h
  move btn "cursor" to the loc of btn "script_OK" in 800 milliseconds
  click_sound
  set the hilite of btn "script_ok" to true
  set the hilite of btn "script_ok" to false
  hide group "script editor group"
  if the mouseclick then exit_h
  if the lookandfeel is not "motif" then move btn "cursor" to the loc of btn "close box marker" \
      else move btn "cursor" to 174,167
  click_sound
  hide group "button properties"
  set the icon of btn "cursor" to 301
  if the mouseclick then exit_h
  reset_cursor
  if the mouseclick then exit_h
  hide control "bullet13"
  show control "bullet14" with visual effect wipe right
  wait 700 milliseconds
  if the mouseclick then exit_h
  move btn "cursor" to the loc of btn "button example"
  click_sound
  set the hilite of btn "button example" to true
  wait 8 ticks
  set the hilite of btn "button example" to false
  hide btn "button example"
  wait 1 second
  beep
  show btn "button example"
  wait 200 milliseconds
  if the mouseclick then exit_h
  hide control "bullet14"
  reset_cursor
  wait 400 milliseconds
  if the mouseclick then exit_h
  show control "bullet15" with visual effect wipe right
  wait 5 seconds
  if the mouseclick then exit_h
  hide control "bullet15"
  show control "bullet16" with visual effect wipe right
  wait 2 seconds
  if the mouseclick then exit_h
  show control "bullet17" with visual effect wipe right
  move btn "cursor" to the topleft of btn "button example" in 400 milliseconds
  move btn "cursor" to the loc of btn "Button example" in 190 milliseconds
  repeat 3
    set the hilite of btn "button example" to true
    wait 8 ticks
    set the hilite of btn "Button example" to false
    wait 8 ticks
  end repeat
  show control "bullet18" with visual effect wipe right
  wait 1 second
  if the mouseclick then exit_h
  move btn "cursor" to the topleft of btn "button example"
  set the label of btn "Button example" to "Bye!"
  reset_cursor
  if the mouseclick then exit_h
  wait 400 milliseconds
  show control "bullet19"
  wait 1 second
  if the mouseclick then exit_h
  show control "minikeyboard"
  wait 700 milliseconds
  if the mouseclick then exit_h
  tap_sound
  show control "aink"
  wait 32 ticks
  if the mouseclick then exit_h
  hide control "aink"
  show fld "atyped"
  wait 30 ticks
  hide control "minikeyboard"
  wait 70 ticks
  if the mouseclick then exit_h
  hide control "atyped"
  lock screen
  hide control "bullet19"
  hide control "bullet18"
  hide control "bullet17"
  hide control "bullet16"
  unlock screen
  show control "bullet20" with visual effect wipe right
  wait 1200 milliseconds
  if the mouseclick then exit_h
  menu_choice "tools","message box..."
  show group "message box group"
  if the mouseclick then exit_h
  select text of fld "message_field"
  wait 1 second
  if the mouseclick then exit_h
  show control "bullet21" with visual effect wipe right
  wait 4 seconds
  if the mouseclick then exit_h
  type "set the location of button 1 to 75,100"
  wait 3 seconds
  if the mouseclick then exit_h
  repeat 2
    show group "distance_markers"
    wait 40 ticks
    hide group "distance_markers"
    wait 40 ticks
  end repeat
  show group "distance_markers"
  wait 1600 milliseconds
  if the mouseclick then exit_h
  put "" into fld "message_field"
  move btn "button example" to 255,282 in 400 milliseconds
  hide group "distance_markers"
  select text of fld "message_field"
  wait 1 second
  if the mouseclick then exit_h
  reset_cursor
  lock screen
  hide control "bullet21"
  hide control "bullet20"
  select text of fld "off screen"
  unlock screen
  if the mouseclick then exit_h
  wait 4 seconds
  visual effect dissolve to black
  visual effect dissolve to card
  go cd 10
end opencard
           ��  �            -  1  2  3  4  5  6  7  :  ;  <  A  B  C  D  E  M  �  I  J  u  }  L  �  	  �  	] dissection   	@          ~�  
�  �  �  O  I  E  �  �  �  �  �  �  � 
advanced1   	P0
on auto_update
  repeat with i = 1 to the num of controls
    if "autoloc" is in the customkeys of control i then set the loc of control i to the autoloc of control i
    if "autovisible" is in the customkeys of control i then set the visible of control i to the autovisible of control i
  end repeat
end auto_update

on preopencard
  auto_update
  set the icon of btn "elephant animation" to 2226
  field_settup
end preopencard

on opencard
  set the screenmouseloc to -10,-10
  set cursor to hand
  move control "title" to 504,27 in 1 second
  if the mouseclick then exit_h
  wait 1 second
  if the mouseclick then exit_h
  show fld "sub title" with visual effect wipe right with sound "swish.wav"
  wait 1 second
  if the mouseclick then exit_h
  show fld "header1" with visual effect wipe right with sound "swish.wav"
  show group "viewing area" with visual effect wipe right
  wait 1 second
  if the mouseclick then exit_h
  show group "bullet1g" with visual effect plain with sound "realthud.wav"
  show control "address book" with visual effect dissolve
  wait 2.3 seconds
  if the mouseclick then exit_h
  hide control "address book" with visual effect dissolve
  show group "bullet2g" with visual effect plain with sound "realthud.wav"
  show control "training package" with visual effect dissolve
  wait 2.3 seconds
  if the mouseclick then exit_h
  hide control "training package" with visual effect dissolve
  show group "bullet3g" with visual effect plain with sound "realthud.wav"
  show image "cgi application" with visual effect dissolve
  wait 2.3 seconds
  if the mouseclick then exit_h
  hide image "cgi application" with visual effect dissolve
  show group "bullet4g" with visual effect plain with sound "realthud.wav"
  
  set the rect of btn "button example" to 436,191,444,199
  show btn "cursor"
  wait 20 ticks
  move btn "cursor" to the bottomleft of btn "button example"
  move btn "cursor" relative 7,5
  select btn "button example"
  click_sound
  show btn "button example"
  repeat 7
    get the loc of btn "cursor"
    add 10 to item 1 of it
    add 10 to item 2 of it
    move btn "cursor" to it
    get the rect of btn "Button example"
    add 10 to item 3 of it
    add 10 to item 4 of it
    set the rect of btn "button example" to it
  end repeat
  click_sound
  wait 20 ticks
  if the mouseclick then exit_h
  click_sound
  set the rect of fld "field example" to 436,291,444,299
  move btn "cursor" to the loc of fld "field example"
  show fld "field example"
  repeat 6
    get the loc of btn "cursor"
    add 20 to item 1 of it
    add 8 to item 2 of it
    move btn "cursor" to it
    wait until the loc of btn "cursor" is it
    get the rect of fld "field example"
    add 20 to item 3 of it
    add 8 to item 4 of it
    set the rect of fld "field example" to it
  end repeat
  click_sound
  if the mouseclick then exit_h
  lock screen
  hide btn "button example"
  hide fld "field example"
  hide btn "cursor"
  unlock screen with visual effect dissolve
  if the mouseclick then exit_h
  
  wait 4 seconds
  if the mouseclick then exit_h
  show group "bullet5g" with visual effect plain with sound "realthud.wav"
  wait 4 seconds
  if the mouseclick then exit_h
  show group "bullet6g" with visual effect plain with sound "realthud.wav"
  wait 1 second
  if the mouseclick then exit_h
  test
  wait 4 seconds
  if the mouseclick then exit_h
  visual effect wipe down to black
  visual effect wipe up to card
  go next cd
end opencard


on test
  set the loc of btn "elephant animation" to 481,242
  set the icon of btn "elephant animation" to 2226
  wait 5 ticks
  set the icon of btn "elephant animation" to 2550
  lock screen
  show btn "elephant animation"
  unlock screen
  --set the loc of fld "dinner" to 256,305
  --wait until the mouseclick
  move btn "elephant animation" to ((item 1 of the loc btn "elephant animation"-10) & "," & (item 2 of the loc of fld"dinner"-53)) in 40 ticks
  set the icon of btn "elephant animation" to 2550
  wait 5 ticks
  set the icon of btn "elephant animation" to 2551
  wait 5 ticks
  set the icon of btn "elephant animation" to 2552
  wait 5 ticks
  set the icon of btn "elephant animation" to 2553
  wait 5 ticks
  get the formattedwidth of fld "dinner"
  move fld "dinner" relative ((21 - (it-136) div 2)&",0") in 1 second
  repeat 19
    delete last char of fld "dinner"
    eat_anim
  end repeat
  set the icon of btn "elephant animation" to 2554
  wait 5 ticks
  set the icon of btn "elephant animation" to 2553
  wait 5 ticks
  set the icon of btn "elephant animation" to 2552
  wait 5 ticks
  set the icon of btn "elephant animation" to 2551
  wait 5 ticks
  set the icon of btn "elephant animation" to 2550
  wait 5 ticks
  move btn "elephant animation" to (item 1 of the autoloc of btn "elephant animation"+4&","&item 2 of the autoloc of btn "elephant animation")
  set the icon of btn "elephant animation" to 2226
end test

on eat_anim
  local frame_list
  local frame_num, tTimer
  put "2554,2556,2558,2560,2562,2564,2566" into frame_list
  put the milliseconds into tTimer
  repeat
    put the milliseconds-tTimer into frame_num
    put round(frame_num/35) into frame_num
    if frame_num is 0 then put 1 into frame_num
    put item frame_num of frame_list into frame_num
    if frame_num is empty then exit repeat
    set the icon of btn "elephant animation" to frame_num
  end repeat
end eat_anim

on field_settup
  put "scripting language." into fld "dinner"
  get the formattedwidth of fld "first_field"
  set the width of fld "first_field" to it
  get the formattedheight of fld "first_field"
  set the height of fld "first_field" to it
  
  get the formattedwidth of fld "second_field"
  set the width of fld "second_field" to it
  get the formattedheight of fld "second_field"
  set the height of fld "second_field" to it
  
  get the formattedwidth of fld "dinner"
  set the width of fld "dinner" to it
  get the formattedheight of fld "dinner"
  set the height of fld "dinner" to it
  
  set the topleft of fld "first_field" to 33,286
  set the topleft of fld "second_field" to the bottomleft of fld "first_field"
  get the loc of fld "second_field"
  subtract 8 from item 2 of it
  subtract 6 from item 1 of it
  set the loc of fld "second_field" to it
  set the topleft of fld "dinner" to the topright of fld "second_field"
  get the loc of fld "dinner"
  subtract 8 from item 1 of it
  set the loc of fld "dinner" to it
end field_settup
           ~�  �  �  �  ~  �  �  �  �  �  �  	{  	  �  	�  	�  �  
5  
6  
7  
J  	�  ]  � 
advanced2   	P�
on auto_update
  repeat with i = 1 to the num of controls
    if "autoloc" is in the customkeys of control i then set the loc of control i to the autoloc of control i
    if "autovisible" is in the customkeys of control i then set the visible of control i to the autovisible of control i
  end repeat
end auto_update

on preopencard
  auto_update
  set the rect of group "man_group" to 536,172,611,274
  if the lookandfeel is "motif" then
    show image "motif bar"
    hide image "Windows bar"
  else
    hide image "motif bar"
    show image "windows bar"
  end if
end preopencard

on opencard
  move control "title" to 499,29 in 1 second
  if the mouseclick then exit_h
  wait 1 second
  if the mouseclick then exit_h
  show fld "sub title" with visual effect wipe right with sound "swish.wav"
  show group "viewing area" with visual effect wipe right
  wait 2 seconds
  if the mouseclick then exit_h
  show group "bullet1f" with visual effect plain with sound "realthud.wav"
  show fld "bullet3text"
  scroll_test2
  if the mouseclick then exit_h
  wait 1 second
  remove_elephant
  hide control "disgruntled elephant"
  wait 2 seconds
  if the mouseclick then exit_h
  show group "bullet2f" with visual effect plain with sound "realthud.wav"
  wait 2 seconds
  if the mouseclick then exit_h
  lock screen
  set the showname of btn "a button a" to true
  show btn "a button a"
  show group "cutout"
  show btn "cursor"
  select btn "a button a"
  set the style of btn "a button a" to "rectangle"
  set the hilitedbuttonname of group "bstyle" to "rectangle"
  unlock screen with visual effect dissolve
  wait 2 seconds
  if the mouseclick then exit_h
  move btn "cursor" to the loc of btn "tabbed" in 400 milliseconds
  click_sound
  set the hilitedbuttonname of group "bstyle" to "tabbed"
  set the style of btn "a button a" to "menu"
  set the showname of btn "a button a" to false
  if the mouseclick then exit_h
  lock screen
  hide group "cutout"
  hide btn "cursor"
  hide btn "a button a"
  unlock screen with visual effect dissolve
  wait 2 seconds
  if the mouseclick then exit_h
  show group "bullet3f" with visual effect plain with sound "realthud.wav"
  set the rect of btn "movement_example" to 418,98,562,169
  show btn "movement_example" with visual effect dissolve
  send "mouseup" to btn "movement_example"
  hide btn "movement_example" with visual effect dissolve
  if the mouseclick then exit_h
  wait 1 seconds
  show group "bullet4f" with visual effect plain with sound "realthud.wav"
  if the mouseclick then exit_h
  lock screen
  show group "alterable menubar group"
  show btn "cursor"
  set the icon of btn "cursor" to 301
  wait 1 second
  unlock screen with visual effect dissolve
  if the mouseclick then exit_h
  move btn "cursor" to the loc of btn "font" in 300 milliseconds
  click_sound
  select btn "font"
  wait 40 ticks
  hide btn "font"
  if the mouseclick then exit_h
  move btn "cursor" to the loc of btn "size" in 150 milliseconds
  click_sound
  select btn "size"
  wait 40 ticks
  hide btn "size"
  move btn "cursor" to the loc of btn "tools" in 150 milliseconds
  click_sound
  select btn "tools"
  wait 40 ticks
  set the label of btn "Tools2" to "Tools"
  show btn "tools2"
  select btn "tools2"
  repeat 10
    move btn "cursor" relative 6,0 in 10 milliseconds
    move btn "tools2" relative 6,0 in 10 milliseconds
  end repeat
  set the label of btn "tools2" to "My tools"
  if the mouseclick then exit_h
  set the width of btn "tools2" to the formattedwidth of btn "tools2"
  move btn "cursor" relative 0,30
  click_sound
  select empty
  set the icon of btn "cursor" to 302
  wait 1 second
  if the mouseclick then exit_h
  lock screen
  hide btn "cursor"
  hide group "alterable menubar group"
  unlock screen with visual effect dissolve
  if the mouseclick then exit_h
  wait 4 seconds
  if the mouseclick then exit_h
  visual effect wipe down to black
  visual effect wipe up to card
  go next cd
end opencard


on scroll_test2
  local frame_list, current_frame, start_time, this_control, next_control_frame, current_time, tcurrent
  put 0 into current_frame
  put the milliseconds into start_time
  put 0 into this_control
  put 147 into next_control_frame
  put "135,271,406,541,676,812,947,1082,1218,1353,1488,1624,1759,1894,2029,2165,2300" into frame_list
  repeat
    put (the milliseconds-start_time) into current_time
    put round((current_time*current_time)*0.00000625) into current_frame
    set the hscroll of fld "bullet3text" to current_frame
    if current_frame > next_control_frame then
      if this_control is not 0 then hide control this_control of group "scrollingobjects"
      add 1 to this_control
      show control this_control of group "scrollingobjects"
      -- at 486,240
      put item (this_control+1) of frame_list into next_control_frame
      if next_control_frame is empty then put 4000 into next_control_frame
    end if
    if current_time > 22000 then exit repeat
  end repeat
end scroll_test2

on remove_elephant
  --  move image "arm" to 320,480 in 350 milliseconds
  --  move group "bullet15d" to 308,404 in 250 milliseconds
  --  move image "arm" to 320,460 in 300 milliseconds
  --  move group "bullet15d" to 308,394 in 150 milliseconds
  --  move image "arm" to 320,532 in 500 milliseconds
  -- if the mouseclick then exit_h
  show group "viewing area"
  show image "elephant"
  show image "broom"
  -- wait 2 seconds
  --put "481,242       674,252"
  
  move image "broom" relative -45,0 in 210 milliseconds
  move image "elephant" relative -10,0 in 90 milliseconds
  move image "broom" relative -18,0 in 90 milliseconds
  move image "elephant" relative -5,0 in 90 milliseconds
  move image "broom" relative -22,0 in 120 milliseconds
  move image "elephant" relative -25,0 in 90 milliseconds
  lock screen
  show image "disgruntled elephant" at the loc of image "elephant"
  hide image "elephant"
  unlock screen
  move image "disgruntled elephant" relative 10,0 in 160 milliseconds
  move image "broom" relative -20,0 in 90 milliseconds
  move image "disgruntled elephant" relative -30,0 in 100 milliseconds
  move image "broom" relative -40,0 in 115 milliseconds
  move image "disgruntled elephant" relative -50,0 in 130 milliseconds
  move image "broom" relative -20,0 in 80 milliseconds
  move image "broom" relative -20,0 in 70 milliseconds
  move image "disgruntled elephant" relative -120,0 in 105 milliseconds
  move image "plank" to 598,220 in 50 ticks
  wait 45 ticks
  set the rect of group "man_group" to 536,172,621,274
  show image "head1"
  wait 35 ticks
  show image "head2"
  wait 35 ticks
  lock screen
  hide image "head2"
  hide image "head1"
  unlock screen
  set the rect of group "man_group" to 536,172,611,274
  move image "plank" relative 30,0 in 100 milliseconds
  move control "Broom" relative 200,0 in 150 milliseconds
end remove_elephant
           ~�  �  �  ~  �  �  �  �  �  	  �  
:  �  	�  	�  
/  
;  
O  
S  	�  
}  � 
advanced3   	P�local links_loc, mname

on auto_update
  repeat with i = 1 to the num of controls
    if "autoloc" is in the customkeys of control i then set the loc of control i to the autoloc of control i
    if "autovisible" is in the customkeys of control i then set the visible of control i to the autovisible of control i
  end repeat
end auto_update

on preopencard
  auto_update
  if the platform is "MacOS"
  then put "demo/introan.mov" into mname
  else put "demo/introan.avi" into mname
  set the dontrefresh of the templateVideoclip to true
  prepare videoClip mname at 486,188
  select word 10 of fld "links"
  get the selectedloc
  add 15 to item 1 of it
  add 10 to item 2 of it
  put it into links_loc
  select empty
end preopencard

on opencard
  move control "title" to 474,29 in 1 second
  if the mouseclick then exit_h
  wait 1 second
  if the mouseclick then exit_h
  show fld "sub title" with visual effect wipe right with sound "swish.wav"
  show group "viewing area" with visual effect wipe right
  wait 1 second
  if the mouseclick then exit_h
  show fld "header1" with visual effect wipe right with sound "swish.wav"
  wait 2 seconds
  if the mouseclick then exit_h
  show control "bullet1h" with visual effect plain with sound "realthud.wav"
  
  show image "window1" with visual effect dissolve very fast
  lock screen
  hide image "window1"
  show image "window2"
  unlock screen with visual effect dissolve very fast
  
  lock screen
  hide image "window2"
  show image "window3"
  unlock screen with visual effect dissolve very fast
  
  hide image "window3" with visual effect dissolve very fast
  if the mouseclick then exit_h
  hide control "bullet1h"
  show control "bullet2h" with visual effect plain with sound "realthud.wav"
  wait 1 second
  lock screen
  show image "video"
  show image "black"
  show image "off"
  show image "stop"
  show btn "Cursor" at 518,370
  unlock screen with visual effect dissolve
  wait 1 second
  move btn "cursor" to 589,331 in 450 milliseconds
  click_sound
  hide image "off"
  show image "on"
  show image "presents" with visual effect stretch from center fast
  wait 10 ticks
  move btn "cursor" to 589,305 in 400 milliseconds
  click_sound
  hide image "stop"
  show image "play"
  play videoClip mname at 486,188
  move btn "cursor" to 518,370 in 300 milliseconds
  wait 5 seconds
  move btn "Cursor" to 569,306 in 1 second
  hide image "play"
  show image "stop"
  play stop videoclip mname
  wait 20 ticks
  move btn "Cursor" to 569,331 in 1 second
  click_sound
  hide image "on"
  show image "off"
  hide image "presents"
  move btn "Cursor" to 518,370 in 200 milliseconds
  lock screen
  hide image "video"
  hide image "black"
  hide image "stop"
  hide image "on"
  hide image "off"
  hide image "play"
  hide btn "cursor"
  unlock screen with visual effect dissolve
  if the mouseclick then exit_h
  hide control "bullet2h"
  show control "bullet3h" with visual effect plain with sound "realthud.wav"
  wait 1 second
  if the mouseclick then exit_h
  lock screen
  show fld "links"
  show btn "cursor"
  unlock screen with visual effect dissolve
  wait 4 seconds
  if the mouseclick then exit_h
  move btn "cursor" to links_loc in 350 milliseconds
  click_sound
  set the textcolor of word 10 of fld "links" to "red"
  wait 50 ticks
  if the mouseclick then exit_h
  set the textcolor of word 10 of fld "links" to "blue"
  wait 30 ticks
  if the mouseclick then exit_h
  show control "links_info"
  wait 3 seconds
  if the mouseclick then exit_h
  lock screen
  hide btn "cursor"
  hide control "links_info"
  hide control "links"
  unlock screen with visual effect dissolve
  hide control "bullet3h"
  if the mouseclick then exit_h
  show fld "header2" with visual effect wipe right with sound "swish.wav"
  wait 2 seconds
  if the mouseclick then exit_h
  show control "bullet4h" with visual effect plain with sound "realthud.wav"
  show image "array" with visual effect dissolve
  wait 6 seconds
  if the mouseclick then exit_h
  hide image "array" with visual effect dissolve
  hide control "bullet4h"
  if the mouseclick then exit_h
  show control "bullet5h" with visual effect plain with sound "realthud.wav"
  show image "customproperties" with visual effect dissolve
  wait 4 seconds
  if the mouseclick then exit_h
  hide image "customproperties" with visual effect dissolve
  hide control "bullet5h"
  if the mouseclick then exit_h
  show control "bullet6h" with visual effect plain with sound "realthud.wav"
  if the mouseclick then exit_h
  
  show group "send_example" with visual effect dissolve
  show btn "cursor" at the autoloc of btn "cursor"
  wait 1 second
  if the mouseclick then exit_h
  move btn "cursor" to the loc of btn "other button" in 1 second
  click_sound
  set the hilite of btn "other button" to true
  wait 8 ticks
  set the hilite of btn "other button" to false
  if the mouseclick then exit_h
  
  time_5_seconds
  
  if the mouseclick then exit_h
  hide btn "other button" with visual effect shrink to center slow
  
  wait 1 second
  if the mouseclick then exit_h
  lock screen
  hide group "clock_group"
  hide group "send_example"
  hide btn "cursor"
  unlock screen with visual effect dissolve
  
  if the mouseclick then exit_h
  hide control "bullet6h"
  show control "bullet7h" with visual effect plain with sound "realthud.wav"
  wait 2 seconds
  if the mouseclick then exit_h
  show group "string_group" with visual effect dissolve
  wait 1.4 seconds
  if the mouseclick then exit_h
  move image "atext.gif" to 488,238 in 1 second
  hide image "stringof.gif"
  wait 8 ticks
  show image "stringof.gif"
  wait 20 ticks
  if the mouseclick then exit_h
  move image "stringof.gif" relative 0,25 in 45 ticks
  wait 1 second
  if the mouseclick then exit_h
  hide group "string_group" with visual effect dissolve
  hide control "bullet7h"
  if the mouseclick then exit_h
  show control "bullet8h" with visual effect plain with sound "realthud.wav"
  show btn "internet_application" with visual effect dissolve
  wait 4 seconds
  if the mouseclick then exit_h
  hide btn "internet_application" with visual effect dissolve
  hide control "bullet8h"
  if the mouseclick then exit_h
  wait 4 seconds
  if the mouseclick then exit_h
  visual effect wipe down to black
  visual effect wipe up to card
  go cd 4
end opencard

on clock_test2
  -- The trick is to use the sine of the angle for the x coordinate, and the
  -- cosine for the y coordinate.  Here's a sequence that will make a
  -- graphic draw a 45 degree angle line:
  local treturnvalue, t, tframe, thisframe
  put the playloudness into treturnvalue
  repeat with i = 29 down to 25
    put round((i/60)*360) / 360 * 2 * pi into t -- convert 45 degrees to radians
    set the points of grc "clock_hand" to 461,250 & cr & 461 + round(57 * sin(t)), 250 + round(57 * cos(t))
    play "tock.wav"
    get the playloudness
    subtract 22 from it
    if it > 0 then set the playloudness to it
    
    put the ticks into tframe
    repeat
      put the ticks-tframe into thisframe
      put 30-thisframe into thisframe
      if thisframe < -30 then exit repeat
      put round((thisFrame/60)*360) / 360 * 2 * pi into t -- convert 45 degrees to radians
      set the points of grc "small_hand" to 461,222 & cr & 461 + round(11 * sin(t)), 222 + round(11 * cos(t))
    end repeat
  end repeat
  set the points of grc "small_hand" to the orig_points of grc "small_hand"
  set the playloudness to treturnvalue
end clock_test2

on time_5_seconds
  set the points of grc "small_hand" to the orig_points of grc "small_hand"
  set the points of grc "clock_hand" to the orig_points of grc "clock_hand"
  show group "clock_group" with visual effect dissolve very fast
  wait 30 ticks
  if the mouseclick then exit_h
  move image "millenium clock button.gif" relative 0,7 in 70 milliseconds
  move image "millenium clock button.gif" relative 0,-7 in 70 milliseconds
  if the mouseclick then exit_h
  clock_test2
  wait 30 ticks
  if the mouseclick then exit_h
  hide group "clock_group" with visual effect dissolve very fast
end time_5_seconds
           ~�  �  �  ~  �        
            �  	  	�  
Q  
u  
w  
�  �  
�  
�  
�  
�  
�  �  
�  �  �  �  �  �  
v  �  	� advancedteach1   	P*�
on auto_update
  repeat with i = 1 to the num of controls
    if "autoloc" is in the customkeys of control i then set the loc of control i to the autoloc of control i
    if "autovisible" is in the customkeys of control i then set the visible of control i to the autovisible of control i
  end repeat
end auto_update

on preopencard
  auto_update
  reset_miniscreen
  set the movespeed to 300
end preopencard

on opencard
  set the screenmouseloc to -10,-10
  set cursor to hand
  move control "title" to 487,28 in 1 second
  if the mouseclick then exit_h
  show fld "bullet1" with visual effect wipe right
  if the mouseclick then exit_h
  wait 7 seconds
  if the mouseclick then exit_h
  show fld "bullet2" with visual effect wipe right
  if the mouseclick then exit_h
  wait 8 seconds
  if the mouseclick then exit_h
  lock screen
  hide fld "bullet1"
  hide fld "bullet2"
  unlock screen
  show fld "bullet3" with visual effect wipe right
  if the mouseclick then exit_h
  wait 7 seconds
  if the mouseclick then exit_h
  show fld "bullet4" with visual effect wipe right
  if the mouseclick then exit_h
  wait 5 seconds
  if the mouseclick then exit_h
  lock screen
  hide fld "bullet3"
  hide fld "bullet4"
  unlock screen
  show fld "bullet5" with visual effect wipe right
  if the mouseclick then exit_h
  
  show group "miniscreen" with visual effect dissolve very fast
  wait 600 milliseconds
  if the mouseclick then exit_h
  menu_choice "file","new stack"
  show_window
  reset_cursor
  
  if the mouseclick then exit_h
  show fld "bullet6" with visual effect wipe right
  wait 3.5 seconds
  if the mouseclick then exit_h
  repeat 3
    show grc "card_marker"
    wait 8 ticks
    hide grc "card_marker"
    wait 8 ticks
  end repeat
  show grc "card_marker"
  wait 4 seconds
  if the mouseclick then exit_h
  hide grc "card_marker"
  lock screen
  hide control "bullet5"
  hide control "bullet6"
  unlock screen
  if the mouseclick then exit_h
  show control "bullet7" with visual effect wipe right
  wait 3 seconds
  if the mouseclick then exit_h
  show control "bullet8" with visual effect wipe right
  wait 2 seconds
  if the mouseclick then exit_h
  
  show control "fieldtooltip"
  repeat 2
    wait 1 ticks
    hide control "fieldtooltip"
    wait 1 ticks
    show control "fieldtooltip"
  end repeat
  move btn "cursor" to the loc of btn "field" in 300 milliseconds
  click_sound
  if the mouseclick then exit_h
  set the hilitedbuttonname of group "icons" to "field"
  set the icon of btn "cursor" to 1282
  hide control "fieldtooltip"
  move btn "cursor" to the loc of fld "field example"
  if the mouseclick then exit_h
  click_sound
  show fld "field example"
  repeat 8
    get the loc of btn "cursor"
    add 20 to item 1 of it
    add 8 to item 2 of it
    move btn "cursor" to it
    wait until the loc of btn "cursor" is it
    get the rect of fld "field example"
    add 20 to item 3 of it
    add 8 to item 4 of it
    set the rect of fld "field example" to it
  end repeat
  click_sound
  if the mouseclick then exit_h
  
  show control "bullet9" with visual effect wipe right
  wait 2 seconds
  if the mouseclick then exit_h
  move btn "cursor" to the loc of fld "field example2"
  if the mouseclick then exit_h
  click_sound
  show fld "field example2"
  repeat 8
    get the loc of btn "cursor"
    add 20 to item 1 of it
    add 3 to item 2 of it
    move btn "cursor" to it
    wait until the loc of btn "cursor" is it
    get the rect of fld "field example2"
    add 20 to item 3 of it
    add 3 to item 4 of it
    set the rect of fld "field example2" to it
  end repeat
  click_sound
  if the mouseclick then exit_h
  
  lock screen
  hide fld "bullet9"
  hide fld "bullet8"
  hide fld "bullet7"
  unlock screen
  show fld "bullet10" with visual effect wipe right
  wait 1 second
  set the rect of btn "button example" to 415,293,417,295
  if the mouseclick then exit_h
  
  show control "buttontooltip"
  repeat 2
    wait 10 ticks
    hide control "buttontooltip"
    wait 10 ticks
    show control "buttontooltip"
  end repeat
  move btn "cursor" to the loc of btn "button" in 400 milliseconds
  click_sound
  if the mouseclick then exit_h
  set the hilitedbuttonname of group "icons" to "button"
  set the icon of btn "cursor" to 1282
  hide control "buttontooltip"
  move btn "cursor" to the loc of btn "button example"
  click_sound
  if the mouseclick then exit_h
  show btn "button example"
  repeat 7
    get the loc of btn "cursor"
    add 15 to item 1 of it
    add 5 to item 2 of it
    move btn "cursor" to it
    get the rect of btn "Button example"
    add 15 to item 3 of it
    add 5 to item 4 of it
    set the rect of btn "button example" to it
  end repeat
  click_sound
  wait 1 second
  if the mouseclick then exit_h
  hide control "bullet10"
  show control "bullet11" with visual effect wipe right
  wait 2 seconds
  if the mouseclick then exit_h
  show control "bullet12" with visual effect wipe right
  wait 4 seconds
  if the mouseclick then exit_h
  move btn "cursor" to the loc of btn "pointer" in 250 milliseconds
  click_sound
  set the hilitedbuttonname of group "icons" to "pointer"
  set the icon of btn "cursor" to 301
  move btn "cursor" to 393,207 in 300 milliseconds
  click_sound
  if the mouseclick then exit_h
  move btn "cursor" relative 22,10 in 200 milliseconds
  select fld "field example"
  move btn "cursor" relative 10,39 in 200 milliseconds
  set the selected of fld "field example2" to true
  move btn "cursor" relative 5,17 in 100 milliseconds
  if the mouseclick then exit_h
  click_sound
  move btn "cursor" to the loc of fld "field example" in 300 milliseconds
  click_sound
  show group "duplicate fields"
  select fld "field example label"
  if the mouseclick then exit_h
  set the selected of fld "field example2 label" to true
  repeat 9
    move btn "cursor" relative -20,0 in 50 milliseconds
    move group "duplicate fields" relative -20,0 in 50 milliseconds
  end repeat
  reset_cursor
  wait 30 ticks
  if the mouseclick then exit_h
  move btn "Cursor" to the loc of fld "field example label"
  click_sound
  select text of fld "field example label"
  type "Enter the message you want displayed:"
  move btn "Cursor" to the loc of fld "field example2 label"
  click_sound
  if the mouseclick then exit_h
  select text of fld "field example2 label"
  move btn "Cursor" relative 5,30 in 100 milliseconds
  type "Seconds delay:"
  click at 10,10 --get rid of the selected text
  lock screen
  hide control "bullet12"
  hide control "bullet11"
  unlock screen
  if the mouseclick then exit_h
  show control "bullet13" with visual effect wipe right
  wait 6 seconds
  if the mouseclick then exit_h
  move btn "cursor" to the loc of btn "pointer" in 300 milliseconds
  click_sound
  if the mouseclick then exit_h
  set the hilitedbuttonname of group "icons" to "pointer"
  set the icon of btn "cursor" to 301
  move btn "cursor" to the loc of fld "field example label" in 300 milliseconds
  click_sound
  select fld "field example label"
  wait 10 ticks
  click_sound
  select text of fld "off_screen"
  if the mouseclick then exit_h
  show group "properties"
  show group "field properties"
  set the icon of btn "cursor" to 302
  wait 7 seconds
  if the mouseclick then exit_h
  expand_miniscreen
  move btn "cursor" to the loc of btn "show as label" in 400 milliseconds
  click_sound
  set the hilite of btn "show as label" to true
  wait 10 ticks
  set the hilite of btn "show as label" to false
  set the showborder of fld "field example label" to false
  wait 40 ticks
  move btn "cursor" to the loc of fld "field example2 label" in 350 milliseconds
  set the icon of btn "cursor" to 301
  click_sound
  if the mouseclick then exit_h
  select fld "field example2 label"
  move btn "cursor" to the loc of btn "show as label" in 300 milliseconds
  click_sound
  set the hilite of btn "show as label" to true
  wait 10 ticks
  set the hilite of btn "show as label" to false
  set the showborder of fld "field example2 label" to false
  wait 50 ticks
  if the mouseclick then exit_h
  contract_miniscreen
  if the mouseclick then exit_h
  move btn "cursor" to the loc of btn "close box marker" in 350 milliseconds
  if the mouseclick then exit_h
  click_sound
  hide group "field properties"
  hide group "properties"
  set the icon of btn "cursor" to 301
  hide control "Bullet13"
  show control "bullet14" with visual effect wipe right
  wait 5 seconds
  if the mouseclick then exit_h
  move btn "cursor" to the loc of fld "field example" in 300 milliseconds
  click_sound
  select fld "field example"
  wait 10 ticks
  if the mouseclick then exit_h
  click_sound
  show group "properties"
  hide group "field_appearance_group"
  set the menuhistory of btn "field_tab" to 1
  show group "field_name_group"
  show group "field properties"
  wait 3 seconds
  if the mouseclick then exit_h
  set the icon of btn "cursor" to 302
  move btn "cursor" to the loc of fld "field name" in 300 milliseconds
  click_sound
  select text of fld "field name"
  if the mouseclick then exit_h
  type "Message"
  move btn "cursor" to the loc of btn "close box marker" in 350 milliseconds
  click_sound
  hide group "properties"
  set the icon of btn "cursor" to 301
  move btn "cursor" to the loc of fld "field example2" in 350 milliseconds
  click_sound
  if the mouseclick then exit_h
  select fld "field example2"
  wait 10 ticks
  click_sound
  put empty into fld "field name"
  show group "properties"
  set the icon of btn "cursor" to 302
  wait 1.2 seconds
  if the mouseclick then exit_h
  move btn "cursor" to the loc of fld "field name" in 300 milliseconds
  click_sound
  select text of fld "field name"
  type "Timer"
  move btn "cursor" to the loc of btn "close box marker" in 300 milliseconds
  click_sound
  if the mouseclick then exit_h
  hide group "properties"
  set the icon of btn "cursor" to 301
  move btn "cursor" to the loc of btn "button example" in 400 milliseconds
  click_sound
  select btn "button example"
  wait 10 ticks
  click_sound
  if the mouseclick then exit_h
  hide group "field properties"
  show group "button properties"
  show group "properties"
  wait 3 seconds
  if the mouseclick then exit_h
  move btn "cursor" to the loc of fld "name" of group "button properties"
  click_sound
  wait 10 ticks
  click_sound
  if the mouseclick then exit_h
  select text of fld "name" of group "button properties"
  type "Do it"
  if the mouseclick then exit_h
  set the label of btn "button example" to "Do it"
  move btn "cursor" to the loc of btn "close box marker" in 350 milliseconds
  click_sound
  hide group "properties"
  wait 1 second
  if the mouseclick then exit_h
  reset_cursor
  if the mouseclick then exit_h
  wait 4 seconds
  if the mouseclick then exit_h
  visual effect wipe down to black
  visual effect wipe up to card
  go next cd
end opencard
           ~�  �  
�  
�  	  
�  
�  
�  
�  �  
�  
�  
�  
�  
�  
�  
�  
�  
�  �  �  
� advancedteach2   	P�on preopenCard
  auto_update
  reset_miniscreen
  set the hilitedbuttonname of group "icons" to "browse"
  set the icon of btn "Cursor" to 302
  set the rect of fld "field example" to 415,187,577,253
  set the rect of fld "field example2" to 415,256,576,282
  set the rect of fld "field example label" to 235,187,397,253
  set the rect of fld "field example2 label" to 235,256,396,282
  set the rect of btn "button example" to 415,293,522,330
  show btn "button example"
  put empty into fld "script text"
  set the label of btn "button example" to "Do it"
  show fld "field example"
  show fld "field example2"
  show fld "field example label"
  show fld "field example2 label"
  show group "duplicate fields"
  show_window
  put "Enter the message you want displayed:" into fld "field example label"
  put "Seconds delay:" into fld "field example2 label"
  set the showborder of fld "field example label" to false
  set the showborder of fld "field example2 label" to false
end preopenCard

on auto_update
  repeat with i = 1 to the num of controls
    if "autoloc" is in the customkeys of control i then set the loc of control i to the autoloc of control i
    if "autovisible" is in the customkeys of control i then set the visible of control i to the autovisible of control i
  end repeat
end auto_update

on opencard
  move control "title" to 565,28 in 1 second
  if the mouseclick then exit_h
  wait 1 second
  show fld "bullet1" with visual effect wipe right
  if the mouseclick then exit_h
  wait 4 seconds
  hide fld "bullet1"
  show fld "Bullet2" with visual effect wipe right
  if the mouseclick then exit_h
  show group "miniscreen" with visual effect dissolve
  wait 6 seconds
  if the mouseclick then exit_h
  show fld "bullet3" with visual effect wipe right
  wait 3 seconds
  if the mouseclick then exit_h
  move btn "cursor" to the loc of btn "pointer" in 250 milliseconds
  click_sound
  set the hilitedbuttonname of group "icons" to "pointer"
  set the icon of btn "cursor" to 301
  if the mouseclick then exit_h
  move btn "cursor" to the loc of btn "button example" in 200 milliseconds
  click_sound
  select btn "button example"
  wait 10 ticks
  click_sound
  set the menuhistory of btn "button properties" to 1
  put "Do it" into fld "name"
  if the mouseclick then exit_h
  show group "properties"
  show group "button properties"
  set the icon of btn "cursor" to 302
  move btn "cursor" to the loc of btn "behaviour marker" in 300 milliseconds
  if the mouseclick then exit_h
  click_sound
  lock screen
  set the menuhistory of btn "button properties" to 3
  hide group "button name group"
  show group "behaviour group"
  unlock screen
  if the mouseclick then exit_h
  wait 1 second
  if the mouseclick then exit_h
  move btn "cursor" to this loc of btn "script..."
  click_sound
  set the hilite of btn "script..." to true
  set the hilite of btn "script..." to false
  show group "script editor group"
  if the mouseclick then exit_h
  select text of fld "script text"
  if the mouseclick then exit_h
  lock screen
  hide fld "bullet2"
  hide fld "bullet3"
  unlock screen
  show fld "bullet4" with visual effect wipe right
  wait 5 seconds
  if the mouseclick then exit_h
  type "on mouseUp"&cr
  wait 1 second
  if the mouseclick then exit_h
  show fld "Bullet5" with visual effect wipe right
  wait 5 seconds
  if the mouseclick then exit_h
  type "  put field "& quote & "Message" & quote & " into myMessageVariable"&cr
  wait 1 second
  if the mouseclick then exit_h
  lock screen
  hide fld "bullet4"
  hide fld "bullet5"
  unlock screen
  show fld "bullet6" with visual effect wipe right
  wait 5 seconds
  if the mouseclick then exit_h
  type "  put field " & quote & "Timer" & quote & " into myTimerVariable"&cr
  wait 1 second
  if the mouseclick then exit_h
  show fld "bullet7" with visual effect wipe right
  wait 5 seconds
  if the mouseclick then exit_h
  type "  send "&quote&"deliverTheMessage"&quote&" to me in myTimerVariable seconds"&cr
  wait 1 second
  if the mouseclick then exit_h
  lock screen
  hide fld "bullet7"
  hide fld "bullet6"
  unlock screen
  show fld "Bullet8" with visual effect wipe right
  wait 3 seconds
  if the mouseclick then exit_h
  type "end mouseUp"&cr
  wait 1 second
  if the mouseclick then exit_h
  hide fld "bullet8"
  show fld "bullet9" with visual effect wipe right
  wait 4 seconds
  if the mouseclick then exit_h
  type cr&"on deliverTheMessage"&cr
  move btn "cursor" relative 40,40 in 40 milliseconds
  show fld "bullet10" with visual effect wipe right
  wait 4 seconds
  if the mouseclick then exit_h
  type "  answer myMessageVariable"&cr
  wait 1 second
  if the mouseclick then exit_h
  type "end deliverTheMessage"
  wait 1 second
  if the mouseclick then exit_h
  show fld "bullet11" with visual effect wipe right
  wait 4 seconds
  if the mouseclick then exit_h
  select before line 1 of fld "script text"
  type "  local myMessageVariable"&cr&cr
  wait 1 second
  if the mouseclick then exit_h
  lock screen
  hide fld "bullet11"
  hide fld "bullet10"
  hide fld "bullet9"
  unlock screen
  show fld "bullet12" with visual effect wipe right
  
  if the mouseclick then exit_h
  move btn "cursor" to the loc of btn "script_OK" in 800 milliseconds
  click_sound
  set the hilite of btn "script_ok" to true
  set the hilite of btn "script_ok" to false
  hide group "script editor group"
  if the mouseclick then exit_h
  if the lookandfeel is not "motif" then move btn "cursor" to the loc of btn "close box marker" \
    else move btn "cursor" to 174,167
click_sound
hide group "button properties"
if the mouseclick then exit_h
set the icon of btn "cursor" to 301
reset_cursor

if the mouseclick then exit_h
hide fld "bullet12"
show fld "bullet13" with visual effect wipe right
wait 700 milliseconds
if the mouseclick then exit_h
move btn "Cursor" to the loc of fld "Field example"
click_sound
select text of fld "field example"
type "This is a test..."
if the mouseclick then exit_h
move btn "cursor" to the loc of fld "field example2"
click_sound
select text of fld "field example2"
type "5"
wait 30 ticks
if the mouseclick then exit_h
move btn "cursor" to the loc of btn "button example"
click_sound
set the hilite of btn "button example" to true
wait 8 ticks
set the hilite of btn "button example" to false
wait 5 seconds
select text of fld "off_screen"
show group "answer_group"
wait 2 seconds
if the mouseclick then exit_h
show fld "bullet14" with visual effect wipe right
if the mouseclick then exit_h
wait 5 seconds
if the mouseclick then exit_h
visual effect wipe down to black
visual effect wipe up to card
go next cd
end opencard
           ~�  �  	  �  
�  
�  
�  
�  
�  
�  
�  
�  
�  
�  
�  
�  
�  
�  
�  �  �  
� advancedteach3   	P/�on preopenCard
  reset_miniscreen
  send "preopencard" to prev cd
end preopenCard

on auto_update
  repeat with i = 1 to the num of controls
    if "autoloc" is in the customkeys of control i then set the loc of control i to the autoloc of control i
    if "autovisible" is in the customkeys of control i then set the visible of control i to the autovisible of control i
  end repeat
end auto_update

on opencard
  move control "title" to 475,29 in 1 second
  if the mouseclick then exit_h
  wait 1 second
  if the mouseclick then exit_h
  show fld "bullet1" with visual effect wipe right
  wait 7 seconds
  if the mouseclick then exit_h
  hide fld "bullet1"
  show fld "bullet2" with visual effect wipe right
  wait 2 seconds
  if the mouseclick then exit_h
  show group "miniscreen" with visual effect dissolve
  menu_choice "edit","create card"
  if the mouseclick then exit_h
  lock screen
  hide fld "field example"
  hide fld "field example2"
  hide fld "field example label"
  hide fld "field example2 label"
  hide btn "button example"
  unlock screen
  hide fld "bullet2"
  if the mouseclick then exit_h
  
  
  import_backgrounds
  draw_banner
  postman
  group_grcs
  
  if the mouseclick then exit_h
  lock screen
  hide fld "bullet5"
  hide fld "bullet6"
  unlock screen
  show fld "bullet10" with visual effect wipe right
  wait 5 seconds
  if the mouseclick then exit_h
  move btn "cursor" to the loc of btn "pointer" in 150 milliseconds
  click_sound
  set the hilitedbuttonname of group "icons" to "pointer"
  set the icon of btn "cursor" to 301
  move btn "cursor" to 437,346 in 200 milliseconds
  if the mouseclick then exit_h
  click_sound
  wait 10 ticks
  click_sound
  select image 1 of group "foreground.gif"
  show group "properties"
  put "foreground.gif" into fld "image_name"
  put "2" into fld "image_layer"
  if the mouseclick then exit_h
  show group "image_properties"
  set the icon of btn "cursor" to 302
  wait 2 seconds
  if the mouseclick then exit_h
  move btn "cursor" to the loc of fld "image_layer"
  click_sound
  wait 1 ticks
  click_sound
  select text of fld "image_layer"
  type "4"
  if the mouseclick then exit_h
  move btn "cursor" to the loc of btn "close box marker" in 400 milliseconds
  if the mouseclick then exit_h
  click_sound
  hide group "properties"
  if the mouseclick then exit_h
  lock screen
  select btn "fore_foreground"
  show btn "fore_foreground"
  unlock screen
  wait 2 seconds
  if the mouseclick then exit_h
  hide fld "bullet10"
  --thats them layered correctly
  
  show fld "bullet11" with visual effect wipe right
  wait 5 seconds
  if the mouseclick then exit_h
  menu_choice "tools","message box..."
  show group "message box group"
  select text of fld "message_field"
  show fld "bullet12" with visual effect wipe right
  wait 3 seconds
  if the mouseclick then exit_h
  type "the location of the selectedobject"
  wait 2 seconds
  if the mouseclick then exit_h
  put "146,105" into fld "message_field"
  select text of fld "message_field"
  wait 4 seconds
  if the mouseclick then exit_h
  lock screen
  hide fld "bullet11"
  hide fld "bullet12"
  unlock screen
  show fld "bullet13" with visual effect wipe right
  wait 4 seconds
  if the mouseclick then exit_h
  put empty into fld "message_field"
  select text of fld "message_field"
  type "set the name of the selobj to " & quote & "van"&quote
  wait 4 seconds
  if the mouseclick then exit_h
  put empty into fld "message_field"
  select text of fld "message_field"
  hide field "bullet13"
  show fld "bullet14" with visual effect wipe right
  wait 5 seconds
  if the mouseclick then exit_h
  show group "script editor group"
  select text of fld "script text"
  hide fld "bullet14"
  show fld "bullet15" with visual effect wipe right
  wait 9 seconds
  if the mouseclick then exit_h
  type "on preOpencard"&cr
  wait 1 second
  if the mouseclick then exit_h
  hide fld "bullet15"
  show fld "bullet16" with visual effect wipe right
  wait 5 seconds
  if the mouseclick then exit_h
  type "  set the location of group " & quote & "van" & quote & " to -280,105"
  wait 1 second
  if the mouseclick then exit_h
  type cr&"end preOpencard"&cr
  wait 2 seconds
  if the mouseclick then exit_h
  show fld "bullet17" with visual effect wipe right
  wait 3 seconds
  if the mouseclick then exit_h
  type cr&"on openCard"&cr
  wait 2 seconds
  if the mouseclick then exit_h
  lock screen
  hide fld "bullet16"
  hide fld "bullet17"
  unlock screen
  if the mouseclick then exit_h
  show fld "bullet18" with visual effect wipe right
  wait 7 seconds
  if the mouseclick then exit_h
  type "  move group " & quote & "van" & quote & " to 750,105 in 15 seconds"&cr
  wait 2 seconds
  if the mouseclick then exit_h
  show fld "bullet19" with visual effect wipe right
  wait 4 seconds
  if the mouseclick then exit_h
  type "end openCard"
  move btn "cursor" to the loc of btn "script_ok"
  if the mouseclick then exit_h
  click_sound
  wait 10 ticks
  click_sound
  hide group "script editor group"
  if the mouseclick then exit_h
  lock screen
  hide fld "Bullet18"
  hide fld "bullet19"
  unlock screen
  if the mouseclick then exit_h
  show fld "bullet20" with visual effect wipe right
  wait 5 seconds
  if the mouseclick then exit_h
  move btn "cursor" to the loc fld "message_field"
  click_sound
  select text of fld "message_field"
  move btn "cursor" relative 0,-20 in 50 milliseconds
  type "edit the script of button " & quote & "Do it" & quote & " of the previous card"
  wait 1 second
  if the mouseclick then exit_h
  put empty into fld "message_field"
  put the old_script of this cd into fld "script text"
  show group "script editor group"
  hide fld "bullet20"
  show fld "bullet21" with visual effect wipe right
  wait 5 seconds
  if the mouseclick then exit_h
  select word 9 of fld "script text"
  wait 30 ticks
  type "into field 1 of group " & quote & "van" & quote & " of next card"
  wait 1 second
  if the mouseclick then exit_h
  show fld "bullet22" with visual effect wipe right
  wait 4 seconds
  if the mouseclick then exit_h
  set the scroll of fld "script text" to 20
  select line 10 of fld "script text"
  wait 30 ticks
  type "go next card"
  wait 1 second
  if the mouseclick then exit_h
  move btn "cursor" to the loc of btn "script_ok" in 250 milliseconds
  click_sound
  set the hilite of btn "script_ok" to true
  wait 10 ticks
  set the hilite of btn "script_ok" to false
  hide group "script editor group"
  if the mouseclick then exit_h
  lock screen
  hide fld "bullet21"
  hide fld "bullet22"
  unlock screen
  if the mouseclick then exit_h
  show fld "bullet23" with visual effect wipe right
  wait 7 seconds
  if the mouseclick then exit_h
  visual effect dissolve
  go card 10
  palette "delivery example"
end opencard

on draw_banner
  local returnspeed
  move btn "cursor" to the loc of btn "curve" in 300 milliseconds
  click_sound
  if the mouseclick then exit_h
  set the hilitedbuttonname of group "icons" to "curve"
  set the icon of btn "cursor" to 1282
  move btn "cursor" to the topleft of grc "banner"
  set the points of grc "banner2" to empty
  show grc "banner2"
  if the mouseclick then exit_h
  put the movespeed into returnspeed
  set the movespeed to 700
  repeat for each line i in the points of grc "banner"
    move btn "cursor" to i
    set the points of grc "banner2" to (the points of grc "banner2"&cr&i)
  end repeat
  set the movespeed to returnspeed
  click_sound
  if the mouseclick then exit_h
  lock screen
  hide grc "banner2"
  show grc "banner"
  show group "postman_group"
  unlock screen
  if the mouseclick then exit_h
  wait 1 second
  if the mouseclick then exit_h
  hide fld "bullet4"
  move btn "cursor" to the loc of btn "field"
  click_sound
  set the hilitedbuttonname of group "icons" to "field"
  move btn "cursor" to 212,244
  click_sound
  if the mouseclick then exit_h
  set the rect of fld "field_outline" to 212,244,214,246
  set the showlines of fld "field_outline" to true
  show fld "field_outline"
  repeat 20
    move btn "cursor" relative 15,3 in 20 milliseconds
    get the rect of fld "field_outline"
    add 15 to item 3 of it
    add 3 to item 4 of it
    set the rect of fld "field_outline" to it
    -- 307,-53
  end repeat
  if the mouseclick then exit_h
  hide fld "field_outline"
  move btn "cursor" to the loc of btn "pointer" in 250 milliseconds
  click_sound
  set the hilitedbuttonname of group "icons" to "pointer"
  set the icon of btn "cursor" to 301
  if the mouseclick then exit_h
end draw_banner

on postman
  show fld "Bullet3" with visual effect wipe right
  wait 4 seconds
  if the mouseclick then exit_h
  menu_choice "file","Import..."
  show group "importer_group"
  wait 1 second
  if the mouseclick then exit_h
  move btn "cursor" to the loc of fld "importer_file" in 300 milliseconds
  click_sound
  wait 10 ticks
  click_sound
  select text of fld "importer_file"
  type "postman.gif"
  wait 30 ticks
  if the mouseclick then exit_h
  move btn "cursor" to the loc of btn "import" in 300 milliseconds
  click_sound
  set the hilite of btn "import" to true
  wait 10 ticks
  if the mouseclick then exit_h
  set the hilite of btn "import" to false
  hide group "importer_group"
  if the mouseclick then exit_h
  lock screen
  show group "postman_group"
  show image "postman pat himself.gif"
  show image "postman head"
  unlock screen
  wait 3 seconds
  hide fld "bullet3"
  if the mouseclick then exit_h
end postman

on import_backgrounds
  show fld "bullet7" with visual effect wipe right
  wait 8 seconds
  if the mouseclick then exit_h
  menu_choice "file","import..."
  show group "importer_group"
  move btn "cursor" to the loc of fld "importer_file" in 150 milliseconds
  if the mouseclick then exit_h
  click_sound
  wait 5 ticks
  click_sound
  select text of fld "importer_file"
  type "background.gif"
  wait 20 ticks
  if the mouseclick then exit_h
  move btn "cursor" to the loc of btn "import" in 300 milliseconds
  click_sound
  set the hilite of btn "import" to true
  wait 5 ticks
  set the hilite of btn "import" to false
  if the mouseclick then exit_h
  hide group "importer_group"
  show group "background.gif"
  wait 3 seconds
  if the mouseclick then exit_h
  menu_choice "file","import..."
  show group "importer_group"
  if the mouseclick then exit_h
  move btn "cursor" to the loc of fld "importer_file" in 250 milliseconds
  click_sound
  wait 5 ticks
  click_sound
  if the mouseclick then exit_h
  select text of fld "importer_file"
  type "foreground.gif"
  wait 20 ticks
  move btn "cursor" to the loc of btn "import" in 250 milliseconds
  if the mouseclick then exit_h
  click_sound
  set the hilite of btn "import" to true
  wait 5 ticks
  set the hilite of btn "import" to false
  show group "foreground.gif"
  if the mouseclick then exit_h
  hide group "importer_group"
  wait 3 seconds
  if the mouseclick then exit_h
  hide fld "bullet7"
  show fld "bullet4" with visual effect wipe right
  wait 3 seconds
  if the mouseclick then exit_h
end import_backgrounds

on group_grcs
  show fld "bullet5" with visual effect wipe right
  wait 5 seconds
  if the mouseclick then exit_h
  move btn "cursor" to the loc of grc "banner"
  click_sound
  select grc "banner"
  if the mouseclick then exit_h
  repeat 11
    -- -187,-3
    move btn "cursor" relative -11,0 in 10 milliseconds
    move grc "banner" relative -11,0 in 10 milliseconds
  end repeat
  if the mouseclick then exit_h
  move btn "cursor" relative 0,-3 in 20 milliseconds
  move grc "banner" relative 0,-3 in 20 milliseconds
  wait 30 ticks
  if the mouseclick then exit_h
  move btn "cursor" to the loc of image "postman pat himself.gif"
  click_sound
  set the selected of image "postman pat himself.gif" to true
  wait 30 ticks
  if the mouseclick then exit_h
  menu_choice "Edit","Group"
  set the locklocation of group "postman_group" to false --display purposes
  select group "postman_group"
  wait 1 second
  if the mouseclick then exit_h
  reset_cursor
  set the locklocation of group "postman_group" to true
  show fld "bullet6" with visual effect wipe right
  if the mouseclick then exit_h
  wait 7 seconds
  --end of grouping grcs
  if the mouseclick then exit_h
end group_grcs
     �     ~�   old_script local myMessageVariable

on mouseUp
 put field "Message" into myMessageVariable
  put field "Timer" into myTimerVariable
  send "deliverTheMessage" to me in myTimerVariable seconds
end mouseUp

on deliverTheMessage
  answer myMessageVariable
end deliverTheMessage  �  	  
�  
�       �  $  )  *  ,  3  5  6  7  8  9  :  ;  <  =  >  ?  @  A  �  _ fini   	P
�local return_rate, string_list, current_character

on preopenCard
  hide image "only_limit" of cd 17
  hide btn "backdrop_button" of cd 17
  hide fld "slogan" of cd 17
  set the loc of btn "backdrop_button" of cd 17 to 480,240
end preopenCard

on opencard
  lock screen
  show image "only_limit"
  show btn "backdrop_button"
  unlock screen with visual effect dissolve very fast
  send "type_it" to me in 3 seconds
  move btn "backdrop_button" relative -400,0 in 25 seconds
end opencard

on type_it
  put "..it doesn't stop at pink elephants..." into string_list
  put 0 into current_character
  send "type_string" to me in 3 ticks
  put empty into fld "slogan"
  show fld "slogan"
  select text of fld "slogan"
end type_it

on type_string
  add 1 to current_character
  if current_character > (the num of chars in string_list) then
    -- set the loc of btn "backdrop_button" of cd 17 of stack "metacard demo2" to 80,240--end move?
    wait 3 seconds
    stop moving btn "backdrop_button"
    lock screen
    hide image "only_limit"
    hide fld "slogan"
    hide btn "backdrop_button"
    unlock screen with visual effect dissolve to black very slow
    closecard
    exit to metacard
    exit type_string
  end if
  select after last char of fld "slogan"
  if last word of fld "slogan" is "at" then set the textcolor of the selection to 255,51,153
  if last word of fld "slogan" is "pink" then set the textcolor of the selection to "white"
  type char current_character of string_list
  if last word of fld "slogan" is "stop" then send "type_string" to me in 60 ticks
  else send "type_string" to me in 1 ticks
end type_string

on closecard
  global return_windows, return_backdrop, open_as
  play stop
  local i, temp
  cancel (item 1 of the pendingmessages)
  set the backdrop to return_backdrop
  repeat for each line i in return_windows
    put i into temp
    delete last item of temp
    if temp is "metacard demo2" then
      close stack "metacard demo2"
      next repeat
    end if
    switch (last item of i)
    case 1
    case 2
      put "toplevel" into open_as
      exit switch
    case 3
      put "modeless" into open_as
      exit switch
    case 4
      put "palette" into open_as
      exit switch
    case 5
      put "Modal" into open_as
      exit switch
    case 6
      put "modal" into open_as
    end switch
    if the mode of stack temp is 0 then do "open stack temp as" && open_as
  end repeat
  show menubar
  close stack "metacard demo2"
  unlock screen
  set the lockerrordialogs to false
  exit to metacard
end closecard

on mouseup
  set the lockerrorDialogs to true --botch our way past the "can't find object" errors
  cancel (item 1 of the pendingmessages)
  closecard
  exit to metacard
end mouseup

on errorDialog
  exit errorDialog
end errorDialog
          black       ~�  `  j  [  k elephantwalk   	P�local return_speed, timerID, start_volume

on preopenCard
  put the playloudness into start_volume
  show image 1
  put the movespeed into return_speed
  set the loc of btn "elephant" to 701,251
  set the icon of btn "elephant" to 2930
  set the loc of image "eye_balls" to 322,194
  hide image "eye_balls"
  set the loc of image "heart" to 307,199
  hide image "heart"
  hide image "bubble"
end preopenCard

on closecard
  set the movespeed to return_speed
  play stop
  set the playloudness to start_volume
  if the pendingMessages is not empty then cancel (item 1 of the pendingMessages)
end closecard

on opencard
  set cursor to none
  test_sound
  send "continue_opencard" to me in (15*10) ticks
end opencard

on continue_opencard
  global e_current_frame, e_frame_list
  put "2930,2931,2930,2932" into e_frame_list
  put 1 into e_current_frame
  send "animate" to me
  move btn "elephant" relative -207,0 in 550 milliseconds
end continue_opencard

on animate
  global e_current_frame, e_frame_list
  if the loc of btn "elephant" is 494,251 then
    put "2933,2934,2933,2935" into e_frame_list
    put 1 into e_current_frame
    send "animate_up" to me
    move btn "elephant" relative 0,-83 in 350 milliseconds --up the way
    exit animate
  end if
  set the icon of btn "elephant" to item e_current_frame of e_frame_list
  add 1 to e_current_frame
  if e_current_frame > 4 then put 1 into e_current_frame
  send "animate" to me in 25 milliseconds
end animate

on animate_up
  global e_current_frame, e_frame_list
  if the loc of btn "elephant" is 494,168 then
    put "2930,2931,2930,2932" into e_frame_list
    put 1 into e_current_frame
    send "animate_left" to me
    move btn "elephant" relative -50,0 in 200 milliseconds
    exit animate_up
  end if
  set the icon of btn "elephant" to item e_current_frame of e_frame_list
  add 1 to e_current_frame
  if e_current_frame > 4 then put 1 into e_current_frame
  send "animate_up" to me in 20 milliseconds
end animate_up

on animate_left
  global e_current_frame, e_frame_list
  if item 1 of the loc of btn "elephant" = 444 then
    set the icon of btn "elephant" to 2940
    send "slump_elephant" to me
    exit animate_left
  end if
  set the icon of btn "elephant" to item e_current_frame of e_frame_list
  add 1 to e_current_frame
  if e_current_frame > 4 then put 1 into e_current_frame
  send "animate_left" to me in 20 milliseconds
end animate_left

on slump_elephant
  global e_frame_list, e_current_frame
  local i
  play stop
  set the playloudness to start_volume
  play audioclip "skid.wav"
  move btn "elephant" relative -120,10 in 950 milliseconds
  set the icon of btn "elephant" to 2941
  move btn "elephant" relative 0,15 in 100 milliseconds
  lock screen
  set the icon of btn "elephant" to 2939
  show image "eye_balls"
  unlock screen
  send "move_eyeballs" to me in 10 milliseconds
  get the points of grc "heart_path"
  show image "heart"
  set the movespeed to 50
  repeat for each line i in it
    move image "heart" to i
  end repeat
  show image "bubble" at the loc of image "heart"
  wait 2 ticks
  hide image "heart"
  wait 8 ticks
  play audioclip "ping.wav"
  hide image "bubble"
  wait until the sound is "done"
  cancel timerID
  lock screen
  set the icon of btn "elephant" to 2930
  hide image "eye_balls"
  unlock screen
  wait 5 ticks
  put "2930,2931,2930,2932" into e_frame_list
  put 1 into e_current_frame
  send "continue_left" to me
  move btn "elephant" relative -150,0 in 350 milliseconds
end slump_elephant

on move_eyeballs
  get the loc of image "eye_balls"
  add 1 to item 2 of it
  subtract 1 from item 1 of it
  if item 2 of it > 198 then exit move_eyeballs
  set the loc of image "eye_balls" to it
  send "move_eyeballs2" to me in 550 milliseconds
  put the result into timerID
end move_eyeballs

on move_eyeballs2
  get the loc of image "eye_balls"
  add 1 to item 2 of it
  --add 1 to item 1 of it
  if item 2 of it > 198 then exit move_eyeballs2
  set the loc of image "eye_balls" to it
  send "move_eyeballs3" to me in 550 milliseconds
  put the result into timerID
end move_eyeballs2

on move_eyeballs3
  get the loc of image "eye_balls"
  add 1 to item 2 of it
  add 1 to item 1 of it
  if item 2 of it > 198 then exit move_eyeballs3
  set the loc of image "eye_balls" to it
  send "move_eyeballs2" to me in 550 milliseconds
  put the result into timerID
end move_eyeballs3

on continue_left
  global e_current_frame, e_frame_list
  if not (the sound contains "clmp") then test_sound2
  if the loc of btn "elephant" = 174,193 then
    set the icon of btn "elephant" to 2936
    put "2936,2937,2936,2938" into e_frame_list
    put 1 into e_current_frame
    send "down_elephant" to me
    move btn "elephant" relative 0,60 in 300 milliseconds
    exit continue_left
  end if
  set the icon of btn "elephant" to item e_current_frame of e_frame_list
  add 1 to e_current_frame
  if e_current_frame > 4 then put 1 into e_current_frame
  send "continue_left" to me in 25 milliseconds
end continue_left

on down_elephant
  global e_current_frame, e_frame_list
  if the loc of btn "elephant" = 174,253 then
    set the icon of btn "elephant" to 2930
    put "2930,2931,2930,2932" into e_frame_list
    put 1 into e_current_frame
    send "animate_final" to me
    move btn "elephant" relative -257,0 in 550 milliseconds
    exit down_elephant
  end if
  set the icon of btn "elephant" to item e_current_frame of e_frame_list
  add 1 to e_current_frame
  if e_current_frame > 4 then put 1 into e_current_frame
  send "down_elephant" to me in 25 milliseconds
end down_elephant

on animate_final
  global e_current_frame, e_frame_list, return_to
  if item 1 of the loc of btn "elephant" < -50 then
    visual effect dissolve slow
    play stop
    set the playloudness to start_volume
    if return_to is 17 then
      lock messages
      send "preopencard" to cd 17
      go cd 17
      send "opencard" to cd 17
      exit to metacard
    end if
    go cd return_to
    exit to metacard
    exit animate_final
  end if
  set the icon of btn "elephant" to item e_current_frame of e_frame_list
  add 1 to e_current_frame
  if e_current_frame > 4 then put 1 into e_current_frame
  send "animate_final" to me in 25 milliseconds
end animate_final

on preopenstack
end preopenstack


on test_sound
  if start_volume > 9 then set the playloudness to 10
  if not (the sound contains "clmp") then play audioclip "clmpngsn" looping
  send "up_volume" to me in 15 ticks
end test_sound

on up_volume
  get the playloudness
  add 10 to it
  if it > start_volume then
    set the playloudness to start_volume
    exit up_volume
  end if
  set the playloudness to it
  set the playloudness to it
  send "up_volume" to me in 15 ticks
end up_volume

on test_sound2
  set the playloudness to start_volume
  if not(the sound contains "clmp") then play "clmpngsn" looping
  send "down_volume" to me in 15 ticks
end test_sound2

on down_volume
  get the playloudness
  subtract 10 from it
  if it < 10 then exit down_volume
  set the playloudness to it
  send "down_volume" to me in 15 ticks
end down_volume

on mouseup
  global return_to
  set the lockerrordialogs to true
  cancel (item 1 of the pendingmessages)
  cancel (item 1 of the pendingmessages)
  visual effect dissolve slow
  play stop
  set the playloudness to start_volume
  if return_to is 17 then
    lock messages
    send "preopencard" to cd 17
    go cd 17
    send "opencard" to cd 17
    exit to metacard
  end if
  go cd return_to
  set the lockerrordialogs to false
  exit to metacard
end mouseup

on errorDialog
  exit errorDialog
end errorDialog
          black       ~�  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  � miniscreen  i     �     ��   autovisible  false  � border   K@   �  	7 � -�Y   autoloc  383,217     � menubar group  i     �  � 0� p   autoloc  373,100  1 
motif bar  	@    �  � 5� g   autoloc  373,100 demo/motbar.gif     � windows bar  @    �  � 8� a   autoloc  373,100 demo/winbar.gif     � 	Menu Bar �@`       � N�              	  
� 	  
� 	  	� 	  � 	   	     � File �DU |on xmousedown
  show group "file group"
  set the hilite of me to true
  set the textcolor of me to "white"
end xmousedown
          black     ��  @  � R (             	  
� 	  
� 	  	� 	  � 	   	     � Edit �D�E         black     ��  �  � R (    armed  false           	  
� 	  
� 	  	� 	  � 	   	     � Tools �DE         black     ��  @  R 0             	  
� 	  
� 	  	� 	  � 	   	     � Size �D�E      i R (            	  
� 	  
� 	  	� 	  � 	   	     � Style �D�E      � R ,            	  
� 	  
� 	  	� 	  � 	   	     � Color �D�E      � R ,            	  
� 	  
� 	  	� 	  � 	   	     � Font �D�E      = R ,      MC Font Menu      	  
� 	  
� 	  	� 	  � 	   	     � Help �D�E      	 R (            	  
� 	  
� 	  	� 	  � 	   	     � Icons   �     �  � n� (   hillitedbuttonname  pointer  � pointer �B	d      � r     Select controls   -        	  
� 	  
� 	  	�	  � 	   	     � browse �B	d      � r     Browse tool   .        	  
�	  
�	  	� 	  �	  	    � button �B	d      � r     Button tool   /        	  
� 	  
� 	  	� 	  � 	   	     � field �B	d      r     Field tool   0        	  
� 	  
� 	  	� 	  � 	   	     � 
scrollbar �B	d     5 r     Scrollbar tool   1        	  
� 	  
� 	  	� 	  � 	   	     � image �B	d     U r     Image tool   2        	  
� 	  
� 	  	� 	  � 	   	     � polygon �B	d     u r     Graphic tool (polygon)   =        	  
� 	  
� 	  	� 	  � 	   	     � curve �B	d     � r     Graphic tool (curve)   :        	  
� 	  
� 	  	� 	  � 	   	     � 
rectangle �B	d     � r     Graphic tool (rectangle)   <        	  
� 	  
� 	  	� 	  � 	   	     � oval �B	d     � r     Graphic tool (oval)   9        	  
� 	  
� 	  	� 	  � 	   	     � 
roundrect �B	d     � r     Graphic tool (round rect)   >        	  
� 	  
� 	  	� 	  � 	   	     � regular �B	d      r     Graphic tool (regular polygon)   ;        	  
� 	  
� 	  	� 	  � 	   	     � buttontooltip  @    �  � G    autoloc  295,134autovisible  false demo/buttonto.gif     � fieldtooltip  @    � ! � <    autoloc  319,134autovisible  false demo/fieldtoo.gif     � scrollbartooltip  @    � B � T    autoloc  364,134autovisible  false demo/scrollba.gif     � ovaltooltip  @    � � � p    autoloc  542,134autovisible  false demo/ovaltool.gif     � window group  i     �  � �� �   autoloc  386,268  2 motif stack  	@    �  � �� �   autovisible  falseautoloc  386,268 demo/motstack.gif     � windows stack  @    �  � �� �   autoloc  386,268autovisible  false demo/winstack.gif      oval example   C    �  � �     autovisible  false     h   scrollbar example   !a    � �     autovisible  false
   field example  !`    � � � � B   autovisible  false        
�    
�    	�    �            | distance_markers   a     �  � � f u   autovisible  false  x    K  }}}}}}          �  � M    linepat  52	linefill  52     ����  � � ��  ��   � �  y    K  }}}}}}     � �  f     ����  � � ��  ��    � 
  z  	        � M            
75 pixels 
  {  	        � � O            100 pixels   `    K       �           �  a    K       �           �"  � Button example �e�g    � �% k %   autovisible  false     Do it         	     
  
� field example2  !`    � �  �    autovisible  false        
�    
�    	�    �            
� duplicate fields   i     �  � �     autovisible  false
  
� field example label  !     �  � � � B   autovisible  true        
� &Enter the message you want displayed:   
� &Enter the message you want displayed:   	� &Enter the message you want displayed:   �          
  
� field example2 label  !     �  �  �    autovisible  true        
� Seconds delay:   
� Seconds delay:   	� Seconds delay:   �            	L card_marker   C   ��      �  � �� �   autovisible  false     
� answer_group   a     � , � � n   autovisible  false  
� windows_answer  @    � * � � {   autovisible  true demo/winans.gif     
� motif_answer  	@    � 5 � � f   autovisible  true demo/motans.gif     
� icon �B on mouseUp
end mouseUp
       0 � , (  I        	  
� 	  
� 	  	� 	  � 	   	   
  
�   �       Z � p #           This is a test...   
� 
answer_OK �l�`      _ � 9      OK         	  
� 	  
� 	  	� 	  � 	   	     . background.gif  a     �  � �� �   autovisible  false  - background.gif  	@       � �� � demo/backgnd.gif     / 
green.gif  	@      @ �  $ demo/green.gif     2 foreground.gif  a     �  � �� �   autovisible  false  0 postman pat foreground.gif  	@       � �� � demo/postpat.gif     1 green2.gif  	@      3  $ demo/green2.gif     # postman_group  a     �  � �� �   autovisible  falseautoloc  386,272  & banner   KB      ff  ������  �  � �D m   autovisible  trueautoloc  367,272        v � � � � � � � � � � � � � � � � � � � � � � � �$ �/ �8 �; �> �A �D �O �X �[ �^ �d �o �x �{ �~ �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � �	 � � �,7EB	?<�6�4�6�<�?�B�E�B�?�<�9�6�4�6�<�?�B�E�B�?~<{9x6o4d6^<[?XBOEDBA?><;986/4$6<?BEB? �< �9 �6 �4 �6 �< �? �B �E �. � � � �  ! postman pat himself.gif  @    � � � � �   autovisible  falseautoloc  490,271 demo/posthim.gif     ( postman head  @    �  �  !   autovisible  falseautoloc  530,245 demo/posthead.gif     � file group   a }on mouseup
  hide me
  
  set the hilite of btn "file" to false
  set the textcolor of btn "file" to "black"
  
end mouseup
     �  � e �   autoloc  246,230autovisible  false  � New Button  A`       � i y �             	       � 
New Stack `Ti@         black     ��  `  � l q              	  
� 	  
� 	  	� 	  � 	   	     � File Separator 1 �@        � � q             	  
� 	  
� 	  	� 	  � 	   	     � Open... �Ti@       � � q            	  
� 	  
� 	  	� 	  � 	   	     � Save �Ti@       � � q            	  
� 	  
� 	  	� 	  � 	   	     � Save As... �Ti@       � � q            	  
� 	  
� 	  	� 	  � 	   	     � Revert �Ti@       � � q            	  
� 	  
� 	  	� 	  � 	   	     � File Separator 1 �@        � � q             	  
� 	  
� 	  	� 	  � 	   	     � 
Import... �Ti@         black     ��  @  � � q             	  
� 	  
� 	  	� 	  � 	   	     � Audio Settings... �Ti@       �  q            	  
� 	  
� 	  	� 	  � 	   	     � Stack Files... �Ti@       � q            	  
� 	  
� 	  	� 	  � 	   	     � Preferences... �Ti@         black     ��  `  �0 q              	  
� 	  
� 	  	� 	  � 	   	     � File Separator 1 �@        �H q             	  
� 	  
� 	  	� 	  � 	   	     c file bottom.gif  	@       �M x  demo/file_bot.gif     
� importer_group  a     �  � �� �   autovisible  false  
� motif_importer  	@    �  � �� �   autovisible  true demo/motimp.gif     
� Windows_importer  @    �  � �� �   autovisible  true demo/winimp.gif     
� New Button ���e       � �� �       'Snapshot
Image
EPS
AudioClip
VideoClip        	       
� Cancel �D�`      dM T             	  
� 	  
� 	  	� 	  � 	   	     
� Help �D�`      M T             	  
� 	  
� 	  	� 	  � 	   	     
� 
Select... �D�`       � @             	  
� 	  
� 	  	� 	  � 	   	   
  
� Find  �        � � D            From file: 
  
� importer_file  i`       � �^                
� Import �L�`       �Q L             	  
� 	  
� 	  	� 	  � 	   	     
� Don't Import @E�      � � l             	       
� Stack Name �4	e      !@      	Importer      MC Stack Menu        	  
� 	  
� 	  	� 	  � 	   	   
  
� Find  �        �! h            Put into stack:   ' banner2   C      ff  ������  �  � �D m   autovisible  false        v � � � � � � � � � � � � � � � � � � � � � � � �$ �/ �8 �; �> �A �D �O �X �[ �^ �d �o �x �{ �~ �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � �	 � � �,7EB	?<�6�4�6�<�?�B�E�B�?�<�9�6�4�6�<�?�B�E�B�?~<{9x6o4d6^<[?XBOEDBA?><;986/4$6<?BEB? �< �9 �6 �4 �6 �< �? �B �E �. � � � �  	 edit group   a     �  � e �   autovisible  false  + New Button  A`       � i � �             	       
� Undo �i@       � j �       2     Ctrl+Z  z	  
� 	  
� 	  	� 	  � 	   	     
� File Separator 1 �@        � � �             	  
� 	  
� 	  	� 	  � 	   	     
� Cut �i@       � � �       2     Ctrl+X  x	  
� 	  
� 	  	� 	  � 	   	     
� Copy �i@       � � �       2     Ctrl+C  c	  
� 	  
� 	  	� 	  � 	   	     
� Paste �i@       � � �       2     Ctrl+V  v	  
� 	  
� 	  	� 	  � 	   	     
� Delete �Ti@       � � �            	  
� 	  
� 	  	� 	  � 	   	     
� Select All �Ti@       � � �            	  
� 	  
� 	  	� 	  � 	   	     
� File Separator 1 �@        � � �             	  
� 	  
� 	  	� 	  � 	   	     
� Group �i@         black     ��  @  � � �        2     Ctrl+G  g	  
� 	  
� 	  	� 	  � 	   	       Backgrounds... �i@       � �       2     Ctrl+T  t	  
� 	  
� 	  	� 	  � 	   	      File Separator 1 �@        �. �             	  
� 	  
� 	  	� 	  � 	   	      Create Card �Ti@         black     ��     �0 �            	  
� 	  
� 	  	� 	  � 	   	      Delete Card �Ti@       �H �            	  
� 	  
� 	  	� 	  � 	   	     
 edit bottom.gif  	@       �T �  demo/edit_bot.gif       properties  a     �  � �� �   autovisible  falseautoloc  383,270  6 button properties   a     �  � �� �   autovisible  falseautoloc  383,270  0 motif button properties  	@       � �� � demo/motbtn.gif     / windows button properties  @       � �� � demo/winbtn.gif      Button Properties  �e       � �� �       -Name
Appearance
Behavior
Accelerators
Extras        	       q 
tab_alert   C   ��      �  � �q '   autovisible  false     v appearance_marker �E�`       � � !              	       � button name group   i     �  � �� �   autovisible  true
  !   �        � � d            Button Name: 
  " Name  i`       �>         
� New button   
� New button   	� New button   � New button    Tabbed button    New button 
  #   �        � 4            Layer: 
  $ Layer  i`       � $         
�    
� 1   	�    �     1    1 
  %   �        D            Number: 
  & Number  	       X "         
�    
� 1   	�    �     1    1 
  '   �       | "            Id: 
  ( Id  	       � 4         
�    
� 1000   	�    �     1567    1567 
  )   �       � T            
Mnemonic: 
  * 	Mnemonic  i`      $ $         
�    
� 0   	�    �     0     
  +   �        �? 4            Label: 
  , Label  i`       �?h         
�    
�    	�    �            � button_appearance   a     �  � �� �   autovisible  false  � threeD  e�       � l      3D         	      � Opaque  e�       �. l      Opaque         	      � Default  e�       �F l      Default         	       � 	Disabled  e�       �^ l      	Disabled         	       � 	showName  e�       � � l      
Show Name         	      � showBorder  e�       � � l      Show Border         	      � showHilite  e�       � � l      Show Hilite         	       � 
Colors... �E�`      6 � <             	       � Font... �E�`      6 <             	       � Make
Divider �E�`      6D < (            	       � BStyle  $i       } � � � Style   � RadioButton  E�      � � h             	       � 	CheckBox  E�      � � h             	       � Shadow  E�      � h             	       � 	Pulldown  D�      � � `             	  
� 	  
� 	  	� 	  � 	   	     � Popup  D�      � � `             	  
� 	  
� 	  	� 	  � 	   	     � Cascade  D�      � `             	  
� 	  
� 	  	� 	  � 	   	     � 
RoundRect  E�      �, h             	       � 
Rectangle  E�      �D h             	      � opaque  e�      �\ h      	MenuItem         	       � Option  D�      �, `             	  
� 	  
� 	  	� 	  � 	   	     � 	ComboBox  D�    � �D `    	combobox  falsef  false            	  
� 	  
� 	  	� 	  � 	   	     � Tabbed  D�      �\ `             	  
� 	  
� 	  	� 	  � 	  	     � extras marker �E�`      � �               	       � button_extras   a     �  � �� �   autovisible  false
  �   �        � � h            Border Width:   � borderWidth  �a       � � $�O��� 0  32       
  �   �        � h            Shadow Offset:   � shadowOffset  �a       � $�'��� 0  64       
  �   �        �7 P            Icon: 
  � icon  i`       �7 @         
�    
�    	�    �          
  �   �        �W P            Hilite Icon: 
  � hiliteIcon  i`       �W @         
�    
�    	�    �            � 
Choose... �E�`      E7 P             	       � 
Choose... �E�`      EW P             	     
  � tab_titles  �)`      � � � d        
�    
�    	�    �     Tab1  Tab2  Easy!       �    	`      = �  d  � Custom Properties... �E�`      �S �             	     
  �   �       � � �            Button (Menu) Contents:   	 behaviour marker �E�`      M � 
              	        behaviour group   a     �  � �� �   autovisible  false  
 
Script... �E�`       �( T             	     
   toolTip  i`      LD         
�    
�    	�    �          
     �       �$ d            Menu Button: 
     �        �L D            
Tool Tip: 
   menuMouseButton  i`      #$ $         
�    
�    	�    �         1    traversalOn  e�       � � t      Traversal On         	       autoHilite  e�      S � t      Auto Hilite         	       lockLocation  e�       � � t      Lock Location         	        sharedHilite  e�       �
 t      Shared Hilite         	        hiliteBorder  d�      S � t      Hilite Border         	  
� 	  
� 	  	� 	  � 	   	     hiliteFill  d�      S
 t      Hilite Fill         	  
� 	  
� 	  	� 	  � 	   	     autoArm  d�      � � t      	Auto Arm         	  
� 	  
� 	  	� 	  � 	   	      
armBorder  d�      � � t      Arm Border         	  
� 	  
� 	  	� 	  � 	   	     armFill  d�      �
 t      	Arm Fill         	  
� 	  
� 	  	� 	  � 	   	   
  r 	tab_info  h     ������  �  � � t   autovisible  false           jEach properties palette is split into different sections, to control all of the object's many attributes.   7 field properties   a     �  � �� �   autovisible  falseautoloc  383,270  5 motif field properties  	@       � �� � demo/motfield.gif     8 windows field properties  @       � �� � demo/winfield.gif     : 
field_tab  �e       � �� �        Name
Appearance
Behavior
Extras        	       � close box marker �E�`       � � 	              	       
� field_appearance_group   i     �  � �� �   autovisible  true
  ;   �       & � D            	Margins: 
  < Margins  I`      j � L         
�    
�    	�    �     8     
  =   �       & � L            
Tabstops: 
  > 	tabStops  I`      r � �         
�    
�    	�    �          
  ?   �       � � \            First Indent:   @ Font... �E�`      ZU <             	       A 
Colors... �E�`      �U <             	       B Show as Label �E�`      Z% p             	     
  C firstIndent  I`       � 4         
�    
�    	�    �     0       D showBorder  e)       � � l      Show Border         	      E threeD  e)       � � l      3D         	      F Opaque  e)       � � l      Opaque         	      G 	dontWrap  e)       � l      Don't Wrap         	       H 
showLines  e)       �- l      Show Lines         	       I fixedLineHeight  e)       �E �      Fixed Line Height         	       J hScrollbar  e)       �] �      Horizontal Scrollbar         	       O fstyle   �       �! d L  K 
Rectangle  E)      �% \             	      L Shadow  E)      �= \             	       M 
Scrolling  E)      �U \             	       
� field_name_group   a     �  � �� �   autovisible  false
  
�   �        � � X            Field Name: 
  
� field name  i`       �L         
�    
�    	�    �          
  
�   �        � � 8            Layer: 
  
� Layer  i`       � � $         
�    
�    	� 26   �          
  
�   �       e � D            Number: 
  
� Number  	       � � "         
�    
�    	� 7   �          
  
�   �       � � "            Id: 
  
�   �        � L            
Contents: 
  
� text  �)`       �P X        
�    
�    	�    �            
�    	`      ;  X  
� 	Import.. �E�`         black @  �? @              	     
  
� Id  	        � 4         
�    
�    	� 2739   �             image_properties   a     �  � �� �   autovisible  false   motif_imageprop  	@       � �� � demo/motiprop.gif      windows_imageprop  @       � �� � demo/winiprop.gif      Image Properties  �e       � �� �       Name
Extras        	     
     �        � � d            Image Name: 
   image_name  i`       �4         
� foreground.gif   
�    	�    �          
     �        �
 4            Layer: 
   image_layer  i`       �
 0         
� 4   
�    	�    �          
     �       : B            Number: 
     �       �             Id: 
   id  �        0            2833 
     �        �B P            File Name: 
   	fileName  i`      B         
�    
�    	�    �             
Select... �E�`      B @             	     
   number  	       z .         
� 2   
�    	�    �            4 fore_foreground  B     �  � �� �   autovisible  false  0         	  
� 	  
� 	  	� 	  � 	   	   	       d tools group  a     � 
 f �   autovisible  false  c New Button  A`       h �             	       e Standalone Builder... �Ti@      2 �            	  
� 	  
� 	  	� 	  � 	   	     f File Separator 1 �@       J �             	  
� 	  
� 	  	� 	  � 	   	     g Utilities... �Ti@      L �            	  
� 	  
� 	  	� 	  � 	   	     i Navigator.... �Ti@       � �            	  
� 	  
� 	  	� 	  � 	   	     j Message Box... �Di@         black     ��  @  � �           m	  
� 	  
� 	  	� 	  � 	   	     k File Separator 1 �@        � �             	  
� 	  
� 	  	� 	  � 	   	     l Character Chooser... �Ti@       � �            	  
� 	  
� 	  	� 	  � 	   	     m Script Debugger... �Ti@       � �            	  
� 	  
� 	  	� 	  � 	   	     n Control Browser... �Ti@       � �            	  
� 	  
� 	  	� 	  � 	   	     o File Separator 1 �@         �             	  
� 	  
� 	  	� 	  � 	   	     p Menu Builder... �Ti@       �            	  
� 	  
� 	  	� 	  � 	   	     q Resource Mover... �Ti@       �            	  
� 	  
� 	  	� 	  � 	   	     r Find... �Ti@       l �            	  
� 	  
� 	  	� 	  � 	   	     s File Separator 1 �@        � �             	  
� 	  
� 	  	� 	  � 	   	     Q message box group   a     �  �>� F   autovisible  false  O motif message box  	@       �B� > demo/motmess.gif     P windows message box  @       �I� 2 demo/winmb.gif   
  R message_field  (`    @  �_�          
�    
�    	�    �             script editor group   a     �  � A�D   autovisible  false  A windows script editor  @       � D�= demo/winse.gif     B motif script editor  	@       � E�< demo/motse.gif      
script_ok �d`       �] `      OK         	  
� 	  
� 	  	� 	  � 	   	      Cancel �D`      P] `             	  
� 	  
� 	  	� 	  � 	   	       Help �D`      �] `             	  
� 	  
� 	  	� 	  � 	   	     ! 	Menu Bar �A`       � ^|              	       " Edit  �E       � b $        Undo
Cut
Copy
Paste
Select All      	       # Go  �E       � b          %Line...
--mouseUp
--
field "bullet3"      	       $ 	Messages  EE       b P      MC field Messages Menu      	     
  * Editing Object  �              � �	            $Editing Object: button "New Button"   . Control Structures  �E      U b �        eexit
if-then
next
pass
repeat forever
repeat for
repeat until
repeat while
repeat with
return
switch      		       / 	Commands  EE      � b T      MC Commands Menu      	     
  � script text  �)`       � � �        
�    
�    	�    �            �    	`      2 �  �  �    	a       �Fl   � cursor �C     � 3-     autoloc  180,203autovisible  true  .         	     
  B field_outline  
!     �  � �. >   autovisible  false        
�    
�    	�    �          
  � 
sub title  	        �   -� -   autovisible  false           &MetaCard is a software creation tool.     �    @ �    �  navy       �  
  � header1  	        �   fY    autovisible  false           )Use it to create something as simple as:        (  � 	bullet1a   i     �  h � � )   autovisible  false
  �   	           v � � !           An address book            bullet.gif  	@       l �   demo/bullet.gif     � 	bullet2a   a     �  h � � *   autovisible  false
  �  	          v � � "           A reference guide   ! New Button  B
        l �              	  � 	       � 	bullet3a   a     �  h � � *   autovisible  false
  �  	          v � y "           A slide show   " New Button  B
        l �              	  � 
  � header2       �  7 $   autovisible  false           Or as complex as:   � 	bullet5a   a     �  hR � 1   autovisible  false
  �  	          vV � )           A graphical application   $ New Button  B
        l\              	  �   � 	bullet4a   a     �  h4 � +   autovisible  false
  �  	          v8 � #           A multimedia presentation   # New Button  B
        l>              	  � 
  � 
sub title 	 �     �   -" *   autovisible  false           8If you can use a computer, you can build with MetaCard.        # @ �    �  navy  #      (   � 	bullet1b  i        �   gb L   autovisible  false
  �   	          * kI !           -Build your project using predefined objects.   m New Button  B
        ! q              	  �   � 	bullet2b  i     �   �g 4   autovisible  false
  �  	          * �F 8           IModify or combine these objects to produce almost any kind of interface.   n New Button  B
        ! �              	  �   � 	bullet3b  i     �  Q 7   autovisible  false  o New Button  B
  -       !              	  � 
  
	 second_field 	         +& �            simple and powerful 
  

 dinner          �& �             
  
 first_field 	         +
            &Tell these objects what to do using a   � 	bullet1e   a     �   % � �   autovisible  false
  �  	           	 ) � �           oMetaCard "documents" are called "Stacks".  To start to create something, you first need to create a new stack.        n  � box2   C     � �� ,F &   autoloc  286,63   
  	 bullet2       �  	 ) � �   autovisible  false           �The area inside your stack is called a "Card".  Each stack can contain multiple cards.  These cards can share elements, or be completely unique.        �     �   
 box2   C       �� �F &      choices   i           ��   	Continue �M�p :on mouseUp
  send continue_choice to this cd
end mouseUp
       �� � #             	        Go Back �E�p pon mouseUp
  visual effect scroll down to black
  visual effect scroll up to card
  go previous cd
end mouseUp
       T� ~ !             	        Menu �E�p "on mouseUp
  go cd 1
end mouseUp
        �� ~ !             	       O 	bullet1d   i     �   gx "   autoloc  217,120autovisible  false
  P  	          * kg            0AVI video and major audio formats are supported   s New Button  B
        ! q              	  H   R 	bullet2d   i     �   �# $   autovisible  falseautoloc  302,163
  S  	          * �            6Imports major graphics formats including GIF and JPEG   t New Button  B
        ! �              	  H   U 	bullet3d   i     �   �< $   autovisible  falseautoloc  302,205
  V  	           �+            IImported graphics remain compressed in their original form to save space   u New Button  B
         �              	  H   X 	bullet4d   i     �   �: 7   autovisible  falseautoloc  306,257  v New Button  B
         �              	  H   � squew1.gif  	@       % �& / demo/squew1.gif     [ 	bullet5d   i     �   	7 4   autovisible  falseautoloc  315,291  w New Button  B
        $              	  H   � squew2.gif  	@       .% , demo/squew2.gif     ` 	bullet6d   i     �  B K   autovisible  falseautoloc  327,323  x New Button  B
        F<              	  H   � squew3.gif  	@       W"� C demo/squew3.gif   
  f 
sub title 	 �     �   - !   autovisible  false           3MetaCard offers more ways to distribute your work.         @ �    �  navy   
     '   g 	bullet1c   i     �   g � +   autovisible  false
  h  	          * k � #           Distribution is royalty free   p New Button  B
        ! q              	  d   j 	bullet3c   i     �  T |   autovisible  false
  k  	          )C t           �Build single-file double-clickable executables, or deploy your application cross platform with separate engines for each platform.  Your applications can even be run over the Internet on any supported platform!        �     � *     � 	  r New Button  B
                       	  d   m 	bullet2c   i     �   �D �   autovisible  false
  n  	          * �3 �           �Deploy your application on more than 15 supported platforms, including Windows 95, Windows NT, Windows 3.1, Macintosh and all popular versions of UNIX.   q New Button  B
        ! �              	  d   � 	a button �E�`    � � � z Y   autovisible  false             	     
  � a field  �!`    � � � � �   autovisible  false        � a field for text   �    	`       �  �  � a scrollbar   a`    � � � 6 �   autovisible  false         � 
a graphic  �CC    � � � � �   autovisible  false     � �� �� �� �� �� �� �� ���'�,�-�.$#. �" � � � � � �� �� �� �� �� �� �
  � bullet1extra 	       �  # � � !   autovisible  false           
Fields... 
  � bullet2extra 	       �  q � �     autovisible  false           Graphics... 
  � bullet3extra 	       �  � � l #   autovisible  false           Scrollbars... 
  � bullet4extra 	       �  " � � !   autovisible  false           
Images... 
  � bullet5extra 	       �  q � � !   autovisible  false           Buttons... 
  � bullet3text  	       �  $ �A    scoll  10000autovisible  false          )                                                                                               Shadowed fields...     Patterned images...     Percentage bars...  Images in Buttons...    Checkboxes...     Non-scrolling fields...       Radio-buttons...       Circles...       Purple fields...    Yellow buttons...     Horizontal scrollbars...     Buttons with icons...         Menus...        Tabs...          Green scrollbars...        Borders...           Pink elephants...                                                                                  � scrollingobjects  i     � j l   autovisible  true
  �   �    � � � u �   autovisible  false           a little text   �    C@   �  �� s � �   autovisible  false     �   aa    � � � {    autovisible  falseY�����3   100         � New Button �C�`    � � � � �   autovisible  false  �         	       � Checkbox 1 `E�    � � � l    autovisible  false             	     
  �   `    � � � | R   autovisible  false           some more text   � Radiobutton 1 `D�    � � � l    autovisible  false             	  � 	  � 	       �    CD  ��        ��    � � � : :   autovisible  false     h
  �   `  33  ��  � � � h |   autovisible  false           some colored text  @ � �    Yellow      � Ugly Button �E�`          ����    � � � � 4   autovisible  false             	       �    !a    � � � �    autovisible  false  � Another Button �G�`    � � � � �   autovisible  false  �         	       � 
New Stack �Ta@    � � � q    autovisible  false           	  � 	  �   � New Button ���e    � � � � u   autovisible  false       Tab 1
Tab 2
Tab 3        	       �    a! �           ��      DD      DD      DD      DD      DD      DD    � � � m    autovisible  false         � New Button  @     � � � M H   autovisible  false             	  � 	  � 	       � 	elephant  @    � f � � �   autovisible  falseautoloc  481,242 demo/elephant.gif   
  N 
sub title 	 �     �   -� !   autoloc  260,61autovisible  false           3MetaCard is the most powerful and flexible choice.         @ �    �  navy           � crosshair.gif  @       @   demo/crosshai.gif   
  � bullet3       �  	 � � ?   autovisible  false           For example, lets create:        
  � bullet5  !     �  	  �    autovisible  false           a field        
  � bullet6       �  	 �    autovisible  false           a scrollbar        
  � bullet7       �  	 �    autovisible  false           an oval        
  � bullet8         �  	 ) � �   autovisible  false           |To move or resize controls, use the pointer tool.  Each object can simply be clicked and dragged to a new position or size.        {    test   C       � �          A � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �
   bullet1        �  	 ) � �   autovisible  false           �All objects have properties attached to them.  Properties control everything - from the way an object looks to how it interacts with the user. 
   bullet2        �  	 * � �   autovisible  false           fTo edit an object, you double click it with the pointer tool.  This brings up its properties palette.    crosshair.gif  @      9 �   demo/crosshai.gif   
  3 bullet4 	       �  	 ) � �   autovisible  false           �Remember, all objects have properties.  When you've finished viewing this, look at the online help and examples for more information. 
  � off screen  !`      �              
  � bullet3        �  	 ) � �   autovisible  false           `Lets have a closer look at some of the properties you can alter - with just a few mouse clicks. 
   bullet1        �  	 ) � }   autovisible  false           OWhen you've edited your objects, you can script them, to tell them what to do. 
   bullet1 H        �   ) � l   autovisible  false           ^When you've created and edited your objects, you need to script them to tell them what to do. 
   bullet2        �  	 � � i   autovisible  false           :When a user does something, an event or "message" occurs. 
   bullet3 	       �  	 ) � �   autovisible  false           �Suppose you created a button.  When that button is clicked on, you want it to dissapear for 1 second, then show itself again with a beep. 
   bullet4        �  	 � � N   autovisible  false           &Firstly, you would create the button. 
  - bullet5        �  	$ � i   autovisible  false           FThen edit the button's script, by bringing up its properties palette. 
  1 bullet6        �  	 * � b   autovisible  false           CWatch how closely the script created follows what you might think: 
  2 bullet7        �  	 � � 0   autovisible  false           When the mouse is pressed... 
  3 bullet8        �  	 � �     autovisible  false           Hide this button... 
  4 bullet9        �  	 � �     autovisible  false           Wait for a second... 
  5 	bullet10        �  	 � �     autovisible  false           Make a Beep... 
  6 	bullet11        �  	 � � #   autovisible  false           Show this button... 
  7 	bullet12        �  	 � �     autovisible  false           Stop there... 
  : 	bullet13        �  	 * � �   autovisible  false           DPressing the OK button compiles the script - ready for instant use! 
  ; 	bullet14        �  	 * � Z   autovisible  false           Lets see it in action... 
  < 	bullet2a        �    � �   autovisible  false           {To make objects respond to actions, you attatch scripts which start with the name of the "message" you want to respond to. 
  A 	bullet15        �  	 * � �   autovisible  false           jAll types of object can have their own script.  This even includes images and graphics, cards and stacks. 
  B 	bullet16        �  	 * �    autovisible  false           8You can make objects respond to almost any action, e.g: 
  C 	bullet17        �  	 � � w   autovisible  false           $When the mouse moves over an object  "on mouseenter" 
  D 	bullet18        �  	 � � a   autovisible  false            When the mouse leaves an object  "on mouseleave" 
  E 	bullet19        �  0 � W   autovisible  false           When a key is pressed  "on keydown"   I minikeyboard  @    � �$ y :   autovisible  false demo/minikeyb.gif     J aink  @    � �5     autovisible  false demo/aink.gif   
  L atyped      � � � � $   autovisible  false           You typed "A". 
  M 	bullet20        �  	 * � �   autovisible  false           fYou can use the "Message Box" to try out simple commands and artificially "send" messages to objects. 
  u 	bullet21        �   � � �   autovisible  false           IFor example, you could precisely set the location property of an object. 
  } off screen  !`      � B             � backdrop (less colors).gif 	@    �     ��   autovisible  false demo/backdrop.gif     � big1_normal  	P�on mousedown
  global normal_name, depressed_name
  show image "big1_depressed"
  put the long id of me into normal_name
  put the long id of image "big1_depressed" into depressed_name
  insert script of btn "button manager" into front
end mousedown

on mouseup
  global advanced_user
  put false into advanced_user
  hide image "big1_depressed"
  remove script of btn "button manager" from front
  visual effect dissolve
  go next cd
end mouseup
     � f  � �   autovisible  false demo/big1_nor.gif     � big2_normal  	P�on mousedown
  global normal_name, depressed_name
  show image "big2_depressed"
  put the long id of me into normal_name
  put the long id of image "big2_depressed" into depressed_name
  insert script of btn "button manager" into front
end mousedown

on mouseup
  global advanced_user
  put true into advanced_user
  hide image "big2_depressed"
  remove script of btn "button manager" from front
  visual effect dissolve
  go cd 11
end mouseup
     � f � � �   autovisible  false demo/big2_nor.gif     � big2_depressed  P "on mouseup
  hide me
end mouseup
     � g � � �   autovisible  false demo/big2_dep.gif     � 	logo.gif  @    �    V�   autovisible  false demo/logo.gif     � Big1_depressed  P "on mouseUp
  hide me
end mouseUp
     � g  � �   autovisible  false demo/big1_dep.gif     � sidebar.gif  	@    � d  �   autovisible  false demo/sidebar.gif     � small1_normal  	P�on mousedown
  global normal_name, depressed_name
  show image "small1_depressed"
  put the long id of me into normal_name
  put the long id of image "small1_depressed" into depressed_name
  insert script of btn "button manager" into front
end mousedown

on mouseup
  hide image "small1_depressed"
  remove script of btn "button manager" from front
  modal "settings"
  spin_logo "settings_group"
  send "expand_stack" to cd 1 of stack "settings"
end mouseup
     �  �L j z   autovisible  false demo/small1_n.gif     � small2_normal  	P�on mousedown
  global normal_name, depressed_name
  show image "small2_depressed"
  put the long id of me into normal_name
  put the long id of image "small2_depressed" into depressed_name
  insert script of btn "button manager" into front
end mousedown

on mouseup
  hide image "small2_depressed"
  remove script of btn "button manager" from front
  modal "about_box"
  spin_logo "about_group"
  send "expand_stack" to cd 1 of stack "about_box"
end mouseup
     � *L j z   autovisible  false demo/small2_n.gif     � small3_normal  	P�on mousedown
  global normal_name, depressed_name
  show image "small3_depressed"
  put the long id of me into normal_name
  put the long id of image "small3_depressed" into depressed_name
  insert script of btn "button manager" into front
end mousedown

on mouseup
  hide image "small3_depressed"
  remove script of btn "button manager" from front
  modal "exit_box"
  spin_logo "exit_group"
  send "expand_stack" to cd 1 of stack "exit_box"
end mouseup
     � �L j z   autovisible  false demo/small3_n.gif     � small1_depressed  P "on mouseUp
  hide me
end mouseUp
     �  �L j z   autovisible  false demo/small1_d.gif     � small2_depressed  P "on mouseUp
  hide me
end mouseUp
     � *L j z   autovisible  false demo/small2_d.gif     � small3_depressed  P "on mouseUp
  hide me
end mouseUp
     � �L j z   autovisible  false demo/small3_d.gif     � 
text1.gif  	@    �  c  � Y   autovisible  false demo/text1.gif     � 
text2.gif  	@    �  c � � Y   autovisible  false demo/text2.gif     � bottomborder.gif  	@    �   ��    autoloc  960,479 demo/bottombo.gif     � leftborder.gif  	@    �      �   autloc  0,480autoloc  0,720 demo/leftbord.gif     � rightborder.gif  	@    �    �   autoloc  639,-240 demo/rightbor.gif     � topborder.gif  	@    �     �    autoloc  -320,0 demo/topborde.gif     � backdrop_group  i     � ������   autoloc  320,240   dim backdrop with border.gif  	@          �� demo/dim_back.gif   
  � 
sub title  	      �   3 +   autovisible  false           -MetaCard is an application development tool.         @ �    �  navy         
  � header1  	      �   XH &   autovisible  false           Use it to create:   � 	bullet1f   i     �   _M ?   autovisible  false
  �  	          ! c: 7           PAll standard controls are supported, so its really easy to build anything, e.g:    New Button  B
         i              	  �   � 	bullet4g   i     �   �D X   autovisible  false
  �  	           �1 P           eMetaCard uses simple drawing tools to create and build the objects which make up a MetaCard program.   | New Button  B
         �              	  �   � bullet4   a     �   �w 4   autovisible  false  �    JA             #	      

  �  	           , �f ,           mMetaCard uses simple drawing tools to create and build objects the objects which make up a MetaCard program.   � 	bullet2f   i     �   �^ a   autovisible  false
  �  	          ! �K Y           yMetaCard's intergrated development environment (IDE) allows you to modiy these controls with point and click simplicity.   � New Button  B
         �              	  �   � 	bullet3f   i     �   �X C   autovisible  false
  �  	          ! �E ;           NThe scripting language also allows complete control over anything you create.   � New Button  B
                      	  � 
  � 
sub title  	      �   3V +   autovisible  false           <If you can author, you can do it efficiently with MetaCard.     �   ! @ �    �  navy  !     � ,   � 	bullet4f   i     �  0B E   autovisible  false
  �  	          !4/ =           WYou can edit the development environment itself, as all of it was created in MetaCard!   � New Button  B
        :              	  �   � 	bullet1g   i     �  F | � 4   autovisible  false
  �  	          U � � ,           a simple address book   y New Button  B
        J �              	  �   � 	bullet2g   i     �  F � *   autovisible  false
  �  	          U � � "           "a multimedia training application   z New Button  B
        J �              	  �   � 	bullet3g   i     �  F � � +   autovisible  false
  �  	          U � � #           a CGI application   { New Button  B
        J �              	  � 
  � 
sub title  	 �     �   3K 3   autovisible  false           7MetaTalk offers unrivaled performance and flexibility.  @ �    �  navy          .
  � header1  	      �   ZM 8   autovisible  false           >It contains all the basic features you would expect, such as: 
   header2  	      �   �k    autovisible  false           !But also many advanced features:    	bullet1h   a     �   �H C   autovisible  false
     	          ! �5 ;           9Support for multiple windows, palettes and dialog boxes.   � New Button  B
         �              	  �    	bullet2h   a     �   �G <   autovisible  false
  	   	           ! �4 4           2Controls for sound, video and animation playback.        1  � New Button  B
         �              	  �   
 	bullet3h   a     �   �I ?   autovisible  false
    	           ! �6 7           3Hypertext linking and text searching capabilities.        2  � New Button  B
         �              	  �    	bullet4h   a     �   �L M   autovisible  false
     )          ! �9 E           FSupport for associative arrays - access elements by string or number.        ;    � ;      =   � New Button  B
         �              	  �    	bullet5h   a     �   �K ?   autovisible  false
    	          ! �8 7           1Custom Properties to store data with any object.   � New Button  B
         �              	  �    	bullet6h   a     �   �L H   autovisible  false
     	           ! �9 @           NThe ability to send messages to any object at a specified time in the future.        M  � New Button  B
         �              	  �    	bullet7h   a     �   �I U   autovisible  false
    	          ! �6 M           @Powerful string manipulation and pattern matching capabilities.   � New Button  B
         �              	  �    	bullet8h   a     �   �g ;   autovisible  false
    	          ! �T 3           ?The ability to send and receive information over the internet.   � New Button  B
         �              	  �   % title  	@    � { 	 � $   autovisible  trueautoloc  804,27 demo/title2.gif     � title  	@    � t  %   autoloc  800,29 demo/title3.gif     � title  	@    � E 1 $   autoloc  877,30 demo/title4.gif     � title  	@    � \  '   autoloc  890,30autovisible  true demo/title5.gif     � title  	@    � �  � *   autoloc  829,29 demo/title8.gif     � title  	@    � � 	 � '   autoloc  765,28 demo/title9.gif     � title  B
     � w     autoloc  804,27  %         	  � 	       � title  B
     � h  $   autoloc  899,29  �         	  � 	       � title  	@    � ? 7 $   autoloc  874,29 demo/title13.gif     � button manager  @Non mousemove
  global depressed_name, normal_name
  repeat while the mouse is "down"
    if the mousestack is not in "settingsabout_boxexit_boxmetacard demo2halt" then
      hide depressed_name
      next repeat
    end if
    if within(normal_name, the mouseloc) then
      if not the vis of depressed_name then
        show depressed_name
      end if
    else
      if the vis of depressed_name then
        hide depressed_name
      end if
    end if
  end repeat
  hide depressed_name
  remove script of btn "button manager" of cd 1 of stack "metacard demo2" from front
end mousemove
        � � � P             	  � 	       � title  	@    � [ 	 &   autoloc  887,28 demo/title7.gif     � 	an image  @    � � � R [   autovisible  false demo/an_image.gif     � border cover   i       s 	  ?  � border cover.gif  	@      w  
 7 demo/border_c.gif     � 	bullet7d   i     �  FYH 7   autovisible  falseautoloc  234,372  � New Button  B
       ~j              	  H   � squew4.gif  	@       J]6 / demo/squew4.gif     � 	bullet8d   i     �  � S� A   autoloc  343,115autovisible  false  � squew7.gif  	@       � W� 7 demo/squew7.gif     � New Button  B
        � �              	  H   � 	bullet9d   i     �  H s, �   autovisible  falseautoloc  222,207  � squew6.gif  	@       L }$ � demo/squew6.gif     � New Button  B
        ^ w              	  H   � 
bullet10d   i     �  E �� R   autovisible  falseautoloc  275,213  � squew5.gif  	@       W �� J demo/squew5.gif     � New Button  B
        I �              	  H   � 
bullet11d   i     �  � �H 7   autoloc  406,187autovisible  false  � New Button  B
       * �              	  H   � squew4.gif  	@       � �6 / demo/squew4.gif     � 
bullet12d   i     �  S7 4   autoloc  306,365autovisible  false  � New Button  B
        c              	  H   � squew2.gif  	@       %W% , demo/squew2.gif     � 
bullet13d   i     �  �L: 7   autoloc  483,359autovisible  false  � New Button  B
        �U              	  H   � squew1.gif  	@       �P& / demo/squew1.gif     � 
bullet14d   i     �  %� A   autovisible  falseautoloc  252,308  � squew7.gif  	@       6� 7 demo/squew7.gif     � New Button  B
        )A              	  H   � 
bullet15d   i     �  O�� -   autovisible  falseautoloc  308,424  � squew8.gif  	@       `�� % demo/squew8.gif     � New Button  B
        S�              	  H   	 button bar  i        �Z A  	 dimmed buttons.gif  	@       �R 9 demo/dimmed_b.gif   
  �         h� � $           Click the screen to pause.   	  frame1  @    �   �` �   autovisble  falseautoloc  -182,282 demo/frame1.gif     	! frame2  	@    � �� �` �   autovisble  falseautovisible  falseautoloc  182,282 demo/frame2.gif     	* 
computer1  @    � l ` �!   autovisible  false demo/comp1.gif     	+ 
computer2  @    � l ` �!   autovisible  false demo/comp2.gif     	- 
computer3  @    � l ` �!   autovisible  false demo/comp3.gif   
  	6 bullet4      �  	  �    autovisible  false           	a button          	7 miniscreen pattern.gif  @       , � L L demo/miniscre.gif   
  	J 	bullet2a       �  	 ) � �   autovisible  false           {To create interface elements, choose the appropriate tool from the toolbar and drag inside your card to create the object. 
  	M 	bullet7b       �  	 ) � �   autovisible  false           ~Clicking the "hand" icon chooses the Browse Tool.  The browse tool allows you to interact with objects rather than edit them.   	{ cgi application  @    � l ` �!   autovisible  false demo/cgi_appl.gif     	~ 	INTERNET  @    � l ` �!   autovisible  false demo/internet.gif     	� customproperties  @    � k b �!   autovisible  false demo/custompr.gif     	� button example �e�`    � � � N N   autovisible  false     New Button          	       	� button example �e�`    � � �     autovisible  false     New Button          	       	� cursor �C     � (F     autoloc  388,131autovisible  false  -         	       	� a button a ��#e    � x i � I   autovisible  false     	a button    Tab 1
Tab 2
Tab 3        	       	� cutout   a     � f � �   autovisible  false  	�    KB      j � � �        o	z$xBoQ|ivu�~�s�Rm]sSW\*Pb �J �2 � �  �� �� �� �� �p �{ �k �y �nn  	� BStyle $i`  � � �  gray   | � � � Style   	� RadioButton  E�      � � h             	       	� 	CheckBox  E�      � � h             	       	� Shadow  E�      � h             	       	� 	Pulldown  D�      � � `             	  �   	� Popup  D�      � � `             	  �   	� Cascade  D�      � `             	  �   	� 
RoundRect  E�      �( h             	       	� 
Rectangle  E�      �@ h             	       	� opaque  e�      �X h      	MenuItem         	       	� Option  D�      �( `             	  �   	� 	ComboBox  D�    � �@ `    	combobox  falsef  false            	  �   	� Tabbed  D�      �X `             	  �  	� cursor �C     �  �     autoloc  380,270autovisible  false  .         	       * slide show  @    � l ` �!   autovisible  false demo/slide_sh.gif     	� address book  	@    � l ` �!   autovisible  false demo/addressb.gif     + cdrom  @    � l ` �!   autovisible  false demo/cdrom.gif     ) 
catalogue  @    � l _ �!   autovisible  false demo/catalog.gif     	� training package  @    � l ` �!   autovisible  false demo/training.gif     	� 
money bag  @    � l ` �!   autovisible  false demo/money_ba.gif     � 	bullet5g  i     �  f 9   autovisible  false  } New Button  B
        "              	  � 
  
2 first_field 	         !G            +To control these objects, MetaCard uses an 
  
3 second_field 	         2 �             advanced object-oriented 
  
4 dinner          �2 �               � 	bullet6g   i     �  Kb W   autovisible  false
  �   	          !OO O           cDespite its power, MetaTalk is so easy to learn that almost any creature can get to grips with it.        <    � <      ? #  ~ New Button  B
        Y              	  �   	� 2.gif  @       � � � � demo/2.gif     	� 3.gif  @       � � � � demo/3.gif     	� 4.gif  @       � � � � demo/4.gif     	� 5.gif  @       � � � � demo/5.gif     	� 6.gif  @       � � � � demo/6.gif     	� 8.gif  @       � � � � demo/8.gif     	� 10.gif  @       � � � � demo/10.gif     
  12.gif  @       � � � � demo/12.gif     
 14.gif  @       � � � � demo/14.gif     
 16.gif  @       � � � � demo/16.gif     
 18.gif  @       � � � � demo/18.gif     
 elephant animation  B
 �on mouseUp
  local iid
  set the icon of me to 2226
  put 2550 into iid
  repeat 18
    wait 10 ticks
    set the icon of me to iid
    add 1 to iid
  end repeat
end mouseUp
     � k � � �   autoloc  481,242autovisible  false  �         	  � 	       
 using_depressed  @      f � � � demo/using_de.gif     
% logo  B
     �    d�   autovisible  false  �         	  � 	       
& little cutey top arrow.gif  	@      H P   demo/lcta.gif     
' little cutey bottom arrow.gif  	@      H �   demo/lcba.gif     
( arrow1  B
     � H P     autovisible  false  
&         	  � 	       
) arrow2  B
     � H �     autovisible  false  
'         	  � 	     
  
/ bullet3text  	       �   �A    scoll  10000autovisible  false          *                                                                                               Shadowed fields...     Patterned images...     Percentage bars...  Images in Buttons...    Checkboxes...     Non-scrolling fields...       Radio-buttons...       Circles...       Purple fields...    Yellow buttons...     Horizontal scrollbars...     Buttons with icons...         Menus...        Tabs...          Green scrollbars...        Borders...           Pink elephants?...                                                                                  
5 elephant animation  B
     � k � � �   autoloc  481,242autovisible  false  �         	  �   
6 address book  B     � l ` �!   autovisible  false  	�         	  � 	       
7 training package  B     � l ` �!   autovisible  false  	�         	  � 	       
: broom group  i       j � � 6  	� broom  	@    � ~ � � .   autovisible  falseautoloc  714,252 demo/broom.gif     
;   i       j � � �  	� disgruntled elephant  @    �  � � � �   autovisible  false demo/disgrunt.gif   
  
J field example  !`    � �# � 8   autovisible  false        �    
O movement_example �e�p�on mouseUp
  local rect_list, start_frame, current_frame, item_no, count
  set the rect of me to 418,98,562,169
  get the rect of me
  put 0 into count
  repeat 25
    add 10 to item 2 of it
    if item 2 of it > item 4 of it then
      repeat 10
        add 10 to item 4 of it
        add 1 to count
        put it into rect_list[count]
      end repeat
    else
      add 1 to count
      put it into rect_list[count]
    end if
  end repeat
  put the milliseconds into start_frame
  repeat
--45 frames, appox.
    get (the milliseconds-start_frame)/66
    if it > 43 then exit repeat
    put round(it) into item_no
    if item_no is 0 then put 1 into item_no
    set the rect of me to rect_list[item_no]
  end repeat
end mouseUp
     � �H � )   autovisible  false     	A Button          	       
Q clock_group   a     � � � � �   autovisible  false  	� millenium clock button.gif  	@    � � �  
   autovisible  trueautoloc  462,178 demo/mclbtn.gif     	� millenium clock.gif  	@    � � � � �   autovisible  true demo/mclk.gif     	� clock_hand   K  ������  � � �  3   originalpoints  444,209
477,168orig_points  461,250
461,193        � �� �  
E small_hand   K  ������  � � �     orig_points  461,222
461,211        � �� �  
S alterable menubar group  a     � l � � p   autovisible  false  
T 
motif bar  @      j �� g demo/motbar.gif     
U windows bar  	@      o �� a demo/winbar.gif     
V 	Menu Bar �@`      w ��              	  �   
W File �DU |on xmousedown
  show group "file group"
  set the hilite of me to true
  set the textcolor of me to "white"
end xmousedown
          black     ��  @  � (             	  �   
X Edit �D�E      � � (            	  �   
Y Tools �DE         black     ��  @ � � 0             	  �   
Z Size �D�E    � + � (    autovisible  true           	  �   
[ Style �D�E      S � ,            	  �   
\ Color �D�E      � � ,            	  �   
] Font �D�E    � � � ,    autovisible  true     MC Font Menu      	  �   
^ Help �D�E      � � (            	  �   
_ Icons   �       s �� (  
` pointer �B	d     � �     Select controls   -        	  �   
a browse �B	d     w �     Browse tool   .        	  �   
b button �B	d     � �     Button tool   /        	  �   
c field �B	d     � �     Field tool   0        	  �   
d 
scrollbar �B	d     � �     Scrollbar tool   1        	  �   
e image �B	d      �     Image tool   2        	  �   
f polygon �B	d     7 �     Graphic tool (polygon)   =        	  �   
g curve �B	d     W �     Graphic tool (curve)   :        	  �   
h 
rectangle �B	d     w �     Graphic tool (rectangle)   <        	  �   
i oval �B	d     � �     Graphic tool (oval)   9        	  �   
j 
roundrect �B	d     � �     Graphic tool (round rect)   >        	  �   
k regular �B	d     � �     Graphic tool (regular polygon)   ;        	  �   
l buttontooltip  @    �  } G    autovisible  falseautoloc  295,134 demo/buttonto.gif     
m fieldtooltip  @    � ! } <    autovisible  falseautoloc  319,134 demo/fieldtoo.gif     
n scrollbartooltip  @    � B } T    autovisible  falseautoloc  364,134 demo/scrollba.gif     
o ovaltooltip  @    � � } p    autovisible  falseautoloc  542,134 demo/ovaltool.gif     
p Tools2 �dE         black     ��  �  � <    autoloc  487,218autovisible  false      	My tools        	  � 
  
u links  h       � o � � n   autovisible  false        � zThis field contains hypertext links.  You can put hypertext links in any MetaCard field.  Links can be any size or style.         @ �    �  Blue        #  @ �    �  blue  <      A  @ ��      Red  Z      _   
v cursor �C     � � j     autoloc  380,270autovisible  false  .         	     
  
w links_info  `  � � �  gray �  � � �   autovisible  false        � �Links - A term used to described text which will work like a button.  Often used to provide cross-referencing in electronic documents. See also hypertext.    � �    yellow          � @ �    �  Blue  � 	     �   
} 
man_group  i        � K f  
z plank  	@    � h �  Y   autovisible  trueautoloc  625,220 demo/plank.gif     
{ head1  @    � H � # (   autovisible  false demo/head1.gif     
| head2  @    � H � # (   autovisible  false demo/head2.gif     
� array  @    � m ` �!   autovisible  false demo/array.gif     
� internet_application  B     � f Z -   autovisible  false  	{         	  � 	       
� send_example   a     � g � � E   autovisible  false  
� other button �e�`    � s f � '   autovisible  true     	A button          	     
  
� 
send_text 	       k � � =           )send "HideThisButton" to me in 5 seconds   
� 
zoom rect   K       ������     ~ viewing area   i     � c W3   autovisible  false  1 large mini border.gif  	@      g [ �+ demo/large_mi.gif     2    K       i ] �'     3    K       g [ �+     
� string_group  a     � � � � f   autovisible  false  
� atextnormal.gif  	@    � � � {    autoloc  488,237autovisible  true demo/atextnor.gif     
� 
atext.gif  	@    � � � {    autoloc  452,185autovisible  true demo/atext.gif     
� stringof.gif  	@    � � � H    autoloc  476,238autovisible  true demo/stringof.gif     
� window1  @    � l ` �!   autovisible  false demo/window1.gif     
� window2  @    � l ` �!   autovisible  false demo/window2.gif     
� window3  @    � l _ �!   autovisible  false demo/window3.gif   
  
� bullet1       �  	 ) � �   autovisible  false           iTo get an understanding of how MetaCard works, we'll take a look at how you create a simple application. 
  
� bullet2       �  	 � � �   autovisible  false           �Over the next few minutes, you will see how to construct an application which allows the user to enter a message to be displayed after a set period of time.        �     � 
  
� bullet3       �  	 ) � �   autovisible  false           �This will demonstrate a small sample of MetaCard's features, including: its ability to asynchronously send timed messages to objects; animation and movement commands; and basic use of variables.        �     �      �      � 

  
� bullet4       �  	 � � u   autovisible  false           JAt the end, you'll get the chance to view and edit the completed project.     
� title  B
     � Y      autoloc  887,28  �         	  	� 	     
  
� bullet7       �  	 ) � |   autovisible  false           3Lets draw the objects, or "controls" that we need. 
  
� bullet6       �  	 � � �   autovisible  false           �The area inside your stack is called a "Card".  Each stack can contain multiple cards.  These cards can share elements, or be completely unique.        n     n      ~      � 
  
� bullet5       �  	 ) � z   autovisible  false           1Lets create a blank MetaCard document, or stack. 
  
� bullet8       �  	 � � |   autovisible  false           PFirstly, we need a field for the user to enter the message they want delivered. 
  
� bullet9       �  	 � |   autovisible  false           ^We need another field for the user to specify how long to wait before delivering the message. 
  
� 	bullet10       �  	 ) � |   autovisible  false           (We need a button to "send" the message. 
  
� 	bullet11       �  	 ) � |   autovisible  false           (We also need labels for the two fields. 
  
� 	bullet12       �  	 � � �   autovisible  false           These can be created by copying the existing fields.  To do this, select both fields and then drag holding down a modifer key.        c     c      r 
  
� 	bullet13       �  	 ) � �   autovisible  false           �Lets finish each object by altering their properties.  Double-clicking on an object with the Pointer tool brings up the properties palette for that object.        x     x      � 
  
� 	bullet14 	      �  	 ) � �   autovisible  false           RWe'll add names to the other objects to make it easy to refer to them in scripts.   
� title  B�     � � 
 � %   autoloc  829,29  �         	  
� 	     
  
� bullet1       �  	 ) � �   autovisible  false           NNow that we've created the objects, we need to script them to make them work. 
  
� bullet2 	      �  	 ) � �   autovisible  false           �Let's script the button.  When it is clicked, we want to store the message from the "Message" field, and display it when the time in the timer field has elapsed.        t     t      �      � 
  
� bullet3       �  	 � s   autovisible  false           KLets edit the script for the button by bringing up its properties palette. 
  
� bullet4       �  	 ) � �   autovisible  false           �First, you enter the name of the "message" you want to respond to.  We want to respond to the button being clicked - on mouseUp.        k     k      x 
  
� bullet5       �  	 � � �   autovisible  false           LLets store the contents of the "Message" field from the card in a variable. 
  
� bullet6       �  	 ) � �   autovisible  false           kWe need to know how long to wait before delivering the message, so we put the other field into a variable. 
  
� bullet7       �  	 � � �   autovisible  false           ^Then we want to send a message to display what the user entered in when the time has elapsed. 
  
� bullet8       �  	 ) � `   autovisible  false           &And that's all we want to do for now. 
  
� 	bullet10       �  	 � � �   autovisible  false           QWe'll use the "answer" command to display the message we stored in a dialog box. 
  
� bullet9       �  	 + � �   autovisible  false           ZWhen the time has elapsed, we need another "handler" to intercept the message we created. 
  
� 	bullet13       �  	 ) � `   autovisible  false           Lets try it... 
  
� 	bullet12       �  	 ) � �   autovisible  false           CPressing the OK button compiles the script, ready for instant use. 
  
� 	bullet11       �  	 � �   autovisible  false           aNow we make the message variable local, so that it is available in all of this object's scripts.   
� contents screen group   i       �����  
� tracking_button �E�`      p > � E             	       
 New Button  B
           ��  �         	  	] 	  r 	       
 New Button �C�       �����   �         	       
 New Button �C�       ����   �         	       
 New Button  B
       ���� �  �         	  	] 	  r 	       
 New Button  B
       {�� �  �         	  	] 	  r   
 logo  B
          d�  �         	  	] 	  r 	       
 New Button  B
       d  �  �         	  	] 	  r 	       
 small1_normal  B
�on mousedown
  global normal_name, depressed_name
  show btn"small1_depressed"
  put the long id of me into normal_name
  put the long id of btn "small1_depressed" into depressed_name
  insert script of btn "button manager" of cd 1 into front
end mousedown

on mouseup
  hide btn "small1_depressed"
  remove script of btn "button manager" of cd 1 from front
  modal "settings"
  spin_logo "settings_group"
  send "expand_stack" to cd 1 of stack "settings"
end mouseup
        �L j z  �         	  	] 	  r 	       
 small2_normal  B
�on mousedown
  global normal_name, depressed_name
  show btn "small2_depressed"
  put the long id of me into normal_name
  put the long id of btn "small2_depressed" into depressed_name
  insert script of btn "button manager" of cd 1 into front
end mousedown

on mouseup
  hide btn "small2_depressed"
  remove script of btn "button manager" of cd 1 from front
  modal "about_box"
  spin_logo "about_group"
  send "expand_stack" to cd 1 of stack "about_box"
end mouseup
       *L j z  �         	  	] 	  r 	       
 small3_normal  B
�on mousedown
  global normal_name, depressed_name
  show btn "small3_depressed"
  put the long id of me into normal_name
  put the long id of btn "small3_depressed" into depressed_name
  insert script of btn "button manager" of cd 1 into front
end mousedown

on mouseup
  hide btn "small3_depressed"
  remove script of btn "button manager" of cd 1 from front
  modal "exit_box"
  spin_logo "exit_group"
  send "expand_stack" to cd 1 of stack "exit_box"
end mouseup
       �L j z  �         	  	] 	  r 	       
 samples folder inverse.gif  	@      f  � � demo/samp_fol.gif     � sample app final border.gif  	P �on mouseUp
  hide image "organiser_depressed"
  if there is an image "dissection_depressed" then hide image "dissection_depressed"
end mouseUp
       i  � � demo/samp_fb.gif     i organiser_normal  	P�on mousedown
  global normal_name, depressed_name
  if there is an image "dissection_depressed" then hide image "dissection_depressed"
  show image "organiser_depressed"
  put the long id of me into normal_name
  put the long id of image "organiser_depressed" into depressed_name
  insert script of btn "button manager" of cd 1 into front
end mousedown

on mouseup
  global now_time
  put the ticks into now_time
  show image "organiser_depressed"
  remove script of btn "button manager"of cd 1 from front
end mouseup

on mousedoubleup
  global dissection_mode
  put false into dissection_mode
  show grc "zoom rect" with visual effect zoom open fast
  go "personal organiser"
end mousedoubleup
       � C E = demo/org_nor.gif     h organiser_depressed  Pmon mouseUp
  global now_time
  if the ticks-now_time < 20 then
    show grc "zoom rect" with visual effect zoom open fast
    open stack "personal organiser"
  end if
end mouseUp

on mousedoubleup
  global dissection_mode
  put false into dissection_mode
  show grc "zoom rect" with visual effect zoom open fast
  open stack "personal organiser"
end mousedoubleup
       � C K = demo/org_dep.gif     � small1_depressed  B�on mousedown
  global normal_name, depressed_name
  show btn"small1_depressed"
  put the long id of me into normal_name
  put the long id of btn "small1_depressed" into depressed_name
  insert script of btn "button manager" into front
end mousedown

on mouseup
  global advanced_user
  put true into advanced_user
  hide btn "small1_depressed"
  remove script of btn "button manager" from front
  modal "settings"
  spin_logo "settings_group"
  send "expand_stack" to cd 1 of stack "settings"
end mouseup
        �L j z  �         	  	] 	  r   � small2_depressed  B�on mousedown
  global normal_name, depressed_name
  show btn "small2_depressed"
  put the long id of me into normal_name
  put the long id of btn "small2_depressed" into depressed_name
  insert script of btn "button manager" of cd 1 into front
end mousedown

on mouseup
  hide btn "small2_depressed"
  remove script of btn "button manager" of cd 1 from front
  modal "about_box"
  spin_logo "about_group"
  send "expand_stack" to cd 1 of stack "about_box"
end mouseup
       *L j z  �         	  	] 	  r   � small3_depressed  B�on mousedown
  global normal_name, depressed_name
  show btn "small3_depressed"
  put the long id of me into normal_name
  put the long id of btn "small3_depressed" into depressed_name
  insert script of btn "button manager" of cd 1 into front
end mousedown

on mouseup
  hide btn "small3_depressed"
  remove script of btn "button manager" of cd 1 from front
  modal "exit_box"
  spin_logo "exit_group"
  send "expand_stack" to cd 1 of stack "exit_box"
end mouseup
       �L j z  �         	  	] 	  r   
 using normal  	Pon mousedown
  global normal_name, depressed_name
  show image "using_depressed"
  put the long id of me into normal_name
  put the long id of image "using_depressed" into depressed_name
  insert script of btn "button manager" of cd 1 into front
end mousedown

on mouseup
  global advanced_user
  local it
  hide image "using_depressed"
  remove script of btn "button manager"of cd 1 from front
  if advanced_user is false then
    visual effect dissolve
    go next cd
  else
    visual effect dissolve
    go cd 14
  end if
end mouseup
       f � � � demo/using_no.gif     
� New Button  B
        c  � Y  �         	  r 	       
� New Button  B
        ] �	 Z  �         	  r 	     
  
� 	bullet14       �  	 � � �   autovisible  false           Don't forget, the "Answer" dialog box is just a MetaCard stack.  You're free to edit it, or even create your own from scratch.        q     q   
� title  	@    � C 
1 '   autoloc  875,29 demo/title16.gif   
  
� bullet1       �  	 ) � �   autovisible  false           �Lets display the message on a banner attached to a van.  When the time has elapsed, we'll make the van "drive" across the screen.        g     g      v 
   bullet2       �  	 ) � �   autovisible  false           'First, lets create a new, blank, card. 
    bullet3       �  	 ) � �   autovisible  false           ,Now lets import the delivery truck graphic. 
  $ bullet4       �  	 ) � �   autovisible  false           <Now, we'll draw the "banner" to be pulled behind the truck. 
  ) bullet5       �  	 ) � �   autovisible  false           ~Now, we'll put the truck and the banner together into a group.  This allows them to be moved across the screen as one object.        v     v 
  * bullet6       �  	 � � �   autovisible  false           mNote that groups have many other uses, including allowing sets of objects to be displayed on multiple cards. 
  , bullet7 	      �  	 ) �5   autovisible  false           �Lets import the scenery for the truck to drive through.  We'll import a foreground and a background.  These files were created in a paint package, and saved as GIF with transparent backgrounds.        f     f      w      �      �      �      � 
  3 	bullet10       �  	 ) � �   autovisible  false           mThe truck and banner are now in front of the foreground.  Lets select the foreground and move it to the top. 
  5 	bullet11       �  	 ) � �   autovisible  false           �Now would be a good time to introduce the message box.  This makes a useful addition to the palettes, and allows sending messages and commands.        j     j      y      � 	
  6 	bullet12       �  	 � � �   autovisible  false           ?For example, lets get the pixel co-ordinates of the van group. 
  7 	bullet13       �  	 ) � �   autovisible  false           WAlso, lets set the name of the group to "van" without going to the properties palette. 
  8 	bullet14       �  	 ) � �   autovisible  false           �Now, lets edit the card script to do the animation.  We could use the properties palette, but as a shortcut we'll type "ALT-Control-C".        w     w 
  9 	bullet15       �  	 ) �C   autovisible  false           �We need to move the truck off the screen before doing the animation.  We'll do this in the preOpenCard message handler.  The preOpenCard message is ideal, because it is sent before the card is displayed.        g     g      y      �      �      �      � 

  : 	bullet16       �  	 ) � �   autovisible  false           .Lets move it well off the left of the screen. 
  ; 	bullet17       �  	 � � �   autovisible  false           CLets do the animation after the card is displayed - "on openCard". 
  < 	bullet18       �  	 ) � �   autovisible  false           HWe want the group to move to right, and finish completely off the card. 
  = 	bullet19       �  	 � � �   autovisible  false           )Thats all we need to do to make it move! 
  > 	bullet20       �  	 ) � �   autovisible  false           nLets edit the script of the "Do it" button on the previous card.  We'll do it from the message box this time. 
  ? 	bullet21       �  	 ) � �   autovisible  false           wRather than putting the "Message" into a variable, lets put it into the field created in the banner, on the next card.        l     l 

  @ 	bullet22       �  	 � � �   autovisible  false           HAnd instead of bringing up a dialog box, we simply go to the next card. 
  A 	bullet23       �  	 ) � �   autovisible  false           �This is only one small example.  It could be expanded further in many ways.  Examine the finished version and try editing the scripts.        j     j      ~   E about_group  a     �  3  �   autovisible  false  M New Button  B
        1 d �  K         	  � 	  	] 	  r 	       N !aboutve.gif  	@    �    V,   autoloc  51,157 demo/xaboutve.gif     I Settings_group  a     �  3  �   autoloc  51,240autovisible  false  J !setting.gif  	@    �    V,   autoloc  51,157 demo/xsetting.gif     K !blankve.gif  	@    �  3 V �   autoloc  51,390 demo/xblankve.gif     O exit_group  a     �  3  �   autovisible  false  P New Button  B
        - d �  K         	  � 	  	] 	  r   R !exitver.gif  	@         V, demo/xexitver.gif     Z backdrop_button  B     �     ��   autovisible  falseautoloc  320,240  �         	  H 	       ] small_settings  a     �   
 l�   autovisible  false  \ !shortse.gif  @         V demo/xshortse.gif     ^ New Button  B
        9    \         	  � 	  � 	  r 	  � 	  � 	       ` backdrop_button  B
        �  ��  �         	  _ 	       j only_limit  	@    �     ��   autovisible  false demo/only_lim.gif   
  [ slogan        ������  � 4� 4   color  pinkautovisible  false        _ '..it doesn't stop at pink elephants...          @ ��33��   @ � � �  white     l !elanilo.gif  	@       � � Q demo/xelanilo.gif     m 	elephant  B
        b � � z  r         	  k   n 
eye_balls  @      7 �   demo/eye_ball.gif     o heart  @      6 �   demo/heart.gif     p heart_path   C      0 �  >     \3 �3 �3 �3 �3 �3 �2 �2 �2 �1 �1 �1 �1 �1 �2 �3 �4 �5 �6 �7 �7 �8 �8 �9 �9 �9 �9 �9 �9 �9 �8 �7 �7 �6 �5 �5 �4 �3 �3 �2 �2 �2 �2 �2 �2 �2 �2 �2 �3 �4 �5 �6 �7 �8 �9 �: �; �< �= �> �> �? �? �@ �@ �@ �@ �@ �@ �@ �@ �@ �? �> �> �= �= �= �= �= �= �= �= �= ==>?@@AB  q bubble  @      6 �   demo/bubble.gif     r !elani1.gif  @       �`  T demo/xelani1.gif     s !elani2.gif  @       2c v S demo/xelani2.gif     t !elani3.gif  @       �^ v T demo/xelani3.gif     u !elianir.gi0  @       �� S v demo/xelianr0.gif     v !elianir.gi1  @        $ T v demo/xelianr1.gif     w !elianir.gif  @        Q T � demo/xelianr.gif     x !elianil.gif  @       M � T � demo/xelianl.gif     y !elianil.gi0  @       S � S v demo/xelianl0.gif     z !elianil.gi1  @       b g T v demo/xelianl1.gif     { !elianic.gif  @      n , C W demo/xelianic.gif     | !elanisk.gif  @      � 5 v S demo/xelanisk.gif     } !elaniel.gif  @      ' B C W demo/xelaniel.gif   
  � off_screen  !`      � >         
�  
  � off_screen  !`      �	 +         	�    � 
map_group   a	�on mouseEnter
  if "message" is in the customkeys of the target then put the message of the target into fld "info"
  else if fld "info" is not empty then put empty into fld "info"
end mouseEnter

on mouseLeave
  if the message of the target is not empty then
    if fld "info" is not empty then put empty into fld "info" --i.e. the object left was selectable
  end if
end mouseLeave

on mouseup
  global advanced_user, dissection_mode
  if the destination of the target is empty then
    beep
    exit mouseup
  end if
  get the destination of the target
  if it is "organizer" then
    hide group "map_group" with visual effect dissolve very fast
    open stack "personal organiser"
    exit mouseup
  end if
  if char 1 of it is "b" and char 2 of it is not "e" then
    --beginner
    put false into advanced_user
    delete char 1 of it
    hide group "map_group" with visual effect dissolve very fast
    go cd it
    exit mouseup
  end if
  if char 1 of it is "a" and char 2 of it is not in "bd" then
    --advanced
    put true into advanced_user
    delete char 1 of it
    hide group "map_group" with visual effect dissolve very fast
    go cd it
    exit mouseup
  end if
  if it is "exit" then
    hide group "map_group" with visual effect dissolve very fast
    click at the loc of control "small3_normal"
    exit mouseup
  end if
  if it is "about" then
    hide group "map_group" with visual effect dissolve very fast
    click at the loc of control "small2_normal"
    exit mouseup
  end if
  if it is "settings" then
    hide group "map_group" with visual effect dissolve very fast
    click at the loc of control "small1_normal"
    exit mouseup
  end if
  if it is "behind" then
    hide group "map_group" with visual effect dissolve very fast
    open stack "how_work"
    exit mouseup
  end if
  if it is "beginner_dissect" then
    hide group "map_group" with visual effect dissolve very fast
    put false into advanced_user
    put true into dissection_mode
    open stack "personal organiser"
    exit mouseup
  end if
  if it is "advanced_dissect" then
    hide group "map_group" with visual effect dissolve very fast
    put true into advanced_user
    put true into dissection_mode
    open stack "personal organiser"
    exit mouseup
  end if
  if it is "delivery" then
    hide group "map_group" with visual effect dissolve very fast
    open stack "delivery example"
    exit mouseup
  end if
end mouseup
       �����  � New Button  Bj         ~�  �         	  � 	  	] 	  r 	       � new map.gif  	@       `���� demo/new_map.gif     � New Button  B
          d�  �         	  � 	  	] 	  r 	       � New Button �A�           �  g � �    destination  b2message  IAn introduction showing some examples of what can be built with MetaCard.             	       � New Button �A�           �  g � �    destination  b3message  6An overview of some of the many object types possible.             	       � New Button �A�           �  g � �    destination  b4message  \Information about the many ways and platforms available to distribute MetaCard applications.             	       � New Button �A�           �  g � �    destination  b5message   A brief summary of this section.             	       � New Button �A�           �  g) �    destination  b7message  )A demonstration of how to create objects.             	       � New Button �A�           �  gA �    destination  b8message  'A demonstration of how to edit objects.             	       � New Button �A�           �  gW �    destination  b9message  0A basic introduction to scripting with MetaTalk.             	       � New Button �A�           �  g� �    destination  	organizermessage  OView an example of an application created with MetaCard - a Personal Organizer.             	       � New Button �A�           �  g� �    destination  beginner_dissectmessage  ODissassemble the Personal Organizer example.  Learn how it works and was built.             	       � New Button �A�           �  � �    destination  a11message  IAn introduction showing some examples of what can be built with MetaCard.             	       � New Button �A�           �  � �    destination  a12message  +An overview of how you build with MetaCard.             	       � New Button �A�           �  � �    destination  a13message  8A quick look at the amazing MetaTalk scripting language.             	       � New Button �A�           �  � �    destination  a4message  \Information about the many ways and platforms available to distribute MetaCard applications.             	       � New Button �A�           �  � �    destination  a5message   A brief summary of this section.             	       � New Button �A�           � ) �    destination  a14message  5A demonstration of creating and manipulating objects.             	       � New Button �A�           � A �    destination  a15message  ZA demonstration of using the MetaTalk scripting language to complete a simple application.             	       � New Button �A�           � W �    destination  a16message  TAn extension to the previous section showing the addition of graphics and animation.             	       � New Button �A�           � � �    destination  	organizermessage  OView an example of an application created with MetaCard - a Personal Organizer.             	       � New Button �A�           � � �    destination  advanced_dissectmessage  ODissassemble the Personal Organizer example.  Learn how it works and was built.             	       � New Button �A�           � � � �    destination  settingsmessage  _Change the demo playback settings.  Options for display, the black background and sound volume.             	       � New Button �A�           � � � �    destination  aboutmessage  +Information about the authors of this demo.             	       � New Button �A�           � � � �    destination  exitmessage  Pricing information and exit.             	     
  � info         � � �        �    	]    r    � New Button �A�   ������  � � u �    message  You are here.             	       � cancel BC�P �on mouseEnter
end mouseEnter

on focusIN
end focusIn

on mouseLeave
end mouseLeave

on mouseUp
  hide group "map_group" with visual effect dissolve very fast
end mouseUp
     � � D    
linewidth  0  [�M           	       � New Button �A�           � � � �    destination  behindmessage  IView some notes on how this demo was made, and how you can take it apart.             	       � New Button �A�           � � �    destination  deliverymessage  %Opens the completed delivery example.             	       � map_depressed  @    �  eL  z   autovisible  false demo/map_depr.gif     � map_normal  	P�on mousedown
  global normal_name, depressed_name
  show image "map_depressed"
  put the long id of me into normal_name
  put the long id of image "map_depressed" into depressed_name
  insert script of btn "button manager" into front
end mousedown

on mouseup
  hide image "map_depressed"
  remove script of btn "button manager" from front
 show group "map_group" with visual effect dissolve very fast
end mouseup
     �  eL  z   autovisible  false demo/map_norm.gif     � New Button B� Won mouseUp
  show group "map_group" with visual effect dissolve very fast
end mouseUp
        eL  z  �  �         	  r 	       � sample projects text1.gif  	@       f  � S demo/samp_pr1.gif     � sample projects text2.gif  	@       f � � S demo/samp_pr2.gif     � dissection_normal  	P�on mousedown
  global normal_name, depressed_name
  hide image "organiser_depressed"
  show image "dissection_depressed"
  put the long id of me into normal_name
  put the long id of image "dissection_depressed" into depressed_name
  insert script of btn "button manager" of cd 1 into front
end mousedown

on mouseup
  global now_time
  put the ticks into now_time
  show image "dissection_depressed"
  remove script of btn "button manager"of cd 1 from front
end mouseup

on mousedoubleup
  global dissection_mode
  put true into dissection_mode
  show grc "zoom rect" with visual effect zoom open fast
  open stack "personal organiser"
end mousedoubleup
       } C E = demo/disnor.gif     � dissection_depressed  	Plon mouseUp
  global now_time
  if the ticks-now_time < 20 then
    show grc "zoom rect" with visual effect zoom open fast
    open stack "personal organiser"
  end if
end mouseUp

on mousedoubleup
  global dissection_mode
  put true into dissection_mode
  show grc "zoom rect" with visual effect zoom open fast
  open stack "personal organiser"
end mousedoubleup
       z C K = demo/disdep.gif     � New Button B� Won mouseUp
  show group "map_group" with visual effect dissolve very fast
end mouseUp
        eL  z  �  �         	  	]   � 
zoom rect   K       ������     � black  @    � n b � �   autovisible  false demo/black.gif     � off  @    � -;     autovisible  false demo/off.gif     � on  @    � C<     autovisible  false demo/on.gif     � play  @    � B"     autovisible  false demo/play.gif     � stop  @    � -"     autovisible  false demo/stop.gif     � video  @    � g Y �   autovisible  false demo/video.gif     � 	presents  @    � n b � �   autovisible  false demo/presents.gif     � fake descriptor end.gif  	@      \  ) demo/fake_des.gif     � dissection screen text.gif  	@       r ; � � demo/distext.gif     � New Button  
        a  �2  	� �           	  	] 	       � badstatic.wav   	`                f,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,��$$���.># /$ž$��8'�(��&�S��A������2*�*��.-��%:�����[g�#��8�'8+2��:&��A(�E�![�(S, %%����&.4A�8���(�!�S�)��0*��(�+����E�0.��>��!<�A�������[�$�!��I����M��#�����������>�$8��>��>M�> �>�-���ţ4�-$>�$"�$�4��'�*�#���"��>����+�����������>�$�2��ż���,���g�)����ɼM>,>$�>�$ţ$'�+�-�$�6��'�M6���������E�$���-��S�A��!�����������>�$)�A>��><�>�>�,�[�6�)�%$>8$ �$�-��*�,I$+����&��0�)>�>�>�>�[��>�$�#��.��>�)>�>S>&>�>�>�>> >$+>:$�>$">->.<$0 ���(26>$�$�$�<>�$����� �:$�$�$[$�*�8�g>�$�>�$>4$A$>$+&$�$�$�$>$#$$'$#$.#/$�������&����"�<>�$������&�I#�!�+�<>>#>$M'0/$���.����6#��<!&(*6+E[0*��E��������[[00**S�"������������������������������������������������E����������)������������������������������+���"���MgEE2,#)E�����۴���>04[��������[Mg�������MES������S66E��ͯ���E>EŲ��MM簭�64E�����������E62S������M�����������ɸ���g��������������Mg��gS2A�g�<()E�����g/<M�����������ͺ�������Eg�������������۸����I>A<6������I8EE��Ӻ���[E����ͯ���SES��[E>Ӯ���A2����EE�ɾ��IM�����ź��gg���g�����gg����E/6�Ÿ���& "(6E�I</:Sg�ů���EE箭��EgŰ��gSE竴��g����gg<S��紬���ME<g۰�����EM2g۴������gg�۲���g44级��EEM�������EI�Ű�gE�������gg�����E<S����EEEgۯ���g��g����I<E[�8.'',2A<<�����EA����M<E篩�����ź�����Egg�g4>EŮ����ggE��g������SE��������M/22���A/gŢ����g�g<A2Sg���������[22<:2/*/*>E�����������I/22M�[Sgg�������><E���<)!.8EA[����ɾ��I22<羰��������gg���>Ig������;�������gE<gۺ���������������ggɰ��><Ag������g4<<紬��������gg;���gEž��۾��g</>紺����AgS�����g���E[�����[E4'.SM<2Egg�gggg��������I64g�������EE>>����g������ۼ���gI����gۮ���02>۰���gEEE篰��E<g�����g<>�۴���>>8<�ů��gS�����gI>�������MA<Sg����Ӯ��gE����纰���A<24g��E:*# *:۰����g2A�����A,S����������ɴ����S���ɮ����M͡�g,S����,-�ɺg2ͦ���SM���g2ɮ������S22I�������S<AM�<�ɤ����2M�M2/4ɢ����[����M6MS�������������2-,2S,2".("6MӺ������M����,,0�������M--ţ���4(ɰ���> 6���������M[22E����������EIɡ���*,M���M$:ɰ������g2,[��S22竡����MM2>�������2<,IM26M������硡��MM[�M�g���<+M�����MM2MM�������/22������,,"S������������MIӫ����M22MM������:/Mͭ������ɸ�M�g2����gMg۰ɰ���S.2������M2M����ɾ��ɰ��M,:ɬ����M����,"2M�������4MM������<""/����A ��������������g#2S����0E�۰ɸ�MMM۩���g2g�����簰������,8����,M��������I6,S�����-,[���<,ɨ�������窪��,Ig����,MMM�����g2g����:2,,<����MMͭ���<		&۫��)I6[�M22[�����ӡ�����M�������MMӰ����ɲ�[����������6,-M����ɮ���S8�ͭ�����,0����M%ͥ���MM22A۩���>,Ӯ���S22�������MM�������ɰɰ��ɫ����M���6",,�����'"#222$�MA,�ɩ����������ɫ��g�Mͯ�����Ű������������������MͰ���������M,S����E2�ɩ���M,/۫����MM<�������ɫ���gM�g����2"+g۩����,),Sɶ�Ӱ�2M2������������<.,�A�M竡��M[�����M2<�ɰ�����8������S24������[2�ӫ���2�������������M;�����Ű����M[2ͯɶ�����������竫�>"0Ө�������M�2Ӱ��2[����A2�ۯ�����6,,����,,Sū�"!!/��22[�����2Aۧ���������ɾ���羫��������,2:����Sɰ�gM68�����ɰ��**"g������S���g���S<2ɰɲS۰����I2ۯ������-"4�����MM���<22g�簫��I$'竗����[M+">����:#0MM0"<���S.,0�����[�����ɰ��IEɾ���g4�Ӯ�����,".����M������2:ɰ������M2Ӹ��Mg����,,&[�����S:Mɤ���6<ɫ��g,,.���S/4M���ͥ�������$I���,,&������ɫ�88Ŭ��2$2Ӻ62,MMM�ۨ����M������M����M28�����[)[������2[ɫ�����2���ɯ������S>,,/۪�����0:A2ӫ����M22����:Sɰ�ɰ����4"2۞���2-Sɶ���6ɫ������:,,�����S�MMg��g'#!/:��gA,͡����:����������M/���g�����M2M۰�������/M�����۩���g!)�ɫ�������Ŭ����,.8���M�ɰ����M����ɫ�2+".�����M������.,22۰��������22�����>24�I,���M2g���("+-8Ͱ���������������2�����确�/S�����-4���M������ɧ��S2�ɤ���ɰg,E����22������Ӱ��MM2�26�����M,MS[�������M22ɾ��Ӱ����MӮ����MM2[�ɫ����.8�������MM4#g����$,"I�������2A����ɨ����MM��ū��S����.$,�����M,,�۠����0%S����ɬ�����۴������MA,Mɯ�ɰ���,"A�����MI2>����g"/M����������2,2���SM����6'8M��������M"""+g����M,缰M�[簰�����簰�ɰ����, "ۡ������gM����S����S�����,<������MM8�����ɰ�����ɬ�6,0A��������������������>M����ɰ����<$I����6.2�����ͮ���M����S�M&:��2[���[M����+6����g,Eɠ����0ɡ��:"0�����[2IA������0,,:������[S��ɸ����2MM���ͼ�����MA[6�ɡ���S����Ů���2/4�����g�2M2��ɺM�A�/,ۦ���M竚��2����8"4-(�2>Iӟ���.�����ɶ��ɰ�������ɰ�MMM硞��E,>۩�������A+)�ɰ�۰������ɸɬ����SM0I����ɺ�����MS�gM����S&"M͜��$+����[&����[*+/�簤��M/[����<,�۰IӼ���S&#M/!#�ɾ%,I��gM�����&6�����ū��ɼ細����>4�ӟ���[�ɭ���22硖������,,簡��E#(矝��M2>�Ţ��A,/[�����+A����2,���6>/S��������2>���[0Ӱ������8"M��������M,2+>���-"g��ɶ������ɫ��MMM���2-������>ɰ���۞���MM22MM�����g2M���� "2���������2M2��Ű���������&2����4<S����2����4/����[."�M��g�g�M[�����22.6M������2�����4"+2,,0����62瞐��I$"M�ɰ�������-M2E2:������0"8���A,>�����/>������,/��������gggg������SS�ӬA0$�����>$ۨ�����4#硗��0%E�������0 (����:!4������#g����AA����((-M稝����AIg���E([(<Ӻ�����0"+����
 /[�gA[AI�����A���E���������S�2 6gA�������AAA��������' ,I��������A�����AA����� ��������� ������������������ �������0���� .�����6������'	[��  ��������I�������������:��� �����A  ��������������������:-���������� �����8�����ͬ����������������������������������6�������������������������� ��������  A�>���������������� ���ە���4 g���/2����� ������ M�����6����I������� �����-����	<����͞���/���  ����������������:������� ���� ��������$������ S�������������!���[
 E�����8́���  [�����	 ���������< ۏ��S����#  ��<(� �� A����2�������,  ������	�������������������#���  ������������ ���������'���[���� ����,	 �������) ş�� ������������ <�������
���<>���(���������������8#� �������2ş��A ���������� ����������������� ��������((���� 	�����[�#����#%�����ş�� � ��������.���������������������8>���� ( ������� ����͟ ��� $������&���A������������,����$  �����":���������'�>����������������M,�������������� ������"����$6 �������$>�����ۍ������������S+A������*<����0'���������������� M���������������0 /�����������������8����� ������(�����,������������ӟ�����>��������������ے��������8�͈����* [������0����� E��������������M�����������������������������������   @  � 
click.wav   	`      et"r mc    k����[MISSMSg���ө%(�"M�-E0*0:�[��E�I�M//60(��������
	0��A8��S��������M2$!E��������)(4綫   @  � earthquake.wav   	`                Cc�����������������������������������������������������SSIEIS�������[IIISg����������SIEEI������������S>64:M����gSSS[��������gSSg�������SEEIg���������������M<:<I�����������������[S[�����������[[����������[���������gA404E���������SSISSS[������������g[������SIIIS[�������������[[�����[SSg����SIEMg��ɾ����SS[��SSS[[���������[[�Ӽ����[[���������������[IEIg������[SMIE>ES�������[[�����������������������gE>>M缴�����������������۶�����Ͷ��������>*"0ۯ��MI[�[4&'A��S<4>Ų�������MA>EEES�����[����E2'!(I������������0#E������������S6//A�����-.۪����gA>S�E::>S�������ɼ���������E-# 8��������[%(>[S[�����E2,,:�ż��IE>A::I����������S0(&)6g��������[IEEM�S6+((%#%,<ۮ����������>#%-<۰��������S4$"/����������4$.>��������������gA/#*S���������M4.&##,Eͯ����8/4g����>24:>SS:.&&,4>M��������-"#!%:������������</--04AgӰ������4(*<ɭ�0).M���>.))-6M筝�����8&!':�Ӻ�����E//Iɯ�����ū�����I$(06:<>>AEI�����������g>)"#.���������*'ӟ���������I)#/A����������M44<IS������/$S������M66:404:SӴ��4%")EͰ���������g,"&.>������A/),8������6+(),0M۰������SEE>>>I����S<6E۴�������Ÿ��>*!"/[�Ӽ����������E &A������[6--:�������>0.,,,0Iɮ���64>S�����gA6<IE>Mӭ�������."#+6>4*%%*8����������>46EME4(#'<Ӻ�����M4/<ͩ����g&".[����6')8�������AE�������A"����:%+[������Ÿ�S40>�����[E紬��IAESI6E�����/"!2��������&!6SS</-6������SSI64I������-![�������MIM������2"-g��SEMSEE������<$ .M;��������������E0))-8���E M�������4'&,4>8, %�����E!0��gE>E<66A���������>'+ۨ����82A͸��������I/((),6I[E.'(.AӶ����.(�ż������������S:/0:M�����������ɾ���������>0(%'.:S�Ŵ����SA60/08ES����E404>I[���������[ME>>EESSSSSE>86::S۾��������[<6:>Ig�ͼ���������ž������������SIEM�Ŵ������SE::840/0<���������E6-,,-/0:S۶���������<+$"$*0AS��������������SIISS[����S>64046>E[SA668I�������SI>86:<>I[����������������A448Aͺ���������������������M86A[���SIIE:2-(&(.:S����gSSISS��SS[gSSS[�������[Sg�Ӿ����A8:AgŴ��������������������I<2-,,/28:80--0<[�����E4)$#'2I�MEIŴ���������ž����������������[[SE8/-/<ɴ�������M4-,/<���ź����S2+).4:6-'%%,6�����������I&!0ӫ�������M*%'6����I4/0/./8�����Ÿ��E0,,2Mɴ���g�����M-/S���SEI������������A)*Š��������������S.%%/[�����</2Ag>+$#%.<簣����:08۩�����M68EM:(A���������6%")/-)%#&2竝��������E+"".[����Ŷ����M+%g������-,[��������gA4&.ͨ����������4
>���0$",[�&'.8S�������M),E�������[2,4������Ӱ������+ +246:::>ASͮ������gI/"$<��������A4����������/'2SŰ�������804<ESӭ����M!-ť�����64440/4<����M+!"/[�����������6##'2S������I2*(.AͲ����>-'&(,6�������gE>>::<M����A48[��������ź��S/#%8�������������*-�������<-,.E������g2-,)),4g����A04A�����E44>E::[���������>%"%/:8/(%&.Iʹ�������[84<II>.$#.[�������g>/0[������6 ':Ͱ��M-'.Iɮ�����M>S�������)2���g+!#6Ӵ����;��<04[Ŵ���ISŮ���SE>E[<8�����A)(M�������8*A[I4./Eɮ���gSS[>48箢���M .��������[II[ӫ���M(&<���IISSEIŨ����-&8�Ÿ�������������[:,)+0I����+-�������M,&(/8>2%/������*(A���MEE>:6:Mͮ�������g0M�����g, %8Ӱ�2)*0I������g.#)EӾ��EE���[[ۺ���<*"")AŮ�����S$!-SSSS[�������[S[�������I::>Sʹ��������������������S>4.-,-04::2-,.8S�����M6+%"&/Ag�SEE[ɶ���������������������������[[SI:/-.8[Ͷ�������[8.,/8[���ż����g6-)-288/(%%)2[����������*,g��������-%&0g���S600//-4S�����ź��M2-,/IӶ����[�Ŷ��[0"*I���gEEg�����������I-"$����������������0&%+I�����E//>gE.%#%,8������>06������g64ASA,4���������>("'..+&#%/g����������M/#",I����ɸ����/ A������4(I��������I8*(�����������E
0����6& )E�&&-4Mť������-!)>�Ŵ�����6,0S������۶������2)046:<:>>I۰�������M4$"2ɦ������g!,�����������8"%/IӴ��������<02:EM簡����'(穜����:4440/0:g���g."",I�����������>&"&/E������S6,(,<綮���M.(&(,2S�������E>>:::E����E44Mů������ż��g2$#2[�Ų����������0)[������E/,,>ɥ�����6.,)),0S����M00<g�����M64:E<:M���������M)"%/8:0(%%->۸�������<48EIA/&#*Iɶ�����*������:2AӺ��������M0(((,4I[S2(&+:S羭����8'�����S<6<M����gMII<4-)'&,4I����SSIISg��[SSSSS[�������[S[�������M::>MӴ���������������������SA4/-,-04::2-,-6M�����M8,%"%.>[�SEESɸ���������������������������[[[I</-.6SӸ�������[8.,.8S���ż����:-),2680)%%(2S�����������,+[���������.%&/[���[80///-2M�����ź��S4-,/E۸����[�Ÿ��g2#)E���EE[�����������M.#"g����������������4&%*E�����I//<gE/%#%+6g������A24g������64ASA,/���������E)!'-.,&#%.[����������M/$"*E����͸�����2!<������8 'E���������I:+'g�����������S
.����8& (>�������M( %<������-#<Ͱ�������������+'g����������������>,&*:羼�E604[������4,4�����A:Iɰ��I40E۶������!)���������2&"%,6Ŵ���������:/2Sɴ���8&$-4I�����A6<M��S>>I�I2,/I����I-&/g���>" +I��������4()4g�I/&'*-/Aӭ������M4028>A>[�������60:���������[[����>) *[�����S4,(#%>Ŵ���I<424>ɼ��[I[ɰ��g8<Ӫ������������S<448AS���������[E>>AEISSSSIE>66:>[Ӹ��������I88:>S�Ÿ���������ż�����������SEESۼ�������E>::64//4I۸��������g<0-,--/4>gɲ���������S4'""'-4Ig���ž���������gSIISSg�����gI:42046EM[I<66<S�������gME:66:>ESg����������������S:44:M�����������������������[A68E���SMI>8/,(&)/Ag���[SIIS[�[SSSSSS�������gS[�Ŷ����[<6<E缯��������������������[E8/-,-04::4/,-4E�����gA/&"#+8S�[IESۼ����������ż���������������g[[SA2--2E羰�������A/,-2I����������E/)+/6:4,%%(.>ӯ���������4&>���������8'%+A͸��<2///-/AӴ��Ӿ��:/,-8�����gɼ���<'$6���IESͯ���������4&:����������������<)%&6ӫ���2/4M�S4&##(/I������S40I�������<4<IE0!$۟�������g.!%,/-(##)>����������6' %8�����������<%.������S&#4۫�������S>/"!>������������'
"第�E)"%2�'&+0A��������:%$2[͸�����E.,>ͮ�����Ŭ�����M#%,466:::>E��������S>* *[��������- ����������I(,:���������I406AIg������2>������M4460/06EӲ��8&%:ӯ���������g, #,8筟���>.()2[������6*&().>Ӱ������M>>:::Ag����S84>粭����������>) *E�ͼ����������I"!6������g4,,2������A/-,)).>Ӯ���608M�����g>46EE:A篣�������0""(4>4,&%)4���������A44AIE6*#&8缲�����S6/8۬�����*!,M����<((6[�������EA������SS���A&(M������ź�g40:����gE�����MEAMM6>�����2#/ͧ������*2MS>0-2g�����SS�M84E������2E��������SII�����6#+S��[EISIEg������E&,E����������������I2+),6g���[!>�������8(&*4<:.!"M�����g!.g��EAE>66>g���������E*)g�����<2>Ӻ��������S0(((,4E[I/('->gۺ�����0%�����M86A[���SIIE:4-(&'-8S����SSIMS��SS[gSSS[�������[S[�Ӿ�����E::>[ɴ��������������������M<4-,,.26::0--/:[�����I4)$#'2E�MEEgŴ���������������������������[[SE8/-/:gɴ�������M4-,/:g���ź����[4+).4:6.'%%+4����������M' /笟������S+%'4����M400/..6g�����Ÿ��I2,,2MͶ����g�����M. -M���[EI�����������E* )͡��������������[.%%.S�����>/2A>,$#%-<粤����:08窜����S66ES<)<���������:%")/-*%#%0�����������I,""-S����ɶ����S-#[������.+S��������gE6',ۨ����������:
:����2$!+M���������E2/4ASů�����2%'.E�[:.,2[�����[/)6�����[/"'8�����������g2((.:M�g>/0[�����I%<�����<(&-A���I446:I�������2&%&(+/<筞�����ź���S/'%&(,/:>EEg�������<,-<������<68>>EISE:00Eӯ���4" *>������������:%'>������[ES�ɼ�S2/46-$#,M����ͼ��������SIEI���gE<ES����SgӶ����[.""(0E�Ŵ�������E406Sɰ���MEӭ����6,0����I+%%0ESI:4//20+%%*-06S�����<,%#(,:I�Ӷ��������4/4Ŵ��gI������:,).IͲ��[2-))/M������Ŷ����-,ɟ����Ӵ�����ʹ�������>)"2ۯ��MI[�[4%(E��M:4>�Ű�������IA>EEES�����g����E0' *M������������.$M������������S6/0A�����+/Ө����gA>S�E::>S�������ż���������A-#!:��������M$*A[Sg�����gE2,,<�ż��gEEAA::M����������S0(&)8g���������[IEEM�M6*('%#%,<۬����������:"%->ӯ��������M4##/����������0$.A���������������gA/"+[���������I4.%#$-Iɯ����6/4����>24:>SS:-&&,4>S�������,"# %<粬���������</-.06Agӯ������g2(*>ŭ�g/).S���<.))-6M۬������6&"(<�ͺ�����A./Mɮ������������E#(06:<A>EEM�����������[<("$/笠������))ɞ���������E'$0E����������I44<IS������-%[������I66:404<[ʹ��4%"*Eɰ���������[+#'.A笟���>.),:������4+(),0SӰ������SEE>>>I�����S:6I۴�������Ÿ��<(!#0[�ͺ����������>'I������[4--<�������>0-,,,2Mŭ��44>[�����g>6<IE>Mͬ�������g-"$,6<4*%%+8����������>46EME2(#(>Ӻ�����I4/>ɨ����[%#/g����4')8�������>E篞����<$竫�8$,g������Ÿ�S40>�����SE粬��gI>E[I6I�����.!"4�������%"6SS</-6紬���SSE64M������,"g�������MIM������0! .��SEMSEE�������:#!.S;��������������E/))-:����A"S�������2'&,4>8+&������>"2���gE>E<66A���������>&-ӧ����84Eɸ��������E/((),8I[E-'(.EӶ����g-,�ź������������M:/0:M�����������ɾ���������<0(%(.<[�Ŵ����SA60/08ES����gE406>M[���������[MA>>EISSSSSE>86::S۾��������[<6:>I�ɼ���������ž������������SIEM�Ų������MA::840/0>���������E6-,,-/2:[Ӷ���������g:*$"$+0ES��������������SIISS[����M>64046>I[SA668I�������SE>66:<AI[����������������>448Eͺ���������������������I86Ag���SIIE:2-(&(.:S����gSSIS[��gSS[[SSSg�������[Sg�Ӿ����A8:AgŲ��������������������I<2-,,/28:8/--0>g����E2(##(4I�IEIŴ���������ž����������������[[SE6.-/<ɴ�������I2-,/>���Ÿ����S2*).4:4-&%&,6�����������E%"2ͪ�������I*%(8缺�I4/0/./8�����Ÿ��A0,,4Sɴ���۾���I, /S���SEI������������>(,����������������M-%%/g�����:/4Eg<*##&.>ۯ����80:Ө�����I68EM:'I���������4$"*/-)%#&2۪���������E*"#/g����Ŵ����I*&�������+ -g��������[A4%0ɧ����������2
A���g/#"-gM&(.:[�������I( -E۾�����[0,6������ӯ������* ,246:::>ESɭ������gI."$>��������<8����������g.'4[Ű�������g604>ESͬ����I/�������64440/4<����I*!#0g�����������4"#(2[������I0*(.EͲ����<,&&),6��������[A>>::<S����gA48g��������Ÿ��M."&:�������������).�������:,,.I������g2-,)),4����>04E�����E44>E:<g���������<%"&/<8.(%&/Mʹ�������S84<II<-$#/[�������/Ť����64IŶ��������>.((*-:M[>,&(0IͲ����S,>����gE68E���SMIA:0,(&(/>[���[SMIS[��[SSgSSSS������g[[�ɸ����g<6<E�����������������������gE80-,-/4::6/,-2A����gE0'"#*6S�gIEM������������ż���������������g[[SA4--0A����������E/--0E���Ŷ����I/)*/6:4,%%'-<۲���������8!%:���������<'%*>Ӻ��A4///-/<۴��۾���</,,6g�����ͼ���>("2g���IESӰ����������6'2����������������A*%&4筡���4/4M�[6'##'/Eɭ����[40A�������A4:II4#!���������/"$,/-($#(:Ŧ���������:(!$4�����Ŵ����>'+Ş����g(#0筟������S>0#:������������*
g���M+"$/ۨ������/"!-禙���E!-g��������������<<����������������S0(&/Sɸ�S:00>ͪ����E,.I����[:<���g608��������0S���������A+!"#(/I͸���������[0/E۸���S,!")0<[͸���S:8A�E>Eg�S:--:۰���2()>ŭ�*%8簡�����M+(.E�g:*&(,.6[�������<006:E>Iͦ�����A02Mů������[���[/#%6������<0*%/������SA604:M����MS維��A6M�������������E404>I[���������[ME>>EESSSSSE>:6::M����������g>6:>Eg�;�����������������������SIEI�ɴ������[E<::40/0<g���������I6.,,-/08M۸���������>,$"$*0AS���������������SIIMS[�����SA64046>E[SA666I������[I>86::>E[����������������E448AӺ���������������������M:6A[���SIIE:4-(&'-8S����SSIMS��SSSgSSS[�������[S[�Ӿ�����E::>[ɴ��������������������M<4-,,.26::0--/:[�����I4*$"'2E�MEEgŴ���������������������������[[SE8/-/:gɴ�������M4-,/:g���ź����[4,)-4:6.'%%+4����������S(/筟������S+%'4����M400/..6g�����Ÿ��I2,,2MͶ����g�����M. -M���[EI�����������E* (͢��������������[/%%.S�����A/0A>,$#%-:�������:08窜����S66ES<)<���������:&")/-*%#%0�����������I,""-S����ɶ����[-#S������.+S��������gE6',۩����������:
:����2$!+M�&'-6M�������[* +A�������g4,2g������۲������-*046:::>AMͮ������I0"#8��������I0�����������2 &2Sɲ�������:02<ESۮ����[#+ͦ�����84440/2<���S,"".S�����������:$#'0M������M2+(-AӴ����A-'&(,4g�������gE>>::<I����E46[��������ź��[0#$6g�Ű����������,+������>.,-A������4-,)),2g����E02>�����I44<E<:S���������A&"%/:8/(%&.EӴ�������g:4:II>.%#-SŶ�����>00S������:!&6Ӳ��S.&-Eͯ�����S>M�������+/����-!"4۴����Ӿ��>04Sɴ���IMɯ���SE>E[<6����I*'E�������<)>[I6..Aͯ���gSSgA46������S"+��������[IISӬ���S*%8���IISSEIɩ�����/%6ź�������������g:,)*/Iɮ��-+ɥ�����S-&(.8>4&-������,'>���MEA>:68Iۯ����ž�4  8�����S26[����������8,((,.>SS6*&)4M�ů����A)�����S>6:I���SMI>6.+(&*0A���[SIIS[�[SSgSSSS������[[�ͺ����g>6:E����������������������gE:0-,,/4::6/,-2A����E0'"#*6S�gIEM������������ż���������������g[[SA4--0A����������E0--0A���Ÿ����M/)*/6:4,%%'-:۴���������:"$8���������>'%*<Ӻ��A4///-/<綸������>/,,6[Ŵ���Ӽ���A)"2g���MEM۲����������8'0����������������E+%%2������6/4I[8(##'/Eͭ����g40>ť�����A4:EI6$g���������/"#,/-($#'8ͧ���������<("$2����Ŵ����A'*͟����)"/���������S>0$6������������,
[���S,"#/穛�����0#!,������I",[��������������A8Ŭ��������������S0(&/S͸�[<20<Ӫ����I-.E����[:<���g808g��������2I���������E+""#'/IӸ���������g0/A纯��[-""(/<[Ӻ���[:6>�E>Eg�S:-,:۰���4((<ɮ��,$6��������S+(.A�g:*&(,.6[��������>006:E>Eӧ�����A02Mɯ������[���[0$$4ŧ����>0*%.�����SA604:M����MS�����A6I����������:$*����������SI�����[紥����A)+M���ż��E+$%*8S[EE���������S+#$/I�I* 0۴��2$$,>��������M6<ӥ������������E) !-<[ŭ�������[")S����������������S>>��������ū������6!#,8M纭���I-/S�����</4������EIɴ�S�����[/%%4ES������M"!/Eۺ�������4)0ɩ����S۬������/%6gӺ��������ɺ��> 'E������6#&>ŧ��������M0/A�[<44>E2./IŪ����S8&!-S�����������M%#,/2A[<.,4������������E-%)M����S)%I�������0-E�����A 2���*!,Aӯ����M#">Ų��g88粭�gISͮ���0 <�������:&M���������I2'&.<M粠����I#,><+$%0ۨ����4##8�����8!%<Ͱ���������>' *6ME-&/ͥ����,[�����+*Iżg2,-/0[������E%"$+A�������[Ͷ����8%"&,4::Aۨ�����[+%(A������I0/046:AA8/*-S����[&(E������������&%[������>:SӺ��:**/-#,g���ɼ��������I>:>���E66>S���SI������8"%/E�ʹ�������g2,,4�����:A�����I)&6�����0!"0EE>4,)+-)"%)-6�����S."#,8I羪�������I+)8綮��II�����S-$%-S����<+&#%/������������S6�����������ۺ��������S-���4#"&-4::Eͥ�����M(%*I������A0/046:A>8.)/g����E#+S�����������[#(������><[ͺ��6)+/,"/����ź��������gE<:A��A46AS���MI�������2 '2I�ɲ�������[0,,8�����:M�����A''<�����.$4EE:2,),-("%+-:ۯ���I,!$-:Mۺ��������A)+<Ӵ���IM�����I,#%/g����8*%#%2ӧ����������>>������������۸��������I+"E����IEM[g:',�[>/0EͲ�������g:68>>E[�����Sg����M4(/͢����������> *š����������[<-*2Sŭ��:E������A:A[�S646AS���ż�������[I/#'���������*/MSMIɼ���I4)&-Mɼ���MA>A>6:�����������8(#%.I�����g����IAAA[�gɲ�>&0������S&%8笟������[A0##E������������'$筭�I*#!&4ͦ������.$$2ӥ����<!2��������������:#I����������������M/))4gɼ�S<24IŪ����A.0S����S>A����[62>���������/ ����������A+##$&,4[ͺ���������S22M۸���M,$"%,4Aͺ���S<>I��IAI��[<.0AӰ��g2*,Iů�[*!!)>簢�����E-,2M�g:,),.2<�������g<44:AIASɦ�����A4:gŲ�������g����S0'#)A������>2-(#$8縶���[E848A[����M[縰��A:g��������������I84:ESg����������gSEEEIM[[[[[IE>:AA[�Ŵ�������gA:AEM���������������������������[MMS�ɸ������SIAA<:646EŴ��������I:000048Agۼ���������A/)')/6M[����ɾ���������[SS[[g������SE>:6:>ESg[I>>>S������������[ME>>AAISg�����������������E<:>M������������������������SA>I����[SSME82.-.4A[����[[S[g���[[g��g[[[���������g[��Ÿ����IAEI͸���������������������SE<4226<AEA6448I�����M</**/<S���SMSͼ����������������������������gggMA648E�Ӿ�������S<448I����������g:006>E>4.-.2A�����������M,"!+<۲�������M0-0A����S>8:868A����������I:44>[Ӿ������ɾ��S4($$)8[���gSS������������I0) !6ͩ���������;���[6..8�����E8>M�E2--/6M縭����A:I簤����[AES[I/#'S���������<-),4:62/-/>粧��������S2-*-8����;����S4)##/�������6($%+8��������MA/&!(<۲����������< %S���:.,-8S028Igū�����[2,),8S�;����>6A������缰�����4'$&-6>AEIIIMSg۸��������[:.,/Mů������M((E����������<,&&*2AgӾ�������E>EMSg綪���S,"!(<ӯ�����EEEE>>EI�ɼ�S6./>����ɸ�����E/*+-/4AŰ����[A64<S������I82268I�ɶ�����MMMMMMg����MEIɾ����������g</.2M�;����������6'#%+<������I::<[ɮ����gA::88:EŴ��SAES������[EEM[MMŴ�������M204AMI>644A[�ž������gIEM[[M>22A�ž������MAAgŰ����E/,.6M����[>6A[Ӿ�����[Sgʹ�����6&")Iɶ�:02I����������MEI�ž��[gӾ���g[S[�gMI缰��S8//8g�������E-&&-<SSI>A[۾���g�SII������[2)-EͲ������gg纲��[8//8S���gg[gۺ����</,+.8S�������ž�������M>:<Eg����:*&+AӴ�����g>8<ESSE60/0E������:/0<g���g[[SSMSg���������I206Sɲ���gIM�����������M>>>AESI>:>M�������M>�����SMSg����ggSME><:>I[�����gg�����������������������gSM[g��ž�������������������[SIEEEIMSSMEEEMg�����gSE<88ES��gg������������������������������g[MEESg���������SEEES����������[EAEMS[MA>>AIg�ż��������I4//6Egͼ�������M>>Ig���SMMMMIMg����������SIII[�����������M>446A[����gg�Ŷ��������gM>4.,+.:gŲ��������������SAAE[�����gMMS�gMA>>EM������gMM͸�����SS[gI</*()0I۶�������E>>EMMIEAAIgӾ��������MA>>Eg�����������S>844:SͶ����[A66:A[�Ÿ������[M<426E�����ɾ����>-''/I����gEAAE[۾�����IAA[羴���S<68>[�����������ž��M6..4I����������������gMII[����[S[�ż���[MS����ggg����[Sg���������E2,,2E�Ÿ�������[IEEEIS[����ɾ�����gS[�����[IEEIS[g������ggg���gg��[S[�����SMS����gIAEMg�;�����[MM[�[MMSS[g��������g[[ggg��Ÿ����g[g���������������SIIM�����g[SIEEEMg������gg[g������������gg�����������[EAEgӾ�����������������������gMA<88>M[��������gSMS[�������������gSSSg��gSIIM���[SSg��������g��������������[SMMMIIM[g����������gIA>AMg�����������������������������������gMMIMMMMMS[g�������g[MIMS�������g�����   @  � 	skid.wav   	`      o� � c �  $0��������������������������������������������������������[IIS�������IIg[[�����IMSM[������[IES��Ÿ���A:MSg�����I:>AM������IEMAg��Ÿ��SSMEEggӾ����MEA>E[�ɾ����gA8>Igͺ����SA8<Eg������I848Egͼ����M::<E[ɸ���A::::S͸����gA420E������M8408IӺ����g>.,/<SͶ����>2-0E۾�����S6.4<gŶ����M2/6<Mɸ����A<>A[Ͷ����AA>>E������g6-8S�Ÿ����I>[[���������IS�SI��[[gg����A:A��;��M:[g���S��M����MIg�[���[��g�g[IS��Ŷ��S>EISӼ���[EEEA[ɼ����[>/8I������S0**2MͶ����[4+,60M������S84.-8g������E2.->�������S62)+>�������gA+*8I������:.26Iۺ����M<<6<������I4++8������I.(-8Sɰ����S///2:累����E0006���������M6EA8A�ŸŴ���I8.*6Iɰ�����>)))&Aɮ����6$ (2[������M,# *>۲�����>)" %<Ů�����2%#,'<������[2#"2M������2("!.g������S/%#2������[-#-6EͰ�����6')*+8ɮ�����I2,%'6������2(#%-:ɭ����g8+#),2箥����<+&-04:�������:.)+.6g�������A2)%-Eͯ�����I6(%*<簧���g0+-/AͶ����>.,/<������I6.*/E������M.$(/E������IE8-.Mż����E.**6M;�����A6-'2�������A/*-:������I->:/>�ɴ���[:/)2I�ɯ����I6.AM�������I/*0<[������80E:8S�Ų�����>AA28��g�������g>4:8Sź������<04Ag������EMI62Eͯ���:8AA<>۾����g2,4IMgۼ����S0,/A��������<-.0<Ͱ�����I/).4E�������[/+2>����;��I02+4��������S:04I�������>68AEɺ���[[S.8S������:E<02Sۺ���I>4/4S������[4&0<M������I-(-<2������<'&4EA������g<*%0AM������g8()8ISӼ�����>..00Aɼ�����E-*E08;�����M-%&*8g������8))6EӾ������*&08M�������E-%+6<ŭ������8/&&2Sʹ�����>.&(4g�������2)#)8������I.$#*<ɭ�����:*%$.S������[."#(2[������<,$#+Aͫ����A.0&.MӬ����<2.,,A۴�����6'&)2[������/,/08g������M-&&*8�������>**%+>�������6(%,4[������4%(.,M������E&+48[������E,()6۸�����[</+6g������SE:..Ag������S<<.+>g����ž�I:..:M������S4*>2/Sͭ����8./0E��ž����E08IA[;���ż��I:<E[[�Ÿ��S8++0>gͶ�����4&*4E�������>,)-A�����I+,,6g������I/).<۲�����<--0<������I-*+.<縮���M<,%/Aӯ�����I/)*/S�������:2./>������4/>2:gӶ����E./A:Mͼ����ME0,2S[ۼ�����[8.*,gS簬����E6)$-<[������[:' (2Eɩ����S/---4綫���g4,+/6[�����6+/:g�ɲ����:4.-I�Ų�����S>>AM��ż����g��SI���S��g������><Igg�����[[gEIg�������gEE���Sg[�SAM����[S[M����[SM���Mɸ��A:S��[S����SI>Ig���gg���S������g[S[���gSSӼ�E6EӼ�g���S[������MSgSE�Ŵ���M>6Eg���ɺ��I<:*6�۶����[2,4E��Ӻ���M0,-<�������A8.06g������I8<608Ӳ�����M::44Sɺ�����gI2<><��Ŵ�S:2>IS�������M20M>I������>:IIAͶ����[M6/A纸��g�[A:�Ų���MS<8:I[ۺ���[M��I8M�ɼ��EM>IA<�ɼ����M<AEIgź���gSM8>IE[Ŵ����E64gI<Sɯ���SEAIA<[�����[::<IgS��ž�[::AS��纾���>4AII纼��;�gE:6MӾ�۾���[>:AgSg�������>:IAM�Ӹ�ź�M��S4g�����[IE�S>�������>:�II�������[IA<ES�����ggM>M��g۶�gg8Eggź���ASI6M>E۲����A>4/0Eɰͺ��:8<:S���Ͳ��gMIA<E������I��[�Ÿ���S6<ES��ɴ���S82:86������SE2/EӾ�����[0/:[SŶ����::6-8�������[>>,2Mʹ����<46MS��Ӱ���gAS�M��Ӽ�g�ES[[�����ggMIg������E�MM�������E[gES��MI�g�������[ggAEgӾ���EE<E[S������>:688I�����g[:2EI��������I6>[S�Ÿ�gSA6AS��۾����SA<Ag�Ӹ����>46<[Ӹ�����E<426MӺ���gSSMMSӸ�������IE��S�[>AS�ź���gEE>>[��ɾ��MASEIg��ž�gg[[[����gg[M������gAEI>>�����I>MMSMSŴ����SA>AEEgɶ����A<EIgż�����SA>I�������g:A>>M�������M406E[纮���g8624A�������M2-.2Iɰ����M-2--:g������A648Agɲ����>//88Sɼ����A0/6>�������I2/66AŸ�����M40:IͰ�����S4.:E[ź����>24:<������gA-,6I۶�����A./<:>�����<:AI>M�Ŵ���gI>8>����ۼ��[EIE>������[IEAIMg�����EAEIS������S<>M[[����gM>8A�[۸����[<>AI�Ӿ���I82:M�Ŷ���gI0/A[Ӽ����g:.8EIg�����S6/6M�ͺ����A46ISɴ���E::>SӺ���>26<AӺ����[<02<[Ͳ����E8624g������A./28S������E40/<������A0+,6gӲ����>+-2<Sɶ����E0(-<綰����4,08MͶ���>E2.2I綫���>0*0IӸ�����<6/+<gɰ����A::6:ɶ���>6-4Ag�����g>/AM�������A6466������gS><44MӸ����[8E<.E�۸����E2/<Eg������[8<AM��ż�<E/:������<68A����ͼ���:28>�����<IIEg�͸���S:>Igɼ����[gMAS�ɸ���E>EM[���ɾ��M:<8I͸����SSgI>Mɴ���gSAEg����I�gE[�����g��AESgŸ���S>AIMS������</>:IŸ۾���M:I�Iɾɶ�IEE4E��������A>4I��ɬ�gE4g�[g�;��[EA��S��M��AžMI�M��2M�SŴ���I<>I>S�������4-06I��������:A86۴����A684AIIӭ����:E<24A�������A6084Sɴ����M<..:A�����gI6--2[ů����[4%4<I;����[2((2I͸����<I6.>�������S:->>E������M4666ɶ�����AI:66Mɼ�����84<>I����ӶI�A>I<[Ӹ�ɼ�I>:>0M�縯���A880.>�Ÿ�����>-/2.�������8..6E篯���MEE84<[����>M:8EMg������28<26Ӹ�����E62<AM羶����<<6.A������2.86g��ż����6/>8[�������[AA�����SMES��������S6<M۸����I8E<.<gۼ�����6/06[��纸���S6/:S����ž��S<88>��ż���<02.>ɺ����[g</8A������E0-0Ag�Ų���g8-0<M������SA2(2�������E0.,:�������<><,/<M������<./-:��ɰ����>//+.M������g6*.IS۲����[20.+M�����EI-(2Eg������<./,8Ӻ�����[8.*<Sͮ���[E>MI>>;���MI><E��ɾ���ME8���ʹ���<��I<�����I<EEӺ���g�S��I8S�����<08<IӼ��ż���A88I۴���EgI:S�����E8AI��Ͷ����6-/AӸ����ESA<>EӼ���A>E[��S�����I>2A������[[S6:[�Ͷ���AS6/S�gͺ����A0:ES��ɼ���g>>8M�����M>��S�ۼ��IEA�����gAM�IAM�Sɴ���[68SI紺羸IS<<[�Ų�MM�<<S[�ɸ���I>M>:�Ÿ���>..8gg������AI..>�����:,.2:M������>/*)2縭����.&0/4ɰ����[2(&(8g������S0(#->Ӭ�����A0+-8������>,-2:I�����[gS,,0<Ӻ�����>6<0>Ӿ����g:M<6IM[����E<8MgA�ż���S8,E�g��[Ų��[808[��g������>6g68��S���۸�S>64EӶ����[MAI/<�Ÿ����E/6Agۺ����[6/>SӸ�����6.6I:ɮ����A660A�ͬ���[202-Aۼ����g[4)-8[�����I884-<������g4/.->纲����>-0::[�����I:4)2�������M4:I0S�����[M0/ESMɴ���A6:>Sͺ����S:0<>Iɮ���E<,-Sɪ��žS)2</۰����g<040>Ӷ����8>>::������gEI6:[ɺ���g�<+>E>ʹ���MS40I����Ŵ[[:/MgI���۾A<��:��I����26M������MgS>0�������44��M�����gESESgS�g[��M��8Eg��Ӽ�����g88gŸӴ�IS�A[��g�Ÿg��MS������EM[g������E[S[����;��g<>gӼ���MMgg��SM�����M>S��g��[S��E�MMS���SS�[[��M[Igž��ME����EMM��g[�8��Sg����AS��ɼ�MM[����[g��S[M26[۾��M����S>��ɸ�MI[����g�<AE�����I:6>E��������A4�����IMMES�g۸����E<�g������[����gM[g���[[[���g�A<<M������[IS��g[gӾ��M8A�[S�͸���E4A��;����A6AASʹ����S>008M[Ų���<:64<ɶ������8/:MMŶ�ɴ�g:2EM����g[EIg[AS�ɸ���<4A���������IEA>�ž��M��[AIg�����S��<�><�������S[�[E������S�EMMI[Ӻ���M<[�E��[[���EAS�Ӿ����S<A[��������gM[II��Ӻ��E��IA�MM�ɸ���M8AE��S��Ͷ��[</8S羸����ggIISEE���ɺ��g:8SgMż����SI>>M����ž�[S<8:E������SIE<4E[Ӽ�����MIA2<gۼ����>6AIES����ɺ�M�E08[������gI>�E:S�纯����[[>26[�Ų����[Sg:4[Ӽ�����I0gg<>��ɲ�[S<A[�������M8I������g�>A��A۾�[��g>�A<g��ͼg��2��ES������[E>E����ͺ�A<AMSۼ����SIMgg>S�����MEAS[M[ES�ż���[>IME��g�����g4>[ASgɸ���[<:��ɶ��[��E<SSMMӾ���[82E�ž������[A<[;��SMSMg��������SI[MM����gSSgEE�������MIggɾ��g��S><:>�Ŵ����:24A>SŲ����M8<M:A��ɶ���[E>>Ig�;�����IM[���ż�MIEAS������M>:S�Ӽ����gI8:AEź����IIg������g[��S[SM���ž�SESg��������gSME>I����ž[[I:E��������SAMEI������MEII<[��������SA>I[g���g�gAII��Ӽ�������Sg�g��g�gE��g���g���MM�[S������MIgg[[gSӾ���E<AI��ɲ����S<>SSgͼ�����E>:6<���ͼ����gI<8Ig缼�����IA[E>������[[�gSA[[g����gg����[�gM�����M[�Sg�[M������g�������������[g���[�������gg���g�����[:��[S������SSIS������������gSg�������g[S[SS������EEISS��������[MA>M������gg�SEM��������S>ES�������SS�SI[������IEAI���������IIS[ɼ���EASM��������E<8:M������ggEEAIgɾ����MS�M[�[M�;���SAAMg���������[�[E[�g[��gg������IM�[����gg�����[Sg������[S�����������IAg�����SS�M����������SS�S��g[��������ggME��ۼ����[gS<>[�������SgEE[�������SESg:M������[��SMSI������gg�gMg�S��[gggg������gMA[��g�����S[[[������SMgg[S��������[ME��g�������MIg�g�������IS��g���g>�E[��������MM[S�����S[��SSS���gg�������������gg��������gg������S>��������Mg���[S�����[MSgg��������g[Sgg����gg�MS���S[����[��[�[�����SMg���S��[����[gMS�����g���������SSg����gM������[gS[��������[g�[�����[MEEMg������[���g�gM[�g���ggg���gMg�����MM[MM����������S�gM�����SSS[�������SS[g�������gMSMSg���ɾ��g[AM�������SAM[�������gSSMS[��ž��[M[SS[�������[MS[g�������IISg���gg���[S[g�����g���SS����g[gS���[S����[g����������S����������g[EM����������g�g[����[[������[[��[�SS��[���g��[S�S��M��gS��gg[S�����[��SS�S����[gMEg�������[Sg[I�ż��[ESMS��������MAES�ɼ����I[[MS������[gIM��������S[[[�������ggMIMg��ͺ��S��gg������ES��������[[[��������������gg����[[[[�����[�gMMM������SE[SMg������[[MAISS�;��g[SIIg��������[AEM[�����gEESS��������gAEMI�������gg[[g��ž�[gg[��S����[������[g����g����ggg����gMMM[��������SEEg�������[IEMMM������MIM[Sg�������gg�g[������Sg�[M��[g�g[�����g��gS����������g[Mg�����gSS���[g�����gg[S[����������[ISSg����������MIS�����������[IIS����SS[���gSg[����MS�g[S�����[M[[��SS�����gM[SI[����������SSg����g��S[�[���������gS[g�������SMg[Sg�����[[��gg��������SS�����S���[g�����SgMS���������[I[MM������[[[S[ggg�����g[[SS��������[IS[M�������gEE���������g[��[��g�����ggS[�g[�����gS��������gMS������[���������MSg�������M��������[[[g�������[[g��������[ESg������ggSEAg��Ӿ���EI[SM�����g[[MM������g[g�gg����[��[g�����g����������������g���������g[g����������[[��������g������gggg���������gSg��������gggg�������[��g������ggg����Sg������g�gg��������[[���������[g������gg���������g��g����������g����������������g[[[������g[g������g[g������[[IS���������ggg[g�����[[[��������[SS[����������g�����[IIMMIIEAAEIAIEIM[g����ż��������������������������������������������������������������������������g[SMIA:8644688860.-,,,,+)(&&%%%$#"     "$%%%%%%%&(+0:M�ɼ�����������������������ɾ������������<, $*0>gź���������������������������������������������������������[[gggg��������������������������������������g[[gg[SMMME><::8888::>>>   @  � 	ping.wav   	`      et"r      ')))))))))))))))))))))))))))))))))))))))))))))))))))0�+�����[8S������<��E��g��M�*Ӯ������������������������������g��I�g6ӯM/��6.��.4��&<��'�[$ɨ:)��0)��)2��(<��$g�g'Ũ<'��2/��+4��*M��(��I*��<,��.2��->��'[�+ͪA(��6/��.2��+A��*[�[)ͨE,��4.��0:��+E��+��S*ɭ<.��40��,<��-M��*�M-��:-��28��.A��-g�,ӮA.��:2��/:��/I��+�g.ɮA-��66��2:��-S��.�M.Ů>2��46��2E��.[�/ۮM/Ų:6��8:��.I��0�[-ӰI2��:4��4A��0M��/��[/Ͳ>2��::��0A��2[��.�M2ŲA2��6<��4E��0g�2ӲI2ŴA:��6>��4S��2�[4ͲI6��::��8E��2[��4�S0ͶE:��<<��6M��4g�4۲S6ź>8��<E��6M��6�g2ӸI8��A:��6E��8S��2��[8ɸE8��>A��8E��6g�4�M6ɶE<��:A��:S��2�6ӶM4ɺA>��:A��6S��6��[6ӶI:��<<��:I��4[��6�[6ͺA:��<>��6M��8�4۶S:źA:��<E��8S��6��g6ӺI:ŸE>��:E��8[��4��[:͸I:ž>A��:I��6g��8۸S8ͺE>��<A��:S��6g�g8۶S:ɼA>��>E��6S��8��[4ӺI<��A<��<M��:[��8�[8ͼE:��>E��8M��:�6�S:ɺE:��<E��:S��6�g8ӺM8źAA��<E��8[��8��[:ӸI<ž<A��<M��6[��8�S6ͼE>��>A��:S��:g�8۸S<žA>��>I��8S��:��g8ӺI<żA>��:M��:g��8��[<ͼI<žAE��<M��:�:�M:ͺI>��<I��<[��8�g<ӺM:��AE��>I��:[��:��[:ӼM>��>A��>S��:g�<�[<ӾEA��AI��:S��<�g8ۼS>žEA��>M��<[��:��g<ӾI>ɾEE��<M��<g�:�[>ͼI>��>I��>S��:�>۾S<;IE��>I��>[��:��g<ӼM>��AE��AM��:g��<�[:ӾIA��EE��>S��<�<�S>��IA��EM��<[��<��g:۾SAɾIA��>M��>g��:��g>ӾM>��EI��>S��<�<�S>ͼMA��AI��A[��:�>۾S<��EE��AI��>g��>��[<ӼSA��EE��AS��<g��>�[>��IE��EI��<S��>�:�SA��IA��AM��>[��<��g>��MA��II��>M��>g��<��[AӾM>��EI��AM��<�>�[>ӾME��AI��A[��>�g>۾S>��EI��EM��>[��>��g<��SA��IE��AS��>g��>�[A��IE��II��>S��A�<��[A��ME��AM��A[��<�gA��SA��II��AM��Ag��>��[AӾSE��EI��AS��>�A�[>��MI��EM��A[��A�g>۾[E��IE��ES��>[��A��g>��ME��II��AS��A�>��[A��ME��IS��A[��A�A��SA��MI��AM��Ag��>��gA��SA��IM��EM��Ag��A��[A��SI��EI��E[��A�A��[A��II��IM��A[��A��g>��SE��II��ES��Ag��A��gE��ME��IM��AS��A�>��[E��ME��EM��E[��>�gA��[E��MM��EM��Ag��A��gA��SE��II��I[��Ag��A��gA��SI��II��E[��E�A��[E��MI��IS��A[��E��gA��SE��MI��ES��Eg��A��gE��SE��MM��ES��E�A��[E��SI��IM��Eg��A�E��[E��MM��IS��Eg��E��gA��[I��IM��I[��Ag��E��gE��SI��IM��E[��E�A��[E��MI��I[��E[��E��E��SI��MM��ES��Eg��A��gI��SE��IM��I[��E��I��[E��SM��IM��Ig��E�gE��[E��MM��IS��Eg��I��gE��[I��MM��I[��I�E��gI��SI��MS��Eg��I�E��[I��SM��IS��Ig��E��gI��[I��SS��I[��I��E��gI��[M��IS��Ig��E�I��[E��SM��MS��Ig��I�E��[M��MM��M[��Eg��I��gI��SM��SS��I[��I�E��gI��SM��M[��I[��E�I��[I��SM��I[��Ig��E��I��[I��MS��I[��I��I��gI��[M��MS��Mg��I�I��[I��SM��MS��Ig��I��gI��[M��SM��M[��I��I��gI��SM��SS��I[��I�I��gM��SM��IS��Mg��I��M��[M��SS��M[��Mg��I��gM��[M��MS��Mg��I�I��gI��[S��MS��Mg��M�M��gM��SS��M[��Mg��M��I��[S��SS��Mg��M�I��gM��[M��S[��M[��I�M��gM��[S��M[��M��I�M��[M��SS��S[��M��M��gM��[S��SS��Sg��M��M��gM��SS��S[��Mg��M��I��gM��SS��S[��Mg��M��M��[S��SS��M[��M��I��gM��[M��M[��Mg��M�M��gM��[S��S[��Mg��M�M��[M��SS��S[��M��M��gM��[S��SS��Mg��M�M��gM��[S��S[��Mg��M�M��[S��[S��M[��M��M��S��[M��S[��Sg��M�M��gS��[S��S[��Sg��I�M��gM��[S��S[��S��S��M��gS��SS��Sg��M��S��gM��[S��S[��Mg��M�M��gS��[S��Sg��Mg��M�M��gS��[S��M[��S��M��S��[S��S[��Sg��M�S��gS��[[��S[��Sg��M�S��gS��[[��Sg��Mg��S��M��gS��[[��Sg��S�M��gS��[S��[[��Mg��S�M��gS��[S��S[��Sg��M��S��gS��[[��Sg��S��M��gS��gS��S[��Sg��M�S��gS��[[��S[��Sg��S��S��gS��S[��Sg��S��S��S��[S��[[��Sg��S�M��gS��[S��[g��Sg��S�S��gS��g[��Sg��S��S�S��gS��[[��Sg��S��S��S��g[��[[��Sg��M�S��gS��[[��[g��Sg��S��S��g[��[[��Sg��S��M��S��gS��[[��Sg��S��S��gS��gS��Sg��[g��S�S��gS��[[��Sg��S��S��S��gS��[[��[g��S��S��gS��g[��[[��[��S��S��g[��[[��[g��Sg��S��S��gS��[[��Sg��S��S��[��gS��[g��Sg��S�S��gS��g[��Sg��[��S�S��g[��[[��[g��S��S��S��g[��[[��[g��S��S��g[��g[��[g��S��S�S��g[��[[��[g��[��S�[��g[��gg��Sg��[��S��g[��g[��[g��[g��S��[��gS��g[��[g��[��S��S��g[��[g��[g��[��[��S��g[��[[��[g��S�S��[��g[��[g��Sg��[��[��g[��g[��[g��[��S��[��g[��gg��[g��[�[��g[��g[��[g��[��[�[��g[��gg��[g��[��[��S��g[��gg��[��[��[��[��g[��gg��[g��[�[��[��g[��[g��[g��[�[��g[��gg��[g��[��[��[��g[��[g��[g��[��[��[��g[��[g��[��[�[��[��gg��gg��[��[��[�[��g[��gg��g��[��[��[��g[��g[��[��[���[��[��g[��gg��[��[��[��[��gg��[g��[��[��[��g[��gg��gg��[�[��g[��gg��gg��g��[�[��[��gg��gg��[��[�[��g��gg��g��[��[��g��gg��gg��[��[�[��g��g[��gg��g��[�g��g[��gg��[��[��[��[��g[��gg��gg��[�[��[��g��gg��[��[�[��g��gg��gg��[�g��[��gg��gg��g��g��[��g��g[��gg��[��g��[��g��gg��gg��g��[��[��[��gg��gg��g�[��g��g��gg��g��[�[��[��gg��gg��g��[�[��g��gg��gg��[��g��g��g��gg��gg��[��[��g��gg��g��g��[�g��g[��gg��gg��g��[�[��g��gg��gg��[��g��g��g��gg��g��g�[��g��gg��gg��[��g�[��g��gg��g��g��[��g��gg��gg��g��g��[��g��gg��gg��g��g��g��g��gg��gg��g��[�g��g��gg��g��g�g��g��gg��gg��g��g��g��g��gg��g��g��g��g��g��gg��gg��g��g��g��g��g��g��g�g��g��g��g��g��g��[��g��gg��gg��g��g�g��g��gg��g��g��g��g��g��g��g��g�g��g��g��g��g��g��g��g��g��g��g��g��g��g��g��g��g��g��g��g��gg��g��g��g��g��gg��g��g��g�g��g��gg��g��g��g��g��g��g��g��g���g��g��g��g��g��g�g��g��gg��g��g�g��g��g��g��g��g�g��g��gg��g��g��g�g��g��gg��g��g��g��g��g��gg��g��g�g�g��g��g��g��g�g��g��gg��gg��g��g��g��g��gg��g��g��g�g��g��g��g��g�g��g��g����g��g�g��g����g��g��g����g����g��g��g�g��g��g��g��g�g��g��g��g��g��g��g��g��g��g��g�g����g��g��g��g��g��g��g��g��g��g��g��g��g����g��g��g��g��g��g��g�g��g��g��g��g��g��g����gg��g��g���g��g��g��g��g��g����g����g����g��g����g��g��g��g��g���������g��g����g��g��������g����g����g��g��������g������g���g����g����g��g��g��g��������g��g������g�����g��������g�g�����������������g��g������g�������g����������g�g����������g��g������������������g���g��������������g��g���������������������������g�����������������������������������������������g����������������������������������������������������������������g������������������������������g�����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������   @  � realthud.wav   	`      et"r mc   ������������������������������������������������������!	͘��������������[#
	$M۰���������������6.%&6篠��������/,����������������I0/68.0<AI4"$:ۯ�����������A&%4ۼ�[6&%<۶�������������M+)0<AE[Ӽ�����������������M.*>���������E2(&%%%,Mů������S82.-2<缶������SMS[�[[SA0/.-.08SŰ������[.#"+<gɺ�����������[E4.,.2EŰ�������g-)06:Eɾ�����[MS������������6( $+4MŰ���������M,!#*28Mů�������������[[[���g[E<2.+,2A����������[I<86404:EAAAMg��ɾ�������������������g[[SE<66<M����������E/'""%*.6<ISg��ź�������������S:2.-,-04:AS�������������gE4.-/048I[������gSEEM���������MA>>AM[[Sg�������������g[MSSSMSSS[[����������������������M>::<AIS���������[SS[���������[MIEISSS[[�ź���������MA><A[������������������������g[SIEEIM[[���������������ggSMA<<<AESg��ɾ������ME><<AM�ɾ����[S[[gg�;�����gg���[SSSS[g��ɾ������MEA>>>>>AI[������������ggSSS[ggg[[[gg�����������gSSSSIE>>>>I[����������������[[MIEEIMMMM[��������������gSMMIIIMM[��������[SSSSS[[[��ggg�����������g[[SMIIIIIEISg����������������������������������������������������������g����������������������������������������g[SMIIIM[��������������gg[SMS[g����������������g[[[gg���������g[g������������������ggg����������������������   @  � static1.wav   	`      Cara\drP  ����������������������������������������������������������[-&�����<&缘���6����������������$&����)g�������g6�6���IS�������������睍��羴��������[A����������[%6�ɤ���.&������ɛ�������6%.Ŕ�����������S�:,������&�����8%:������,$������6$0�����66���g%-�gg�����8ɚ���,����M���68����<眏������6%A����SE����Ӥ��%6������������'%>�������/E������ɛ��:,����͔���#6�����ۜ���%%+�����<6Ӥ������M%M���������� .����E�%%
���g�����-�����������)�����66666SŚ�������������������(�����ɺ��,ۥ�����6%%[���������M#6����������6������[66����A6���2%����ʹ���A������-S��6
(����%")�����8������:��������6%E����A%�����6����68����'��������8
%������������g066g&��������������E%%�������66�����:%%%g������۸�����I6%6!	,����26�����2%%A禔���-%�����<S�����S0�����.ۖ������%����������%�������6' 6����8M���������[%S����%"$��������6666���������>>�6���������ɴ%+��"���6%[�����6������>$�����E666������6%,Ӕ�����������6�������   @  � static2.wav   	`      � �� �  	&I�(M����ӧ���������-"稔����:>������8)�����E)):������g*$����::���������������8)#A������E-<��:<��������������������::����%疍��$)Ş��SM4:::۞����,:I:���������������������������������������������������*S���������#)�����I):�����)ӝ���::�M6)$E����:):ɴ�����+)>�����)癒��*):����g:���)):�������#)����:����������������A)���������:�����������������:����Ÿ�Ӹ��������[������I)):Ŝ��Ũ��:-矕��<A͞��:>�:����������������E):g���������M��������[����ɠ�E)�������窞�����������,#+����������������������Ũ��������::S:۩�����������80��������66Ũ���M68��۸���: .����������+$����稨�g*0E����42��������8 :�������������������������A��������):���Ӹ���:�ӝ���):���������۸�I��������:����������������<����������ɴ��I)(4ɨ������:,������EE�����<))����::Sɟ��.
:)):���������������������������>.:��������:::ӝ���������������������:I���������:������:<�Ÿ�����������::�����):���4����::(&�Ә���g!������A::)�����8
Ӟ��2)����������::��������:I����)������E,�������:))Ŝ����:8����A#:�������:[�:�������:)*:����������<%E������/)4����:2)�������)):͝��Mg������������:))�������������������[:S�����&)������������������������)*������:�������(:�����M�������������������A.�����:)I���")[��������!�����A'������:)):ۨ�� ����::�����������������������[���������S)���������0<����� >�������)ɜ������E%&��������-g������&I������������S�������0������)6������[) I���I):�S:��%�����:����66����AE�����::.))[���������)6������*):���   @  � 
swish.wav   	`       , � < �  }��������������������������������������������������������������������������g�g��[��g�������[�g������������g���g�����������������g��������������g�������[��������������������g�g��g�������g���[�g�������������g�g���������g�g����������[�g�S��g�[�g�g��g��[��g���g�������������������������g��g��������������������g�����������g�g�����g��[���g���g���[�����g�����g���[�g�[��[���g��[���������g�g��g��[�g�[��[��S��S����[�g��M�[�[��[�S�gg���g��g��������S�g�g��g�g��������S�[��M�Sg�[���g�������g�������g�����g�[�[���S�[�������g�g���������g�M��S�[���g�[����g��g������[�[�g��[�[�������g����[��S���g�M��I��[�[�����S��I�g[�[�S�[�g�M��S�M�������g���g�S��������g�g��[��I�g�[����������g��g������[�S��g��[�[�g��g�gg�M��g�S�����g�[�[���g��[�g�g�g�g���g��[�g�g�E�gg�S��[����[��S�gg��[�g�����[�g��g����[��M�[��I�M�I��[�I��g���g�g��g��[���g��gg�����������������[�g��M�[�[��[���I��I��M��S�[�g���g���g��������M���[�[��[�[�[�M���[�������g����g��[�g�g�g����g�g�I�I�M��[��[���������[���[�g[�[�I���g��g���g�g�g��g��[��g�[��g��������[��g���S�[�g��[��g��g�g�S��[�g�g����S�[�S�g������M��S�[���g�S�[�I��I��E��M�A���M�g��g��E��E��[�g[�g�g��g��S�[g�I��M�g�[��M��S��I��[�S��g�g�g���g�������[��E�[g�M��S��>�gM�[�[�g��g�g���S�����[������g��[�S�[��I�A�g��[���g�I���g�[�S�[�g��>�I�E�g�[�g��M��S��[�[�E�M��I�[��[��E�M���[��g�[�g��g�M��g�gg�A��<�A��>�M�S��g�g��M��[��[��S��A��M��M�I��g���[�M�M�[�A��S�M��g[�M��M��I��g�M�I��[�[��g�g�[�S�[��E�S��S��S�[����[��g����S�[��[��E��g�������M���S�[��S�����g�M�S��g�S����M�E�S��M�[g�[�����[�[�g��E��E�I�S��I��S�g�g�g��I�A�gS�I��[�S�[�[�[���g�����g����[��S��[�S���g�[��M��I�S�[g��M�S�I�S�Sg�I���g�S��:�I��M�A��A��I�g��M����[�S��M��M�A�MS�M���E�S��g�g�����g�[��M�>�S�g��M�g[�I��S��I����[��M��A�S��>�E��g����A�[M�A��M��A�M�I��g��[�[��E�A��S��M���g�M�g��I�>��<��A��6�SI�[S�A��S�[g�[��g���S�M��g��I��6�A�<�S��I��g�g�g�[�[�[�S��[��A�I��S��>�>��g���g�S�gg�8�[���g��A���[��M�<��S��[���[��[�[��g��[��g�g��g�[��I�I�g[�M�S�[��g�������g�M��M�A�g[���[�S�gM�E�S[�E�g��g�[�[��g�[��>�gM�MS�g���S�g���g�S�A�[g�<�E�>��4�I��I��I��M���>��[��M�A�g�I�g�E�g��g��[��S�[�[�[��<��8��E��g���M�g��[�g��S��g�[�[��gg�<�>�[��g�g��S���g�g��M��g�I�[�S��g�[g�A�6�M�S�S�g�Sg�g��4�>g�A�S�I�A��S��M�I��[��[��M��I�[S�I��<��I�Sg�Sg�E����I��[�g��E�[g�<��A�g���S�E�gg�g�[��g��g��g�M��I�[�S�[�[�[�g��E�A��I��g���>��A�I�M�M�Sg�A��M�M�M��[�g�MS�Eg�:��S��[�I���g�I��E�M��[��[�[�g�M�g��g��A����S�A�gg���g�<�g[�[�M�[��M�S�>��:�[g�I�[��S�g��<�g��S��[g�I��g�g��I�g�S��M��A�[��A�[<�8��:�[�g�[�8��M��E��:�[S��g��[�<��g��[�/�gI�gI�[g�A��[��A�E��2��4��[��A�[�[���S�A�>��S��S��4�I[�2�M[�S�E�4��6��<�g>��<���S��[��g��S��E�>�[>�gg���[�SS�g�[��S�8�M�>�M�g�I��A��E��S��>��M�<�S�E��M��S�����[����[��g��M�gM�S[�I����<�ME�I�S��M�g�g�E�g��S��S�[��A���S�M�S�M��A�[���gS�I��Sg�>�[��I�M��M��A�S�A�[I��[��6��-�gI��<��E�2�:�[��M�:��6�6�8��M�[���S�I�M��I��6��2�8��<��g�>��:��2�EE�g<�:g�Ig�E�<��E�2��I����I�<��A��A�8�M����I�/��.�Eg�<�<��>��:�g������>�gA�8�IS�Ig�[�M��M��8��8�6��I�[��g�M�I�E�S�A�S�>�gI�<�g[��[��g�Sg�A�gg�gS�I��8�[��S�g�:�6��I�<��I��6�8��0��>��[��E�S��<�I�[<�I�0��A[�A��M��>��M��8��:�>g�4��8��6�S>�S��E�E[�S�[�M�>�[g�g�S��>�E���[��M�S[�6��0�g[�[��[�I�2��>�[I�:���<�gI��A��E�8��4�M��g�S�E�g[�Sg�[I��M��g��A��6�A�����g���A۾:��S��I��A��A��S��A�<�I�A�,�EE�>��Eg�g[��S�M[�S�g�M�E�gE�2�g[�I��>�A�8��S[�2�I��I�gg�A��gA�SS�M�:��E�S��A�S�gS�I��<�AӺ%�-I�-��4�I�M��E�2��8�[S�AӾ6�[S�4�:�/ɸ4��<�Sg�M�I��.�%ɯ-��0�S8�I�<�gE�:��g��E�g�M�E�-Ŵ,��0�M[�:��A�[g�I��S��[�<�E�>��>��A�gg�A�<�>��:��6�M�8��<�6g�E[�4g�(��.�+��4�S[�:�g<�8�gg��6�>A�'��"�2>�4��4�g�g�I�[��M�gg�A۾.�A>�4��/�8[�8�[g�<�Ag�4��E�S2�6g�-��*�+��6�gS��8�<�A�8��S[�4��>g�+�.�SE�S�����I�S�4�gI�I�g��������M�>��MI�A�6��2�AA�2��[��E�M��>�2�.�:��E[�M�6���>�I�0��:�/�[g�g�M�/��:�:S�gg��I�2��M�A�[M�<�2��E�Ig�>�A��0۲/�I�A�[>�*�[/�+Ӱ.Ӵ/��2��I8�ME�8�-��/�A>�%��4�<g�<�S����0�%��(�8۸<����>�6�2��.��:��0�Ag�Ig�I��I�g�[�[���A�<��:�6�:�[g��8�M8�)��2�:S�S��4�MM�S���[�S�I�.�EM��.�4g�/��,��+�EI�8g�(�6��/��8�E�MS�I�A�S���gS�I��g�[��<�[S�I��[��S�>�A��E�S�S�2�[[A�0�2�2��M��[��E�gE�4��g��I��:�M�I�M��2�8��-�,��'�0�-�gI��A�M6�I��S�E�IS�M�[[���E�:�M�gg���[�6��<��g�<�E�[�S��A��>��S[�I�[A�:�M�6��Mg�g8�g<�-��*�[���/�)��-�.��4�-��2�-�.�I��<ɾ2�g���gE�8��[�A�:�Eg�0��)����%I�#��'�<A�/�%��%�:.�>8�gM�M�[S�-��>��[�>��A��:�-��8�Sg�:�g�E�E���g�:�[I�A�<�:���[�>�A��I��S�6ɾ(��6�>I�SE�S<�AA�<�S��:�0��S��A�6�M��>�0�<I�A��4��$�"��#��,�>�g�[g�:�-�>I�+Ӽ6ͺ4�,�*�4��A��#�4A�,��S�g��S�2�0�E�Mg��M��S�>�[��M�M[�.��"�0E�0��8�A[�>�g�E��'�S>�-�I�S�<��I�E��I���g���8�g>�+��+�0<�/[�8�M[�S�/�A�IS�2��<�S��6�6��/�:A�>6�2�Sۺ*�g[�AM�4Ӽ0�M���[[�g[M�IM�>�[��[�>��4�<�[<�-�g:�8I�'�S��<��-�8�/�[�g�<��.�:�[2���)��(�A*�+A�A��>��)�6I� ��2�2۸8��E�>�A[��[��gS���E�>��A�M�8��-��.��<�#�[A�/�E8�%��:�[<�%��g�,��#�>I�2S��E�E�.�8��I�I���+�-��0�:�E�Mg��I�6�M>�$����E۸4S�6��-�A>�EM�>�6�4g�0��I�<���M�M���[�g�S�8�*��A�I:�gI�<E�,�I8�+��g�8�g�M�����<�E�.�E[�&��I�)�0���>�6�+���[g�,�0�2�4[�:g�'�S+�&ɮ'�2�gS�E�g6�*�4��(��S��I��S��>�>�>ż.��2�8��A�+�:E�<�<����A6�2��M:�I��[[��6[�(�.��<�0�IM�8g�-��>�>��MM�(�<>���:;&�[M�[�.�gE�S+��A�>��.�ME�[۾*�&��/�)��M�M[��A�SM�Ag�2[��.4���+�/M�'�� ��2�:�MSg�I[��I��4��S�/��8�[I�[�A�M�6Ӳ#���'���6A�A�>�.��)�E6�(��&��$�[:�6��.��g�-�-6���:�>Ӽ/�"�:(����8[�4g��.��+�6���<�S�A�>��>�S�E�[4�   @  � 	tock.wav   	`      et"reMun  X����������������������������������������������������������������������g[SE����$�>�E%����+%���M!Ӣ��,,ɾ�g4<���gA��[���gM���S���gMS����g[g�����S����������[[�����[g���������[����gg������g��������g[����g�g������gg����ggg������gg���g���g�E�E��S�[�>�/���	��	����	4���M		���			����
����"���E.����&<:���SA2��ӺI�MAE����[   @  � 	clmpngsn   	`      � �� �  e�������������������������������������������������������������������gg����������������������ggggggg[SMIE>:80I&   �$��Š��  �'$E��  ���&�& �S�<�����������S�  Ӡ���簲��� �>  �.    +!��E��86%SM-�E8����������M88�8M۾������/   $( -����[.gӼ������������������A64:2M/2IM[E:<IɴM�[,8EI�ū���������<[6A00#)%!%   *>/�8S۴��������ũ����8<8:8M2.4%g��ɾ��g��ɪ���ɾ�۾������������II<I8A6:M0>���gS�[>M��SS[�����[��MEIA>S>:EMM�����>�E��������g�������g����ͺ�[S�[۾���I6:4MSA>����������������������MEIMgE[EE�gS��[�����Mg��ggS�S����gg[gEMIg�����Ӿ�����ggMgMg[<M<>g���������������������gSgMEAA:E>M[����g������������S[SSgggSIIIIS[[�������g��[�SMg�����������������������[M[gg���������[[gg��������������gg���[SSA><AEAMM[[����������������gSSSgSMSSIM[[SS[[��������������������g��g�g���������������g������g[[[gg[gg���������g���g�g��������������gg[[g�����������������������������������������������������[gS[S[����������������g�����g�����������g����������������������g����������������gg����������������������gggg����������������������������������������������������gggg����������������ggggggg[g����������������������gg����������������������������������������������gggg���������������������������������������������������������������������������������������������)-  �[�< ��   �  /�. ��  ����%� ���͠' A"#:<����*��� �  !:E��/��ͦ �������������������S"/ %& )   , -    /2M:(<,ͮ�������  � �  (��������gۥ6  ""     ,   - #!(04+<g��������������EE,M>-:-�&!'*����I�ũ�����������ۺ>.<6/40>6+6��Ÿ���;����������g�����gEM�::/.22A,.42E4�M�64>A8[���g�EI�ͼ��MM�M>:>Sg�����;��۾������������[����[��II>g[�S����g>S[Sg[MSS���������ɼ�����E��gg�SMMM<EA[Ag[IE[�[[����S�Ig���gIIgESSEEggS�S�g��ɺ�۾�����������MI8A:<.2.6IIAS��������������ͼ����>[S>EE4AI[S���Ig����SMg[��SMM>:EE[E[EE><AMS����ź����������g[����������������������g���[I[�[��[[MIMg�g�������������[����g[IMEA:>68<>>EIS[������������g�S[gSgMMgS�g�����۾ž�����������g�[�[EIM[[SSIIM[ggggS�g������������g>8:8�6[�<�E�/.�:2AӺ64Ӵ�:�04��A�4����4����>��<:Ӳ�ɰž����<��[24��:888>6[���AS�>�M�Ͷ�������[I>ES�ۼ�����g<<<>A>>��gg>S[���ɾ����ż�������gMSgIgMIggg[gM�����S[�[��ɾ�����;�g�[SSIA<>6<686<MA�[gۺ�������Ӽ����S[SI[IEM8S�[��gSSg�����������������������gMSM[MM�M[������g���g��������g[M[[MSgg����g���������[�g���������������������gMMIS[MIS[g����������������������gS[SS[SSg�[�������������������ggg[[S[gg�����������g���SgSSg��������������������g[[SSSS[g����������������g���gg[ggg�����[g[[[[[[S[MEA<60.)!  ��"�"#�!   �  �"��!��!��   #.!!�#[�����""�SI����M+!+���� ��M�68��ɼ�ţg�/*A/EӰ�������ţ���S��[>+//2�M�6<MI�S62..-:II�Sg�Ӿ���������������������II,!&'#,&,-.-262,2>�A:I��Ӻ������������>.0&)2'$"&  &&:MM�Ӵ���������������S6AES[<M����SgESI���������ɶ����������S>gEM>I88002I��M[MSM����[���M�>I[��g>MgI����ISEI��[����[MM������g��g��������������MISMggMg�ž���gS[g������[���������IE<28AMESgg���S����MESg[�g[gg�[�[E><<M�;�����������g�[IAS[[EM:EEISMgg�����������������IMIMM[SIMIS[[g[������[SM[����[IISgS[[gggg[g[S[���������g��g�[�����������������������g[�gg���gS[g[g������������������g[MIIIIAAEEM[SS[g����������������g��SMS[[Sg[[[������������������g[[g����������������������8I668A�>2g�002�6:��84��64Ÿ����:���>g48S48>S����IӴ�8I8�A6���E[���M簲����������������S>I6<:6:662:4646::ESgASI���������6�6�662����;��[��[888A:888:>:88A6:8>EMAI���������ͺ����MMg�I[E�<:8A������ž����ž������SIMMMIIgIAIg��������ż��������g�������g�SSEIAM[EEMISI�g�IMS[S�����g[��������[[Mg�����������������������������������;�������##� � )E��"/���#%���!���<�4�%� !/ӡ " ��4/�E�&& 6)2�</ <��$����!�������-E�M6���6�����I$$!$48A*E���۴�4*#+'AA��������I�E������S<,.'$"'!", /6<MM8:gŶ���Ӯ����ź�MI>��A����gI6&)& &/*:,��������������������M,&""&&+246+4,8���ɼ�����IA<<g�gMI2)4g<M:E[:60S�M�[A<����ɼ���ɺ�IEE>[���SM����gI�[��g�������۾��������������SMSM�����gIS>E>S[II6A�g�E<MMgɴ���ɺ���EA<SEAII<��M�S�S8<>�[IEM���������g��I۾M>:���:g��S��������Ӽ�ۺ��II[�AAA<0.2SS����[����ۼŰ�������M>>AA4ASI[gg��gAS[��ɾ�����SMg��g[�����g[[��������g������������g�g[S������ž���SS[S[[MEIAMMMMM[IIAIg�ż��������������g�ggMEEISES[MMIS����������ɾ�����������gSMM>EAMI[I[g��������������������MMMMgggSMISIIS[��������������������g[���ggg����������������g������������������������gggg[g[������������gSg[g[ggggg����������������g[[SS[[[��������������������gg��������������������ggg����������������gg[SMIE>8668�>��8�6666�>E�6��8ŶA6�6S:��88�888��8�8I��M;��E88�͸�8���gMS���͸��������ӥ����g%�&#�&����#*)M�  ���8���-%� E��   !� !#()>�����-��2+<�[%E�+���-� +�  �)�   $     + "4"''�-��������������������<Ӯ��60/,*'('(��(����&#! !  '/�0"ۭ������������������������6+$!!" &%!".*A�S�����竡��M[A�2S)*%%$'.04/,/SA�����������SgE6:SE84%(&2'/8II[SS:<:E���S�����������źg�缴����gA���[>M��S�������II>ESg>8I[S:A>�:�EI[<2MI�AES���M��g��[M�gSAg�͸�Ӿž����:>6M<SM>>><E[Ig�g����S�������ɼ��ͼg�[ME�[��ESg�������������g�[�MAA4AA>00,4:8SS[IM�Ÿ�����������SM[E<A<>A:<:EI>SM�����ɺ�Ŵ�����g[��S[g����S���ɺ�źͼź������gS�IM<68:><E[[g�����g�[[S[[�g���g�[gISI[g�gg�������������������gMI>AIIEEASS��[S�������������������gM�IE:AS�IMMSSME�[����g�S�<�����<S[:IE>A<8>AS�����Ӻ��[����������g�[�����������g����Sg[�����SSM[Sg��������������Sg�S[MEg�����SI�[EAEgSgSSIMSMISSIIMSSIE�g��������������������gMEIIggg[g������������������gggg�����������������g����S[[[g[[gg�gg[[[gg[[gg�����g���������Sgg�����������������������������������۾���:�>>A8<8��4���8<��64g�:��M�MII888S66666SI�6��S6IM<�IE8I8�8�Ӷ�6�������[E�gE�ͼg����[>:8:>S[IA�������[><>>[[ɸ���������ͼ�������� �� �������' � #��$S�'I��A������ !  '#�� �g:#&:2篫�M%&$�(-����[��M$['�ͬ�M�06$,%).40.*![�g�[������6�M�ͼ�S���������M�[/I4 & !    ##%,-.*.:4>8:�ͧ��������������������SMM<''%$#"&, 28紴���������������E>/2**/'(,#&/-,EI[;ž�Ӻ����[g�g��MS02<><EAg>044:0/26g��ɾɾż��������gg����A[[[�I��������ͼ���EI���EIESEEg�����IA>8S������MgEAIEEEEg[�g�Mg���������[AIM[��MEMME[��gg[E>IIg�������������M[�[S[g���������������������[AA:<<::4088Sg[��ɾ�����ɼ�������gSEAIA>6444888AMS�������ɼ����������MSg��[Igg�������������������gMMMSg�gSS��[g[gSg�����ggSSMS[�������g��g������������SMMEEAA>A[��������ɾ�����������Sg[[SS[SMSS[g�����������������g[IEEMIMSM[SS[S[�����������������[SSIgS[gg[SS[[gg����������������������������������g���������[ggg�������[MMS[gS[S[S[g[[SMMIM�[��S[[[g[S�MM��II��E�[�E��IMSS���S��MS�g[�����gMI���M���   @  	 Calculator  �`      6 � � �             X     U 
Helvetica   U 
Helvetica   W 
Helvetica  U 
Helvetica  U 
Helvetica  U 
Helvetica  "U 
Helvetica   U 
Helvetica   U 
Helvetica  U 
Helvetica   W 
Helvetica  U 
Helvetica   U 
Helvetica   W 
Helvetica   �    	P7on openCard
  global first_number, replace_mode, operation
  put 0 into fld "calculator"
  put fld "calculator" into first_number
  put false into replace_mode
  put "" into operation
end openCard

on keydown thekey
  if thekey is a number or thekey is "." then click at the loc of btn ("x"&thekey)
else if thekey is in "=+-\*" then click at the loc of btn thekey
else if thekey is "x" then click at the loc of btn "*"
end keydown

on enterkey
  click at the loc of btn "="
end enterkey

on returnkey
  enterkey
end returnkey

on deletekey
  click at the loc of btn "del"
end deletekey

on rawkeydown thekey
  if thekey is "65407" then click at the loc of btn "AC" --key pad clear
  pass rawkeydown
end rawkeydown

--stop the mainstack getting these messages
on preopenstack
end preopenstack

on closestack
end closestack
            � �  �    �  �  �  �  �  �  �  �        	  �   @`  ��  33      ff  ��  33       � �             	  �   � + �e�x   �on mouseUp
  global first_number, replace_mode, operation, second_number
  put empty into second_number
  put fld "calculator" into first_number
  put true into replace_mode
  put "+" into operation
end mouseUp
       � ~ e "      +          	       � * �e�x 
  �on mouseUp
  global first_number, replace_mode, operation, second_number
  put empty into second_number
  put fld "calculator" into first_number
  put true into replace_mode
  put "*" into operation
end mouseUp
       � ~ H "      x          	       � - �e�x   �on mouseUp
  global first_number, replace_mode, operation, second_number
  put empty into second_number
  put fld "calculator" into first_number
  put true into replace_mode
  put "-" into operation
end mouseUp
       � � e "      -          	       � � �E�x 
   �on mouseUp
  global first_number, replace_mode, operation, second_number
  put empty into second_number
  put fld "calculator" into first_number
  put true into replace_mode
  put "/" into operation
end mouseUp
       � � H "              	       � Del �e�x 
   �on mouseUp
  global first_number
  if the num of chars in fld "calculator" > 1 then delete last char of fld "calculator" else put "0" into fld "calculator"
  put fld "calculator" into first_number
end mouseUp
       � X � "      Del          	       � AC �e�x 
  �on mouseUp
  global first_number, operation, second_number
  put empty into second_number
  put empty into operation
  put 0 into first_number
  put 0 into fld "calculator"
end mouseUp
       � � * "      AC          	       � = �e�x  Qon mouseUp
  global do_me, first_number, operation, second_number, replace_mode
  if operation is empty then exit mouseup
  if first_number is 0 then exit mouseup
  if second_number is not empty then put "put " & first_number && operation && second_number && "into fld " & quote & "calculator" & quote into do_me
else put "put " & first_number && operation && fld "calculator" && "into fld " & quote & "calculator" & quote into do_me
if second_number is empty then put fld "calculator" into second_number
do do_me
put fld "calculator" into first_number
put true into replace_mode
end mouseUp
       � ~ � H      =          	           K@          ������       � �         K   eeeeee       � �     �    iGon mouseup
  global replace_mode
  if replace_mode is true then
    put the label of the target into fld "calculator"
    put false into replace_mode
    exit mouseup
  end if
  if fld "calculator" is 0 then put the label of the target into fld "calculator" else put the label of the target after fld "calculator"
end mouseup
         & v x  � x1 �e�h          e "      1          	       � x2 �e�h         2 e "      2          	       � x3 �e�h         X e "      3          	       � x4 �e�h          H "      4          	       � x5 �e�h         2 H "      5          	       � x6 �e�h         X H "      6          	       � x7 �e�h   ffffff       + "      7          	       � x8 �e�h         2 * "      8          	       � x9 �e�h         X * "      9          	       � x0 �e�h          � "      0          	         x. �e�h         2 � "      .          	        calculator pattern.gif  @        8 � _  	�GIF89a� _ �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   ,    � _ � H����*\Ȱ�Ç#J�H��ŋ6�0���'U2�I�  @4��@�<%#�;3f�7)������ �Ir��')�k	�Q�C��{*ҀыUZRM`�T�>40p����Ժu��T;6L)@�V�}X%�
�+�n[P���L�`�`] 24�:����z2U3)R0	F �a�o%"%H���ǒi��k���'�q~��m��>'x��l�(^ؕ�C�d�0}��dOj(�8��*�3&G�9A���<������l���Bf��uw�� �TFo��C�9 �W�!P  @�@}+qDP]�e�}�ax�$�P��B�-!��yu����F��5�d8�����}�B�9PW�H${3u�{���s��RB��uWE����^2�iMy��
%!�m)�OJF' S-7�YYB�!a���fUY�Ѡu��Pn�jU�
*��c|E�yP��V�Z�C���_>j�PP'zJRH.�&�B`��hI�aT�������*T�{��:�Q�*Sz$�S��N
!�5�t�>��N@�Jj�o=
a+e��Q�* ����
N�	������׊� �iQx��c_�D+E�K�r'X���e�t��D�U�-�[�i���D�9Y\��"�.I�
Be�E�Y�U "���kBȩ��{U�e:��켝>q/��,)C`��2�HS�@B����[���TWm��Xg���\�D%t-�B� ��&c�]��p��p�YG=u��RO��-P	z����I8��� QvPB�uh��@J����
��t�s��S�yB�< �t�3��u(9C_'z�Ic^�#d�Pq�7{���5俈>��m/�v�/�8 ;��s�^��>i���|��nw	����|��8��������h�m�yqճ� ��}��m7�����>�}m���4��	��k��p	=o �k�B*p�^� ��A��:�#��C�H����n'\A�7��L��8��
��L!"4���'�)apA`	��_�Mo ��7*��AD�;��N�Y\������-uwI=`��q$	��/j(*���G���>��9��A��y;4$�򗵿)�y�Z�4��4j��LZ	�6:�M8����@��-ti��Q�z��j
��7�����v6��Nmԓ��0i�Z-Nu���<�5
vs�<���MmJ�%��nz���8�INba��I������@FF�UG,O��)��Ti�~�4��8�[���
T@�׼�,�i�`��X�M�Z���!�Ӽj!9�R�b� /4b�ή���z�a��A���H/=˄lD̴4i+��Փ���
]"�E����^��JZ���.7%�=���heQ-*�)(�����1by �Q��s?�U�jP��Va�P=��XmU �PUz!��u;%��2����b�U��:-��5+��Y�CnE$aM+]�B���f�)��V`��-q��b���h�/Y�'�:�7���f��gAX���V!�p;���Z�YU�X���xՇ�mY+Rx݌L7��mK�s���$d�OT�[��h��-ʠhT�}�W$42*N���ڷ  !�clip2gif 0.7.2 by Yves Piguet ;      
   calculator  	`    �    �    	geowidth  0.470313
geoheight  0.05geopercent  0.40625,0.279167        � 0   	    K@  ������       � � &     	 Contacts Search 	 �p Non preopenCard
  put empty into fld 1
  select text of fld 1
end preopenCard
       ��F H             X      � 
Find Card   	P�on MCFind
  local thilited, tstring
  set the cursor to watch
  put the hilitedButton of group 1 into thilited
  put field "Find" into tstring
  set the caseSensitive to the hilite of button "case sensitive"
  set the defaultStack to "Personal organiser"
  if thilited is 1
  then find tstring
  else if thilited is 2
  then find whole tstring
  set the caseSensitive to false
  if the result is "not found"
  then beep 1
end MCFind

on returnInField
  click at the loc of btn "search"
end returnInField
           F H  �  �    �  � Type   �       ���  p .   partial words  D�      ��   h             	  �    whole words  D�      �� 2 d             	  �  � Search �L�p !on mouseUp
  MCFind
end mouseUp
        � ) T             	  � 
  � Find  )`      �  B         �     case sensitive  D�       n 1 z             	  �   � calendar popup 	 �`      � �               X      �    	p�on preOpenStack
  global current_day, do_me --should not be here, should not be global but is somewhere else
    local snames, nnames, it
    put "get the titles" & current_day & " of group " & quote & "diary" & quote & " of stack " & quote & "personal organiser" & quote into do_me
    do do_me
    repeat with i = 1 to the num of lines in it
      if item 2 of line i of it is not empty then delete item 1 of line i of it
    else put " " into line i of it
  end repeat
  put it into snames
  put min(the number of lines in snames, 7) into nnames
  set the height of this stack to nnames * 24 + 8
  repeat with i = 1 to 7
    set the name of button i to line i of snames
    set the visible of button i to i <= nnames
  end repeat
end preOpenStack

on mouseup
  global current_record
  put the num of the target into current_record
  send "displayrecord" to stack "personal organiser"
end mouseup
            �    �  �  �  �  �  �  �  �  �Ta@         �             	  �   �  �Ta@        4 �             	  �   �  �Ta@        d �             	  �   �  �Ta@         �             	  �   �  �Ta@        � �             	  �   �  �Ta@        | �             	  �   �  �Ta@        L �             	  �   	 halt   �p�on preopenstack
--400,300
  get the loc of stack "metacard demo2"
  subtract 1 from item 1 of it
  add 196 to item 2 of it
  set the loc of this stack to it
  get the num of controls
  set the layer of btn 1 to it
  put empty into fld "description"
end preopenstack

on mouseman normal_object
  global normal_name, depressed_name
  put the long id of image normal_object into normal_name
  put normal_object into depressed_name
  put "inverse.gif" into word 2 of depressed_name
  put the long id of image depressed_name into depressed_name
  show depressed_name
  insert script of btn "button manager" of cd 1 of stack "metacard demo2" into front
end mouseman

on opencard
  lock screen
  set the layer of btn 1 to 1
  unlock screen with visual effect dissolve fast
end opencard

on closestack
end closestack

on closecard
  lock screen
  get the num of controls
  set the layer of btn 1 to it
  unlock screen with visual effect dissolve fast
end closecard

on mouseleave
  put empty into fld "description"
end mouseleave
     � M�R 6   cResult  menu               U 
Helvetica   �    Pl
on auto_update
  repeat with i = 1 to the num of controls
    if "autoloc" is in the customkeys of control i then set the loc of control i to the autoloc of control i
    if "autovisible" is in the customkeys of control i then set the visible of control i to the autovisible of control i
  end repeat
end auto_update
on preopencard
  auto_update
end preopencard
           R 6  �  �  �  �  �  �  �                 	    � menu regular.gif  	P\on mousedown
  if the mode of stack "settings" is not 0 then exit mousedown
  mouseman (the short name of me)
end mousedown

on mouseup
  if the mode of stack "settings" is not 0 then exit mouseup
  get the short name of me
  put "inverse.gif" into word 2 of it
  hide image it
  remove script of btn "button manager" of cd 1 of stack "metacard demo2" from front
  close stack "halt"
  set the cResult of this stack to  "menu"
end mouseup

on mouseenter
  if the mode of stack "settings" is not 0 then exit mouseenter
  put "Click here to return to the main menu." into fld "description"
end mouseenter
       ���� d d  �GIF89ad d �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�  � ,    d d G� �	H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�=|��ɚ'Kַ�(M�$)k�o���#9��̓�j�$	n$M����c��^G��Ք%��ɓ=E��)��ȓ/������]ZS(Q�G&���i֗WQB���gL�vɢ�*�٢iՂ�[rVI��I�4i5�N���EK9��y���\0�c�V1_�/W�5c��ڪa�NU��<0�۸s��ͻ�����N��q�IA*_μ���У㳢��Z�Xe�,�5'̨T�u�U�54�ǚy���/�ָ_OZ[�����:w�Ə2h�͹%�L#M��}����a��sW~�՟kN��[R���v���_j;�&�$��7�d�n��3+0�(�4�h�8�v܎<���@)�Di�H&���I��P*��Yꁤ]�����a/Q_hx�ØL�M"P+8�v�)�^M7�$�US��R_}UY=��G� ih�J��$��?aޘ����H���ur���|}���R���瞔I(�mk�)!h�1xl�����j֨��a�r�ԃ��F�[q��]k ����Wk`k��v�-��y��GUa)�rlZ�a*�Jma��:�XO-��V���pEu_�����[��Tl~ꘛ=+��� ,���=K&���7���G,��Wl��g���w��� ���GV�l��(����,�좾��9���˒��y�+����v$`a�ʒ�v�Dh��uh�}Z4GɞX�%a�ث���Ow�|
jX}N��Z\u����,:n���iש�����:����O�TS�~��W$��Rvg���n��w~˴�,�fj��8F�n�������H�:�����EC�-�O#i�\�������nQRR����9��SΗ��y�W�|�!��ëZڙ��'�#%Oѭ��(SVq�l�����j?�q�� �M��JK����Z-��]7-�x�I{f!�MhD���S%|lh|��脨a�1'y�J���h�).��B��.u4�Sa��A��og�ڸ�u*���.{���(qN�[��	�0��WqUR�HZ��R�di�:d?05�Z��
B�|X��_��t�8ƒ�#`<c�hF6���e,O���6������=�Qd�� I�B�L�"��F:$  !�clip2gif 0.7.2 by Yves Piguet ;        � settings regular.gif  	P%on mousedown
  if the mode of stack "settings" is not 0 then exit mousedown
  mouseman (the short name of me)
end mousedown

on mouseup
  if the mode of stack "settings" is not 0 then exit mouseup
  get the short name of me
  put "inverse.gif" into word 2 of it
  hide image it
  remove script of btn "button manager" of cd 1 of stack "metacard demo2" from front
  settings
end mouseup

on mouseenter
  if the mode of stack "settings" is not 0 then exit mouseenter
  put "Click here to alter the settings." into fld "description"
end mouseenter

on settings
  local orig_loc, it, start_time, current_time, image1_loc, image2_loc
  modal "settings"
  set the defaultstack to "metacard demo2"
  hide bg "small_settings"
  if there is not a group "small_settings" then place bg "small_settings" onto this cd
  set the width of button 1 of group "small_settings" to 1
  show group "small_settings"
  put the loc of button 1 of group "small_settings" into orig_loc
  put the milliseconds into start_time
  repeat
    put round((the milliseconds-start_time)/3) into current_time
    if current_time < 1 then put 1 into current_time
    if current_time > 100 then exit repeat
    lock screen
    set the width of button 1 of group "small_settings" to current_time
    set the loc of button 1 of group "Small_settings" to orig_loc
    unlock screen
  end repeat
  lock screen
  set the width of button 1 of group "small_settings" to 100
  set the loc of button 1 of group "small_settings" to orig_loc
  unlock screen
  send "expand_stack" to cd 1 of stack "settings"
end settings
        4�� d d  �GIF89ad d �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�  � ,    d d G� �	H����*\Ȱ�Ç#J�H��ŋ3j����=|�d}��o�,�����r��y0�ń��L�&g��I�?V��uT�Mp���4���I�'�Δ��$ k� h�:/+�y>�
���ʑ#�~�Y'ۜXs����*̰Aɖ��ԛr�̳߼|��Z`�����6�3�^�E�~,�3�y��n�i��[�x�^^ͺ��װc˞M���۸s����٨#QwI��鶧��˷5_���}�d���,�������U�4��ҽ[Yuk�󂿕%��h�R���Y^:�����<x>�Ĳ0��L�8�Z}�}dE>Z� >6h>�08a�Rh��b��:� +b�f�(���,���0�(�4�8��"��<����Ïe�e�?"9�]I��S�Q�YR��^t	N�dZױ��ZO��iO}��U2�e�ӭ4Ku����7����IN:�c[q% rQVb�!���Itf�ڭd\�lu������y z�z1�W%MO�ǔ5���ӥ�eFgw��y�ܢ�ͳ �`e�> ���ef�f�<I&��	����ϲ�������QR�I)v��mM�xk�����e�.
X�����d�mG[�����k�����Jk� ,��l��'���7���G,��Wl����w��� �,2��Ħ��(������&�G��R&�4˰��9�V�KVQt�9h"�5����{>e�,��9RuI!ז�9�2�>O1���4�QQ4�lvpT�t�|QVh�V��5bsd�HN��4v�j�L75�' V�U�F@�4�I4;��X��b��}�Qd�Q�g-����-z���kb�i���.��dί��K��
��cĹ,;������.��xT�_d䪫�f_�?��]�tR�������YMYÜV���y�Nl�o�5�h��U�#����Þ��S�J����>��`�"F��ҟ�ȩp�XA X���"���������;L"�W.x#� fm���5���9�	%��UkX1li��J�d�� ��窓l�Q���M�H��GH����x/��+Ȣ���.z�`�큱2��hL����6��p�c@  !�clip2gif 0.7.2 by Yves Piguet ;        � back regular.gif  	Paon mousedown
  if the mode of stack "settings" is not 0 then exit mousedown
  mouseman (the short name of me)
end mousedown

on mouseup
  if the mode of stack "settings" is not 0 then exit mouseup
  get the short name of me
  put "inverse.gif" into word 2 of it
  hide image it
  remove script of btn "button manager" of cd 1 of stack "metacard demo2" from front
  close stack "halt"
  set the cResult of this stack to   "previous"
end mouseup

on mouseenter
  if the mode of stack "settings" is not 0 then exit mouseenter
  put "Click here go back to the last screen." into fld "description"
end mouseenter
        o�� d d  �GIF89ad d �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�  � ,    d d G� �	H����*\Ȱ�Ç#J�H��ŋ3j�ȱ#��X��Hr㊓���Kim^��*a���&�}�D��X��
�6k���2�L�*�Y{)�Ν������~3e����+үYU:	��@{��Mͩ/�۷p�­g��ݻx���˷�߿�L���>�9�g���ǐ��{�`O�.����јH�V&���{H�rU��(k�0��=Z!Z����yԚ�׊s���S�ȓ+_μ���УK�N������_�x2�����������+��35z��}�|�^�h�H��,?�~�)�V�T���_K��TSya5�]r��Q3y��xY	��mU�'[��-8ۃ�ݶj����,���z��F"x�C�8��<���@)�Di�H&��L6�$`6*)�}C� �A��!�>�O>V�)�d��NT.�؂C1���3m��x�ʹ��L������7�jv�M^9�ee��g`Xn�����hp�f��]X���cE>�$h`���Z}�EX��JQ8n*�_�5�h��&�f ���W�鉪r�+����N�*����f�A�ڜ��F�xn"K�yb��Ww��-r�:���;k�i񳮐2�9�=����������� ,�� !�clip2gif 0.7.2 by Yves Piguet ;        � up regular.gif  	P]on mousedown
  if the mode of stack "settings" is not 0 then exit mousedown
  mouseman (the short name of me)
end mousedown

on mouseup
  if the mode of stack "settings" is not 0 then exit mouseup
  get the short name of me
  put "inverse.gif" into word 2 of it
  hide image it
  remove script of btn "button manager" of cd 1 of stack "metacard demo2" from front
  close stack "halt"
  set the cResult of this stack to   "this"
end mouseup

on mouseenter
  if the mode of stack "settings" is not 0 then exit mouseenter
  put "Click here to begin this screen again." into fld "description"
end mouseenter
        ��� d d  _GIF89ad d �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�  � ,    d d G� �	H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ '�9o+}!SR�B�<k����)˚Kk���T�s��{.]�t�O8k߄Z�7�eҦ9w��h��իX�j�:��ׯ`ÊK��ٳhӪ]˶-�n{�d�&N�q1�d�t�?�Oi�5�B��*s^�Ŏ�6�ַ�}Vk�̹��ϠC�M���ӨS�^�:a�|��nXuE�����7�`m}}���{��B�ƴ6��5�O�$4f��ثM�/gtе��M����ċ����;g{���H߾�����?_���X�|��+���ۂ6���F(�Vh�f��v�� �(�$�h�E������O{
N�<���Y�-�p�`8]Vσ��2�M̙tco9Z�sD��O����WM��Dd�G���m�Ygc~��$jA�dSc���OzOugci[.�L�%��zC�	�gAZWR�5&�7��D�?&��Y�t��Q.���SCE��?nVy_�Տc�:Ye��b�wn�+���꫰�*k��dz⭸�뮼����+�Ė !�clip2gif 0.7.2 by Yves Piguet ;        � forward regular.gif  	PZon mousedown
  if the mode of stack "settings" is not 0 then exit mousedown
  mouseman (the short name of me)
end mousedown

on mouseup
  if the mode of stack "settings" is not 0 then exit mouseup
  get the short name of me
  put "inverse.gif" into word 2 of it
  hide image it
  remove script of btn "button manager" of cd 1 of stack "metacard demo2" from front
  close stack "halt"
  set the cResult of this stack to   "next"
end mouseup

on mouseenter
  if the mode of stack "settings" is not 0 then exit mouseenter
  put "Click here jump to the next screen." into fld "description"
end mouseenter
        ��� d d  �GIF89ad d �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�  � ,    d d G� �	H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�C{���H�=|�d�t�r�,o*�9J��5�r�a��}#K
x2�7�HU�r�n��y��ȑlFrњMF ����X�%�F�5BT�"�����h�� V���瓕�zc9�[A���Æ���3���#K�L���˘3k�̹��ϠC��g���ӨO��6������D��(�X�e{Jf��:�j��ӧ���ut�y#kݶ)�F��V޺��z�ȑ�9���͇|`Q�f�Z3\M7n�f��F��U�>���hO++�(��h��&���6���%�����P��J��H?�0�7j�D�O*x�,.!ҒR���#k�W<�u\�E�5[R�p�7��MN���#k���π�4[,vb?�8�u�le�VYm�����By+��z�t�͕o���#��%p��%J+���#�tIg}�p��Tݨq_>h�=V�#餔VZi>���_�~�Ϧ�v��
O�jꩨ��ꪬ���꫰�*무�j뭸�뮼���
"�zR )>Xϱ�&�l��F����ڴӞ�ӄ��M�H���#�h��6d�ѥ��X��,��M�3Ÿ��&���i�K,IɊk�ȍ���+��N>��<�~�R<i=��ٷ��;�+�$�5*uS����6W�)&x^�U�~+�&��"����w�^ucV2l�1�|�cVZ�,n7�`b(o�U�m�g���w�ֳx�ۑj<�ϑ�y�^z1�
y�%?,�(}�ycwvNwm��wߥ�W �����hŝ7[I'�0i�W+�RZK��]�GNjp ��~s�.�}�^{��7}���
��v_���?���c��ja���zR�X�O�&����7����G/���W�P@ !�clip2gif 0.7.2 by Yves Piguet ;        � play regular.gif  	PTon mousedown
  if the mode of stack "settings" is not 0 then exit mousedown
  mouseman (the short name of me)
end mousedown

on mouseup
  if the mode of stack "settings" is not 0 then exit mouseup
  get the short name of me
  put "inverse.gif" into word 2 of it
  hide image it
  remove script of btn "button manager" of cd 1 of stack "metacard demo2" from front
  close stack "halt"
  set the cResult of this stack to   "play"
end mouseup

on mouseenter
  if the mode of stack "settings" is not 0 then exit mouseenter
  put "Click here to resume viewing." into fld "description"
end mouseenter
       �� d d  �GIF89ad d �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�  � ,    d d G� �	H����*\Ȱ�Ç#J�H��ŋ3j���=|��ڧ_��(S��xo��m�D !�ȚG��zD&�H}�N���e�m��bD5�q�F62۲q�VaCW۴Aն/P +��fd��ѶD�=z�r�2��(��(G�|�X�ӗV�P�ڸ!�(�>��K�L���˘3k�̹��ϠC�����nݼ�V��gP�Y)c$&Slj� %3ժ�#@�q�þ�V��.���6 �obU��2�e۰�[�lF�����w���"��=�smN�����|���������� (��h��&���j�P�5Kdt3�,������H+�`��5Ft�X݌��
ĒKFpP��\����oFw�	��tGl B^kp�7�<\��}u�6F�hR�,IeĎ7���#�tǍ|t��#1V�Am�p`\}��ahB�"k,�Wmz��6k��O>���T��&"Mrsڒ� g���n0m�"�>�_�.6�}��3*�	���(���*무�j뭸�뮼����+��k�J+̩�G���ڮ�u㏆���ͅ��Hҕ��4j���ȵ܌�Z�,q�"!B"lc�,f��l�F�1f6"p \wjΥW�Ƚ�$�6����N��#4���"LZR�8��7@�]bF�D�#r B�?"�hsT�i�s�)U6v�7�]�	^kĬ�hFqD�ؔ�����	L�QŁW8��͚�a0����H7n5I��M��Li�MRk�W>�E�[&����\:�<�6��F�]c�g�F��$LX5���<��#�,F����ظ�<�ʇ�0�xtd�X��7gW�w٩��.qS��v/hT���"�֗���՘���*b05����w�c�cJ�=�7���g����w�����/�� !�clip2gif 0.7.2 by Yves Piguet ;        � button descriptor.gif  @    � P  � *   autovisible  false  qGIF89a� * �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   ,    � * G� �	H����*\Ȱ�Ç#J�H��Ł������Ǐ C�I��ɓ(S�\ɲ�˗*���&�F�8s��ɳ�ϟ'evX�&УH�*]�T��XD�6�J��իeʪ�*l�7n��l{�h�Zo��us��Q�nl�db$�,nzר��mC2�9�2�۬�ݼ�����#��Ԓq���*Y�b�ݍ�� xݮٶZ��۶�����؈_'zt�m7D�	{ㆈ["��łe�U��
12�(t<ѡ��.˟�y��恟g-�xk��Ɋ�j�,��F�/\���d��'k������}�a�h�dg`,��'�@Cm�ՄVhaL�d�7R]�� Z%�@t�(���L�ā�*�(�N��?%JH�<�(S<=rѐDi�H&�$B4�a�PF	�����XfI�Vqx��`���LM����h��L֐��p�I�n�)�x�TTv��g�{�ST���5idϢ�6�裐F*餔Vj饘f�馜vꩦ6IX`��78 7��F�g�͂�,r��\�M�Fg�Qj�F�m��Y�t��,ly�_+�>�q�<��#���5�v���ܾ�ld���d��5[�]�o���5��k�������Ͼ��������'l�*����*��B�īDl1�� rH ���1�{�p�	'�#�~���,����0�li�!�8KI�9���L�y��D�H��E'�#�]���r��NCm5VL�c�Ww]�L���������d�-�?[	Z��p�(�q׍T��;ڭ��l����+���ۀ>��y��JR'���&5N8�K}Ē�g���wn�<��.�褗~P@ !�clip2gif 0.7.2 by Yves Piguet ;          menu inverse.gif  @    � ���� d d   autovisible  false  �GIF89ad d �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�  � ,    d d G� �	H����*\Ȱ�Ç#J�H��ŋ3j���!?V���'k^?Y�P�T�R�,"�}��R���"S�)�^�y@��\�߽�?��iS�˕@��:s�Kk;�Y;�R�H���[rhѣH*�Z6&L�SU�IҪ՟���;�'Q�iՂ|IשS�#���,вP�:~,kVe��6�nK���yZ�1�+[Ny�i�Ͱc˞M���۸s��ͻ�������R%͔�����_՗Zw~=�m�׵�W��g˙��wn�{�'M���c������&��tj�����okM+}Y�ͦT}OU&�j%�ԒWP�#TLm�WZk.�rR��}��Q�t�� �(�$�x�p(���,���0�(�4�h�}�ʎ<���@)��胏mJ�6KN�}v�SL��j)�3҃?�d��u�s��Na>F�MMW�y�=�%l^�T\q��G�I�����W^���fIR��%qW�J8Y�z�6h`J�ggW�&Zk��(f�)\���eI��t&d:��Je'��iֱ�Z�H�z�Z}c�U�j�~e���^�	zbv�5֒T�5xePYJK-X���Ӗ˲7�|>Fk��T��W�fk�IS��Q ��cE���[����{��ڛ/����o��s$�'���7���G,��Wl��g���w��� S�?$�l��(����,���;���4�l��8�s�k& Hs�kN�iR�$a�Ī����h���)Y�Sa�����_j[�rԙt���Rt6��֙�zU�7ǒ�X�U��L"��3e|-eEәs�G���N�F��ݩJj�G�y��uXZ�������RM��jO�A����J���=��`�6eW�a�8��Fxy�P��ؙN'V���j�Z>�ܪw��|;�U�w�>>���E
���QgQ9:�٪Fa��k͟.�<� ��h���,ބ?�?�Q��^|����iϢ������>{z��3,-�� ���8���-'.�+ϧ��>��o}���d!�E�|�+��H�
E�"J���E6;5h��*�c�����$��rZ=�0s�c�,�$���p"v��]�39V�O�s�e���|Ps�
IT��8���z8܏J�Ś<Q"�؇��E�:��x̣��������!�@R��$�!��E:Ґ�4d�&I�JZ�̤&7��Nzғ !�clip2gif 0.7.2 by Yves Piguet ;         settings inverse.gif  @    �  5�� d d   autovisible  false  �GIF89ad d �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�  � ,    d d G� �	H����*\Ȱ�Ç#J�H��ŋ3j���!?V�d}��o�,�����r��y0�ń��L�&g��Is>|�:.�ȏ&8YG[��g��̓PgF�y�5k �f����<�@�*$�r�H�^o�ĩ6g[�OuN�	6�X�D��z3'׽����7/��y�V X!�p>�L���{�`ީk�ĉ��[�6	|�n�ӨS�^ͺ��װc˞M���۸_��:%o������y&�|Z��f�5ّ*]�B�Y�f�R��-��_�a���<ٻmw���o�����櫉���������;,K�
����|�}�P�$���6���:8YnVh�f��v�� �(�}�ʉ(���,�����Ok��#RSG�u�J�4�v��ԣW6me�g�YӱtVZ=nƗ{ځ�_;��n��]o�q�M_S
GU� 4��V�\�������Y���fi�>Z���M��yQs�e^L���YSO1EX}tM(^Qc�9_~�aj�I� ��U���>�	Z�e��5d~fB��W���ϬW�se�G����髫0�ZS�r%�>��e�]���d�h�ťֲb�O>Vl�-��r����Z.��;��~�n>3�(���k�������� ,��l��'�0E�����G,��Wl�����J �t��� �,��$�/�[�Z�QK"�J�Ǔ�����L�
EԘ`���7pyߡN�g_���%T,E��@�7��N!H�� �QG-���,	��M��'˶&i`>�2'i|��R2�L���wS�kP�ZZo�sK�	Y��E�̙���ӝڅ�I\�^�R�ݫН�#Ow�63�=�K:��ku�%[d������섟�2�]�cY$�_$_���eޭ�]��1�T��IE3���l���!���oY�9�zQM�U2���Ч�̣�ޞzO�J����]��}E�ٝ�2>�Hm;q��W�ǁ�%�U`쳻��|/ю��N$�zs�}'�K�D{ �{�A��y���
)X��8��틓�&?�P�DX�Iu����g�2����&:�P��US{XъU�G=���+v�[�b�(�2b��`\����6��p���H�:�1  !�clip2gif 0.7.2 by Yves Piguet ;         back inverse.gif  @    �  o�� d d   autovisible  false  �GIF89ad d �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�  � ,    d d G� �	H����*\Ȱ�Ç#J�H��ŋ3j�ȱc���y�q?V��ɚgm^?��b�\�RfLk���G��V(a�lY��˘0o��g����;{z��h��.i�Rgm&L�D�Ƅ�S�Y�����i��۷p�=K��ݻx���˷�߿�L�0D|'��j�'ДF�ڬ��(Қd�jU)Ӯ6���
���̚�e�Oi˗Ii�d:uj����{������N����ȓ+_N�s�&�Y��|�I�+��ʽ�w������%��HI[��v�Ae'���%����������E}���g���P��X�d�m�b�,��D95!p��_�^�^l�X��U7�N.�(�4�h�8��<���@)�Di�H���xA��u;^�O�;�5�Y��
�t�S�`��%��]��K���l���bd�f&�Cɇ�P�gjV�TbM�IV�Szg%���E �Z�HX��i�6�7V��A*�|��W�JD9�W=&8ML�FM�zz)�V��S��X7�ג��!�J� �+�:���}eY�w:���ճگR��J�Bk�j�9U�J�yu߮����1����.�gp�j��b��뮽���t��xOHI,��l��'���7Q@ !�clip2gif 0.7.2 by Yves Piguet ;         up inverse.gif  @    �  ��� d d   autovisible  false  �GIF89ad d �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�  � ,    d d G� �	H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ 'Za�O>}�V�\91�@��ɴ6O�5k6q�˷�˟���7SV�y4�Z�&��<F�����JJ��i�W��֭]���*�kY�b��]˶�۷p�ʝK��ݻx��e�O�^�B��i�Z�������2P���	�3jի�
-�t�L��p>�i�)�yߒλ�8��װc˞M���۸s��ͻ������G2_��+��$l2��z��S��͜�N>�U�y��p�/^�I}�x'��o��~H���7ٟS�N���^_��Q-E�L�5%�L�ͳ�IV��?��#�Vh�Z��>�E�� �(�$�h�(���,���0�(�4�h�8�XQrϭ��>=��ID���sЍ8�w��R�>�8�>�yf�!�%y\=��3�xS�b�UQ7e�IMU�h�`�Rk�q�Q�I��׍�o#Qy�?�95���`�O p�fqB}�d�F�S�X��m}V)�Q���i�ȇe���clK�S d�-UK��Q�
UMLe�k#�O�5Mv|L���|߰*�<����^���ϳ�F+���V��>>����v�����+��k !�clip2gif 0.7.2 by Yves Piguet ;         forward inverse.gif  @    �  ��� d d   autovisible  false  �GIF89ad d �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�  � ,    d d G� �	H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�C|��y	$+Y(��%�Jn�mC�FM��7W���/�
�@����Q��=�F�ۣm@!:r$���@�f���{A5�T���,G�����~.�%Zc$՜+����޽{���<���{�X�ҧ��ǐ#K�L���˘3k�̹��Ϡ#�D���Ӧ�)��O_��ME��QQV�f!�֔�6nUqZն�kOǰ�>���Fֺm3RF�6G��u�k���#W�q���:y��)�:�����n�͚խ>���W�7�$���(��h��&���6����aE&�$�C�����8�O7J1ō6e�O� � z,!�R���#k��V'w�Io�v�*���7AlsSx�i��*�7K�Ųa7��#�T�MVTeuUV8q��>>��Y���J7�T��Y="]ޘ߅���^��l)�}�p�ATݨ��xx:�X>�4�裐:�O7&":aC �sO^�F�W���*ꨤ�jꩨ��ꪬ���꫰�*무�j뭚�㚬��h��֤�&)f��"�M ;鈡b(u��Q���H"Xr�klib�)������1ŸͶ���^X�PE�X.Rj�#7Tr�.��:K�I���!J���#�Zw_V�޴���x�,�D;����6U�	fx% z�a,K�.��#j`�U�xU�`�	�<d�%KR�v3Kv �2wW��y	6�gC�,�,��f���c�w\fc^z���X�𣒋�8R_}޴�S�
x`�7�I.h�u�YܰD��T�)�6A�\i��B��z��FƖ��g��d������i��|��W�,���dkV���ꬫ��b��jR>z�
cO��k������/���o���'�P@ !�clip2gif 0.7.2 by Yves Piguet ;         play inverse.gif  @    � �� d d   autovisible  false  �GIF89ad d �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�  � ,    d d G� �	H����*\Ȱ�Ç#J�H��ŋ3j���b V���c�_Ǔ(~ԷMͶm"��qdͣdf=Ɋ_>{)�.\�m�ld��FF�#DܲI��̶l�Uذ��6m"G��WOhƕkmK��ѣG-׬!�Hҷ�r�Xq�f�����۽}��̸��ǐ#K�L���˘3k�̹�ɕ޺u��O��<w\i���J��)c�LT�F� �$,+�� �N��+�m���j�Q�l��mX�mv6#I�d�7����[��MmL���X�p�?����������Ͽ��� (���5V}>���r�>�%8+�x�H+�`��5Ft�7������0x6ר�u��H��&������P����6M���n]��I���2�d�K�pC݇t)��#(V��k�p�b��x9��"k��kv1�6kQ���ZN�6Z���MhB��]�DiC�K�8��^�J�Jj� �Y!)��v�駠�*ꨤ�jꩨ��ꪬ���꫰�*kE���G�A��`!�U*h��2�ib�$�+�"Z7r&l��b�7�n(B"�!�6݄�¤fSƇو��n�y��4�T�+��M"j��ʽ�ȊF`�m�$�s)~r ċ#p�kG�k������{R��_bc��WB��\�mh�V^f���sFG��Ï��H�׽t�Tp����|I#?���jh=ҍZD�E��N/ܰRڈ�3�y�&�kxh7o��rڈv��s�ai��$�KV9ڐ�<��#�a�gwZg�ϼ���H+z3$�ȑ��� ��&s���\ns�ߛ6n��f�"�Gڲ��X�T�0��`/��,�|�3��"f>�����������/�� !�clip2gif 0.7.2 by Yves Piguet ;           B
 Aon mouseenter
  put empty into fld "description"
end mouseenter
           R 8  	         	  � 	        button descriptor.gif  	@      P  � *  qGIF89a� * �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   ,    � * G� �	H����*\Ȱ�Ç#J�H��Ł������Ǐ C�I��ɓ(S�\ɲ�˗*���&�F�8s��ɳ�ϟ'evX�&УH�*]�T��XD�6�J��իeʪ�*l�7n��l{�h�Zo��us��Q�nl�db$�,nzר��mC2�9�2�۬�ݼ�����#��Ԓq���*Y�b�ݍ�� xݮٶZ��۶�����؈_'zt�m7D�	{ㆈ["��łe�U��
12�(t<ѡ��.˟�y��恟g-�xk��Ɋ�j�,��F�/\���d��'k������}�a�h�dg`,��'�@Cm�ՄVhaL�d�7R]�� Z%�@t�(���L�ā�*�(�N��?%JH�<�(S<=rѐDi�H&�$B4�a�PF	�����XfI�Vqx��`���LM����h��L֐��p�I�n�)�x�TTv��g�{�ST���5idϢ�6�裐F*餔Vj饘f�馜vꩦ6IX`��78 7��F�g�͂�,r��\�M�Fg�Qj�F�m��Y�t��,ly�_+�>�q�<��#���5�v���ܾ�ld���d��5[�]�o���5��k�������Ͼ��������'l�*����*��B�īDl1�� rH ���1�{�p�	'�#�~���,����0�li�!�8KI�9���L�y��D�H��E'�#�]���r��NCm5VL�c�Ww]�L���������d�-�?[	Z��p�(�q׍T��;ڭ��l����+���ۀ>��y��JR'���&5N8�K}Ē�g���wn�<��.�褗~P@ !�clip2gif 0.7.2 by Yves Piguet ;      
  	 description      2on mouseenter
  put empty into me
end mouseenter
       S  �                Delivery Example  �p @on preopenstack
end preopenstack

on closestack
end closestack
        � �� �         Delivery Example      U 
Helvetica   W 
Helvetica       	P ~on preOpenCard --we use this to empty the fields
  put empty into fld "timer"
  put empty into fld "message"
end preOpenCard
     �     � �   	cdnumber  1              �    	P'--The "--" denotes a comment.  This is ignored by the MetaTalk compiler.
--Use them liberally to be able to understand your work again 6 months later!

--Feel free to change and edit this example as you like.
--Unlike the version showed in the presentation, this example changes the
--traffic lights, and move the man's head up to look at them before driving through
--the red light!

on preOpenCard
  set the location of group "van" to -282,105    --to be off screen on the left
  set the icon of button "head" to 2856         --to be the normal forward looking face
  set the icon of btn "light1" to 1012             --to be green
  set the icon of btn "light2" to 1015             --to be green
end preOpenCard

on openCard
  send "change_lights" to me in 4 seconds    --send this before the move starts
  send "change_face" to me in 5 seconds      --or it won't be sent until it has finished
  move group "van" to 750,105 in 15 seconds  --move it to be offscreen the other side
  
--now, lets go back to the previous card
  visual effect scroll right
  go prev cd
end openCard

on change_lights  --runs 4 seconds into the move
  set the icon of btn "light1" to 1013     --yellow
  set the icon of btn "light2" to 1016
  send "finish_lights" to me in 200 milliseconds  --to change the lights to red
end change_lights

on finish_lights
  set the icon of btn "light1" to 1014   --red
  set the icon of btn "light2" to 1017
end finish_lights

on change_face --runs 5 seconds into the move
  set the icon of btn "head" to 1011      --to look up at the lights
end change_face
     �     � �   	cdnumber  2    �  �  �  �  �  �  �  �  �  �    � light1  B
�on mouseUp
  lock screen
  set the icon of me to 1013
  set the icon of btn "light2" to 1016
  unlock screen
  lock screen
  wait 10 ticks
  set the icon of me to 1014
  set the icon of btn "light2" to 1017
  unlock screen
  lock screen
  wait 90 ticks
  set the icon of me to 1013
  set the icon of btn "light2" to 1016
  unlock screen
  wait 10 ticks
  lock screen
  set the icon of me to 1012
  set the icon of btn "light2" to 1015
  unlock screen
end mouseUp
       � 8  $  �         	  �   � light2  B
        \  $  �         	  �   � van   i 
       �  �      KB      ff  ������    � ,D m        v� ?� <� 9� 6 0 . 0 3 6  9# <. ?7 <: 9= 6C 0N .W 0Z 3] 6` 9c <n ?w <z 9} 6� 0� .� 0� 3� 6� 9� <� ?� <� 9� 6� 0� .� 0� 3� 6� 9� <� ?� <� 9� 6 0 . 0$ 6( 9+ <. ?. W. j. ~. �. �+ �( �$ � � � �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �} �z �w �n �c �` �] �Z �W �N �C �= �: �7 �. �# �  � � � � � �� �� �� �� �� �� l� X� ?  � postman pat himself.gif  	@      # ! � �  xGIF89a� � �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�   ,    � � G� ?H����*\Ȱ�Ç#J�H��ŋ3b�Ǳ���9jI�d� F�\ɲ�˗0cʜI��K �L�ܩ���+��'��ѣH�ƋWtU�UL�J-jϧP�B���ʵ�ׯ`���*�ϳh}�:Tj���V�oԤr�=]������$)vhY��u�M�V��U��ʋW�z��H>��
@��F�+��5�r�,L���İ5.ږs>}�F�d�f@��  �t��|����o2R�W��-ذ������}���D��Y��t�={���Z��*��v��;^>��is�X����މ�@�IGgS}&W>�M�Jrv��Q��G�d(�>v��V�߀�ud�(�ՁM�  �TQ�
�lv�e��܄�%U�bhTs�h�Z�f�a$$`���Ę�py_=���T�\�Y��b������u�iG ��hӜt�]tu�t�|��矀��H �gDr��vV'����i�.eWա���(�Qԝ�>*�M�z���a*Q�,=I�`����SKW��P���������5���(N�w�~���2�Ӊ�jjLȞ@��.������+�Ú���b�-� �[�������n��k���o�'* ��,��w�iV�&�p·������[pZR��"\>�[\3Vѥ��IGXk�71Or:�1e1��Q� \�+G�`����EJ2y2��'o�؃h���S+h�Y=b�Ơe6ʓ_Ω�|Ո�!ko�'��]� `OԢ՜[p�5Ղ�}9�j$����P���TyU���R�Y��|�ţ^nVX���xS�3�K<���M�W<� �_��h UOV�^�|W���#�rx�jڭoG��]pM�sO>Q��\<��z�`����pe��?$�y���k;�� ���V?T��+�!G:o�F�:0��F����~K�j�����jg����L��_ ߷a�l rb�K �i�O��s iC��9Ɂ61�8%<Uk\/
���?]E����B(�X�P&���h�f�Cy�`W��C���D�Z�3��f��I=��U�B1z$���(�%Z�X�"����.B�#����E/��,<cIP2�6��p���HG7�Q�	�H���>������ ����"�Þ"����9�H�;�D�����
ED>2���ɍ�
�$�4*al*Z�c�G!���!��(BɌi�=+�G�tC��gs7�i�F���l����ʒ�˼�C7���ٞi�M�j�|eCb�̇L�.Փ�p4��*�l�Yg�l�Lkc9f7�Y��=&B�Ӈn�"ͅ/Pه�.S�/�:Ɣ�<�T�ʉ���X�>�a�� �Q)�=���s6�i�a<�#K4"�M�j���r"�f+@O'�����3L�Mᚲ#�3�
�]Ue������G>S�&U)v�n��S��yy�&Uz��.���^"t�ʀS�rQ'��|���p��\��٥Q1\UJ>����<Efx�ig���Uu�+��\��qS�>\U^����H�r�T�r��ȖTq%b�D��~���"�&k���3��S:��V���U,R��!#1���V�����2�ʃz<�^S��R��� �v��p�*ň�2�s�?���������y�]͠��&��I���*X�K���7u���VX�B2j��k�{����(��և���|���<'+�T������ď�k؁���3*�?C� ����+��p�IH
��'�����ZAJƎ��k�cJ�xb	T]�F���U/�&+IX<���Dd9Y���`����$�vk&Gظ(8�o�p]T���<f�@J;�3���7��|3���ՏBg�?���͑ 
��:���՘,BڈU�ڛ�U�"bZ��c��绍��L�6��첚êP��:�X��ָ�f�wm���ש������.�(}_e;;ׯ�����.gk��؞�!�}�l{�Q�.v��a6�*"��|���v����U�V��]��;��5�i��kJb�s�,��p�IWR�#u�*�Y[%�gcNq�Zi�����wK�2qE�V5#_x���%T.�J�8[G*J^�۹��Gǒ��M�gsw��0��S�*{z%G�9/��{�h)^}-0���l�\���7M97���91��^/�2�� k�fhB�k�����L�"��h���L�Y����9d�#��6FH�݃��`~��V���'ϒ�w�i��rY�Uh��Y�*׺�<�%�����Kхwx�l�x:���G�w���3��ۚ����6�I�z/�!�{&nX[��I��y��wE����k������ӳ�!xhW~w�C/�%Z~q����AqA�9�����wݾ�T��:���|&u����({e6q��0�'�Adg(u|;�7ճ
�p9etF���4�Q#�54�sQ�J
h{HC�]���!t[��#e5R���q�wU$(T�7r�$#��W�W2�s�53�4��}��wQ$=!'XF'4R8��9�<�_\�o��|�~�p��7����4{�x�} �#�e<��o�E�_『#~�e��y����a��U�`x^x�^z�/�4#�ZW�"1�I�I�P#yQX�g1�s���oH6T}8r���Lq4'6��8׃[��:�舵'I]�F�E�4��[��Q��uHs�8$c����D��MWS�Q��S=�QzϤqLg|�����X��$�hfK���;偎�3��#�u[�5�CS��[�8/�HwQ��Y�3:2g�r�]�e�S�&���YŇ�8��q�%�SFxo�H�R��p&h��:HT�y�Jq���8���[�"�e&�%��'.wT�ts��Q�xo^g!R&�u$�:�8v�r��P>��-i]R9��<�&��g�aKـ=ؔ�jl��p�?�*8��M9Hn��P�}Tg�hanv/Fn�#b�3c��`I9Ɨ	�����*`�/9V��ٗa�>�9-iF0{�P��t��X挐�?-fg/Va~�(�int���-����)#��t򚣉`�)a�3c�I*e��b�cb����(��Cv��9g0�d���P��y,��eBAT�ԛ֙F&rbҙb�9)��g,���)f;ևt��j�#+�FC/!e&��v�����f�Wv)��h�ҟe�h *��ٜ����h*D�I?{Df��eg֝�Y���A���01�j֔cq���h��"��A�r?�Hwf�ld.��B!:��D�D��._@E	�b�H f��6h>�����RmjV,S�g���@J ut�,$�@����j��=�,C��֥;�K:�_P�g��U6ig4�m�C�v��A�nz����Jt�gϘ�Jj^�r��i`*�l�j�j� D�#4 ��"��j�m�"m��kJ���q��{���JK�Jk�Z�����z !�clip2gif 0.7.2 by Yves Piguet ;        � head  B
       � ;  &  �         	  � 	     
     (         � B0 B        � hu   � 
green.gif  	@      � Q  $  �GIF89a $ �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   ,     $ G� IH�������[Ȱ!Â�ʔqHq�A}��Utx��Ǝ	7>�(P�ȃ&-Ĩ1%I�'/vS�d�#��	q�M�5��ȗ&_l��)H�e�L�r�΃��v��S���>�
�ྲK�"D�ohQ�m���R_֣J�6��t ӂ !�clip2gif 0.7.2 by Yves Piguet ;        � 
amber.gif  	@      � O  $  �GIF89a $ �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   ,     $ G� IH�������[Ȱ!Â� , pϡE���Y�x���~|�Q�H�O.ĨQ%Ȓ�L�P%L��-�h�N��"DײgБ0�L������v�y�T�/>j���}X!J�hT`ĉ<��{�*F�C�������sKFmJ�!ߘ( !�clip2gif 0.7.2 by Yves Piguet ;        � red.gif  	@      � N  $  �GIF89a $ �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   ,     $ G� IH��������ǰ�C���)�"Ă��Y�x��Ǝ	n��q�Ȇ%O^$�Q�ʒ$�LxM�I�.JtI2"Ŝ�"D�Q���0=�L���>�Ҵ9RjM�U��L��ྭ%��v"؈gE��DƢd��E�Q�Ӭ8-6�p�ɥ !�clip2gif 0.7.2 by Yves Piguet ;        � green2.gif  	@      � �  $  �GIF89a $ �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�    ,     $ G� H�������[Ȱ!Â�ʔqHq�A}��Utx��Ǝ	7>�(P�ȃ&-Ĩ1%I�'/vS�d�#��	q�M�5��ȗ&_l��)H�e�L�r�΃��v��S���>�
�ྲK�"D�ohQ�m���R_֣J�6��t ӂ !�clip2gif 0.7.2 by Yves Piguet ;        � amber2.gif  	@      � �  $  �GIF89a $ �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�    ,     $ G� H�������[Ȱ!Â� , pϡE���Y�x���~|�Q�H�O.ĨQ%Ȓ�L�P%L��-�h�N��"DײgБ0�L������v�y�T�/>j���}X!J�hT`ĉ<��{�*F�C�������sKFm
�!ߘ( !�clip2gif 0.7.2 by Yves Piguet ;        � 	red2.gif  	@       �  $  �GIF89a $ �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�    ,     $ G� H��������ǰ�C���)�"Ă��Y�x��Ǝ	n��q�Ȇ%O^$�Q�ʒ �LxM�I�.JtI2"Ŝ�"D�Q���0=�L���>�Ҵ9RjM�U��L��ྭ%��v"؈gE�@Ƣd��E�Q�Ӭ8-6�p�ɥ !�clip2gif 0.7.2 by Yves Piguet ;        � pat head scared.gif  	@      �   !  �GIF89a ! �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�   ,     ! G� ?H�����*�C�"�'��AV�d��� &I��C�
�4د�|#���/�J�1m��%ρ(��Lx@�={*�dU�Q7���t���aˎ���֯`Ò�5hòf�L{vg�U	�&��Ѩ=�+]���"N�R��z`_= �\ʘɏ$�#��|�U+W��Wr�|S�X� !�clip2gif 0.7.2 by Yves Piguet ;           B
       ����� �  0         	  � 	          B
         ��� �  -         	  � 	     
   field example label  	@    �  >  � B   autovisible  true         &Enter the message you want displayed: 
   field example2 label  	@    �  > P �    autovisible  true         Seconds delay: 
   message  )p Hon returninfield
  type tab --move to the next field
end returninfield
     �  �  � B   autovisible  false          
   timer  )p�on keydown thekey   --use this to stop non-numbers being entered
  if thekey is not a number then
    beep
    exit keydown --the message is halted, the key is not entered into the field
  end if
  pass keydown --passes the message on to be used in the normal way be MetaCard
end keydown

on returninfield  --when the returnkey is pressed
  click at the loc of btn "do it" --we could use "send "mouseup" to btn "do it" but the click gives visual feedback
end returninfield
     �  � U �    autovisible  false             Do it �E�p�on mouseUp
  local myMessageVariable, myTimerVariable --this is not normally needed, but I've added it in case
--someone is running with "the explicitvars" set to true
--explicitvars on means all variables must be declared
--useful in rare cases
  
  if card field "message" or card field "timer" is empty then --check they have entered something
  answer "Please enter a message and/or the seconds delay."
  exit mouseup --stop here, don't go on to the end
end if

put field "message" into fld 1 of group "van" of cd 2

put field "timer" into myTimerVariable
send "deliverTheMessage" to me in myTimerVariable seconds
end mouseUp

--it might be a good idea to change this so that the user can cancel the message while
--they are waiting, or at least prevent them from entering a new message
--for example, you could hide a graphic to cover up the fields to prevent access
--after the message has been sent, adding a command to hide that graphic to the
--preopencard handler
--you could provide another button to cancel the message
--see the metatalk reference on sending messages for more information

on deliverTheMessage
  go next card
end deliverTheMessage
     �  � x k %   autovisible  false            	     
    	@      �� ~ � <           =Note: look at the scripts for comments and more information.    	Settings   �p @on preopenstack
end preopenstack

on closestack
end closestack
       �  )                �    p�local stack_loc, subtract_amount, timerID

on preopenstack
  local i
  hide this stack
  get the loc of stack "metacard demo2"
  subtract 220 from item 1 of it
  subtract 77 from item 2 of it
  set the width of this stack to 1
  set the loc of this stack to it
  hide image "exertion"
  put item 1 of it into subtract_amount
  put it into stack_loc
  put the loc of this stack into stack_loc
  set the width of this stack to 1
  set the showborder of this cd to true
  hide group 1
  if the backdrop is "black" then show image "xcheck2" else hide image "xcheck2"
  if the alwaysbuffer of this stack is true then show image "xcheck" else hide image "xcheck"
  set the soundvolume of cd 1 of stack "settings" to round(the playloudness/10)
  repeat with i = 1 to 10
    if the vis of control ("v"&i) then hide control ("v"&i)
  end repeat
  hide image "blink"
end preopenstack

--306,223
--400,300

on expand_stack
  local total_time, start_time, t_rect
--252
  show this stack
  put the milliseconds into start_time
  repeat
    get (round((the milliseconds-start_time)*0.504)+subtract_amount)
    if it < 1 then put 1 into it
    if it > (252+subtract_amount) then exit repeat
    put the rect of this stack into t_rect
    put it into item 3 of t_rect
    set the rect of this stack to t_rect
    wait 20 milliseconds
  end repeat
  get the rect of this stack
  put 252+subtract_amount into item 3 of it
  set the rect of this stack to it
  send "bringingrcs" to me in 100 milliseconds
end expand_stack

on bringingrcs
  lock screen
  show group 1
  set the showborder of this cd to false
  unlock screen with visual effect dissolve fast
  send "blink" to me in (the random of 3) seconds
  put the result into timerID
end bringingrcs

on blink
  get the random of 3
  if it = 1 then
    show image "blink"
    wait 4 ticks
    hide image "blink"
    wait 4 ticks
    show image "blink"
  else
    show image "blink"
  end if
  send "no_blink" to me in 4 ticks
  put the result into timerID
end blink

on no_blink
  hide image "blink"
  send "blink" to me in (the random of 3) seconds
  put the result into timerID
end no_blink

on put_away save_me
  local total_time, start_time, t_rect, t_orig_rect
--252
  lock screen
  hide group 1
  set the showborder of this cd to true
  unlock screen with visual effect dissolve fast
  put the milliseconds into start_time
  put item 3 of the rect of this stack into t_orig_rect
  repeat
    get (round((the milliseconds-start_time)*0.504))
    if it > 252 then exit repeat
    if it < 1 then put 1 into it
    put the rect of this stack into t_rect
    put t_orig_rect-it into item 3 of t_rect
    set the rect of this stack to t_rect
    wait 20 milliseconds--to let the window system
--catch up
  end repeat
  get the rect of this stack
  put subtract_amount+1 into item 3 of it
  set the rect of this stack to it
  close this stack
  send "spin_logo settings_group" to cd 1 of stack "metacard demo2" in 100 milliseconds --window manager
  cancel timerID
end put_away

on enterkey
  click at the loc of control "ok_normal"
end enterkey

on returnkey
  enterkey
end returnkey

on sound_up which
  get the soundvolume of this cd
  if it > 9 then
    play_sound
  else
    set the soundvolume of this cd to (the soundvolume of this cd + 1)
    play_sound
  end if
end sound_up

on sound_down
  get the soundvolume of this cd
  if it > 0 then
    set the soundvolume of this cd to (the soundvolume of this cd - 1)
    play_sound
  end if
end sound_down

setprop soundvolume which
  set the soundvolume of this cd to which
  set the playloudness to which*10
end soundvolume

on play_sound
  local i
  repeat with i = 1 to 10
    if i > the soundvolume of this cd then hide control ("v"&i)
  else show control ("v"&i)
end repeat
show image "exertion"
play "elephant call.wav"
wait until the sound is done
hide image "exertion"
repeat with i = 1 to 10
  if the vis of control ("v"&i) then hide control ("v"&i)
end repeat
end play_sound

--on mousemove x,y
-- if x > 143 then
----top or right
--  if y > 84 then
--   move image "eye_ball" to 145,85 in 30 milliseconds
--  else
--  move image "eye_ball" to 144,84 in 30 milliseconds
-- end if
--else
----bottom or left
--  if y > 86 then
--     move image "eye_ball" to 143,89 in 30 milliseconds
--    else
--      move image "eye_ball" to 143,86 in 30 milliseconds
--    end if
--  end if
--end mousemove
          
          on mousemove x,y
  if x > 143 then
--top or right
    if y > 84 then
      set the loc of image "eye_ball" to 145,85
    else
      set the loc of image "eye_ball" to 144,84
    end if
  else
--bottom or left
    if y > 86 then
      set the loc of image "eye_ball" to 143,89
    else
      set the loc of image "eye_ball" to 143,86
    end if
  end if
end mousemove
  
        black � � �  white �       )   soundvolume  10    �  � background pattern   a       ����1   settings backdrop.gif  	@           �)  ]GIF89a� )�  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   ,    � )� ��إ��@]Z�p�\��`�\j�ȱ�Ǐ���Ç�	I|V�T1�����0cʴײ
>=Vp깩'_O=zD���$�'U�ރ��&K�OK�Di%ɪV{
ɵ�ׯ��olٱhӒ]��쾷c��[�o�ݺx���˷/�U��˙����8��{r���ǐC�2�}��6�`�?sMX�h�>��\P�|���Ǐ�ڷs���vmܿ{N�8�Cܒ+'�m�Gݺ�sQtGެG���[?���9�䛵y�ѫ?�~�����ϣU)@-Q�S� (��"1�B��|�  ��Q����O)�`�a�V�a��U��'����O�1�P�A��O�Q�4�ȓO�Q�T�+���=�I�E&��D.��Jn�"�Ȑ��8\�eV��]�P�q��\x�C�2t��8 � ����x�瞀���
������P	 $�袌.JB	+0�Bc�UJ�b��ĒT�v�iK�^e�=jj	��*����i=

렃�J+�����P������������C�]d���م��Z$��^r�Z>���-���YE��j�= 6jn�$L���E�i���Di���+է���DUt�T*���
�
\�=*�z�I*����:�q�x)��d��ϒi�q���kw�Y ++vO��N����"��8'JBU���n�=�[)�&�[t��ދt�(�4h	*@髥�P�����0��$���/V��Vl��Sv㱗X�fA�~|%P�%��9`-�ڶƭ��3�����:�:��C�����b��ўVn4��-MҨ_���P��p�/�����پ�}�#]��%�ϲ��2�]w��[1��8�l'�x*(ؤj].�8���$<�Ꟍ�$��/�t�N]N4�QQn}UG�ku�G-u���Z:�ό�ר36v��M�2���=$���䀺��mb2����8�NגSk���Y�jf�� n�<tmPq΋��F��5.^����T�9{)m{��V��5�I�`����`E�@�9�`�RR�:)u@��
X@2�dW:���/���2���TB���LK�;���	�a��8B�N`�����B�ٱhw���6����}P&0",����.|���Y��H+�owW��ܴ;5M0y^����A2nPP��6�ϩ�}Y���!���1�u<ZuY���P*8�=�'5D̐�R��E:fR\[��a+!�Utb�(PMp��rЀg���k�M�(X�+hд�c��GS���P�,]��f*��+b*�yyK�~�rVA]��>���9�߭�8@�$d0����K�g��LHA�V�$W)u�(s��R�z��"���q
���=K}jol�#�PI29G�*�*�J�P���`�[�>�Z�H��
��Q�T��l�Ě��,OQ6[�Zu)���q��2GW�5�� �iH��VڳJ'���)-�&Aj�R�Ԧ�?�WU�U���Τ��U�%&�r��#E :æH���fiE�K�g����^���	��8|(�j��kn�X��dlIã夢X�%vs�EcS��ET�p��JJ �X��z��dl�V�b%�"1h�ԎѼ,}�;�5K:���(�o]mٴ��p�s�i�����^J�`�k�a��=p2Y��R_%�JJv��eJ��h����5����Y�{��Q���<�K�K�X��K!|)5��*����/�|�_ ��V�xu\�<0V�,y�.�&a��1�� ł�D�ܽ)b}>J۪ ���_.�
(L�������{�|�{=$��gINߟ u]��%30�Ldq%8n�c���Lx�O(łB,7�1[~�0UJ�CAo��=�yI���K�3=!�U9�Q������L��Y�T�IČ:]"�zf���KA�x_$ap?�+��1���iD.{`�ˤ��y_RLϽ$ŵ|k|���w%��k����:�Xce��U��ҩ�:K�]�үu]����$*�N,��N�(I��2�0�����4�ͪRf�@0غ�m����������f��p��v-R�{�b%�v��R���-����o�:��d�ƽc`�C���)QU���������g���+z�Ri�b6��z.�Z��Dj����@�T���bS�����T�@ԓ&b�&�BWg�Q]�	���$���<�$9��$V���0�����N��GP�ᓈ�$&No��Eg�r�}V'��X=00��ހ�v����nW��c�W�Ш��ߣHn'I��>뢏�)'�	�����}/����z��{�GΔь�ؑ��	��M�$�}}���7ᇱ�P���0��0�����/�˟�ģ:HuM���?����~�0)��m��U��e�pȀ*Q}�o�&|��.��S�&L:�VV-��c\��X��)"�531��V 8ad;���0�w~3�c��n�SV�F�SV�W��q[�z��m��qK�m��zFU�&��
��W�F�vmgTlg�i��W�!L�tL|'.7tsеe�$�d�tb�g�E*&��5tC���7z�0���r��.'b�GHYH����q�74��zK[�ǀSр��{Nb[·'wL�%Q(]r5��r<��i�B��b�'}$h=��,d��w7�`)q1�BQ�9�UZM���j�5$��:����~W�J�ov6рU��F&���lG��(t�'*�7��ST)�ho�R:�����8�r%4��kFC���'Q��9�a!�����Cփ��g"�w��>��W��*�=��Х��W���H~�@~�r�ր�T��m�������n��V�$���0�5�6eK�f��'}B6B�[/dTL�=��;ahz9��U���!3��5�启v���`i0o�*�đ�8)�փ�$IT�׍@lٍV����'�4Cn�E7��sEn��`�C[q�e7��<{5)81HA��Y�H�XQ�d)����ZX	Mia[I+A�r�GHP%w�F�$�$�R��7�I"��ɒ�Y���$�Xwr�&|��tR��.Y9O�sd�؃�/�O�ӊ��'�ќ�EE7a�f%��{ e�2K��H9���tA\I?�Y]�5�X(��_#�5�4Oϕ�ׅ�H~�y��(X��xn�%�'e�ZI��)W�T�/��s59�N��HW4��V�{�$��P
��txov�X�V���`3o�L��>W�S CB�%z�F�B��DjT`��x�9�l1
��Y���jx�o2��O��AB0�|?��Cz�y�&_�c�Ķ����i���v`I��Fgr�C��_�c������w����ډ�����H��()c��
ڠ�Dx ��6�����Sal�PA��5�s]IW�g��H.e�)� �vp,��r��֞g80��T;�S�����m�Q�j��3	�#�/���z��1���iXII�#�H�=d��+�0O"Y"q/�vAѭP��"gQ���[V����șJ�	�5���5Y�W�9.ƙ�O���ڧ{F��FTKa�Šꩨ�Z���$�&\�i�G�'1���$ 0�P"���tB1M"w)���l�Z�m*�������|0�*���ɫO:�ǩ�j�`%��3������P�K2������r\JR�H��J�$8��B!S�)��U�l
i�J*��L�Yg��S�㲙���է���7�������.j�۳J;��'��}�2]G;�|۷t���+����Ħh���c*���&�&���ӣ|�9�Zpu��{�N*i��h�rzr�+`��WI�.{K��˷����4�� ��!G�{p�
��$����W[�h릛Wc;�'դ������U�EҺ[=�㥵"Ib��K�E�����@lĶ�inH���Wn˵I��أ�˻�j��[�+�������� �r
��[$B�j�u{�K�<�uk���h#��[=�[��䄡���CZ�{)抹0ۿ�ۻ2+�@㹋��C[�\�8���/\�H����BRklz6ꛦZ+�����e�'Q�n(�ɋ���ā٪Y���ټ��:1].l�t;�ի�^����h�tX�+���5l�Gl����3˧c���,�T���w�B�5̄ (�_�ų)�O�9��Z+ꆍ�����G�u�����gK�%��Z�����om'|����2����I�$'Q
G	�P��d�+ ���Ʊ��������E���8*1��|ǟl�}��&q�0�Ň��7�$�<����$T9����j삞{2�
��\��<U�Ɲ\�K��\fU\�(O����=��ʂܽټͬLޜ� ��
�cγ��$|��
c��P�|ĊAǒ������̌�N̹�&i�Ɯ����PҺ4lЮ;���&Q$�ps�@
���\�Ɛ&����?�Q����̆f�Il�R��0�B(���l�����GT�s�ؼ�4}�>�6}�bM���>��ɺ�29�r����qAw�����k���KL�#l��L{A�H�GJ���v�b}�dm�h����l�q�^��`AK?�cP,�0� I.�P=ҩ��V=��:���~�;�B+��,�3��a=�~�(*�=,����H�$�c��������o���u��rL�%̫�;��doH�)NaX��ۼ��6�ؾ=��>1o��q�����^0����N��£"�v�ߡ|��qhK�ߍ۰\�����M���7܍*���'�@@�%L-��]=I��s冘K�S���f\�dGE\/ɀ���>�޷��֗
�$��l������|p��L�?��%}♲o���D����5n�7>���X�>�'��d���Qϭ��,��-�N���l����\��t��ּ�3N�y~�����`���
�� ��}��ݜ}� |��ͿL��8�[�={\�x�W��{���V1����m��
��Ɉ������r����'�jP����v}n�����z��K������Fԝ�ܛ���G�l̉����t4`��G����4�ܫ�.����������RNԽD��,�sl��L�L|���'z��>�<^�����N��m�_l��A���`��ɮ��N���Zc��>]����HD�Y��Ğ��� T<Nk����d~m���C����j1��6����i�/B�g����F��
����.�O�Tn�Ϟ��.�&�FI�%��^��2�B9��g�Ğ�5�����H��E
�=�J�ǀ��[�d�W�'�v]��H�a܋�\���'���p?��.�B�ٓZ�I6�Q=��2`_~�J�}a��W��K��%_��@y��_����.�S�`��e��ȵ�nυp~�v,ߔ�o�Q��������'��>�PO�?�}1P/��G�H;���X��v*��~��5��	���e���?�;����1��?��v�6/ ������+��^+z���
>+橈��F(#f���JG�%�a4���?-]��S&L�3m����fN�=_�×OO�@M�Q�D�M�Z��j��14բ���@|b��؊+b�2v�ҳ �j�8�ɝ>}ֵ�7&^�}]uhbUu�T�\�Rj�JТ��2��ď=��9��G�%Ye���W���W�왱i�,T_ ~.e[8*ԌH!h5�¬\UB�H��F�(+�9z-��b�co�4mG۷��.�f ���y���#c�H�j�w���W�p}�!�6�C��>+�$�Li4�S)���Ҏ���Ð�3�	�|v[���
{�>��J��(��*	��L3��"k��@��Ь�1G�p�Ⱥ)ڐC#�:�'���B��L�oH��rl���bJ���c"/;��:)2�3��4��;�@+2�$�4r+��7�Tl��룈�@�j��������
�
�h#�lT��ЪH�A�l�,2q��νD��Rmb%�@��,2+��1���O�SȲ-]H�* �g�'��G���$�N�/� ���SA�V�*칓7[{vD@�2�>A��
��\d�?�4����v,�Ĝn>:���l� `j���_�X�|�)%K�&<n;�LB��^	�hW|���;���@L#��߆>��UHA�;��`(����9	�	{�
�p��0#�VqV����\��@����H�\P���pLd?�vf�kƹ'�iC�	}��-d?�J�F;�)�rz׫�HX͂��#H�~���!�pKI�����i�ٞ�G�@V1�4����M��D�2F
c�]d�i/��^bS6�;zQ^	q��f'�e#���G���K�(�n�>E�ʨ�26hW��dH����l�tG+d�}��m��/$ ���q��G+?w�8ϒ�^{e���������{Ƭ�%��tQ%nv�S���ȝ�w�����Զ��/�L]��#?flt��ȼ4��5dd%`�Be~M�	��P��M�q;ק�����a�谤�m�3�YD¤��`�}�C���&�� ��x����4W[[|ޢC��)���#�5.� �Rf�@:��;�b�^x�=���sନt@�iBk�byƧ�}��`��x1�4�C"�� !��� � ���x�Q���J��B�B�m-��۞u9�a��?�쓠ry�7~�Q����D<ޅf��]��S��4�DL}҄&|tdm����4h�Hz��U� Aĉ����t^�
���:%���2oRJ�4S0�4���B�h()�!p��M�o8���ÂL��z��c�܉L*ʓ&�$_�̲9��P��T��(!z0��TL8ɹ͕:R�wj(D�3�
읠�'mrj{�&;��4�v��hA���#XP�W�Z�'���4`7}�Ng�՘�(��[:�J��X':�.꘦�ϛ$���SƩ}�,X��^D��ɛZ�v�k�>(���j)�axVưOt&u��&�A+�TK��X���FY/Zb�)N�:O���@�,���r	�ObiͰ�7��a�C�$ə7�$d���X�w����,4�%%�fӰ|��f�"�ƭ�n��*ײ�e��|�/7[ �U˸�[�ʷVhR���a�6��7_O�,����q2��/���n�2���X �ٯ �k\�a�K� ������j�'�e�L1�?|��@�������Im{U4� ܒ����kЅI�����1qĠ��Ԯq�yӭV��x��P9�p�Y�sh��=��{GtY�c�mntUbȩA�CvI��\'���Cv㗑p�g���
ϋ�*�g�<�t6��D�;��b�ґ ���|Q3�
�9�2(!VV����3�� �g��;T��b`�2q�@I!���#b�"F��NI���F�f�4�Up��ZZ�5� �~�pGِ�3@��XYbLI2kg[J���`F7<��ӜV����Y�H��(�{%Q���4��t�7�{%�S�\&g�,����
�7m�a+\ݡ�ٌO	�@@#�	�a�[p0#:ѭNq�f��h<AzJ��b�;���
'v��LZ>�;l���*Vq�����챁�5GW)�O�ʆh�f��%����Nls{浩K�Ǹ�fr� ��K�Ǎi��Eyg�J����ņ�6y$��zީ^���6ZU�sR�@ b� �ft¡ĉ�JQ���Ař�q�g���u�}�/�T=�[N���v���㤇����O|��>��C�R�GQu�ˬ;�J�����������'}0���D��eb�+��Pﻖϻ��Һ�_���~���~O�1��~V�:��?th�z�V{�����Ψ6��t9�k9�M�9������=��|���?���%2��a�f1���;�����L@Ri@ĺ>@��|x�Ɂ�
L<L�?cY<�2A�B�B�#��@��,>tS@���	���C���A�;����:�@�KB!,�!��k{�/�\3t¯A)�@@�[��B,�Ac�>�0Q��=<C�64�NSDki��Y��`	<>+�	(��:��
���$t
`;��C�3��L3El84TD3ܴ6tD��I�Ĝ�����L��0y<�h��CD���U\�$d���F��G�9#��Y�	}P:�A\�����y��f>O+��q�`�bLAEFE�4FTg4ER���4�	�p���F���m�)c�7�9p4�$DG���;�V�fx\�y�G� �[�GpJ<A�H�7Q��,Ǹ#G4,�4TG�TCed�w��X�Ȉ�	��|�B�����},ƨ�r�II�<Ą�la��;BylIH�	��|��+<!:B�t�+�{ǟ��J��IuL�e|�xԩh�:�����è��m��\���9ɻ�I��uTCt3JG���*X\J��G��J��Bg����t$��J̛�/LƱLI������2������D���Y"mԃh��\BD����Q�˾8J��۔����R͞荧�FҬ@郿X`��D�U����`ǁ<���Ka��;���B�ݔ1��Ƞ�I��D��1 2(O2���t�;F�ʮ�ͮDF�����L7��3�5�4=��
�L|�@8�}(�}@���Ј���`�O|Oʼ�<J{�M��줲�R��v���}���@@��4��.[��z�����ʯ$I��P��P�������۴M#�P�x�ه�dQ�18O/ (�@x<�/p�{ �@���PB���d�!eF0�P�<R7R��1%5��|����U��R+�ѩ� Y� a����
��N��xj����lF�,8���P��Lެ�NeR|HQ���=��@HO�Q}�E��C��	�L�$SB|��3�zX�]���#%�H�P�N��� ͉ߌ~��? U@Ї~�D��C �EV�@�(�Ѯ�Q��Y�аFCT���U8��8]C�6{���bE>Ճ,�-h�@`T��`����(���K��KZMńD�s�I�U!�PaUA�M�Fc�X���,��Q%U~=����V@�t�>p'q��"��YK�3B�I� U�JmSw%�v]�E��z�T&P~�<�f�8D؇C��1`�{�C�/*�;YEB�4HpD���JG��_����Մ�:vdCN%ڎ��� Y��aZ=OV�}T�:�Õ�ٗ��r]�Dl���
=�f<��RV��Z�ٜ���Wޘ.�G.�.p�=Y�L<5���ї5>�	ɟ=7aSܣLH"�U�3R��Z����ܗ������*���\el̫�t$C"M�P3��r�yj8G4\��4#����M�ލ}[��|X˳��+^=(^@x_񬇨���P�2
C�Z(�\�C��h�f���C�T���H|����	.8 �[���������[��C��ŕC�.U
bK����X\�ĄT��4�6m��UHl_*�3�������*������_&!b��-��ʊ,��Q���=�`�\F5$�_�bL[��]�a!�(�p�XP�-��- ^��\��>|`V$�D���Ř�R�fB @���,�46[�5�T=��ӈ򅿞Y�5� ���`�=
��2�4]tʬp
�"�M�cG��T��43�����L�@ �� ��	؍�P�}�� ��>� �-�tڲ}���؄X�Չ#diN�2=IC���dS� �b��:����d6f�c��Gu�c��$r+�i�j�N9�7�0���^�e���ϿsZ�'[��(�]^Y��-@熆���m�$�G�	��Ƀ��S|�S~f����e���n��ПNb�]�k`c�~hVêh����p�����YEW-�^}&��NS�]X��#�|H�@PQ�uh�b �>��ܜ���W�9A�i�TX~S{XGv����nj5[Mdvb!��a.� ����k!�ǥ�d���]�'�E��Vj���N�T��Yj�~j6����}�\��Gqb��F�`�'�[K��c�U����.RO#jB����L�	�!
ח��}�"�k!�
��j��\�>^Ӯ@��� I��H�g.�Պ�T�U���v�O�d��ߘٻ��l���G1^<u�t<�0�U���؎m���w��0B�Mvl��тIB����~	z�����&b�6�}�W��\#�o�n�^�^�VW\uW�>q�5��\��=�٦��ACG����~���^�n�c����S<}����l�:��oq(L���Wv��ߝu����PXiA�x�ᲕqD�H<�(/<�r"��Gg�V�`.r�OLr�X�4k�!ue�l�(G[�T�����;�3Hm� ��/_�$��1ߐ~P�<]��_�En6���fc�]n�s���j�Vo=�;��<�ha=��}W3��L�� <t�N�-ft>���H'�4�eS�Ms�vo�vh.`�7V�u�3˛����N�P@Ǎa@��u*t��na�6�+�8*G�N�]G�v1'����e!^n!�S���fv��� ��^����S�s�Z�S(/R&�П�uw��b��;ǖ�wu���`D��yyI_I�X���b��~�|@gfgv��s8 ������\IrT�����p^���gB���8�B�/��rǳ/�b��x��F�C@�L�t�^vOWv=��]��og� :���i��sR��aZ�4z�O����HO[��q��;d	��y_�b� ����}����vhu������8b:�ɦ����Y�w��x]���*g۾,w��v��\���T+?�¯:�{w_g������U��Ǘ|����ނ<��u��/���� ��������o�9��ھdN��~�b�A�_��A<|R�x�{\6�/~7^n#f�a�-��l�b����$d��!�eXd�"ƌ76�W��'�D>)i�$J�%Wث��%�/e����&N�t��iOfK�-]��w��?� �"U��)ӤKi޻���R�r���_հUkZ-K��X�U�����*��V��h�# +\ ��O/A@U����`��	�J�BE{7R�|QϽ�'Gr&ٹ3I�,�Ѭ�S�h��I����k�m�2=*����M��4k����\��-��x�♫����-?|��2X�`�}���C��a��Kd�؊d�+Zn����#U��??k٬����Y5O���D�v�Q�-���	��SXY鴕p��\Xj-�\fe��Goy��*����*�F�@\���^مv�%�GC�Y�OD���E��7��xV�|&Y�~���dj4��ME�=I%�ۖR9x�Y�iUa�b(�����f����?���\u]WPv�q�b>{V����X^�1$XD�ţD��5deE*���}vՓVA)`k,���N���Z�Q}��H��i�Α)��g�)"s�|h��ъ�>�T�"�U�HP�|�u����ᨐ�:�C���
�FF�d�H�2�Bh���)��UɟP�F�lN�u9[�z��Bu�Xm6��r��j����S,]V�X�yr��_0�E����I>[8���=��ƊJ���q{Q|Fzk�U�a��H-�l.��v�����ϲ�e�
���h���U��
��," �X��>��pA���0��\0�>�V�PbyM�Xz,�q�"k�-����r�H.�r�6�*�=��������ۖ� ������a�����뚙�� �O,)�u�\�g��E��U e	���Qy��G�Cӎ�hD���`�U��y߷gP&��h��d8���nP��%p���5����*t��k����#��.��@�U�z>���=��DO�-��	q��pd(C!�m�Z�ܬp�}�x2�T��E���fV���v���T;#�B�Sqo)������`V�*B�5�FO�RX��C��/1S�4D��o�*�]�jX��j�9u�Z�n�!��$�e�LD��D�u�]:�GX��*�H�LI�J�����V�8X �a���)�a+��,��0Z
�	OT@����%����ʈYz�Bu�@�ed%���X��U�?��
JP����z�[KhB�Hba�vի9�c#��FC��i���P�w�Ej� �3�y�$1G��Q��ֿ�5f���&EM�o2瓨�8­S���P,�W�ۜ�u|S���B��s���EF���S��R�"���ʎ�thK��{w�|�`ܦ6�q�Q�D�����\�!�q�����'���4(SE��la	���7b�_CSa��D�@�C�2�����";�3�	;�9��}		В�Jt�L���V�YaPb�H�<j��Oe#a!��!	z�$'^��*�F��dN�b����Si���y�풨��a>Lע�X$0ዱ��eJ��E�g��gƮ�4͌�$�ڍMmM�&z�'�p�`"i�mU؜�j��䜠q �R��4b!,�HX�4��G�kڭtuǩ���!e�Y��2�hmR��)�~ғ�NdBī�<�w�Q�^�߳j!�x`ms�+��h�o��o�y�/����T��� 9�^!t����ުs����2Y�b�0� ��H!�7@����*1���H�BV�X����zF3�6��n�'��zJ���NQՠX+�K���[|������|�q@�ß��Z��wŮ"�ٓ���w��u����v���3\s��r���̳+��E/y)�+��.��&|5s��G/y�a[Lu��=�OI5�"^f��k���N�:Ai���kZrwTȎ������qu����甾S� ��g�ê���WM�C�)�����vXi�`����_����ш������ ]� F�aL�L����2�ՠ��� s77��$GC�ͥM�����q�͌C�l����X�w9�����$Vo���f�w���l���o�jk��bbB�롶��e�\����&��>Mo��|"���;�G�<�:$�����4��q�b
,uL��mFz6�q�b.��]���E��<k�u�/�HB�y���#���Ҵ�R���<׭��cם;dD�u���h���OX��K��+���d���t"A�u�N>�Ir�l��\~v�VT^�%���8fMc;����|�j�nO�)�;��\�]?�ݡ�h��� �����BA[0�f	<Œ@0���~h�'u1o�^��p�����f"��#����6�?t�{���p]��UZ�)��{��s]e��x�#f�!�E�����, ��: +�X�Y���DUN�r��}�i����B�A�UJ�x�O� *\�����I����q��A�ωH�)�Љ���<L�܃�D]�y�� >  L 3]��Wz�����H���]޷`x]�X��M�O�����ԋ���[����0G�Z����ҐY�T�z(����*�E�_D����F �� %V�%z�f\i"o�E��K���)���Cكs0Y���_���
��sd���刈�����-�/� .����J���aVZ�O���-az�$Z"5�+L^�Y`2�~��i �Z��DYX�&��C 	�GB|[=X�~����\q�`6Gܽ߄���ȡ�������9a�!�*�B"Z��Fű��!�
D�4Rc%ZcCe���q܄7"I�E[DI[ a���L�$LA�J��� �I��sd���д�<�I:,�[��s����==�s�^QE��Y�*_<$���� ��D�X$FRcQխX����΃<�Yj�M|�V��Jo�7
4�Ji�$	h��c-����s�
X�
N�"X\q\�?�N�b�_�܃@��@��/�[��2����)�azm�L�TE��Ev�FB^�E�NY�"gx#�$��e�ho �]�F��&^��M֙M�#s����^�P�\��� ��R~��_���rL�]ѝ�Bb�}H�1^ԥg�fWZ�W�Yk��*:	ljHZ��Y�d��f�� o�穵KQh�nN�K�_�$uz�t����^-�Eb�
u&d� ������-�I�"�����y��)�VJb{V"&F_�-R�\^-��aҦi�&m��[�g�$B�C�z�[�#찥gx�`gN6�`��s�ŭ� u>&���I�
��u��4)V�� �j�!_9�z.��( `��\���`��]���()��L�᥏�%�%�)o"����rڣM֛c2�m5�qQ�\��a�.f��ޒ�!�>��P�$�#�#�D H���5ڙ��~���H��d[��b���������N\�f\�\"fM줤�M����*�)Q*[&�dg��
�DE���<�i,aLDW��5�a��F���=
�O�F[Q��谮��	)����#[ȥPԫV�"N2�Pڤ,��I�EO�6Zdb�O%�❾�\����^�GzZ\��RE�A�B!+���׍㙈)zaBU�N@p&�zQ1�2�V�ez�Go9j�\�ȏ����e)EY&wޛmk�F&��* ���hPL�,z�>� 6`2`�R��)]�̖ۚ�dByZU�W֡X*�[��OHOː����9�h��z�?���_�%.���O� �àxlN���2���D ���n.�r�oE����ުШ�~ah��Cy�Mp�iI�y\i����+J�^�eO�un
�[@қOe�q\[Y�f�i���vmiZ����O�S}��T�!a^Y��md���Xή&Z��,������ђM�.�R��Rf�d���oQR�X ��,�k4#4rZO4������z��z���K�a��QB]z�'M��)R!���T]������Wb]N��\�F�Lv>XfF�j��6��2������+�F]qi�^�70U��+K���֊��v$�j�)���*���`,� �t��N����=� ��`�݆�1���pi
���L��J
�����ߕבc�'��- 3q�rUCi\���	��J,>�G@�ВkRr��Ul�.G��=�`��qj@c�)�V
���(���l�,O��ڽ��X��� �3���}�B�Ţ�����f�����կ�br�Nms��v�����0��� p�Nd�۬�m}b�H���Zps�x`p�l"�.�5�� ����#���q���S��қ��]�]�[������0�WU��C�׌n
����n��2��X&T2ŭ��4���,Q=�n�p�E�$�%7-�Y(@Nfeb�&d�2#)��6+����~3E������%�iy�:3�X�=����2	�3��H�f����s�!�R2�=�2/3�/0J�f��=�*B3&p��OC�C�uY�D^��_>�XZ0 w�ۂ%D��Z������##�s�ˮ��
u�A����_�`B�*p���1���)��ǚvL�S��`��^XXෝcG
vGk�Qa���
<��[^8���SW��.���[��2gv�i����PC��)�q�Fﺌ&6�j�1˲�)i��v�q��l!��T�/gi0g�x��E����3턈WC��os/d�4��L5b?T�0E0Dn[eŕ �9:4+_P�11"�y�Z�h��)Z���3=/QFЛ}��ȄT$�ň��Ȁ���.^r�^rQ&d!�����Md*��i�n�8���n�'[�2�q���X�4:��N��eS�sp�ɢU�$3�UN��s��?�A��t"+�_��Vbe���h���j�z�^��G&Ro�X\��q��6���C�WW�)����F��I9څ$C6��-Ű���X/m�N&�͉q����" P���9^�-B�;Ͷ��o�Ҷz�:��kܢsTK��W��c{��}?2��~���8�͑t�5>Yh�67��
��Q<l�|ω��#Nk�j�D���zy��l�X�:�"ݫ��g�2�D�{��$YJ:��EC��F��EDg��NJXt����s��O6��6�t�d��/\�yf���@b�A��)��0jc`���)�w�#�[���/Ԡ:M�ho")\��z\���zT[0��W�?`D�[����{�����#�C��M}DR+s�`~ȕr�/f*�?Z��TbG���OOn�C�}��7^ER���<�����ͷ���'����6yn+���?���_D�gD�����H�3ًA���w�G�੥���2{;��ȻM�D\s�v�{�(�XtU�{�5���[d���|J�;"+�;z�n��gI�HD={ B����ۗ�"���u��;���ׇ��aj����-�|b\��yUR8ʯr	M�^Pl�ꑢY�(��;�V������|n�:@��S���V�X�w��?@9���D���@I����"䘰J��G�S����{���(_��hڌ�S�N��b�ӷ���z�T�H�R+�����B�T{S����kW��V�K5,Ug�
$�b-�$
�".ݹ���g��޶s�����=�t��� ����P�d��?*i�`A�
r��� G��\�d�ߓ��s��ٓ6m���q	DԨQ�I.d�U�T�3F�r2͛�RY�*X���e�=�^�������}���l�n�;�D��s��w��C"TH�r˔�쳎�c,$��I3�b*I��:z�'�h��b�)Cܬ�͚|�Ӄ$��-)��J�*�ȸ�& Ȑn��+/��J�xDK/��0��c����H��2�Ǻr���Q$)�2����))3�R@+M�?�
:���T{�ǚ\�Ц9i�I�{)(~dn8�ʇ��ʪgd| h��G���h��:��ԑ��8��GۂI��B�T�8�
G�Vx!�����h��� A2�#Y;CA�F�L)��])C8�M6ΜJ)H~��
���{���R4�F�QH!cRK�+��Ԃ�S�����P�ҎH�F-��UuԮ�'d�r�[8A�LR0�y-M�G+�X����؝��)O|v��7��jj��!K�J�Z�p�%;K?-l]����]�D5�Pᵧ=��E�.u��w����5�m�oD�4i�Ӕ�3�666�4\6�{:�3���b
"��!kƘ���Fc4W�����vg��R����V�+��TH)��C�7����^3C�̃��h��J�B���3⬑=�댇˃ڄ~$����t���^[�mú.��E�������{]V�w�{�|�Ј7(��+�o`�Ek^֒�'���!�36�w*�s~�1�-H��t.έg��i����m�m���.vWU�g������+w�F��y�����1r$����w!��F&�XA�d!(�u�x��
̧:{��ic_�$5��T�\4��䣿P��~z�]�z���Ni�1��5*A-MVȃ�$�Q�j�R���f��Y�Y�+]>����x�
#�J�Rd���m׹T�dƝ	I�˝k�?9n'S�sJ�P���r@��2S��!����N"81EZ�[�,�B:�xP!����@\�3[�|�)"�v�2%��7�Ʌ����HP��*�z4  ���7-mW�;��%Z�a�^�١}�bD����Y�z`F)2���ȾNNng��]�U���=7�������y*�OQ����G�U&"���4@��x7� �*��d��\�37�z�+�+�&a$��l���4�������rS��U?{��P�c3�%��q	*EDЈ꣠#�ЫX1�u=8�����P�iDIz��M��X��0:ˑ�u`����`�� �ax$�&)�GrLV�r��).W=	�q�*%�@Z���.��-�'"r�[��H�YHC<2���Ht�˟.�!*>�X�l���a	+0�Y�jv%�a��vQ�X�.�i�]�V��0C��*+�����x��T���0�x�o/#�^�"���^ɤ����$j�9RX5�%�s�l|���2S)�����Xr��F�[�
��ك����_�s���'o�9�z:%���-i}�n�م�އ��50=-�`7"\0�c�O�v&�#�f=�Q'�Z2w��8�� [x�H��Z��b9o�|�ތ�� ���}�SV��h��J�UM��䘶U(1���.7]�od,IY��Uer{'�C˦Ɍ�2�*�䐾��M��D��D%S�3���g��G�
���b���]#�q̮Bc�7JAZO`��3ӲR/qC�뻗{�Ѥ��r���-_�Vf0q��d��z�<HP�e`>�K�p"	�}��(�5d�U��eϕ��;����E�;�����F���u!��{���e!G�3�p���Cɚ&���*��>����+��Z@��n[]�Xb.A�����3��ɫg��K��.'	����=F24xR���<�iR`���p[ɹU�2��rM�?�-�
�`+�<�1��9�
��L�y�VBo��y󘖯��o{P��y&���Y�J5f�)�Y9u$�ƶGC>4�u'aɝҺ�����K{{�v����#A�H���Z�*1��@�I=|s��%�4�3��T� �g���vt���gM�Bީ��H��a�*s��@A�Ƣ��Mv';X�#�J!`'+y姯���7��1oa4٧?;L,7�iD$����Bt�{�>�N���ٟ��,E���$�x�������6�8E�W�*TʴwK�&#��^��|�ZY�B�b��l��%RO�ܭ�2���GwW�̂�Z�����룮OH�O>2/�>�`h(��C�����L�r`���
"Ӹ@˜,`�ba���&�WT��N�t�xn,�**+Ђ����:%_�.̇f
��	�Z����mS��8�f)�bh��)�)���80�8P����o�\��D	&�\���X|�CVa��|@פ������ -n,*�Ft&.j	������룊pf
BZ2����7�@8.p�¯f .��p���V�������GaX��d�/�%d����+���������l�+/ꡪ0�F.n�HG�f	1�����D��"�)�H�5-.q2p9�V� )Q�<P&��`"�5
�+���p(��3�%EVl�H�פ-�T( c��2JU�1	���hHo|� 4.�� "��"��r@1p�P8�;"������#�1�#+$XJ��i�1����%s��eon�0���ߴÕn����n�/&�)�A���h�"��I����1p@��);P������ñNv�;c6����� �r�KY��EfT"�|�E* M�j҅����	���2�e)�I!i���
��)�Q"%R1������I)<��B��/d>g�� d�,���i�\}0e��r�|���Q��O�<��V`�V
��`0��(�S8��"�Q�L4�1s@**5���0+��RCR�,�BpC�<s�B�ɮ�/Q#Y;�:e��K�Pf�qr'����|������ �(��8	�8���Q�Ho:�H2,'��
f'b�5�H,����>E�Cͪ����E�P|0����P�&s��B�6oS�&?�� b� 8�38	�V� )�"�t��)�q�t2-�+%��x"Ic�Y�d�,��,�t�t��<��	nFV�ά�Fv�a�U�х��M	qn(��_��7st0s�!�Vs8�����)��* ��^�A%TI]��X#�A(�A���Q��t�����D��H.�>SI	�4�K���:D�{�1jG�GuTO!@m�F�s*3��Q�b+�#��G7���JW��DS5uK��SA4��lU�.Q�&[T�|�T�sf������Nu�7o�V��V31�P"��
���T�:uQ�D(��C��,BZ��4���(k��Ќ�M��SqM?�Nh!��>��N��ciu]�Հ���4Ӕ3"2���2Y�'�'�s(f�Y3� �<�C�%CTD�lE�iЎ�hu-�EQ��f 26
=V8�6O��V�*TU�}<� �:�'а_��d@P����
C�J��
�27�K�l"� �΋�(i������;��p�c7]i�]CWky5��0�k���x"l�p���d t�>���Z��1�2(Ցd��ّlj�&��.�Vb�Sp�n*wm4� �gU]��jge����V�r$�+�D��!"e 0����u3�Y�� ��gGs�*�\��l�ϋ�v�/��� �i�"~V�wOf!�hP��,Gx��qE�?g� �")�y/���us)s;� ��9�6t���5V�1:n|�K#y�%���5wqv9���W�Mpq����:�\��1��p)������]m�^�7�!�jR�V�Bq!pC�`Ak3915�2u9XK�7n�,'
+��l��h�5bQ5p�kU���Q �?s8��Vx8��8�|s0��Q���v��F�akAЊ�U|r|A� ��,Gm�&Koٷ}�b��q�G�S���Ŷ�x�����?��n�����Rl/�$�!7�K��1*�ב#�|%� 0�Y���CuoA�.�BSp �5��5c����,O�9�y�����m�A5d4��
2pW��� �x���Y�,�a��}QMM5M����3����@�7I���:�ie�7�W���1�)3t�u��Yq``�٘;��۷.�Y=�}��-��:���:��5eb"u���d�����آ��u�{I׃�Y�6�pS�`�_Z�}wx	Z�������Eb��rz9�r1�s�:{78��J��CS�d `L.�ٓ	7�����!���9��Z��F�Iz�z�4�93r#�1�����#�����C0*��8J�~�����A�^?�G[�E����x�fqn9����P�����@tK�,;�$3����9�
��h��E?�Y��"v��F�+cQ��R�PYqZd�s
�q��we9q4�$�����}�^�)���t�m�@9��M�u�zc-�h��?9��,&�;q�k%r��Վ�{O�9}�?:������wր����[�=�W) �)��k&� � ��B��;��� |��{p9OZrK��]=k�����?��p ��r+��F޼z��A�����V�*	5�+��;R���� ���8�p� 5�v�cG�aR�V�U�����۱�ZP��Uy�q�.1d_��G�
$X����A|*�P������}5b�Fŝ�l�9zXϛ�fP t�윎��p+��
���{��P<&<!`2��)¡�@����{�������M�� �5tc"�kIC7��SJDJ]vd�C��â�2Ճ�!�'5�p���Xx��)�?s��y"䁜'�zZ��q��{˻�W�Û3{s��aՃ�H��\Z��u�]��ςAC�ǽ���Z�<����Xݩ����e���r�q��!&x�xH'���Z��=����#�&����h�� 1�z��Kn�E�u�\JLZ��W�{�g���K��q ��ۺ��Q>�f��z�@��)m�PG�W)�W��^�q���t\�Jr��)���KU�	�}B��TZsK�<�W���Gά>�q�߱b�)>֛��)b�S�s_>�}������~�	>�):˛��3��4�/MGS�gy�㼍�Ɲ?ۂ�<j5��|�UO#q!y֧V��5�9�!Ğ����Z�m��Q?�����=�!���'�-(���K����5���z�����1�2q�|꽫��K>�\ U��0�)8������V��#��3f�2�ȑ$Kn��Q"G9Z�h)�%��3s�t@!��3��13&�C��<*�(1�Xh%_>@Q�N�*��U��
v̓�dW�P��*V�Z�uy�� ��W	֕�U*��+2��G�;)�U�W���M:~�<@��!z�4G͚1��̑�'L�J�j��tM�1�i��ϊZ�lc��wA=U��5����X���]����k���V  N��0D���[������O�o_�՝;�T������M�)�hgΤa��
�UY�F���>��UlQ��VlV��V�mőmD�s`�u��QxF㭸Xy.Bv^ �x��i4���P;���ME��i=�hS]��Th�T�M%[�{r�=+T`VZu!C
��]JDW�E���UNi� jN7����؋���>�XÞKD� �N�ї�~>ַԍ��Y���5p�^k8�mYe�UVD��}��S�m$�V^��t�q��qj*��CV#1�Н��'R�z�GY �̓�g���~9����yf�{���3<�Yf�)^P:%a��^��V T��zMe�]rx�@]��Gv�E���R�w-�9lH|�8�4�䙳��w��hę�f��9��14�$q�e�%�Zr��{�y��an$����ꪚ�[�K�M�{��s�s�{n$�,R�֬�K;�*�Ñ1%�ӆ!G��x9��8����	U�P^��t.���8�[#�o���Gy�٢�|��,r���ThC�t��*�C�3U��X�'�k�ij��Y�u����>:��vQ3`�>�]L7 f�=�~G��)v;H�Re�Ȃ\j7"Ԣ�V;��5F-q��Ҵ��C=S�z-.�sQ�Z���r��ZfW]�)�_7��z������Q�������>�e�p�� n� �Ԡ�AdX���@5l���6�`A2p��� 7�Gt�|��n�!@`�6�0�m���� n�1�����?�1�~���A�e1Y qI�F���%>Q�H��5��YD1�H�"�؏o(1�߈<��j������k ���F<��|���j��,d )�D"2�d�#	IHRFnY�%�F(���G��i&�1k��=
��Q`_2`J�^�=4�e�]q>go6��]�k��|0�0�zHNN9�d��g@k���W�P&c]�5Cy�l^s���7�����y�g�`��ʨS�T�;��Nx�S��L';��{�G������1�	t�!ч>8 !�clip2gif 0.7.2 by Yves Piguet ;        � down_arrow  Pon mousedown
  repeat while the mouse is down
    if within(me, the mouseloc) then
      if the vis of me then
        hide me
      end if
    else
      if not the vis of me then
        show me
      end if
    end if
  end repeat
  show me
end mousedown
     �   {     autovisible  false  �GIF89a  �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�    ,      c  �G�����	����[8�Co.�."ĉeE��P#ËA2��Q`?��bv�ip�@�#��<���ŝ��G�_ �A-�AJ��N�H��*Ԁ !�clip2gif 0.7.2 by Yves Piguet ;        � v1  @       = _    �GIF89a  �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�    ,      k �o�����(x!��:�����)&l��	2Z�1Ä�!��g����0?d���I	h��9A'�	9Ib�yҀ@�52 �1�ΥB�>4y��S�-���`@ !�clip2gif 0.7.2 by Yves Piguet ;        � v10  @       s a    �GIF89a  �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�    ,      � �o������` �C�
A�����A�2H���a�z2J\���z �M�0��I�D�qbB�P@)����'e�P�ϑv��)�% �fJ���2�[Zo�ӑt�0��B�#��
`��{6X(a�T� �9l�1C�� !�clip2gif 0.7.2 by Yves Piguet ;         xcheck2  	P�on mousedown
  global normal_name, depressed_name
  show image "x hilite2"
  put the long id of image "x hilite2" into normal_name
  put the long id of image "x hilite2" into depressed_name
  insert script of btn "button manager" of cd 1 of stack "metacard demo2" into front
end mousedown

on mouseup
  global advanced_user
  put false into advanced_user
  hide image "x hilite2"
  hide me
  remove script of btn "button manager" of cd 1 of stack "metacard demo2" from front
end mouseup
         �    �GIF89a  �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�  � ,      � �H���@dƌI��C���H�"> d"����Ǐ^"z�د^��%��x�^?{'��9fU�� ��{���=�dl�ᨳ_�{?O֔��e?+�b��Q�=+Gcz��S�O�<l4�kҢ4�����δ7ݚ�h�^F�.|�0"��� !�clip2gif 0.7.2 by Yves Piguet ;        � xcheck  	P�on mousedown
  global normal_name, depressed_name
  show image "x hilite"
  put the long id of image "x hilite" into normal_name
  put the long id of image "x hilite" into depressed_name
  insert script of btn "button manager" of cd 1 of stack "metacard demo2" into front
end mousedown

on mouseup
  global advanced_user
  put false into advanced_user
  hide image "x hilite"
  hide me
  remove script of btn "button manager" of cd 1 of stack "metacard demo2" from front
end mouseup
         �    �GIF89a  �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�  � ,      � �H���@dƌI��C���H�"> d"����Ǐ^"z�د^��%��x�^?{'��9fU�� ��{���=�dl�ᨳ_�{?O֔��e?+�b��Q�=+Gcz��S�O�<l4�kҢ4�����δ7ݚ�h�^F�.|�0"��� !�clip2gif 0.7.2 by Yves Piguet ;        � v2  @       H e    �GIF89a  �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�    ,      h �o�A�@�;8�����p�AP��p�	9J��Ȋ 0RhPr��nL`��ᄄ�p@R @xl�s���EcL���ǥ�5��)T��� !�clip2gif 0.7.2 by Yves Piguet ;        � v3  @       K m    �GIF89a  �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�    ,      s ��?�0 q0�@ "6DQC�	+6� �`&4�qq��n4hp�+q������+c��XS��7&�А�f��"�� �����#�O�H�	kJ�0�aU�;0  !�clip2gif 0.7.2 by Yves Piguet ;        � v4  @       K v    �GIF89a  �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�    ,      i HP`�����P�B6� "Á(�� A�Ō96h#"��&4�12�?�&�p@�#��dƌAa� 44�c��@%�l���K�)e���D	)3hd !�clip2gif 0.7.2 by Yves Piguet ;        � v5  @       K �    �GIF89a  �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�    ,      � ��H��? 6(h! ��h@q��� bPh0AƄ .>Q�*�8�AJ�&�d9���]6�Ps$�YJ�9�#�.'�(q�Q�Ff8� �G	0�p�1"�*AL�X5�C��J�`�,�1ۺ��A�K�aJ�{V��z|��u !�clip2gif 0.7.2 by Yves Piguet ;        � v6  @       R �    MGIF89a  �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�    ,      � H���}*T�����!�)� b�| � "(�y��rB	((<��fG�-fh`����p1�͛(C�dp�脂>�l@U�P�.����e=�'��h0v,��6��V�={P� t�ٳ1�AUk[�L�v�/ٳT�����^�?AH5KY�Xc�`���D�I%��k�l�hc�gtpE�DŦ5�����W
Ti3���i�jݜ��kj����^�1�GL~4�˫��S�nS�F�8qV?��`x� !�clip2gif 0.7.2 by Yves Piguet ;        � v7  @       f }    GIF89a  �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�    ,      � Xo�����h���B 4�"�	�S�A 40D�P��a)�bH+08p`�	 Vla2�={�Y에�24�`�_�4�5�	�Ӣ ��z��U S6@i�į%e�Dz��?b���Ԫ˞RU��D��3Q��wϞ@|7�J����z%&<Q ˔�LnhS�=��m���AS��E �W� !�clip2gif 0.7.2 by Yves Piguet ;        � v8  @       i u    �GIF89a  �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�    ,      � Po�������@���B�%R�8�Ɓ30`	'�����$�'a��		C�<P�^L�-�R�
�1y��@���~)}��ӧ�D	"��R}r���V�X�6<�� S�� �=�`b��W)�8!J������F�\�nكs���p.e� !�clip2gif 0.7.2 by Yves Piguet ;        � v9  @       n m    �GIF89a  �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�    ,      � د�������6�b�V�@�#�{58`���	=� )���썬g�^��'3d`�0�ȑ�hړi�����$
f��6�``��$�$Z3�ͩ��U��z,06��0��4�Fl�1ͯ�k`3�ܼ0Xq0  !�clip2gif 0.7.2 by Yves Piguet ;        � 	up_arrow  @    �   +     autovisible  false  �GIF89a  �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�    ,      c  ����Cxp߿ �ϛ7p���?�+Z�fb�$-��f��ǋ��|�O`��+3����N#W���'ȁ@Y��H��O���=���^Ā !�clip2gif 0.7.2 by Yves Piguet ;        � 	x hilite  P [on mouseUp
  set the vis of image "xcheck" to (not the vis of image "xcheck")
end mouseUp
         �    uGIF89a  �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�    ,      1 �	H� ����! �B���E�)f���aǆ��h��Â( !�clip2gif 0.7.2 by Yves Piguet ;        � eye cover.gif  	@       � H    �GIF89a  �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�   ,      n ?H������C�P! ����C�	-V����ƍ?Z�УH�M�l(R#ʌ-/���f˚U~��A�K�>G�)�$͐71�\��'O� �
�Qj§V�j�ʵ�W� !�clip2gif 0.7.2 by Yves Piguet ;        � 	eye_ball  	@       � F    �GIF89a  �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�   ,      A ?H����*\Ȱ�Ç#J�Hị/�x���;~��cȒ$Q�|��dŗ0cʜI��M� !�clip2gif 0.7.2 by Yves Piguet ;        � 
ok_normal  	P�on mousedown
  global normal_name, depressed_name
  show image "ok_depressed"
  put the long id of me into normal_name
  put the long id of image "ok_depressed" into depressed_name
  insert script of btn "button manager" of cd 1 of stack "metacard demo2" into front
end mousedown

on mouseup
  global advanced_user
  local i
  put false into advanced_user
  hide image "ok_depressed"
  remove script of btn "button manager" of cd 1 of stack "metacard demo2" from front
  set cursor to clock
  if the vis of image "xcheck2" is true then
    set the backdrop to "black"
    hide menubar
  else
    set the backdrop to "none"
    show menubar
  end if
  get the substacks of stack "metacard demo2"
  repeat for each line i in it
    set the alwaysbuffer of stack i to (the vis of image "xcheck")
  end repeat
  set the alwaysbuffer of stack "metacard demo2" to (the vis of image "xcheck")
  set cursor to 8
  put_away true
end mouseup
        � D   ^GIF89aD  �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�    ,    D  � H����*\�p`8*@đC"EB�1��;b���Ň7N9�"�@9�x!Cf� 2i��9��͜>y���s'P�E������c|B�j3�ͩW�R�j�+֮]�$z��f��d�E�v�٨mߦ]��\�l�����P�[�^L�kᰁe��z��ǈ!;�ܵ)L/Uej��3��c�M��ј�c�9s�Ϟmv���Q�Ao%3�蚣e���t����^���\+�1�y���������n;6P�1����>�x���K���~�ʓ9/�~z��Ǵ��x0�� �fe�xme	Ƙd���i���MhmĦ����Zp^8(�urچ�ɔL�%�[q�!8�M'�?���?Ѷ\v�yU"����!��S�9��W޼~���]Y��Ub�e�U����dRX&�Uw�韅n�y&�
v���x��'lz��'l�yעq.�[��j��Nn��s�j�Q�H�#�<�Ȧ�t��7���#�v�)����ꨣ�Jj��Ȃj����ʭ��k?���믻�k?  !�clip2gif 0.7.2 by Yves Piguet ;        � ok_depressed  @       � D   1GIF89aD  �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�    ,    D  � �H����*\�0+G��A�(1"D�3N�h��F�?v{4�"��Ȍ�re˖,]��I�&̗3qʬ��%��� qIƋP�F��,ztiR�M�0U*��ӨL��f��̮3ǀ�*6�ؕg�zE[��Z�9��J�Sj]�vm��{���1Z��K��`�~��!�ۘ}*��[	���Ǒ/W�L9sg˟9c=Zt�=Sﴹ��-]�����j2�b�ZuwT�@\Ku=T8�P�2=�5��l��6*{���j�B��5w��D���7��k�Kŧ��5����U
���5���Ɲ[�_h���&�>�h�h�i�Yi�V�M��4_uס�Z]9ݖ�c���o��ч�U�Ɯ#Ͻ��L��Hu3n��W�9v|��xX�����#?��F&ɣ���T�+���Q9eh
�%�X�Ĝ`�&&�cfX&�.m�[�l&�&�o��"s8��C�uމ�z���v�g��
�����Ȣ�賨��F�褏VZ)��J�)��v
駋 !�clip2gif 0.7.2 by Yves Piguet ;         New Button  @
on mousedown
  global normal_name, depressed_name
  show image "x hilite"
  put the long id of image "x hilite" into normal_name
  put the long id of image "x hilite" into depressed_name
  insert script of btn "button manager" of cd 1 of stack "metacard demo2" into front
end mousedown

on mouseup
  global advanced_user
  put false into advanced_user
  hide image "x hilite"
  set the vis of image "xcheck" to (not the vis of image "xcheck")
  remove script of btn "button manager" of cd 1 of stack "metacard demo2" from front
end mouseup
         �               	  � 	        New Button  @
#on mousedown
  global normal_name, depressed_name
  show image "x hilite2"
  put the long id of image "x hilite2" into normal_name
  put the long id of image "x hilite2" into depressed_name
  insert script of btn "button manager" of cd 1 of stack "metacard demo2" into front
end mousedown

on mouseup
  global advanced_user
  put false into advanced_user
  hide image "x hilite2"
  set the vis of image "xcheck2" to (not the vis of image "xcheck2")
  remove script of btn "button manager" of cd 1 of stack "metacard demo2" from front
end mouseup
         �               	  � 	     [�M cancel_normal  	P�on mousedown
  global normal_name, depressed_name
  show image "cancel_depressed"
  put the long id of me into normal_name
  put the long id of image "cancel_depressed" into depressed_name
  insert script of btn "button manager" of cd 1 of stack "metacard demo2" into front
end mousedown

on mouseup
  global advanced_user
  put false into advanced_user
  hide image "cancel_depressed"
  remove script of btn "button manager" of cd 1 of stack "metacard demo2" from front
  put_away false
end mouseup
        S D   |GIF89aD  �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�    ,    D  � H����*\�p`8*@đC"EB�1��;b���Ň7N9�"�@9�x!Cf� 2i��9��͜>y���s'P�E������c|B�j3�ͩW�R�j�+֮]�$z��f��d�E�v�٨mߦ]��\�l�����P�[�^L�kᰁe��z��ǈ!;�ܵ)L/Uej�y���lb�\utfӥ7���y5i�}U8���g�����;)o��{/��卯P[OE�tM��<#��\:��m�����@e���C���x���?O��������'���1����L+��)GX~n���>�v`T��Ule	�؂�Q�g��s�e՜�
N�Sl���k���f)���j���
��Zq0��mc�!8��h����$���s8�W�Q��X�3��}S�M
^8��@ZW�Vay�RL���&}�צ�����~n��&�8� ឍ9H��~�wT((�������i��'��Z��=:)������q:\��~*�n�"�WS"�ꪨ��<�W���H7�8bk7�̚물��k��ު밴[k�������+�F+���B�O��f�-�  !�clip2gif 0.7.2 by Yves Piguet ;         cancel_depressed  @       S D   FGIF89aD  �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�    ,    D  � �H����*\�0+G��A�(1"D�3N�h��F�?v{4�"��Ȍ�re˖,]��I�&̗3qʬ��%��� qIƋP�F��,ztiR�M�0U*��ӨL��f��̮3ǀ�*6�ؕg�zE[��Z�3��J�Sj]�vm��{���1Z��K��`�~��!�ۘ}*��[	���Ǒ/W�L9sg˟9c=Zt�=u�[���N�9_��:6O��Z%S{h�P��*<�ꪺǜޚv�괬�͌.�,k�ѭWWkw��+�k۬���qڭчW)�������L�/u���K=����{�5Wi��V�f��������h�I�`k�y�C��&-��{��_zn�n�Uo����o�y�Q!��oB7r�9�\[���u�٨]u6�f$[oy�Cc�-%|DMyX�Z9r���q�ؗUv)�w�]Ə��V!ii���c̀�l<iX睮�i�M(&���J��ȩ�8�(��.�h��2*i��FJ饕2��r�>��
ꨁ�jj����j���
*��  !�clip2gif 0.7.2 by Yves Piguet ;        	 New Button B� #on mouseup
  sound_up
end mouseup
         '        �         	  � 	       
 New Button B� %on mouseup
  sound_down
end mouseup
         x        �         	  � 	       � blink  @    �  � G      autovisible  false  �GIF89a   �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�    ,       ~ H����*<���B�?4|h0⇋)���cF�=btR�H�!M�\���G�.O���2aK�o�\i�fM�:=�d�s(Q�F	6�1iŘNZܙ��T�(oFe`�D�I.[1,Y�gӪ]˶�ۀ !�clip2gif 0.7.2 by Yves Piguet ;        � 	exertion  @       � G & 6  GIF89a& 6 �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�    ,    & 6 � H����*\Ȱ���2�h��Rh�ǋn��I�!n,y��H�+9�t��$G�3Q���2'͔{�ԙ1(Μ/a�$9�hC�<6MZT�P�1Z����Ԛ��}ؑ�X�f�rdٲkѠl�%X֣ۚp]��Kv�٨s�L���È+^̸���A�h,��dĖ3'\0s��P3z�|�s�ї+�E���jԥ_��-[�aطg����� !�clip2gif 0.7.2 by Yves Piguet ;         
x hilite2  P :on mouseUp
  send "mouseup" to btn "xcheck2"
end mouseUp
         �    uGIF89a  �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�    ,      1 �	H� ����! �B���E�)f���aǆ��h��Â( !�clip2gif 0.7.2 by Yves Piguet ;      
     !`       < a f K        � local stack_loc    on preopenstack  (  get the loc of stack "metacard demo2"     subtract 94 from item 1 of it     subtract 77 from item 2 of it  #  set the width of this stack to 1  "  set the loc of this stack to it    put it into stack_loc    hide group 1  end preopenstack    
--306,223  
--400,300    on openstack    local total_time, start_time  --252  '  put the milliseconds into start_time  	  repeat  3    get round((the milliseconds-start_time)*0.252)  !    if it < 1 then put 1 into it  !    if it > 252 then exit repeat  &    set the width of this stack to it  +    set the loc of this stack to stack_loc    end repeat  %  set the width of this stack to 252  )  set the loc of this stack to stack_loc  0-- set the loc of group 1 to the loc of this cd  +  show group 1 with visual effect dissolve  end openstack        � elephant call.wav   	`      et"rcapu  ^�������������������~~||zzxxxxzzzzzzz||~~�����������������������~||||~~~||||||~����������������������~|zzzzxxxxxxxxxvvvxz||~~~�������������������������~||zzxxvvtttvvxxxz~���������������������������������|zxvvvxxzzz~��������������~~|zxxxxzzz|~~~�����������������������~|zxxxzzzz|~��~�������������������������~|xttrppnpnnnpprvxz|~����������������������~|xvrrrrrttvvxz|~��������������������~|zxvtrrrtvxz~~������������������~|zxtpnjjjjllnprtv|�����������������������|zxvvtttrrttvvxxz|~~������������~~~~���~|zxxz|~|~������������������������~~~~~~||zxvttvxz|������������������~~��������������~~||zzxvtrpnptx|~�����������������������~zvrlhddddhlnnrx~���������������������|tpljjhdbbbfhlnptx~������������������|tnf^XRLHFFJLPTV^fpx~���������������������zl`VNHB<::>BFJPXbjnv��������������������~tld^\XVTTTVX\bltx|���������������������|vpjfdbb`^^`bfnt|������������������������~xnf`\XTRPNPTV\bhnt|��������������������xnd\VTRPNNRX`hnv|���������������������tj`XPLFB><<>BHR\fpz���������������������ztpjd\VTRRRRTX`jt|�����������������������~ztplhdb````bflrvz~���������������������|xpjd^ZXTRTVX`fpx���������������������|vldZTPJFDDHLT\bjrz������������������|tlf^XPLLJJJNTZbjpz���������������������~vrnh`\\^^\ZZ\bhnrx~���������������������ztpljjlnnnnnrtvtvxz|~�������������������~|vplhfddb`bfjnprx~�������������������|vphb^ZXVX^djrx~������������������vpjd`^^`bdfffhlrz�������������������~xpjjhhhjnv|���������������~xrlf`^````^\\^`flt~������������������zrjd`\\Z\^bfhlnppprz������������������������������������~zxtttvxxxtrppprrtx|~��������������~zvpjfdflt|������������������~|||zxtphbbfjjjntz~�����������������|zzvtprtvtnljjlnrvx|����������������ztlhdbbdhltz||~~�������������������ztpnlhfb\XVTVX^flpv|���������������������|vrlhb^\\\\\^^``dhltz���������������������ztnjd^XTRNLLLPV\dlt~������������������~pbTH>:60*&(,28@L\n~������������¼�����xhZNHB@<868>DLR\ft���������������������xpjd^XTRRTTTVX^dltz�������������������xrpjb\XTPLJJNTZbhrz��������������������vld\TJBBBDHJPV`lv�������������������vlbZVTPNLJJLPTX`n|�����������¼������vdXNJD>8668:>BHT`n|�������������������tbRB62220.4:BFJR^l|��������������������vj`\XXXXXZ\\\^`fjnrx~��������������������zxz~~ztnjfbb``bbdhntxz|���������������������xtnh`ZVTRRTXZ`dhnrz��������������������~xrlhd`\XTRRV\djpv|���������������������|vrnlllllnptx|���������������~~|||zzxxvtttvx|~�����������������~xtppnprtxz|~������������������������~|zvvxzz|||~~~|zvtttvxxz|���������������������vld^\ZXVTTTXZ^djpv~������������������vj`XTRRPPPTZbjt~��������������������|tlb\XVVZ`bdhlt|��������������������|xtplfb^^bhntx|�������������������xrljhb^XVVVZ^flt|�����������������������~|xtnjhjpv|������������~~|zzz|~~����������������~|zxtpljhhhhffjrz������������������|tnf^XTVVVVX\`fjr|�������������������vnd\TNJJLPV^fnrvxz~���������������������|xvvtrrpppprrrnnnrtvxxzz~�������������������~ztrnlhd`\\^djpvz~�������������������|z|���xrpptx�������������zttvvvvtttvx|�����������������|xtvxz||~��������|vnjnz�����zvvz|~�����������������vjdbfhhd\VTRRTV\ft���������������������zrh`XVVZZ\`hr|�����������������������zz|~~�������xnjlnrrrppnnnrvx|�������������������~zvrpplljhhjlprrtz����������������������~||zvrrrpnjhfdbdn|�����������������������|zzxvrpjfb`bflpv|������������������|xrnllnrtvxzxvx|�������������~||zxtpnllptx|����������������������|tpllnrttvz���������������~zvvtvz|zvtx���������������zrjfddfhjlppprtx|������������������~xrnlhb`bjr|����~~�����~���������������~~|z|~���|vnhflrtnhhjpv|��������������������|rprpnptz~|~�����~|������zxxtnhfdfjpx�����������������~xtrpplfb^\dp|�������������������tf^\^bdfhlrz~|vrtx|~���������~vrtx������~|~��������~xvttxxzzzvttvx|����������������~|zzz~�����������zvxzzxtpljjnttpprv|���������������~|��|rhdfjjf`^bjt|�����������������|vnlntz~����������||||||z|~~vpptvtprx�������������������zxz������~zxzz~���������|tpnnrttx~�������������~zxvvx||~~~xnddlz����������ztpt|�����zvx~�������������~tprtrlfb`dlph``dfn|���������������������zjbbhlrz���������tv~�xtz�������������������������xj`^`b`\VPNT\dnttrrv�������������������������~vlhjlprppppppnlr����������������xnhb\TLJPZ`^Z\dlrz�������������������zvxxxtpjd`blttnjnx|xv|����������������������������zpllptx|~���ztnnv~��������tlntvz~�~��������~|||~~xpjhhntxxrnptx~��������������������l`bjnh^Z^jt||vrtz����������pnv����~������zxx~�����zrnntx||ztnlrz���������������������vplljd`bjtzzrhdjv����������xz��������|||zzx|�����������ztv|����������������������~xphb`flrtv|~|tlhhntz���������������������������|xtnntz|xrljlpptv~������~��������������rhbbjv����xpljnt|���������������~|�����zpjhjlnlhfjpx|���������������~z|�~xrrrvvvtpllntz����������|x|���������|vtrprx~�������~xplnv~����������������������~vhZRT^nxxphflv�����������������|pjhlnlbTNPVXX\l���������������������~vttpf^dnxxrjffbbfpx��������������������zvrnjhhhhhjhhhhhlt�����������������������~vnnrtnhfjrvrh^XZbnx~��������������������xrjfflrtvx|���~~~���������~���������~������znhjnrz����vld`^`hr|������������������|pjhf^RFFN\fjjnv~~~����������������xpnptx|�~|tfXT\lz����������~|||�����������������rbZX\\ZRLJRf|�������������������~rh^XZ\^\ZZ\bffdbfn|��������������������||xvrrpprv|~xpfbfjjddn~�������������������vjb\XVX^bddfjrz~|xvx�����������������~~|xtnjhdbbfjnllnrvz����������������������zrjd^VTTVX\dlv~�����������������~���|rjjnx����zvrrtx||ztprvz����������������������vljpvxvplnpx|~~||~~������������zvx|�|zz~��������~|~~~|xtrnllnprtv|������������������tnnnldXPLPXblprv|���������������~vpnrz~|tljpvz|xvx������vnnt|���������������������~vpppndZNJPbpvvx������������������~zvrld\XZbhjlpv|��~���������||�����������������~xpjhjnppprz�����������������~|xrjbXPRV^dlv��������������������tf^ZXZ^dlr|�����������������������|xvttx|����|vtrtv||vnhhlrx�����������������|xz|zn^RJJPXblv|��������������������~rj`XX`nx~�~~xrnpz�~vt~���|���������zx~������~phhlpnf\XXZ\bl|�����������������~vpljhd\RNR`nz�������������������|tlfhnnjhpz����������|����rnx�����rbRPb~������|tprx|������������������������rd`dlptz~zpfhv��������������~vpljhjjhb\XZ^dnz���������������������~vnd^`jtvvx~������~xt|�����������||����������~th`Z`lvvttz�����������������|zz~�|rjffhhflx��������������vnllnr|��vjbbjt�����������vprx��������vlhfffhp~����vlf`bhtxvtx���������������|~~th\TRTVXVTV`jpt|�������ĸ���������~rhdd^RFFVjx|||��������������������xrlfdht~�|vvz|zvnfddfffjx��������������������xld^`fpxvppz�������������~����~tnllf`ZX\hv�����������~rllrx|~~ztnhdffdbfr������������������������|~����������zpjdbdjt����xz������������xnhntrdRHJTXVTTX`lx���������������|~������~||vj^VZdx����zvz�������������������xplllljfbZRJHLRZblx���������������zrtx|zvld\XX\bhpz����������������z|�����~����|xtrpprplfflv|����~xrptz������������vjjnrrpjdhv��|rrz�������������|xtnhfnx�����������~xvvtrnpx���znfb^\^ft���������������|tnlnpvvtnljhfhnv����������zrnpppprrtz�����������������~�|n`VX`hrz����������������~vx||tjd^XNFLZlvz~�����������~~�������rhdhrz~~~��������vpntz~����������������������xpnjb\Z`lv~���������������������zpf`^bhnvz~�����������~rlp|��~xtph^\dt~������������vnjlpvz|zxtlb`djptx����������xrrtz��������~xx||zvvvxxxzxtpnpv|�����������������|vttrnlllljf`\^bhpx�������������|z|~~|~��znhlvzz|���������|tlfb^^bhp|���������������������vnhfhhnt|�������������vjflv����||zxvx�������������xjb\XZ^frz~|z|~~|~��������������~zvrtz��~zx|�����~zz~���xrlllnrz����������������zvplf^XVZ^bdhntx|��������������zlddhhhd^\XXZ^fpz������������vnlrx~��|rllljffp���������|vtrrt~������|xttx~��������|tpt|�ztrv~�����������������xnfdhpvxtlfflv�������������vjdhr|��|rf^\^dlv����������zz|~|vplt��������zvz���������xvxrjdhpvvrz���������������~ztpljhffjnrvz�������������rd^fpxzzvrnllrvxz|����������~x|�����������~zz|zxxvtttrpljltzztnnt~�������������xtpdXRZfjbXV^hnpt~�������������vllrtrnlllhffjptz�����������~xvxzzvtz�����������������xfXXdprlhhjlnt���������������~tnf^Z^hprnlnrx~������������������vtv~������������|xvvtttx|||zxxz|�������������|vrlf^`lx~ztpnpt|�������������|rlfdb``bjt|~~~�����������������ztrnpprtvx���������~zxxzzzz|~|vppv~������������~xtpjhfhlnrrrprz����������������~ztrrttpnnptxz~���������ztljnv|~|z||||���������������~rhfhpttnhdfnx����������������xrnjfdflljjp|�����������������zpllnprtv|~�����������xttttxvrjhnvzzzz|������������xrrrvxzvrjhhlrx~���������������~vrpptvvvvxxz���������|zxvx|�|tnpv�����������������xnhfb^ZZ`hjllpv|~���������������|tpllnnjddhpvz|����~|��������������������������tjbZTXdrxtnhhnx�����������������xrpppldZTRV`jrtrrrx����������������~�����|zvtrprtttx|~~|zzzzxvx|��������������������xnjf^TPV`hntx~������������������|tnlpx|zvtx���������������|vnnrz����������������������tfZV^jv~��������������������|tlfhlrx|��������������zxx~�~tljnv~��~|�����������������|l^VXblv|~||~���������������|vplljjnrxz|zzz���������������|zxz~���~zz~�~||����������|xx~��~z~����������xnjlpz~~xtrv|������~�����������~vplpt|~|vpptvttx���~�����������������������|~����~~~xplntxz||||~������������������|tnjhhhhhffhlrz����������������~||~�~|xtptz�����������~zz|��������~z|������~||�������xnjlrvvxz|zzz|~����������~||zvvx~�������������������xrlhfb`^blv|~||����������������|tnlhhffhhjjjjpx�����������������������������������vnfdfhhdfjrz�����~|�������������zpjfdfnv||zxttvz��������������||������|vrnptz�������~xrnjjnv~���������|zzz~������~zvrpnpt|����~~~�����~|����~xttvx|������������������|tnjfdbbflt|�����~~������������|zxtrppnljhhfdfjnnpt~��������������������~zz|~~~||~���|rjfdhlt~������~xz����������|pd\\djnprx||xttv|������������~zxxz|�����~zxvttxz���������xrrv~������������������|ztlfdjt~�����~|������������|rf\Z^dlrvvtpljntz����������������~ztpnpttnlnv~�����������������~|~�~|zxxvrnlpx�����vljjpx���������~~������������xtx���ztvz~~|||�����������ztrv~���������������������~xphddjpvxxxz~�|||�������������xtvz~��~xphdfltzzxxz������~|������������~~���������xnf^ZX\dlrvz������������������~tnnprrnlllhdbdhlrxz|��������������������xplllhbdlt~���|tlhlv���������������������rdZX\dnvzxvvxxtnnv�����������|tnjnx������|trv|�����������xvx|~�������zvz������������|rpprpnnrx~�~xrpv|����������~rlpx�������|trvz~�������~tnlptz~~~~�������������������rjjr~����zxxvtrrvz�������~vlfdhr|������~zzz|zxz~�������~xttv|��������������������������������|vrrtz������|zxvplfdhpz���������������������vhbdhntvz|~�~zvvx|��������������������~ztrv|�������|tnnpv|���������������������xpljjlrvzxttxzzxvv|����������������������|tnnrvxvrpv�����ztprx~����������������zxz~~|xnhddfjnt~������������������~vtxzxvvvvrljlrtv|�����������zt|�����zpllprvvv|������|vrprx~�������vpprv~����~|xvvvz|~�����������������������|rjfhpz���vlfbbdjr|�����������~���������vnjjjlnjhnz�����vrt|������������~~��������~xlb^dnrrpprz�����������������zz������ztrpnnrx��������|vrrppv���������||||����������|rjhlt~���|xvvxxz~����������������������~vj^XZdlppr|����|xz|���������~xvvxxxxz|~~|xpjjntxz~��������������������~xrprx|~�~||��~|zz~�����������~z|����|z|~|xrljpx��������~zxxz~�������~|zz|~~||||~~~�~~~����������������������ztrnhflvzztpnljjlnrx������������������~tljhfdbbdfhlt�������������������~xxvxvvvtpjfhlrvz||~�������������������xnhfhjntx||||xvvxz~���������zvtvzz~~�~|zxxxzzz|~�����������������~||~~|zxvxz����������������~||zxvxxxvvtvvz~�~zxz�����������z|������|zvpjfflv|����������������������|xtplnt~������zvv|����������ztrrtvvtrv~��|rnnpv|�����������~~~~�����~z~����~�������~����������zxx|~���������|zzzxvv|�����|zvtvvvrnrz�������������������~vrrtvvttvxvtvvz���������������������~|xpf`^bhntxx|������������������ztnlllllnnnpprppppt~��������������������|vrprvz|~�������������������~zzzzzz|~���~xvvz~�������������������~xvxxxxvxz~�����~xxxxxvx~����~xrprvz~�������~zxx|�����������~||~��������|x|�����������xttv|~�|xvttvvxz~���������������������~~�~��������~|~������������zvrtx~�����|vtrrvz���������~xttvx|�����~vpptz�����������~~����������xvtv|������������~~����������|xtrrvz~���ztnlntz��������~~����������~|vnhhp|����~zz|~��������������||�����|rjffffhjnpprvz�����~~��������xrllrx|xtrvz|zvrpnpv�����������������������|tnpv����~||~��~|~�����������|z|���������~zxxz��������~zvtv~�����|||||zzz|������ztrrvx~����������������������|trtx��������|tnnrx|~��������~xrrv~������xrnnptz����������������������~z|����ztpprtrpllpx������������������|tlfddhpx~�~zxvvvxz~���������xnhhnx�����xrnjhjnrv|�������|ttx�������|zxxz|~��������~xvz~��������~~~������������|xvvz��������~||~�����������~xvvz~�����~zxtrtvz|||~����~zz|~~������~xvvx|������~~~|||�������|zzzz|~�����������~~�������~vpprvzz~��������~|~���������|trtvz|~�������|xvxx|�����~zxxz|~������������������~xrnjhfffjnrz~��~zxttx����������������~~~~|xrnjfffjpx~�������������������xpjhlrxxvpnppnjjlr|����������������������|tpprvz||~~~~~~������������������������|xtpjd^`hr~����|xvvx~������������vpnpv|��~vplnrvz~~�������������������~vrrx����~|z|||zxvvxz~�������~zz~����������tjdhnv|����������������������ztnlnptvvtrrpppprz��������������~|||zxtplhffjnppnpv������������������|xvrnnlllhdflrvxz~�~~�������������������~|xrnjjntx|��������������������zvpllnprrppnnnnlnrz��������������������~|xtprvxz|������������������|tljlptvvxxxxxvvttv|������������~~����~zz~~zrlhhnx����������������������~zvvx|������|xvvz������������~||�����|xrnjhhjlnrttvvxzxxvvz~�����������~��������~~||zxvx|���������������������|xtpnjjjnprttrpnrv|��������������������zvtrtvz|����������������������~zvvvz~~|xvvvttrnnrz������������������~ztrnlhb`bhnrtvz~����������������~vrprtrnjdbdffdflt|��������������������ztnlhfhhjnrz������~~�����������~|xvvxzzxvvxvplfdflrx~�����������������~xvttvxxxxvvvvvvvvv|��������������������~zvpjhfhlt|�������������������~xrljlprrtvz|||~�������������������������zrnnptttv|�������������������~xplllnppppjd``bdfjpx��������������������zrljhfdflpvx|�������������������~|xrpnnnnllprvzzzxz~����������||||zzxvrnjhhhjlnrx|���������������������~|zvtrtvxvtrrvz|�������������������|xrpljfb``dhlnpv~����������������xnjhhfhhjnrvxz||~�����������������������|xxvtpjffjntz~�������������������xrjd`^``^\XVVZ^dfjpx������������������~vpnllllprx|~�������������������������|tplllnnlhddlv|�������������������zvrplf`^^``bbdfhjntz�����������������|xtpnljhhjjnt|�����������������~xtnljjllnrtz~����~~������������|xvtvz~~zrnjjlprpprx���������������������xttrrpppprtvvvvx|����������������|xvrpjfb``bfjnrz������������������~tnhffdfhnrtvvvxz~����������������~�������~zvttttttx����������������������|xtpnllnlljjlprtvxz~���������������|rjdbbdhlprtvvz~�����������������~xtrrttvvvvvtrptz~�����������������������|tnhb^\^`fjnprtxz|����������������|vvvxxvphhlrttrrv|������������������������|vplnv|~|zz|�������������������������ztpllpvzz|~�����~|z|~����������|xvttvvvvxxvtrrrvz~�����������~|zz||||zxvtrrrrrrv|���~�������������zxxxzzzzzz|~�~||||~����������|xvx|~�����|xpjhjpvz|~���������������������~xrnljjlllnrrpnnptx~�������������~xplhfhhjjhhjnt|�����������������|vpnptx~���~|||~~~��������������������������|xrnptxz~��������������������|vtrpnljlnrvz~�������������������~ztnjhddddhpx��������������������|tlfbbdhpvz|~���������������������|xvvvvxxzzxvrppnnnpptx|��������������������|xtpjdbbdhnrx~�������������������ztnhfdbbflrx|~����������������������~~~||z|||~��~~||zz|~�����������������������zxtpnlnprvz~�������~������������|xxz~��������������������������|xtppnppprrtvxxxxz|����������������||||||||~�~zrljlrxz|����������������������zpjd`^`hr|����������������������xphd`^`djnprv|��~zx|��������������|rlhhhhjjlnrrplhhlrx~�����������������~���~ztnfdddhlpx��������������������~xrld^XTX^fpv|�������������������~tlhffddbdfjpx~�~zvvz����������������zxxxxxvrpnlljhfhjrv|�������������������~|ztnjfdbdhpx~��������������������|tnf^XVX^fnvz~�����~z~����������ztrpprtvtrtz������������������~zxxvvvtrprx||zvttx~����������������||||~|zvtttttrrrrrrtvz���������������������xphdbbbdjpx���������������������znfbdhnrtvtttvz|~�������������������|vpnprvx||zxxxz||��������������������������~zvtttvxz|~����������������������zvtpnnnprrrpnnprvz~��������������|zxzzzxxvtrrtxzzxxxz~����������������~zxvvxxzzzzxxxxz|~������������������������~||||~������~~|~��������������������~|xvttvvvvvx|~���������������~|zxvvttrrtx|���������������������~zzxxxxxz|~~|xxz~�������������������������~|zxvvvxz~�����������������������~xtrpprrrnlnrvzz~������������������~xrppljhhjnptvvvz��������������������|zvplllnlljlptvz~����������������|xx||xtrrrpprvz~�����������������������~zzz||zxtppptxzxxzzzz~������������~|zxxvtpnllnrvxz~����������������������~zxvx||zvtttvz~������������~zvvxz�����|xvvxzz|~������|zzz~��������~||||~�����~|zzxvtvxvtppptz������������������~zxzzxvxz||||���������������������|xvvzzxvvxzz|~���������|zzzzzz|~������~~���������������������������zvx|����~|||~zvrppprvvxxz|~���������������~|zvvx|~�~~~|zxz~�����������������������������������������~zxxz|zxz~�~~~~���������������~|zzxxxzzzxvvxxxz|�����������������|z||~�~~~|zxxz|~����������������~~~�����������~~�����zz~�����~|zxxzz|~���������|xxz~~||zzzxzzzxxz����������������~~~��������~xx~���������~zxxxxvtrtttvvvvvvx|~�����������~zx~��|xxz|~~����������������������������������������~|zz|~���~|xxxz|||~������������||zzxvtttvx|��|vtv|���������|zz~��~|zzzzxxxxz|~~�����������~zxz~���~|~~�������������������~|||zxxz||zxz~��~||~~~~�~|zz|~|zvrprx~�����������������������������������������|zxz||~~���~|zxvttvvxzz~�������~zvtrrvx|~~||zzzzzzxxz~��������������������������������������������������~~~~|zvttvxz|||~~~zxvxxzzzzz|~��~|||||zvtrtvz|~��������|z|����������������~~�~~zz||~||~�������������������~|vrpprvvvrnprvvvvvx|����������������|xvvvxxz|||||~���������������������������~|xvtttvxxxxxxvtttrpnljlpv|���|tpprtx|~�������|xxz||||~�������������������������������������������~~~~xrprtxz|zxvttvvxzz|~~~~|||zxtrtz�������������~~~������~zzz|���������������|z~�����~~~~||zxvvxz~�������������|vpnnptvvtpnlnrvz~������������������~vrrrrttvtttx~�����������������������~||���~zvtttvxxxxvxz|����~|zxxz~��|vplllrx||xvxz~��~zx|�����������������|||~�������������������������������|vrrv|~�~~~~~~||zzzz||~~����~|�������zz~�������|z|~�~|||~~||~�����������|xvvx||~|xvxz~�~|xtrrtx|~~~���������||~����������������������~����������|xxz|~~|zvtvvvxvxxxxz|~~�����������������������|xvvvxz|~�����������������||~�~zvtrrrrrrrprrtvx|�������������zxz||zz~�~|zz|~��������������������|vrrvzzzvttvz|~~||~�����������������zvvx|~~~���~zzz||~�����������������|vtvz���|xvvvvvvvvxxxvttvxzz||~������~|||~���~|~���~|||~�����������������~~�������~zxxxxxzzz||~��������������|z|~���������~zxxz|~�����������������~~����|xvtttvxxvvvxz|���������������|zxxvvtttttttvxxxx|����������������������|zvvvxzzz|��������������������zxzzzvvxz~����~|xxxz~��������������~||||~������~|zz|~�~|zxxxxxzz|||��������������~~~~���||zxxxz~�����������������|zz���|zxzzxxx|~~~��������������������������������������~~~~|zxvtrrrtz~�������������������~|xtrttvvvtrrrtz���������������������~�������~~|zz|��������������������������~|xtrnllnprrprx|��������������������~~|xtrnppprv|������������������������~~zxtpnllntx|~~|~�����������������������~|zzxxz|~��������������~~����������|vrrtvtrrvx~�����������������������~xtrpptxxxvxz�������������������������ztnllptvxz|~��~~���~~~~������~���������~||~���������������~~~�����������������~||�������|xvvvtttrrpnnprrrtvxz~���������������������~||zxvttvxzzxz|~�������������������|xvttttttttvxxxxxvvxz~~~�������������������~~~~~~~~�����������������������������~|zzzxxvxz|~~~��������������|||zzxvttvvz~~~|||~��������������������������~~��������������������������~||||||||zzz|~������~~~�������|zxvvvxxxxxz~�����������������������~~~|zxxz||zz|||~~�������������������~zvtrtttvxxzzxvrnnnpx������������������������~|xvtvx||~|~���������������������~|zxvrnjhhhjllnrtz~�����������������~zxvtrrrrrtttvx|������������������������~~|zxvtrnnnnrtx||~�������������������|zxvtrrnllnptx|�����������������������|zvvtrrrrpppv|~����������������~zxxxvvtrrppppnppprvxzz~��������������������~zvrpnlllnpptvz����������������������|xvrpplljlnnnprvz~������������������~|zxtpljjjjnprrttvx|���������������������|zzzxxxxxvvxz|~����������������������~zvtrppnnnppprrtx|~�����������������~zxtrrrpnjjjlptttvxz|~������������������������~xtpllnnnpprtvx|~�������������������|zvrpnljjjnprtvvvxz~����������������������~|zzxxxx|~~~~|zzxvvxz|���������������~zvtxz~~|xrnllprtvvz~��������������������|vvvttttrrtvxz|~����������������������~||zzzxtrrrrrrrrtvx|�����������������|zvvxzzzvtrpnnnptxz~���������������������~~|zxtrrrtvzz|~���������������������|xtpnnljjjlnptvxz|~~����������������������~|zxvvvvvvvxvttvz~��������������������|tnjhffdffhhhjlptvz|~��������������������~zvttrrrrpppprx~��������������������������|xtrpprtttttxz~������������������������~ztpljjllllnnprtx~������������������~zvplhfhhlprvxz||~�����������������������~zvrpppppppprtvxz|��������������������~zvpjhjllnptx||z|����������������������~|xtpnnptxzzzz|zzz|~�����������������������~xtrtxz|||~|xtttvz|�������������������|xvttvvvvtttvvvxz|����������������������~|zxxzz|�������������������������������~zvttttvxxz|||||~�����������������������|xtrrrpnnnprvxz~��������������������|xtpnjjjlprtvzzzxxzz~�����������������������|xtttvttrttrnnpvz~�������������������~zvpljhhjlnnpppnrx~���������������������~xrnnnnprtvxxvvvx|�����������������������~xvvxxxxvvxxxxxz~���������������������~ztpnnnnllnnprtxz|~���������������������~xrrttvtrpppnnnrx|~�����������������������~xrpprvxxxxvrpnlnrz��������������������|zxxxvtrpppppprvz~��������������������|vpljllllllljjjlptx|��������������������~xtrppprppppnprtx|~��������������������~xtrnnnnnnppnnlnrvz~��������������������~zvttvxz|||||zxz|~~���������������������zvvvvxxvtrpnnnrttvz|�������������������zvvvxz||||zvttvvxz~��������������������||zxvvvvvtttttttvxz|����������������������~|vtrrrttvvxxxxxz|�������������������~|zzzvvvtrplllnprtx||~�������������������~zvtrppprrttttvz~���������������������~|xvtrrrttttttvvz~��������������������~ztrnnnnnnpppprvz~���������������������~ztpnlllnrttttvvxz~����������������������~zvtrrprpppppprrtvz~��������������������~vrnnpnnnnpnllnrvvz~���������������������|vrppnllllllnptvvx|����������������������|xxvrpprrrrprttvxz���������������������|zvrplhfhhhfhlnrvx~���������������������|vtrnljlprrprvx|�����������������������zvpljjjlpppnnptz~��������������������~xrnljhhhlnpprrrtvz|��������������������|vtrrrprtxxzzzxxz|����������������������~zxxxxvttvvvvvxzzz||~�������������������~zxxxxxvvxxxxxzzzz|~���������������������|xvttrrttvvvttrrrtvz|�������������������~|zxvtrpprtvxz|~������������������������~zxvrpprrtttvvvvz~���������������������zvplhfffjnptvxxz|����������������������xtpnnlllnprpprvxxxz~�������������������zvrppnlljnrtttvz|~����������������������|zxxxzz|||~||||����������������������������~|zzzzzzxxxz|~~����������������������|zvtrppprtttttrttxz����������������������~zvvttvvvx|~�����������������������������~zvrnllprtvvvttvx|��������������������|vrnljjlptxz||zxxz���������������������|rlhhjllnrvxvvx|~���������������������|vtrppnnptvvvvvz|~����������������������|vrpprtvxzzvtvvz|~�������������������~ztrpprtvxzzzxvxz|�������������������������~||~||zzzxxzzz|~������������������������|zxvttrpppnnpprttvz|���������������������|xtpnnnprttvxzz~���������������������~|xrnljjnptvxxvttvxz~���������������������~xtrpnprtvvvvvvx|����������������������|xrnllnprrrrrttvxz~���������������������zvttvxxxxxvttvxz|~�����������������������~|zxvtrrrrrrtvvxz|~���������������������|zzxvtttttrpprtxz~��������������������|zxvvtrrppppprvz|����������������������~|xvvttrrrrrrttvx|~�������������������~zxvtrnnnnnnnnprv|����������������������|zvrpnnpprttvxxzz~���������������������|xtpnnlllnpprtvxz~�����������������������|xvrpprttvxxz|~��������������������������|zvttrrttttvvvvxx|~���������������������~zvtrpnnnnpprrrtvx|~���������������������~zvrnlljllnnprrtvx|����������������������|xtpnnnnnprtvvvx|~���������������������|xrpnnnnpppprrtx|~���������������������|xtrpppnprtvxxz|~~�������������������~|zvtrppprtxzz|~�����������������������~zxvtttrtvxzz|~��������������������������|zxttttvxzzzz|����~~~��������������������~|zxxz|~~~~~||zxvxxz|~������������������~zvvtvvxzzxxxxxxxz~����������������������|zxxxxxxxzzxvtttvx|~�������������������~zvtrrrprrrpprrtvxz~�������������������~|zxtrnnnnprrvxxxzz|�����������������������|ztrrrtxz~�����������������������������~zvttttvxxxz|||~�����������������������~|zxvvxxz||~~~~~||~~~~�������������������~|||||~~~~~~~����������������������������������~|zxvvvxxz||~������������������~|zxxxxxxxxxvvvvxz|���������������������~|zxzzzxvvvvvvvvx|~�������������������~|zxvvtttttvvvvvxxzz|����������������������~zxvvtvxz~��~~~����������������������~|xvrppppprvxzzzzzz|~����������������������~|zzzxz||||||~~~|||~��������������������~|zxvxxz||~����~|||~~���������������������������~~~~|||||||~~�����������������������~||zzzzxxvvvvxxzzz|~~����������������||xvvtttvvxxxzzz|~��������������������������|||||~~|||||~�����������������������~|zzzxxvvvxz||||~�������������������������~||z||~~~~��������������������~~||||zzzzzzz|~�~~~||~~��������������������������������������������������������������~|zz||~�����������~��   V"   
about_box   �p @on preopenstack
end preopenstack

on closestack
end closestack
          black    � W�)                �    	Pylocal subtract_amount, stack_loc, timerID, move_return, can_move

on preopenstack
  local i
  put the movespeed into move_return
  set the movespeed to 100
  hide this stack
  set the loc of image "eye_ball" to 367,376
  set the loc of image "blink" to 368,378
  set the loc of image "elephant" to 381,403
  get the loc of stack "metacard demo2"
  subtract 220 from item 1 of it
  subtract 77 from item 2 of it
  set the width of this stack to 1
  set the loc of this stack to it
  put item 1 of it into subtract_amount
  put it into stack_loc
  put the loc of this stack into stack_loc
  set the width of this stack to 1
  set the showborder of this cd to true
  hide group 1
  set the loc of group "elephant" to 381,403
  hide image "blink"
  hide image "heart"
end preopenstack


on expand_stack
  local total_time, start_time, t_rect
  show this stack
  put the milliseconds into start_time
  repeat
    get (round((the milliseconds-start_time)*1.012)+subtract_amount)
    if it < 1 then put 1 into it
    if it > (506+subtract_amount) then exit repeat
    put the rect of this stack into t_rect
    put it into item 3 of t_rect
    set the rect of this stack to t_rect
    wait 20 milliseconds--to let the window system
    --catch up
  end repeat
  get the rect of this stack
  put 506+subtract_amount into item 3 of it
  set the rect of this stack to it
  send "bringingrcs" to me in 100 milliseconds
end expand_stack

on bringingrcs
  lock screen
  show group 1
  set the showborder of this cd to false
  unlock screen with visual effect dissolve fast
  send "elephant_anim" to me in 5 seconds
  put the result into timerID
end bringingrcs

on elephant_anim
  put false into can_move
  send "blink" to me in (the random of 800) milliseconds
  put the result into timerID
  move group "elephant" relative 0,-150 in 1 second
  put true into can_move
end elephant_anim

on blink
  get the random of 2
  if it = 1 then
    show image "blink"
    send "blink_again" to me in 5 ticks
    put the result into timerID
  else
    show image "blink"
    send "no_blink" to me in 5 ticks
    put the result into timerID
  end if
  get the random of 6
  if it = 1 then
    heart_float "k"
  else if it = 3 then
    heart_float "m"
  else if it = 6 then
    heart_float "a"
  end if
end blink

on heart_float which
  global frame_list
  local it
  if can_move is false then exit heart_float
  put false into can_move
  do "get the " & which&which & " of image " & quote & "eye_ball" & quote
  set the loc of image "eye_ball" to it
  put the points of grc which into frame_list
  show image "heart" at 372,174
  repeat for each line i in frame_list
    move image "heart" to i
  end repeat
  hide image "heart"
  set the loc of image "eye_ball" to the straight of image "eye_ball"
  put true into can_move
end heart_float

on blink_again
  hide image "blink"
  send "blink_again2" to me in 5 ticks
  put the result into timerID
end blink_again

on blink_again2
  show image "blink"
  send "no_blink" to me in 5 ticks
  put the result into timerID
end blink_again2

on no_blink
  hide image "blink"
  send "blink" to me in (the random of 1500) milliseconds
  put the result into timerID
end no_blink



on put_away save_me
  local total_time, start_time, t_rect, t_orig_rect
  --252
  lock screen
  hide group 1
  set the showborder of this cd to true
  unlock screen with visual effect dissolve fast
  put the milliseconds into start_time
  put item 3 of the rect of this stack into t_orig_rect
  repeat
    get (round((the milliseconds-start_time)*1.012))
    if it > 506 then exit repeat
    if it < 1 then put 1 into it
    put the rect of this stack into t_rect
    put t_orig_rect-it into item 3 of t_rect
    set the rect of this stack to t_rect
    wait 20 milliseconds--to let the window system
    --catch up
  end repeat
  get the rect of this stack
  put subtract_amount+1 into item 3 of it
  set the rect of this stack to it
  close this stack
  set the loc of image "eye_ball" to the straight of image "eye_ball"
  send "spin_logo about_group" to cd 1 of stack "metacard demo2" in 100 milliseconds --window manager
  if timerID is not empty then cancel timerID
  set the movespeed to move_return
end put_away
           �)  �    �  �  �  �    H       �����  	� peripheral backdrop.gif  	@          �)  �sGIF89a�)�  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   ,    �)G� ��إ��@]Z�p�\��`�\j�ȱ�Ǐ���Ç�	I|V�T1�����0cʴײ
>=Vp깩'_O=zD���$�'U�ރ��&K�OK�Di%ɪV{
ɵ�ׯ`ÊK��ٳhӪ]���m9pȠ���=rs��[��9r��хK+8�H�  @�Cv\eŽ�+,g^�b�K $ �M����$`�H�z���WIޓ�o��'��V��T���[�=<���)�Z�loE	�Kx��\zs{%�3��������-㫒R����ӫ_Ͼ�����˟O_}>���[�?�P���ǟ>�߀ާ������=��@��eav��=v��f/�ڈ��8�h�5w�m,��>��am+�h����ۋ7���(�D�L��ޑH��o�WV���هIVyOQ�8ՏNR��o���"I/�6s/�М��Q��azYߜt���~u�9����~�g�2h肈Hσ�<���]��k�U��s�q6�F��ig�A�\nX��c�/ƹ�,�D�*yKyy0��Xz9�X���xL�Z���]�E~ݪ8��#m?���U�X�af��T�
Ҋ�kN)��$�[j9㴺��ײ����:�e<�Von�y���$Cy��)p���(�*��	3��'zߢZ��z����ƻ1��mFe��z���ڃf�0m���/s<[��&W�n�&�Ԓ^�$[��vt�m�y���Jy�W�MP�ur��sLjz�2ʛ�٬t�6�Ǭ�/��v�4~�ݪQ���o���_����?F�����������l�*���;<����0�3�h�����gw,���j��w΁�o���b�f�+s�����a�K��A������*TU\��HU�{����+���t#���{�mx�7��Z~Vz��<>p����))�t�U7�_r2T�����o����?�2����K��x���5-)V�U�l%� �<���� �%tMG*QW�$�>*�QHӃ�nW;��Do$����&���G�����:{��p��n���U���'�J`Ԙ�$�(HJ��B~���d�K\R��,���h�I^��U#5�7(|�y����N+�Q���U�7e��	�һ�m*��_�b�Ǔ��_l���P����_)��j�HF�V�C��cƧ��WrcZ���H'��$�,!}bA��M�إ�9�8��M,m���U��3���;�-J
�[%�E )��k����HG�)Ito�J��+�Y�t9<]g���D-j˻��܆�G62��e�pH�>�1��d0��ƞ������_��_#��s��d��teD2gWYeW����/8����G ��2$�\��HR�P4�+��:o48�H)��З����W9�`�l�S�Qe�ۂ	�)��A�^�a��8��z8�$��T�Q�ZթW�IU1�o�$�+U)�N˫(�>�����	6��$#�i��U�z�'���������
�hO<��~����H�񮠐\_>���,=T����X�g��9!�ь샌����@9R���ѓ��
�F�>z���9sz�]}\��	a��Ɗn3�
�'�8i�O��t�:�z ���`c>T��iջ2Q�0���L��
m�@�t�ϳ�,�U�-�ݏ��#�*>ޣ���c��տ1���"q���2���r,yԪAm!'��KeeH���@~�Q!J�r9�A(��E)�V�fif',�H�x��}r�I,鴒H5��Y�%���5����^q�l�1�T��&.���ʀ�R*�.�Y�ee
�U�xQ#��IUD"Mh�J���hUp^-�JJ:�I��o<k����5����� �_zx����;+��2v��DdA[P+T�9K#��G�R�hI��^�؛R� ���H�1GM:m�盚D��$߹Z�_�dD�z��݊�#����[p1yI�No4��E~�E��g�z] `F_�����SIe-�b.�xY�՗X�4��y�tG��>w��\Uk���N�LP�*jf���,<��
|�������1�����";��S��c4 π�7�����)�%�k��I�����>V���~�n�&'�o=�_"G��Y0W	7�\V��VЇ��n�Ie���8S��u���CvԪw�h;�T�zmm��X3󏵨�zCu�h��f�v�}�X���n �˽0@ �  �����_��s��_~{�q��^��+���J�ҋ����Iz�̋�:�����F�USuV�
=P�9	��t�>��
�3���%���K��09�{�|Ψ�O�3ô�j�GJws>��>�h6l	5�Ґ���
�pH��F�.���~,�I4Xu�VP���+��=�����g x�w�����	(�r_t�p�I��X	UaU�aO�4��E��#7�/�a_�V�rA�1��(��
��.��2U��E6d_�-�s8�����;<�/\��B�L��L���w-&��C3
�"��&22m)bQ�D�9p�f�%�i�f�u.+�,h�t?(;��]�Qve�T�w]Y5w�}W8�{�wuh�~��
x����Gv%7yhyI�I�W/�q��B3<��m�g-�4zHjG�>�j+؂0X���2�d�el_�3"�;~�2%��(m(s�B��"�5NW2����&\�)&�&G�[��R0�*�#3�#M��#�F�*#�^�%��K�-N�:�HV�N5wtX�؇xx���wǣ=x�y�HUPy�҈�aCctt�f�:�7(�|���V��M�6=��r�@��X���X"���d�g�+r�4BX8����C��e�f,�Y���n+�mb�֨)�X$١5X#ʒ5؂[Ͳ3RB��1�U�20VG�eG:5,�'�De#ZW��f�W�Q�;�!2 (2pXm�'(�cy���&����>�>FvVGiMSF.�c8\��sC���|�"\�P��0\P�(S�t��9�1�zIV\3�Z�tM2���hҋ╆#"KXTi�T���ڡ5���,�䥒*�*J�XYCߒJ�~�$�C�Q��D��1}�T-=X4Hr i�w����I�PTb-�8f>�fNBF[K�P�4-x��{)e�吠��~�/^��ϷMq��+��qU��Y1�J�Z�Bfd�8���wF*�f+��j��1��Ԓ���-�L�)*�a2奡��ָl%uC-G5�L�(�X�Gr �Y�K�2lf]�nk�'�D��):׹��vz��쉤G�:�BGDr u3>yyM�4��1��_jx��{I����`�����U��nڟk����z�ɊL��.���T74[��n��.y�!i�WW�l*Ke&��.S��R��Gs8�(t�6S5Tb�tX�m�Cu�(~����q:��O�!�I�^:�4�BdE{�����:�6�4t.�!���OU�i��r��G�� ��
�Ѧ[�j���ј��[`۪�j{�1yɱ�x:��ٛ�6]ԤWg�/�)��G�2-�2敤2j�4i�p22n�2�ׯш�G�^�Ua��Bэ:�]a�fI�GU���T۪U��{���K��:�c7 �i�ɲE�X��8��p��Q�F�$I���D�
!j�
1���Z ��8��E���H�jJ���ۺ$2���+ ʭ�)sx����:=�"�a$��EX��&J�XC� #2R�6A*����X�Gʫ\2�#TFd��!*�҅��D�����ǁ�j#"+/��3�$=�U9�6K��yC�6��f���@�ي��
���[0��Q5�n�U�Vh��A*���PUwU���*�h2�rzPP���r��FP�l��"���:�E;X�����)~R��j� �t[$�F�%���#G�3r�(�;��Fb:Sr��=;��-*[C/bv�SF��W�.�`꾴�=���6;��(���䚭���z�J+S'�mZ��P���:����V��m�#uJ�y���{��*>��;/Z�C�;�#s�B�
2b���%r#��I#��y%׫C������b+m_�����X��H9�s%{:s$�ٮ�+��;�e�� 8�4�ƪ����8����
h��Խ1�ֈ�z�i�2#<�N�2N������l:$:Ǩ�b&f�A�c����V�-{Z/~*����~�پ]"b��ʌ�B~�^>2�M�6�̍�{�dK�d[<$�˺Z��:a�#���H�6�Ü4F�S��c���ڔ�|6y����驆s|��ǁ����L�2Ȝ��Y��82�x��Ƚ-�.��� ���ȷ���R�[�e(n�nUu�=�C�[����1��˾�C*X��R���S�d�,��/�dƼ��� ��L�����!(�l�6d,�ʠ�	͚{�Q:=wE�o�H��ziѳ�� D )y�2���������I҃p���B, ���l��fղ���2&,�0q>0��8K�Qu�c�D�,�-�N�<j�L�Ol6������������E\��)�Z4^�}��\�n\�?���	G�5����-˶��D�f���[�꒯�&\����2�� �!���V�ȋ�����U��V|۳m��|ɂju��*s>��>9I���;L��qk��3�'Q�yVj,��="���~#$��\�%��S]~���R��}�탻|��H:��ၝ��;0�����G�Dǘ;��Hʶ�W����g�ʛs�Ǖы���ض��`����NG®}���}Ȉ��`��*�lT��XY7�"D$AML=�mҝ�+T˹!b����]$�M=�؍
��=u�t����nm")�LN����z�C����J9ߊW��	�;���$������A��Һ�	V`U)���)[�_	�Jxձ���]���"�#.»[�Ն|�*��'��ī�ܬ��4��I��@u@��э�;F��|����\�ߗx�G��#�!�j�V��EE��8B�̄�
�i(��B#C�ל!MM�?�,;����6��
U;��yU"�2}�d��Ȯ
eT%�V��Y=�\Ɋ�ớۄ^�����ɫA�aa��������1I�Z�dIm�EI�3���&�K�(�$m2c%����n��[~���R�������ރ�1��1x~�8_ؐ�}�lM��4�~J�pUu �!wA�@J����`�&����t�]��]�U�^���Z�2U�Q+y���+��.��{��Q������W�A�
�^2�Z�d��M�[�C3�%��!]�"��Q_�ع��KT�-�Z��-�DI~����hWE4�����-������� W������>dÃ�^��R)�UY�����A���nᰍ�N��PDS�-�������U?��.H��� J�Y_����Q8P5]P��c��y׸������������M>�F��:�ܻ�:��_��3�ޯy_%�ƚ� qO�@��

�qϠB����"n2r\�"C�+]�u��
�|\�������|(Mʸ�bEL{2�ճg������Ta/�P+T� qT�ңC�&M�T�ң�TX�zuE+��~����e��WП�jٲ]W�\@u��ő#o����X�`�w��C�ؠb�
�V��Ĕ�xY�b���YT4�ϠM���z��ԭU;��8�|�I0�Lޫ���[8f��.f��7[��OFX��	"��0;���7L���È]y����z���浸����U��2dX+$ê4��+��)���2
*��BjA4
�U��+@>���2�C��#�->$�ö�z�.����@���0g���{hñ�� ����$�Ͳo�L��b,I%qk�9׼c�5ּ�:��18�$n8�[�2ߜ��J�l��6��������,L0�;��H���(������֋�*��(����(�O�A�M����B��[�+�*�CO9,+ߊ�
��P�	Ö^�ȣW9�0�I���[["�C_;��CUt����dkd�Y�� 1��Q��h�VI���N:|X�-���U�\mcSJդUl��(\xcs�'�3��uwۭ����.K�bS�����Œ�ΠC�ԇk�b/P�dց�$mϢH;~o��=�e�"��rh��`eIזb�j�f�fV�#�/��$ 7,���/���]w-���J₋.p��W�@�f����B��SlYg������rH��������̲��mŪ�]9�]X\t;뭴�p7�4i����V+�_��\�'�K���C��oc,�}�Y!�R�BO�I�!=�Og�u�_�����C=��i'��@��w�E��w��������}G~w�L>��ˁl믯Q}fĮ�{}��#}��������|��w�|�,I���א��u>�}K��7_��G���RIkI�vN�?�Х�#A�h�|�à���Zp|ڣ�AnЁ��G�3����$�x�HD72t#Ir�2�=-v��I.  -WG���rE*��$p5!	�8E*V��$��B���^�Y�#,խm�RG��� '<�coj�D'~ƉNZ�r�f���}���8HBҐ�Dd"�HF6ґD�)H�-򂗔d%��JV���G r@�2��:%�d@�I�b��M	����#�V���syŚ�+&��@���0>�1`jh�ȓ�q���3��j��\9�͐z�2bӚfdLX��Gr.�F)�
ҙ������b�ùc^�fyd>��O~�S���'"5PIr�=h@;������Q���d$�eN2E�� $�G;�Fi�s�$u�15��y�iaǙ�B�y�`��8Т&p�
��I�l�ix#�r��4��'h�ӾEƚ�4G�ְ�UHG�i��ӞZ��]��8��Nt����y�gr/y�M����L��O�ҕ��$�B3�AN�����$C:��=4��h�s^�8�&5�D\i$�f�$��ԨFgbUi�o�8�V�@͝r%H&-�ĩ!�aF_��[m꘮6f�Z��=����d֙���G&�U(�6�Ūm��E>�5,��K0�6mV�Wu\�DhB��֦,u�K���%qi'�9�p�X�Lנ ��{�߾���l~=HX�
�|��D�0�l17��Z����Ѥ�D�@X
�يG��f�c[�f
ZDZ\j6�8�D�W��6-ӿ>~ě8�0G��\�e��[p��{9��Mo�j����Mp��sdXvZc&����'��-I9�pq��M��Gǭ�a>l�K�9�j�����������xbq�C�<�������������M��V�1|aE˶8$FL����g��l+�7�EI+�f�M�y�]�b���Ac��UFm���~�wl�mbZma��uŹ���6=���<�3A'r��Ēl�0y��љ�wM�k5�[����Z+X�������7pWf�r�(b��$im��ڪS����Śs��N�܊�`�)�#�L�B�b[��=�8�*T���7���q�yc+Ё�����kBG��F[���b�׶I��TN��%�����\e2:�n�	��sak^7�K8�\���I$#���%�{Y��!�SMʯ% ^^)BrkE�ʪ>�15k�j������a��6�\��d���vz��ml�_~�g7���f�w}�������a��6�쏧g8�Nd<�"��,��)���G�RW�r0:1$!09=BXpJy��f�*�MB�㔂Т��b��/��l5�ʕ�t��1�ߜ󁧵ss�U>��47w3f�K{�Y���c��⊏n<c����a1�h�����!��/�E_:�|�~�	D������	��(�¨�Ҩ��7��:�A��곾 3>Ę+������*9�a:(�(A�`o���9����Ԉr1��=&���=����Y�m�=��ư���Tۜ�J"}��|�����/���i�j�2+��3��A�z����*��R�Ӄ%�-�8j����/L.�>�C��-#�����C�)��C��(�	�h�*�k�4Ʋ��+�3�7J��  FD�g��8BD��2C�i�BM�BL��L�7�`�o!E֫�Q4E���6���`6�	�����	�6�;�k:�� +�o
4z
E���:��W�:��1�41��m�.�Z���5"�2�/����)����C���+5hɸ9)Es+�0� [�Y�8y�A\ ��E̬4�<��
$�}`�0�#+""z�"��	� )<<���Cz��zx�0� �pl�sA֣�dLF�L�8�P�dTE���QV�3����	�[l�h{���*��DUò��I+ٜ�T�zr��Y�9Ӈ}X�j�ԒF�*��;#��;�벰Լ슻;K�b���i[�.���@����-={-�*��@
<����.1���;�`���C�(�d�)���G�$"����l��d��������銍���H�4MU|I�KEaA�'S6ٓ�� ��:hC:������4��$�9	�������t7"��f܇g��
C/-{29�L9�����>�<-%� ���1sC�69�qR��svԩ	��� ��C+���>��)~K�ȥ\r�ָ���h��9����)���"��uЊ<��	�P5� �G��z8���Q�P=�e=�$��Y4��M��D����9� �2��H��4�w�7�l�$���U���R����-�4�?3�ζ[9� �טOc�\c���'!���)	�>[�IG َ�܍\2�ɼ
�`�˰���{����?�4��=�2-��P�(£P�P��#5��A���4�3�QU]�]�SM�ڲ٠�<��I�c���<񴓖b�ࣗn9��x���Ր\��kR�z�(e�nS���B!C8�́����A�ti8�Z8�C�'�D9tz��:Sᨩ,ʎ���6��S�B
����	4e�%�B*�?I�	�H{(Q�P�T$Ӟ{PQRE��;*"��Z���=�ř�Z#�N%}����L+jͷ[u@�\;�)�P:V�1�O�������ϰ֜=�z	�`��Y�̨̊&��ٞ�2�4l	L}3��b�Ȥ�ԨWZ��N�w���"3o5
�Jk�T��4 (T�-T��	���]�r=o���!��N��X���LK)Ȁ)�������[�K�n�QwL"�\�0���+���5��%�2��j��c��@��m��j�<�h�����e*��ۀ��^r�R�Am;1)'��1�S�he1��4z�3Z��*҉�	�}^�U�����Ϝ�23�����f���s�TkB\ے��V��ధ��
������y�(<��*P�8�y��ʭ܋����l��-)1%�ZR
�E��x���~�#;%��`h2t�,��{�?i�[�S��T�8��%��m8��,а�ë�ܱ<ډ�8/��XQ�|^�U�}_���a�<vˏ�1|�������$�Y㖘�:�%	���!c�վ)m� `fiZ��V�6�Fm�HZ�`�F]�}";Ȣ]�r�#����YZ�"��x6����F����h=*�	��D�Z����Xp����@ۍ|b`��)^eA�A1��X`w얿�7�H_�ђA�9�+�-f��܇��}P�*P� V�0��-�fh�-PfO��Y�Q�-��B�b#>iv*di�'���q6�#n9*��b���;r)y�	ӂ)��D�8����W�HKՇ�<�CMS<Z,*Zۛ�`��1*6�|��2�5oeݹ�C+��F|k�p����\a����P
�C33v�af�~�<�fg��3-���h��lU���)��:;z�@u���Y����D�<��=Y�@+aR&GU,��V3�i�>:��1�-��������C":<��û�~_�=�m���	/���*X]ׅ��8� ���D#�e������VA���]�X �-�fR�j~f+����@���^뤈�����
�����f���I��{���3&y/�Z�/��w��.d�2dA���V�)��{�N.I�,)��TN�dJ�~g�n��#�d�`1�S�%A����l�o����0Z����W���h�=��q�������@�Y�]Q�`�s��H�M����e��p8��l
�����K�pL�%���T�W[o| �Sdluk��ܺ�.yb�^C�A��b����V���2�����ud��6���zKjwJsT9��V�1o$F�~��s!�H_w�Y\ii��y8p�A �jF�j���Uԥp�`��?��b&�8@
�}���0�{��
V�208-i��K�݂�����V��p���9�q��(o0�Z]sNڠ���"�{Ba��%6u�67����ON�_�ۛL[��Ж,��m�H���/�����;�v84牤`�.�-4��ը�}D���Vm�����ն%;�`[�Zm� �y:w�k�o{]�b����Ȼn���4��Z׍9�,֍uϣ�
�������{�"G�V�����]@��U�\�l�be}@�r5s]�g��(�
o>v~���
Va4^�{�
���m�6g6��pH�Fmn�sﺷ�f�6�vW���ճ�eΑ�n ��Z�3��o}jO�z~�o�*Vg�خtd�Ո,��,��6i����U}�x`~G���^�����&"yu�`uBn5��Bn0�f8�l]���q8���
҈s��y�j���d:��@�Xv/z'�V�n���M�xW��(Fw#�U�un�g���z������S��.���2e�8*��z���&a�"ތ�c#@m���&�^�{d��s<�c�.��}�0���\pdD�"��-b�g��o�զ�	���|���� {*T� �B��*V.ėp�B@'R�8�!>��dd���B��ˈ�ʓ(W�,Y�˘1c��Cf̚6]�[�2%K�2Q�(j�gO��FU,U��iQ�Q�&E�hU�H��$���U�a�2M�T�ԩ]������'@��{��V|2����U�J�+�+��=�'U�ض/F�@�dI|X�r�*Wث��)Ӄ���z���{�,80��زcl͚�k���((P���V��C�!�p���9t����JȆ�9j��%b�%o
uI~&ϵ+ç�����*Ϛ��9�����~�j�4���[���~����u�]\IUUI���_?&X��q�ab�c�7����>���P�� r�=�(U��L�x��u��S��6	��POp�ٖpMt�jO����$ܓ�B�Xq�rV gEta�9��]h�H����qW�F&_�D�v�Q�I�'����^��wVWgA��V�5\���M��Vj+�E`�?�u].�����t��_�q�Ux �Db28��>��3Os�uVO�8�s��=�p ��i�@����k�5k@g*@+�@���l�1���M)[GZ��]��O骛.뺫n�d��in��+�s%UQ�F�>�/u��TO@��a�6���U�9�0��	$L{]�R�'����uy�c~|��UV���~��']r�`�+�Z��z�t������/�	�#���E��\���f�G_������4R+\=H*짟�R��ZkM�߾�V��D`���]Q������9�}w2���I_an��>��%�=��[��U�75�����p�eޯ�meXh�)2�.���km�!>�3L"Yq�H��!������5�S">(�3������#���1zi���VT�HZ�#��U���C:%����qZ�{���~���~��K����.9�`7���C��w��ć'91���8�i�O���"6��U.?��X�f��4T�q��<Ʊ:a*.s���J*�5�b9�݇D�!ޅ(D4D�>��D "�Z���`T^�¹̦Dr��Li9R]/k��ސ��-�m1Y�R�S�@pAZ��¾5���k|��G����~�#-"�7�-n:���Ch����0�yU�%��(�?�c�Y�;RY�L J��DB�tJ0�:]ɐR���#"�S��Ԫ����C�Cn��n��[sпZ�Mo8p@@�
P�ȁ1�1*'��K�cH�sD���
'	���/f5�z�=�P�)�yJ������FA�A:�N��o}8��p@�<����� �(�}T_$᣾n�����<�N~�:�f-i�J�;
Hg���6;Sʈ7��)}Ƴ�,F1
��>b�D�8�n�ԛ�r�K�	s�C���� �2���[/q�K�`!�k���&�v�s�/:csȘ�k�f*�jU�e/.��
m��Tc/�ʈ���B��)W{Ә�D'��O����~S5bAn��(![ْ��Q��|d�ѓ6,s�h)EbD�T����]Dw2R^��+�^XH�|Ԇ�m(>��
F]���|�̟"��8M*Q��K�������q��S󘿽U�*]��U��E�Ѽ�Nv���P��[ӊ����]P���yO`�
�z�A:���y浯���^�K���uL�)�IH�@J�d��e;���Ġ
�)h#̸���9
u0j*�q!eIf5������uR	MT�HO�$䡉 bمCp��6&7���Gt��pD��cGxC�=�7��s�:��a�yL��V�r���-s����WQ
@<�	z8s>�9T	N���,�8#at(E H�@|�π(�J��R�B��ǡ��E:фf?XAh}xb�tȃ���:�AP�å���9��y��4>�l�4��g�C �V�����?r��]�׾�5�-�a���>6����e3���~�����fK{���u��-�`s{�ݾ��y-�}�C�BV�ou����7]I��1)Dx��k����ݪjlaF�	  ����8	pT�.�e�݊3�S<�t�G4��)l%Бǳ�qB�+�C�R��|���.9�c�r�˼�6�������<��́^+���C��ы�t�3}�Gg9ԋ�r�n?p օ�7c�b��tWR���Pu�S�%<���I�pK=<>S�U�83E�}��9�`:W����ˠak�X�J�
��v�w�F%�8�J ;���AU��B|.�ѓ���?}̍>���<�/W��c���+�� ������O��>B{�+���m@�Qo ���3�O��^bB��v02�YCY��OB�
Pи�"�=���%�I�?����ؾJ� �;D�K�KB�@�T��Ç�!G��@P��H衞. ����>��%]͹^�Q���֞>�ե�ǃ0����=	
2_����	v��|T bߊ������`����	�a��D���$�rxDN8�G�Y\�iG�l	ڜO���Z��P^Qh��,H&��6��!���E�ӱ!r��]�J��a�>�����A_����i����y!2!U�m��`���\��DvH�`ɿ�vx_%&!�i�ǅ������À�V��Ia��,\����J>T�B��f����Ŀ��MR�V���ýVjuH��������^,���!5r`b�>��A�)*�Nɡ�N�)���(^��M�ş���X"&.�&��=nbu�ߚp�>���,�8ܱb��.��� �	��b/�".6�b���Ty���K1�8��#�}
�$1`��=�V`��#��B�0�4ʜ3Z��^�U�f#P�y`����J��yL�@R}��U�9�����a�HR+QdH`�r�^?N�D&�F��bBp^R���p�(e\vXDn_�K�
:�(EM��FT�%b+}"��H�Dd T��%�i�uXb��*j��� � +�J�hRP�M�ݞ�^�E����Z#j�$6�&P���]�``FH��L��Q>E^�c�%I�xKtRg��`�QF�%`ʎ��e	�eW(�(�_�x�"z�L֙,�?$u�.��Gj�v�����N�Pd%�":�˅�d��-��vʧt�d��d&�Q�5��p"�_�CHT�M�ӡ&O����j`;	�>�fdL�J="ʐ��D�(F��R���}�RV�s�$�E�I$d@
�GN\���aE�<刬ᖔ%�]�-��d�N���3]t�J!�zR'�@.�{iB��G��IYFy�^��C���
vI�L�e�6��&�%I��<���8�zR/2hPB�n�>�
q���ȐK��K�d��Ԉ�%���F��pޟ)B$�-� �D� W8�����h&�%���*��~ff�tJ&i� e���2&Ed'�g�ʎ�僘�R%�iIY����1�fa)CD��W�}���eWi��
��"ҩ�aI�BP�P��
�a>��>��
FX(�b(N⼄���fk��j�Pprң։]0Ȗ�i����Qi�@�ex��c)ǐ>��:)�6�������G
��(c	]�2v�PrT�n�|�3V�H����F�.0+�|���,���T�"�Ri�Fl@�c���l�a	�Q����`��j�b,zB\��]`��k����*
%�Q�tv���A]�L�)^�Ѝ�(u�?�'�z�-�DM~jr�Y�:�z��E�*�,Hdv�|Ǫ�-�X�X���C��C���̈́�^�wI�ʽ��,~��W���_hv� -.�K@h�ZAL]m�Tf��y0�`Vf�������P�H8&ux��-n��^B�)2���l�k�T�&��a��Fy���`�g�Zd���|"�b�mI�'�ɪ�Qn|��x��2�h.l.�(+�l�f�,��l�0s8��[������Ji�ܟ���fy�-X�a>��@�`}��	�~f�Ff-#*�˨(���C�rt	�&aX�С�R�
\o��"T~P<���oܢ説�)����LD��{,�P�uFn��[Z"�ƥGe��)�E�� �.>�/c��i�P0D0Cl)C�X��G@�'�h�zDw��C�ጬ|`0�i���b"� 2+����0�p�V숤ף�b��&�|�H ��a̬LJԎ�����S�(g�C��r�t,[����]��"�B.3\C�ˬ�����$rrFf��'~�n�
�%��^�=������o���k)qA�"�8����.I���G��임����>�S�A-�YA ���ypAup@� �nL�p�],מ�qTU9ۣ%~���D�%��'��	$s:e�N]�/�H_O�߈䡃���2,� �@V��ޢ.k1�"n��E����9��Rcd�2k�n.�V���/Sk=34DQ.�n���9�9/QH�����c�IFuN����N(G�v ��C �C��N�wpI+�i�N,���E��}�l.Zᮢ&Jt|Z2}J䳮����*�Jմ]d�r��r=���H�PQKw6�g$�	�.c�z����/ε�d��j��&��,�2nC��>33�ofaiH�3��-�qV#�Vgj7�dI�L4YG�\��PR�s��qK\@s���Ǧ�*i/�__�_�C���[�_��wbjz#/Hzr�2 �
��d��+w�)�G���> B�hcg�&�6h_Q�۲M�vYO�1w�mD�By�q[LknQs.S�����2�o�i��YZq���u�s��[d]_\L@��Fm���<jlO�c}pK W��:D0�u��Y��_Z!a_�C|gHP9{s�_��׮D-�C,�ոr�Y�Jk�g�ʑ��=x�*����w����tV.���y��ma.�Fz�A$�C�5�DS�^�n��qn�8l��� 8/�}	�3�C�8��l��[0���XB�_� �킰��3�2��//��8�V� M�Ԫw���y��^���[9_۟J1
Q���ɠ�N-�C뤹@TVn���6�=��+J�{�H�׃�9���rJ	L:�'����K���ģS���X��6�c3�.�3;3G��CS ���5����o˳jǇfY$l���o��3>%vC�����",��.�T���d�b�7�?��34~{|����w�V�ǆh�6НdeK���(��bQVF��g�����7�����9>P�f�9wF+� ~�өg[3'F�}`s�'kn�T�&|7�p�x�W�q#�����F�[+��p�2ߌ�j�Ɨ��S7�ǚA�3ɧ�!�q{+���b¼� �uvɚ�|��_�S2`���ķ$�g�x
	�Ȟ﹍�̩�'��ӏ����J#	�?��\�O�������gD8�d�4�]s�8@��m��P�6fmz_�1�"�C�u���:����.~��5�ޫ�>��f���:4�	�y�4)&K��Z5@�X�7��*P
L���A|6|1�D�>,X�`A��2�+		⻗���.U�si��J�W�̩��
�={��)�ޓ�7W�j�S$��<�S�Q�I�ZѷU������Gbl�z ЦU��- �\��G�X|+p�7��|o��;�v-S�MW�����z�ۅ�2�Ÿ���f̘c��ZFh|2N��qr�冫[sim�d�\l��}�/I�'���XG��,�'h%�͓�7��s�r|1V�=�}���۷ʊ�<M~,x��ߣl?�$���{���~������<��{N���Jʾ�8���b��)�x*A�����7L�	WJ�'{  �D��������K���b�D�h�Q  �F���K�{h4���+2�3  �drI$#cR����"�d�l�-Q�ҲӼ,h��j�m�ܬ8S��|��4��3��R�);���ό���&���:�����yƊ��3����s� ��#�L�X�<2͍>�E)�Pm����*�àD�����|p��T(�0V]����W����V�JK*��
�%թ<��u�i�]���4v�!��'�%�t���!w\&!��t#Kw�w���/־t-�1�|5M}w�m��,p���4V:5Z�L�У�aB��<@V�@ң
G!��L∿KZ(ԍ�N����ɥ�R�ӆ�y���]U��GamNŗy�q-�,�WY��WaWU:Gy���W�U�a)��:�,������������{Н�nv�v���(}dn |[�W�|���߿P�5N�ϹO?6yᬠ˙��/��q��G��dy6.��5=�J�����١�+dg
W�h�=�e�}IxUk�����U_?E��X���]t��[��ĳ��p����0���F1�-��E���+z�wl��	��2�rͽ��(�t��w�>}t	:�9Iq�t&�h�6���H���HN"�9U�:�H�Gsxz�2�0�<,3�	I�1�Ѝ�t-4��NÑ�&=0�P�`v;�o�:����z8<�	QkC��gD��*.���f�(j?{�XpD�%�h!��4d5ca�h�����<�L�wb����­�p���a�b�u�&�K^}R� 	@x�M5o\KůW���� ~�0��g�S)�@8"���uy*�%A��X�=~!��!:ҹ�����6���=�9)���貇�c�4!�%P��
�wD����EX�yD�`DdQ	^B٧��k)j^���ů�D��4烔�!.KPz��i-MQ�L� �s�o/?�A>΅�v��G�\N�d`���>�a���t�B҃9U�fE�5b�N/�j؈Am�`6юoT�i��-ee!ղڔ�!��w�;��43�T�2�)�F%BB-�P�7�J3y%x�S3��,��et�
��e���p�<�%'��Eq��`Bn�����U.�ɕ\�W������� ��_K��C����$W�<�T�[5c!�J�d� �	G��6�4�s�gY	�2�h+kZ��Q���e�����FL����z�3aMܢH�B��2�\�MuO�jLRE�BX7�TR��J걐�d�&�*�`��2�a��M2��o��� 8F��c� B��&`hR�}i��02%5��0	3Ⱦ(%�;�s�c9څtV�;'> �T�gU �]
C���<)0�`K���� ޡ֞�ۙ��C�lcRD@5�1Nc���Ԥ�"�jU�� �U@��c�0�&�ep���4b��Ȭ|����$3;�Q���p���3g���GP���v� C�v�aH
���4���I��җufks"L�����1����c�UO��\��:٥���wF$�oY|c�(Qƥ�m�7�cڪZ�x�e�x��r�&'��d�`5ɾ53x�5etf;�}�F�ILby�(;�\��JX@��W?��n}����_"ig���Ɏwa��n[E߿�գE7�8���pV<��0  �.�A߀跢αF��cKXY���jh��tm�*��1UYC-�o���۪��-^�f�g���8*8��!�Ǡ���>Y�������h��P��6yfM(/w���lf���}N�=����i� ����d�2�N�l0��~٩���9i��Tz�U�`1���}��6���p@�h�$~L���]YQM�c2[��d���-�^�a�8,S�-q���;�+���/��W=T����l���غ+�����8�@���P`�s��E��$c���+������%�M�E��Z��u�����f�M�jyrҐLx����������>���9��\S:w���bfy�Z��_�n���d�*_��\�)��~��g�m{F�|o�Ɖfxcp�C�^�gnG��hx�B8bN%����F�p')��}�Όf�:H놯:n��`
������,��l���rЪ���H0��A��!<�A�-��.�`��
8������ ��0)SX��@����o�OfN-�ċ��)�j��i�h�.��'E f�؃�hg����&n��$��*#��
,�I/j�U��f($c��'�"1 U���"K�p�jw�9���a<h9��������M	U����o��АP	��	�P����V�Epig����X쩒E���f�p�8��F�Rkv�g���#��ܬ�Rf?�q�B~�0����hk�!�k~��w%�A-7ң��'�
�x'���f���ϧ	� !T!�����-����"����	��j�1�tb�z������`"�8��K��v��Fpa�j�P��4$DL�(8dWB��N�� 7��z$.�V�'��"��|hbk�A�h[�B�k�t��n���r���,9p��R"�zҧ~��8��3i��-M�m\	�!��ރ#�n_jc5<�t�Ѭ�d� p����l�O�İ{>�k���j�CO��p�2ir(+(�=�vFb�<e9��+�皢& �=p6U�|������H0� �a|�Ȍ�>\�!���p�����*��J2 �.ܘ� ���f�G��cZ� ͕T�;��!������8F#]�$�3epc����,P �*�險�����0��p�fk�4'�<���A d#�q"�.�l:��nM��C�,�E"4�B����(b*Xt/�h	"��+�hA11-� �B����+�e���c/� /��"}�"�	#L?"8oK��/0�c�����"h
eh��mc,���D�YT�E��*���ԉ+�⤱�¶��:0�E��(Le����tC}S��3y�#*��T� $$kBn�R:�9K2y�k:��(Є��sx.�%ʩ��1�|O�:�/�PuB�E
"/rG{�Ҕ0$��	�e�������o%zT� �I�@H��t�3'��{'�Kʂ&f�lL��?y��Vl����l�k��8��h�q
�r�����1��YE�J���TSyS\/�MY�C71	K�%���UK�P�0X��ح'�fH<LU�4$,���2U1$bV������&i�%�йj�VAvW!�b7�S#M��¯<ؓL�g>�ȸ��f�Y�3M��@���8�lNbM��eެ9�ЬfP'�1C	�Jz#�ަ@�p�i>��fM3e҃��Ӊ'�r�m�m9 VE{(Vw0t����6"a���R#b�.�qd�Wo$dk�dCV�b�d!�ɨ!Ԥ<��e
RDW�.ƪQ�,�^�)��/C��4��*ϊV��-�.U�&�A�s�)��hW� *R��|5a��f5R/eR�I�wSŲP7�f=�M��S[+�E5�m�A	/r;g�n���J�{i���c�7B��V�Jp�g��*�&x�c��L��Z�e�D,7D�)��a4u�u�5&�MPؐ%s"mG)% ��hG��13�p�9�k�S�q�AL�RϰM�LVz�7����c�s��xA�Mn��bMo�亷LC�"|W�n���	q冀�`�l�&���od.~�l����M~�j}��K�YU�&[+PR�4�:2��8e�U�Ҵ9 x���u�0�Ltx+��{&�P��k��k��`$Hg��Բ`Q$����l�J�-MFwH��:��.�h�;.Ş)�D��V-p����0jԈt�coRc����[&✢{U��uY�d�У�L��:�XuAh�f*t�x���6sk-���h�RK�Y���	+7����E�R�x�im�o	��52����=q%"���P϶�'�n��PdƘ�＇��PȠ5�$��V�"p��&�T��ʘl9*��y>d�r��S݉��u �8��>�6�Hɚ+�Y��2�D�_'xxg����>�U1��r�	�͉Aa��, ��o��?�t�s���:��P��/�Y������P1!p�~B�.�s()p%h�����86�;�
�آ�
~��)��_w�Y,#͗�՘��4l;8�3rb�کs@3�]t����$ئM�Re?����FDH4�8�_���GL��t!����[C�m'�Ϩb�1Y+�!�@�uyK�B����ƀ���x���'"�w��W�̹8�Պ�|o$��7S"Y�d�$�x\Wb�B:�pBK�[i'�I�&�[��j��5��ʠw���i󈧦q���3ը��􄢞M���h�V�FB�0YV�p�P������P����8k�L���c����8���o�)ꯖ�:�U@��>�fX"&)�qpuI������y�T�����
c�>����%��>m�sC����y��1��w�s{���N��%|��h%Y%�9d�fa�"�AT�l�Z��,/���j��U��[Y θ=|���A6%պ�M�=�L�Rڃ���f}�dD
���m�/��I	�Fz���0�V��۲�ȃk���'sY�G���՗��yƽ�[O�����K35� ���xS��<e�dab�F��І���\��!��#h�CF<�+�ϟ۔G�u|�D��m9Blc7��A�Le�d
	�$��m�L0��Z�u�sL���)��t���8�i�u�g�E�+D^�Z�4���y��A�r[nŤ���[�]z�*S˩c�s����wc�m;��!8&=��3��'A�h�k�C����|���A<�u���ps���9��}!*��d�'�qD�k	�w�C�y��	��뚈�i���	]=����nORWv�x~ƚ��}9��g6��7 ;"�P坁}FOx��hp`��2���4r/7�{4cẅ`�A�ÁBc�ڸ��ڍ���:�����^���U�����0g<�*HT��@2��c�ix��>�~}�&��l`퓲�h��IM�r�t��Qs�����ɗ�����fi^ݼ$�Px:=>�4sj��C���!¶`#-�G��.�����x��o�s�����
�*�<h0������J+'N�(�ƍ;z���
>���(R"ő#Q��x�%�{4kڼg2��:M��o�͛+�8zOhRG�2e*ԤH�>�6z+T�X�B]�(M�5�&-K֬ثL�ve�T�ٱt��=;'�'H�:�*��V=��f^ĉ�.��X�o�����o�E�����繊�z��;]ﴽ�H�6�k�=KTv!	{$z���[�HС����1" �('��=���.)�L�r��*2/���O�9�\Ѱ`�^�����e`�n߾��UXW!�l�5�[���_��F�]�M����uW��4�`��^z���؅3����T�>�E��g��cEA��vk}e!bPѦB=��F�n�f#r��d�Kw���6��ݓ��q��]���ZnGf���e����SI%��w/�GgdC��_�EwZ[�S~��aOS��#}<j5�=��'W_1jm�e��7YeY*dQ���}��$CJ"��cv^��L1�xg�#^(C7,�O>�H��j~	�_V$��S�	8�$�JF;$���F��eۜ@#���tz|�&�i��E��kf�iz���T�9�In�y5�z�MK�Ipk��zߠ	?�V`����L<X`�rQ|i��.����eW�5=�^��ë�$�M���b� �������
]`�D+��c�[M|XnDv��lDb���`�pEV[���99��K���ѥJqQ��f����h�6�f����f�1�Dx浤�~$�<�|[�R��h��!��~�M��{i��V�Nn0�KXW���ea^$X�P�
�T�l⭑��4�tO�]��O˪�SZ��H�ZIK�	��sC2�5�U�I�B��m�V�ȥ��q�uu�Y�9ȭ��9���lw�v�g��g_��QI,���>QgO�-���e,q
+ ����*u�a]�B�b�eh�q��>5�Y(t�BY��8�ov!��	ou�,f�`Q��/qAn3��JBE" �RMᝍz��<%!҃�֞Ĵ�q�JQ�N�.M�;b�2rE�y�:d;��fо0��iꢯ��|L�^TYO~r�?<=E��Z����	������d)p��R]�$����fP���� Š�%ft�Ԝ�
%��D��:�&U�X!�2��G+�%7/�~���+i��
�w7�S���>�FFd��2$`�jK#F�7�)Z�k��3aEhbQ�WĢv�h�t�}8��Şp�oT�#zHH��D ��0��C��:K�9���뜭JėHV�~�J������U ��b|�QZ��x�.
�x��3W�_F�7C��PbW)MRz��Ҍ� @c�Q^�$�-I�Ĝ�m��ÇXAӡ���g
�{B�f4��-��m 
c��	�_��������-�|g���YP-",�� �H�s��g ��>J��lA����&t�2�I�V'�@P�d4[/��xQD���m��v4^]���Vp ��z`�Քg�b.m6�X$�̰�lV�k��Z�ը�T*H�����$�gL
y��-o�9V�7K�-l����]�!�<r[�R.ǹ�}�bp�I�lu2�ޣ0��.Eb�BOr�f��dc�r"�]����0��|���gl�%�Z�
���cǖ�x%%��9Ȟ�9�&�G�
i��Z�I"ክ�_˅�B�G��5�j�M�v�a�J���ԩ_|��6I�q�Xr~"]�:����DU*�c��]Hrj�Cᠭ,$ց��U�2�zݳޅ��t�N�!�2�m���/S����@8��(��� �2Шb�*.ix�|�΃�Z�
zx�m�
0l�)j�qg�P���ĲE*��bk$��Op�;�7��<3���!���Cp�PZ�]$cH)��w����%Y)]v�ue��V�׼�!��NMB��.Ǳ�f�!XA<"i>3��\�1��ps���� 
��8���k��t�^��A3�kD�>��,U�B�{��婞]y=0I��ޓ��b4#+����m �m
��h|���c?����@�J��s��j��C��1���Qbp�>g�Fu��H�!��:�p��yme"��V|u��ԫ���3,lE��E2�7�� �Ͷs����S�6��u��"`��HS;#W*�ܙI����v�z��&�ڴ�f�3���32���f�3�Pi۶��m��Vꫂ�o�g�`�+D�M&a�{}k�svlG���<n�5�Q}�@��C"y9�Q��P��'�''>������+3����q�o������m>����~�'ҀF��xF��S���>��c�a|U�}��3�����3\���   ���~@��?i�5[%f[��b��Ej�G�373c���{��\e�ö*l�V%���]4��C^��k+�B&�e�4+��l?|��0��m��u�F]Wf]}g6�@X|_�u��3n�7n1�Gw�}��JQ�a54g˔v��~~iG]#dS�1M�����wT$6[&�h�d�7�WH���+�IlT\�:#w/'�qJW�FOT"� H!B�8UfH���k�R��J�^-�I�k9�:1�`f7(�PQ���Њۀ�@F��P�d�d�jP���@��۰�H� ��8�ܐ���P�������d�@��� ��j���@@@�@0c��`�����Ȏ�8��(� �8�h�8�������h� �� ���(�	y����h���@��P����Fp@ F k FPY�Y�)��+���P.Y�0)�.I�/i�58��;ɓ=��Г@��BD�����U
J_H	f���pP���� ��P
O��`�P)6x� cI��_�`hyK����
��
��s��r�
���v��]�}i�`6����p�0�y;��";����	`6J� �S�Vi�d��3B����)��p�)��Y�Q)��G�b��-r��y6h�;�k_���c�e)���]p�_�0�i�,����Y�����I����i��f�����	��)����i��i�H>�J��n�F�$�P�-{��ٚ�i��韁i����6Z�
E;5�
J���+�w�O�
��z�j�ʡ����*�#J�%j�'��)��+ʢ-�/
�+��3
�5���8z���!J�6��4ʣ
���AQ�vB�6L8�.�.d�Qc�>u�|*�p `�S�w[
pU`<�$�ej�gz�$Pߥ�]r�(�&}c/pć���P}��{Zkz#a:1 t��������z�����ꨑ*��J��j��������ʩ���E��ʨ����j�����:�����骊���� X�0miS>�z6�&P�䶅j��i�D�J92Ac
 d��͊�$@)#�p�Aa�3z���(NޑMQ*�k
�aZ��!�J	!/����
��j ����@�����z��������گ�J��ڪ�Z��z���J��iQfFmQZ��vQo�f�פ��rSn�
�[hj�����)[���,{Yߥ:x�e�	H�ح��?V ����%0��*�:b�O @31�ʯO�Q+�S;� ��U˪��˵�ʨY˰�:���@� � �� k� �ök�8 /]��W�T_�+�`'3D���*���AQ�s��;9RK.��q\�7���8��sZ�����=QP�:=�'ᚧF�A�Y'3V�7A��˺�˯Nk��j��
[��_+����a[���wfo[fl�>`uf� eq#x�ͺ<'�W��\a�6�:B�G�����:���q�k��[����ʸ���D[�k:)�e�+A#����U�������|��Kc��ȶp�u['F��6�� �{�i��(������e%㦏b�#�2�q�y���
���2�ھ�j�\��i:���K�?���õ��L��<�}Q�:�q�aY~Ҵ,�S��Z����|�[������]`�k�evG�!)���d���� ����e"�]<�A����d��r-C�/Ŀ���y��~�9�D���Z�rr3�S>��S�6�{S�@̮A��Tʯ+�N�;�X��W��^��Z̰L��C2@n3 0DR=t<���m��p��8%�"NF�?�d�:z��'�AU������a�?� K+|�?u�ȃ�G��-�˭雾��Z�1G��kcGL0�K�~I�D�;��Zϡ����	<�쨵kŸk���ˁP�,�'��ƽ��ǳ�|㪸��7u�|�̘��q
�]�'��,������%���GƲ7�d/2�ad�/7��¹V@��J8͹A���D��@ltK6(��S\ʦ,��:զ�Z۵�ŏ	�	4��,��,�|<'�Ka��.<�i����[:ߥ����s���7��ޑ%bCv4Boa��{�	�8?@D(��2�J� P�Ѵ^|CB1�4��k�Zt�ؗ��U�0�l�f�z+@�]�:k�O���}�[\�	����Z��=�zZщ�-{�}G\��i}��m�:�w���l*��l�dA22Q�{��b��Mz��k�?�x��=�{�%N�	�A�6�<6YR�B�[��U:���BP�JǗ�l��]
��m��\ն���,�Y]�[���z,y���(�܊����A���R-�ͼ7G��s3:�}��M�B��0��&';������G1Ç����4.{&�6����]��
rO�t���~�Z>�:���]�'|"(����ƅc\����W�����X��^�a{���V��#��ͅm� ^����茻�<��'�@�=��Ձݎ�/�=t.#k�ȁ?^"*l�̿]2Ez���7�b�==�H�x#�`3r�bN�#��]����;�~��]"��x�e&w˥r p�.�?�*k^�W-�W��SM�`k�_�������1� I���A�}θ�j#�-,r��g-����'w�7���t�IV���������ѽ���͘my`�w��x��^l�ר���lR���4lk2�<�?r������I牊�V��&�
����W����p����]�.e��H�s*�\��7Rͺ-�ϋ�q����~�����ݪ6�5�71W�"�vZU/����4�A����=�}P���������r�����}�2^=��z}뚾�͖�j���A3e�e$���\�*��+���\�Z��2���z#Y�s�t�xt��;�{�Τ�I݅^��˽n.�2���&�e]��suA�*Q�W�������Q���9�z�įP I���������2�l�6�&}���������Rέ��r@���$6h����n���o��*�6�eΌ��%�G��+�&��R��{Bp�A���Y�cš��%BLxp����]��1�Å!��W%�ȏ?FL�r��*M�4	"G+�t�̧ЧO|@�$J�`P�E���$)��V���)$C��C��&L�W��Av��\$�T��-͒Mc��	jI�F��SaT�<�J�jaă�.6��qcȋ/���^ +�JD*��A�j$�"�iӦU�P]B�
{�_s�\����?���]7n�7�8��=���Ƶ{������ș��B�a�B��aì�V!��b��QS6]�ڻ�]J�fӯ���/��˨�#L�<���%��*"��(�,���
.�P���b����Ұ��l2	�*H�)&��J�����H9�bL,2'����pı��2�3�ȷ��1m��6Bm��X{�5؎<H�>󫶄�,�/���$;���#����**��b�Ί�fS9�R��:�v�o"�
Ԋ!+��>+?
��\��'�s�>���J=+H�R�k(���)�Њ�AK5UA�T�!�@m��N�iuR�PT���V�l��%k�G���CJE3�RH�T��(��LE�:��6-�rJаm������ȥ�OH�c�(��BT�C_�.;𞛗���S�ʷ`%4>�
ʔ^�@�̀�K�����;��=�?�-�$BT=NUAU�-�'��Z%��N=uf��Xة��N�a%�-De�Mm\#}��4����FU�k>l��[q�����5�\��;A�ز�]H9\*���������Q�d��;�(��  mk��8���S�=6�>����DKA�Of�#�^Q,��IZ0dQvhB��Zu-�������V���4*���j���b���`cu�����֧�|+3Z�Z$T���V����2k��}"�!�&w�k�ɹOr4q�݅���c����r�;p�_1a���쐄��`x%*g��O��V1 �d����|�
eRՄX���.ul�C��:�@%,�_g�?߮��mxB�
)JS&�(�8n�B���=`�˚��ĵ��K���F�]Q9���5GvJ)[W�s +H"y#Z�भ��/gh���8&��ikK�QΉ�>�L�Z��%�F�8Dd3KBf���Qt�`Yh�	E�U�;U&���D^rI�<	/L�Z˙H����m��R�;��(�qԲ�"�䈹L�������f!y�	�h�=�N�t����K�'V�D��v���z���u�.)��V�VxN�틀�k8=� 5�J)��'������t��H�Z��z�;��Ϯh��YA./��B�����0��G>� ��{�[^I��Ej�d��X��Xoo]3Ij�Eq���qt��N��$jᔙGۏM+��|�]T6!��L}o�K]�Ij-����F��9��S�Y��9��,���<fHΥJc��S��Pʡ����#��Ȝb�>*�O�p Kx,�:����@��3�bG�C��Av�|�sY]V�oi�\����4N�z��V����!U!����R��O����9��v�TCN%�4��)!��b0b:���,0KY�r���!��&x2AڤA�|�����&�ucM�"8v����	`Iy����2z�*�{ߦ�-gQ{�Q~H�
j���M��V��|�u��PT�3ў���Gv�f��I�iG�O�V�j#���jI��+��[�
ԭƅb�t	�(�>�čg^!�RzU��U�ea���z�	:���T�#M����%<[����KYy9��C=�@�r�B��>��X���-�eԂل	�j[�޶�̢���-�Ԟ�"ڣ��vrOjq���ylkHJ��!RME��Ύ��ԥ���1�Y��*P���D��
���{�*Ef���ݱ�BT�>�������`�{@q����U�[ج. M2���>�q_4;ֱ�U�H`���^z��o�@zN�>�Nw�i��!��K7B�z�;C��ˣi���ۛL�\o��H�V���<�m��g��]��j�΍�3�*�M��ܽ`��ki�~����d��LKx�Y>�U�}D�����:ߢ\���Ϳ��|��<k��!!���6�h�56ZE��V�dY����o����Z�:	.R�n��Z��yG��T.Vb�&ܧ-���\T'CYYQ�T��w�A�TG��E��2wǡo�@��`�7��@^�
�@$2!���h����4˜���o������F�Ҝ�<�u!Q�j���m�*�7�a�͛*�Iږ���'�\�:�I�u�� sB�rD=v*e�m~�ӽ�*�����vA�\�E�WA5R�j 5��H��;�V�s|��O}�,+�r	w␓{Bb3W��<23�*�"��;&�S���/��$��. ��Aq-�I!��#�����=D�=��2�	Y郷�:�c>���Ӻ�{�㳇�뻷����ڷCi
&�{��n����41��*�2$�"����T+2�#
�9

���8�h<w��bR3`���y�����c�
����5)=�ck�^�	咥����3{�q-� k��p�G�	�:�%3Qh�`%��>t�{p>��SBVl����	H�7�ȹ
%��E3"9�	8�q�̱<xj��+��+��.����.��2�{�H(�*�6�9��W���)���3�����{��@3nd'����� n3:���I�Oуi��*���ڃ	�s�#���Јn��E"享[>T|>�[����[E�t�!T�VT���!<������X�ņq��٘K������q��B�:$.�!�Bd�.�S��k��s��ً=*9+Ӑِtd���'�����<��*��7TǴkC7�7�a1�C/ڡ�#|L�~	�t��R�(z�LKע#�1 ��(�T̺����L� \� �H"tE��H؈�Ō:�����c*�b�������B��
��3$�KF�B�AF/�8��?�i���.~bÐ��z<+������,t��s9=���" ��=��/�pG|�+�P0�DK�Y�}�����GOIA�������y� 1�Ӻ��A䋾x ���
>!dO�ĩ��	8�H����c�t��x"<���瑴8��L��@����}S5�#MY��r��I/L�E*/͵K"�3"%����h[�IB��<r$3�|*�P���ʚc
�K&:+ L]��Iϸ��!���>�
v�����
��DE�����S���"E3:>�$Ӑ����B�9E�{�
LP�z�k���q�!�b�PX3;������2����h�~�5(SJK뿀A���h��(@��?I#D�Z@Ἄ|�C��n|��P�7����/�� ��iD���$����� ^u���[�,y��|>.�H B�B!T��d�2���	+��3mE/=Lu��,��4�<��zc��ٕ���y�1�¾�;�zWUk8?�����,�Ir͗�8G�#��o�F*����?��M�X��1���ѧ��J�܁
<Ι�U9�R�����`K�UPC�?IY4��;��x�TL2UVf�YU����Hi����Ǆ��|H ZZ ��.�(���l��í����<5+�s8��IW�W.�+B] {��i�D�6��Q=�J5�}��)j������}�/���`3N��[5q**r��T;�ر���1�5&={����|��{��gMVi�E�#aE�V ��2ݍ�\�� }�!L�j�O�Dţź�5ڢ-Z��O�e�"��<D�-M^��0�P���P5�F��'}�3���g�j�y�-�Y[�%#��[tT��8����X�]U=��$����QKKV���%���^B&�R2M����\������Ϝ]`����D'|p>�`����ڤ=> ���]�K'/{!w�ګކk�T�Sx=�w�;��.u�4츳弊q����J���m���J!^9���<3��C��J��+`���*AW�<-��q����M!#\��1���Ξ����}����]���	��OV��d`Vd�{�V�]V��c>Z|���c
VO��A
.ڮ{]�Ǎ10 "���v�?���?^�#�A��6ԌkԨ�?��8����Jrʼl�4Iw��4�k�� ��xX?��Q�����"��p*�#�BW�0\�x)���(�ε���`��+*[���lO"�����W��������(�V3ɤ�cw�`��wd��`
�H�:�����HֻR�;�������w�����E� }uTQ~�+P�?��+k��$�+c��&�*	e�ۡ���A�����򤻺"�5�pJ�"�b�;���~	c���
��_q��ȐV2��1����4|kP:2�m55E���$���y~g�	�t�$����>>�ü:��)�z�����h?�u8~�?�!w���I��WFJ��5J�(���s����Yڊ��B���e݇?�1����)�b;J�*��bR+68�ղ�^�&mK)��P�}ˍ݀���8��=���}���3�<�Ac�:�v�ҥ�0Z�}�=N��~����P�肓�d������#M�;��.�����5'�Wh��!�#�e�������)6$L�jC�"�²�R`)*N���]a0���~L�β����8V�<�y�(��v��ϥ�EW��)��� Zx�����N����j(��B����c��`�]n��cS���:к�� ?��qɪ��0|�x?��Z���;�TQ+���߂hH�U��dT��,�.�@I	Q����m���@(3Vh�٣��b�� /K)6�B)!��3[�������
!��ً�*�٘� Ѱ��r7|L���&�`q��R�|>����^I1=',����� _�!r!7�"7 Y�u��. h�^悵�E�Uq$��$0Oo��nJMEe�NPy9��ȏ3c��%��}0b��V�s4��I��1���l���pWi�U��v�;�zQ��(��"ԦI��<��ɡKGV!D�.�2ߗ;��'u>�����(������Ԙ{��膾 ?� ��"�ZyY�n�D���&�`e�3ʠK�|h� ~��P�����ї�o�yR�ګ�Ip����9���G�1����=���U��6�~֥K��K���!�Pq!�dk��چŝ0������Hnw��g�x{ �������Y��p |���r-<�˃a4to��.WQ?W������X��l��f�6�@p��VDAP�D[�e��U���y������ٹ���C6� ��L�>Zi]���A�I����Ј�'ڦaA�,{�s|P��`�Z�9�Wn� ���guY�����"�Z���"W�+��>����[�������yw����
A�V��K��B�
����p�Â)"̸P�Ď2�'r$�}�
��+y\�bE�K��̩Sf̂6{�$8Тō+VD�Yp�M(U��iQ&S�+�ݻ���Q�Y��ꕧ��E�|�1c�z$��+WW�b諾�뽽}���v�=�q�"N\��D�Z���'Y>�/�K"3���?��ge�d+��ګg/����8` v=�̶���ޱ�<v��"O�7PA�D-r���9���Y9R���K�cʠ�-H�1)n��9��kӣG�p�v�%OZ%��z~���L��u�S FՓT@M5T|A(]yGVAz0u�Vwy��]q�!c�%[�a%�=*&�f�ك�]���>z٨�^���X$x�= �؉|���Qّvc\/nhSNyi�ݸ�A�(7�2H��r�̆[����p�	g���	Ĝ�V�WPtΑ蝞Da��PITwEq�Q�)dH�%Ĝz�mtϡ�!Z�{�pI&��J<��*`N4�$�K��4�Tf�ؓPڥ�H�HPNM%�x���ᬲz�`|Y��y�.��Y� �aCB�֍�X��iU׋�	Y�b J�]G�WLb��a�Rٮ\�\����#n��&[m��f�ŁI��8Gp�ԑh��vVw]�ک'O<�E�"ʑD��*A4b�qG�a� ��H~���2ORU�R�d�,����T��~��W�:n�m��v�0�
�u�V��ևC�u���:�s��n���Zk�-��Y�+t�$����������Qt)��D��%W���W=�X�+��o=��v��,�8�j�k�qp\y�SG�u2�]��:t�t>(��!c��1�8�z c���!����ͳ�
���i˿2��9I%`-	�γ����:�+�ES��`�*���uC�t�t��=1S)����m������5��י�д��}�v=,&-njRf&I�[b G��-��a���������7�K_��ܿ�t�7MFQ�	�s\���);}ʎ�R(�jQ#k�{61d)��{�$�B��!��T>R� /���^R�� sk�-�U���[���=�(|�c�>�%)D1K���#�e�5B�[�ֶ��|,���b��E�3G�T�����q-]�!��t���F5�$ 3�í�58�ms8+�#`2�������D� �L�v����:[�՞X蹋(!TԫP���<*v4T����"�R���H��;� Q�JT�lU3�̄����"��.��{��
�5�s�31�;'�V?¨ pe��P��vE��+�A��[ض����0^�"?�H���<
��|��ssy�
����P��B�l.��62^��(p�sJ�	-���������D�Y�HXh�ꅯb����ұp�I�0�C_��
C��I��;i&�
�B^��Ғ�Xen��&W�:qҊ���b9���t)��T��,6�?��F�A�D��7�~{Q�j�C�-�&�WҶ�\*4B��AT �J�E����7ɸ؄49����q%�� %,�3Z^G���B�uj1����z���ڋ�.�A��/9��ڇSN�*qA�R����X����
���(���Ut�m5��na��ŵ*F�c�Ū��<F�*�V�������[<�GN'C�6���B�7��>�0h�o2XY|��7�KM��҉`&!Q܊Z�=�a�U^���\5R(J�LhT(���&��|�1��%��ǒ �!ê^n{�����.������͟F�[�*ֳ�M���<-��hݕ1H����6���%>�[����s���������t���M������)^���&L�*�va��vT[���&���M�fb�R觋⡇wH]َ��hA�pe<��
���������y�5T��ʫ)2�E�=���+k��ڎvl���ݹ=p<1/�D�F��g_qlאء�ԧ6<3m���0iB�g�CH&f.�� g�Tǳn�����K��'\�\A��?
�-������a������9�TO}:�b�R�G�l*��;n��,darU���5��l����y�5��,ޱ�s�a��{˨pmu+���_�qI�ǆ��v�q)��U5J��_�i�+�� �c��7�tɦ	���s��~��0O	�wt4\h2/�O�)*�'2m�{��m�9C���>��><��O���	ϿJ=�ݛڮ��@N��E"'��?�v�zLg:��p�j�q��ْ-!��׌�-D$B�l8=,U}��o��ⶤ�)+�\	�����m���k�"�[�P'fNީ�ev"zX��ߏ&�C��[4�BЅϿ!%L���S\��*�n��ӓ|6���`?#�G��?��:Y�#w����#"K�dī��U�������̅ �{HK�-a�M ���k��H��.�׊PI=��iћ݃He��$9�$����WEx�UȠI�-=
_��̥���C��Qou_P�>��qJ> ?T����M�r��-
X��\�	�������|�1޸ � ���<���iW�%�2�ET�
�8�u���k}�C���ec���A�^�Fmt��#:�A�b1��ҙ��9��Y�hN��`��`��ҿ]�\���Ne��a���>��TUA��Ua����Y[̙"8���d��	���xu��a�)������?a�=T�"�G�a�=�Z���^�|�X"��c"���8b<�<�#	B�*�K!��M���X�Lx]ja`7�Dt�DAPS�MW��2e
S��*�..��-�b���`��A
� a��HH8���`8����W8�xA#y\���9^���i	u��&RN��!�����m��9�Z�d �ȍb�����<Z%#�HP>
����y����&�Ԣ��Hj"P6����I�Ȣʐ_N,ѼqAtpF&܅ ��G�I��Wd��A�ds�d�qW�4YM���d�N��tb�$Y�O��P�	Z�9)�4�jN˷���QIlУ<��C�m݌	ћ����By�1�"B����
y��(Q_p#��T�AS?� ����%�A_Z�_�����&�M���6�:�dj�c^:^Z�ӌW5f��)#ڤ���jh�YQ�FΓA:�����|�#���Y�!��!��c�H�{r���cTb�Tva�5�A�X��jZ�}��%ح�eD7�NnuZ��W!dPU�t�e,����T�^r�T>@�wҘN��T�%��C�y�dʅ�����c�W�-�Zњ��!<��|~)5bf��ifF�$���a�(w�VV0��ңU��ܼaW����ER�)	�>��f\�����M�B(
Y����%��a}��B�b��Y{,*�n�|dčJ�>�xV�TAT��D�( �F�U���JN]��}�Y�$g�Z����|�)����Q�6^4ni�p��)VYHj�RoNj��6"=�]�FF��e�H�H�Uҩmަ��1j��ky���ևvN�ny%NW�jD]֝,T��h��-��T̈́�*��ncRPlMD[�\�RN~��5�)�&����O��}є"ޙ�$�4��Z�1-����jZhdz+�.�cI�%��`@MhJ}Р���uj���"=]��[�i"�⨚��Xb!'`i��ťH�ȋ�C���Qd> ��^g��-��EB����q�'�~��});-��椰��Z#�x�;����*��'�R�2�0���$FGK�P���mĖHkȦ�c�FdD��˼����Ӭ�&I�$��)�.��ƄY{ВO�!G��[2��� ��׆�"���<�弭��\�T��-v����mL��E/�'iV�J�*�"��*#"n�QC"ɲ
ԑ�a���3>���)I��D��QOo�.����b��W�"r�fK��Y���{Bg��\-S�J��\�/�mB��a�ֻ/V(a��>�^�%�m	lw�e>�e�Fl���G��B(FX��n������NTxq�z�S3�dLz��y��^���M�RGM�o^��]��i�x��(	1��V����`�:�|���25���SY�dr���}h�m��n��mp������C���fJt0�-&l��
s�
��_�t ��W7�x�gް��QN��d�߲�l:�/ec@i\���O,�X����)^�X�<MzFM�܃�d�&��Qʽ��.N��/�$�)�/��)w��m�|�q\��܍�*�qu�e	�����p�T�v��B�#B�ږ��m2�Bh/�w����o���w��bv/zfU�vU�E�`J+#eY~���Y���B��,'�x)b,% ��3�E�"ߍZ�Ċ��s[�z-[�V����Rp=?g��L��ܙ�*����
/l�&,�R�v�L�8K�Z�HK�%��5`�ŖⰓ�-L�g"��{��b���m��v�ג�@YJ��r��ܯ>x����U�hi��@ղXPVHI�mFl0��!�y�U�U�w��qp�+�X�ƅ\~���_ܱ�!�(6cs#�!�h�Au2l�5Q��QM�0�2I\��fg�Z}/;m���~��ϼf^˯�50b#m�����As��IR��ߚi�#� ���Q�^��nr�(���X
H��nϥ�+�!3`5�l�t�r����mD���z�O[A�nA�(Þ6�YH�F�.�9�S[ʩ�Rf�p3�,��x�V�B�Ixe�x��dS6����Nt�F[Оv�ݲ���`F��͐8PF�n���+��w��3~WI�jGnI7
�D�2M}S���~GD^�j���-�*��D*W�s�Ij{�ȓ�U���b�33��U�snC����Z�,�u!��a�qs�P=j0�����|�]4�V�^㸍��.�Fa�u����e�=�avV�]K9d�_��s��*X�T�66�p�_���:�-�K�
s�y���LV܈{�ΦK�&cJ�2*���D��RѲ������?N����`:��LX1����S::r[̲���b�)t�,�B$ QsR�S��_��>9���ܥ�*��h#l��16�q�k�^�M�v���K�1̯S�&��=u�oٛ�S;���j��)�֥�8R�^��TP�:V��1��`�P2�Ee�d��v=c$�1�9IcL���F�6���sTM���c��6���G*F�C<�ͻn�_�H�4�m�������gy�uog6y.�;���L*όv�҈���As���_l�_%"�w2�!�n��M��H4�E�p�`�7���V���Y���%"v�h�bAs��$��`�qTuʩ���$���B���uWYv7�MB?��^�������h_r>d_��#��A��Q��詼D�5^"�i�;T=�W˴�+��]�Et�rrso~.c��r˶�5��"0������� �
�ﭸg%�>}V��(�ފ�"VQ��=�9f��cF���i�$I�*=>!9&�*�0�9��
:���sʘ?v,�Q(ѣB�<����O��:o߽@��Y��e��-`�n����.��Ze���{�T��[�n^$��`X+5��P�z��d�fd�6�� �l��]vf�$K�.$������w��Y�u숳��58r�F��7'%y�jǆ2B�yJ�/��~�芄��~~� ɋ7*���x�*�E��G��r|�m:��~g�����������N�'��>��
�����j�y����ĲL,+ƫ���B����ҋ��鐄C���躇���1Ū�k1.Ԋ���d`/#Ϟ�iG�^*��>zN#�T;m>`��5����G��4�2��)��k�;��c.9򆢒����"���3Ӟ��T�K��;	��S.��N2nϒh��1=��'��*��Ԓ���0�<���Q����|��*~tk�*�`�QK����҉ý:�+þb�+DH��ĺnkP�ì0��j�ѱm4�
f:�3�H�ǔ�%sQ"�Bm�#��i��b�(�ް��#L���K1�-��Eu��ͅD��8|d��:G�bH����3�;����k�O��)�In�s�",L�(E��v�p#�	���M���֪l��H-�-
���2Q�V�d^ᮟ4�MV]�9(
��W��]�Wʒ��i����=%vw��4r����6�����#�f�b<G��K�*�v#.�}�m��$~m�o~�������$�'����Z-`��Ư�����㓆��;L�^���0P+}<�Ъ�K.�AQ�RT�5��M�0��Օ��D�Q���F�g�'	2�3fa�v�5V�ϫy�Z�9מRː�~����OL���|�C�(^�v�,��.:Y��u_��ƕll��u6��kr�L����SH���*�(I��7G��w���S��ʸP���2h)�"�*��Lfz���VǺ��/j��2��K-�[M���q�Y��VgFң�,.L��M�E& �yC��>�7�	b��Qp�-���[�{�7��'x`����"�	n[�ۍ�&e)E5�qz��)W�z�O����)vEU��Ш,Ġ�9�6�M=Fh����.4�Շy�� J;�jx��0�
'z��x�U���%���h�Ըm�[lK�� �C���[����`���?G�١�ӤB��j+Wdv�̵�E��#�Y�h	�B�����b����V9��KcQɢ2צN�T�s[�
����e.�H#)��}ήu����d���ϛ ���f7��$X
�a&��R2�Y���FڸZ,�A����eK�e�vߩ���E�����qXeZ8]%�i&�w7j��ќL�v�mєH	��9�*@>5��2�R�O?�#�X�<(Ƞ� ���mZ�OlR���%SXP��d��B�y�e(�������ڄ"�a�0cr��Σьji�F��~�K!�+Qt2i�ޘ����J.�Z�b8�v��I�Iw&�S�unA��X{Z�TkXgT5�6f%w�#��r��XUd�X�,,cA�0��<SDf�O���."�_4�-CI�xk��f�:Bِ���2�5�#��<7���|S��N�{A�,slY�ؾ�F�ŬI`9E�x�ai4Tt����:�5��UMԞv�&�RiI���RwPƈ�172η(�'W�A*.��f��d�[��bF����A����?�Nk����eD�H�Y�P��&� �P��[��7)��ZrІ���pe�~�Y�혳����(�/"��Q!���V���	� s*g�|��w&U��q�S#V��>���}�����k�V��S�Lbq�\WIs�#���hu�bYv��U�G"!�D�PB�z��[��Ա���Hz�s�'5��^���~6�7_��w��2� Xr3���g��*�-���O�M�����=��r�|��QJ6h�l.2�X5d���(�=�J����	ٸ�f���"U2�~q��mU���J��k]W`X��׆��2 㻮9N����f}�_s3�H%Ԙlí慨e�����]���Q"���J���Z�x^[��Ldh~N^�9LG�xIad��\�bI�	�S\"Z#%��x1��k��\��Cy5@^N�p�>k�H�)]	�XKֽ����8�Z�YϽ��v={l5x�d�M�l����X5Y�%<e�y�`�sQЦ�{�T�\�p��Iǵ�$�B?�g�8�݌<�X9If�5�s�=w�����f�[��J��Z�p�\�h����M-������.X�Y�'y�֭�Be$ƶ+����#u����i~x�sQ��}{�w�۾a?�v4�/��+v�̠���tχ�Ɗݚ�6���"b��#�l&�Ȅ4b����uB(�@ĭHȑ��D^��f�ɤ�'��d�J���%�oR|H$0OKj�$�/#*����pNj�,:ʬ؈��@n����K�6"� Y���[���h�p��o=�H.��㲰��2��:gI^#6J�얫��c	���jJ�h#d� ��h/~�J�~o'r'4�,��Ë� 
p"
˩��d��i%�O%0�f+b��mn-�v�z�MN��oǄ0Sj)�c٨d�f�yp��6�K6L�&ǝ�b*\��VôP%,#�B[�P KO�-ޖ��ڰʏ�P�P��%Ԫ�`��f&V�m�@�u$�6L�7䇕�ėPR�&{&F(�K�^����>�.��h��&��pw���n� �,�����6l���į���8b�4�f�)�Ý,�����- a!�6�1Sl�0 ��Hr�bg����d����Ҳ�vȎ�Ʈ��Ժ�+���˗ƆK��;`14Б������F_
H�Z�7��D������N7dk� ��R��q��*:�C��^B�H��l�����zM�@�!�jV���e��������H�$׈���#.v�_2g�C�0�b�&~$JB��B��?�Ex�c?�l) o��O(��J+��.�L\
k�N-�<���]���/��0���7���<�	�$�#Y��x+�(�{�*�r���*%���#��To��'J \0FqN���.^��r�C��L���������2,�8����oqw+%�C�./�!4���~�3���3��2��)cS9�=�0��F�8K6ɒ�L2H�Cj����4%..�FI����bX�2CF��?������0�ǐD�͈V2��9�#�>]�V6�=��/�3�p"@/c�eB�_�h�6/ݮ� Ʊ���Ȩ	o뾌-���B1;x3�� �B��[Jn�� �+=-�E1�TJۚ�^&l"߲79/?r���)0(�ܫ��N0͊�z���8�QuV�Ӡ�a��"��h�Dn�UE�K�jl�TW-c!w���Lo�OA��N`�Aዾ��,m�v��q{��8��8u7����N�g��48Q��p�$��9�F��ER��S�,�'��.��Ь�G�KB($'@Up�4H�$����?]R�1Q2�X����&O�.~����EvUc]��}'O4�oo������4+�T(+�7�c=IO���NϮ+ݥ�.�f�uq��ZEj3��Y\�k܇A�#^o��"qcr��^�+�Ih)'ʪ�� !M5J \���&*�)�/�Qm7������K?i<4oTB��Q�d�f�J�\L���(ݴoR��c78Q7�*�I616���\�D�	�V56w6��!�gS%4�\�0	�)�ei�"s��ۦ��r�2�+�ueFi_���јl�r�ɛ�J>�vV*�U��%�*W�7n%V��wG0��'o�Wo�6x<�n����4"'N��(Cw1�m��
�Z �����Z4DK�+UtC�w[�oh�V��~e�oX�rʷ.F�"�`d`d�KU��_�IF(�S�V� ���
� �I��A��\E>�7mShn��	6��^H{g�2�%X��nF64��_H6
�W�pSV�Դ I�B�dE�ҮtL��OP��!��D��:��4�j��ZՋ�L� �S_��R�H�s�ZaV�Hk�_�+ҭ54�/U���m�(MJ��"��6[��J�����O�	�bF�52h�k8x�U44-Rf9_������T���ct�)K�[���se�8�7Do�$tq�\CB����婠����)#�`j�AH�A�_��w|q��0!BOyPJ�U�%�����Wm����DJV��@#��!����Qyx\�qp���W5�Ok4؃���©O}Ӌp��[����w�D�jް�~��qs,��7�S-�"����n�ڴ��.#�-FGh��V�<����.u߷`�"C<�fv�UVM�U�I�y��e(.06���2���.�W �G6� ���55w�2;�d������uE�<���7s���<�B��rc9D��4�g�ӵ9��n.��6*"�m�p vT�d��#@�INڟ�s�O�xJӪD�w���U.������u�#,�h�%���3��L�K�6p{؆$�:�z}�T��N���ֵ8JQ��6��e_V���q�5Z�F��U�p~�i��Z�,5�HQ</�/O����*�E�jAҭ|�kC�Y��s��Um�CH��
���%��6�0`�~ǳ�{{}j��y&(*3{xB7R�K��*z�=?�I�L�?,8/ɨ|�=t	�T+;t��0�����t��h��[���Y�f.�^�b��c�AG���V!k-Þ�j<	$���4�$��%fj��;�����6J]�UR��	��]����Ǿ�<��
�4'��X +4��)��"TM)0/����o}�35�f���7�檑��֊i9����<����մ�07r�Q�ρ?z�{Y�0p��	`����Gs�U� ����&��ɑa���>�BBv�w��ʻ�r �Uf�ӹʯ ֻ ׿��E�'WA��K�B�2��u1�/��bI��X����m9sq۟#<�GW�ؕ��1*��,��)��M��t*�hL@BG٘+������!/Q7��1��:ݐ�=VY2V"��u�G��3�-����_=�'��ko�@׻ �! $F{��{Iۆ�őB�bL��_�=d;��#=�6h�s�C�����ݫ��H��`k����A�e-Ǘ�3O"_��R�J{�}�;,�Doll�3������[�	���~�e1x�! ~�%~��^��!,�ƹ�
0��#>1����Xdu�!�mh�>�c�9�����6� �#�-\i�����]E�!Qj�;�ZV�迩#ui��ʸ�.Y��ژ�ZxR;�X �>�}<�8c�
�l����뛼���엷�I]'`�G##�M���e��<{�\�]��uՋ��n�_�W�𗺁,��DC��P��dнMt�����l�[�6��H~� Vܻ�������aÅ��"ъ��"�hpcǏA�Ԙ�`I����h�*+���;�Pf={i.l�3��*�������A�Uػ��	C�� 1UhҡQ�J��jW�`�f{���*�� ⢇ŷj���ץ�ݻ8�v��#�ݾ]� L��a�V�M�ϰc�U�I�<��D�)k��9�O���|�p i�@SM���k��c�VaPF剒3�41�B�?{:^��C��9｛7i��f|�t��/^�g;�g� �{�}���Tvi�juM��w�g�<���?c�Z��
�Q�Ք}RMŕTTEՂxU�� RE>V�\U��\��%z��W3��0�_]��`�uqE�)�Ec��8eE�Qg�4���U1�O�Ug�q�)�{��֚j=�]f����rW�[|E�%r�E�~G�֛t�md�qfI��v�$�wt~�]v�d�@ި�OK���|����gj�k�X��S2� �Q
~�եQ�eiV�VT��V>zPH�Yom��`���Zv�#^*���|պ" 3�%+]4�(, A�h�IYv���i�er�5ɓ��=�䒆2zw�M���qT��\6��N�G۳`���q��;]��A�v�)y��Y�Hu~t�y$���#����>ݼ%WpA�����QVjԤP��$N��S�	VUi��j��L��sQ��[UP��n�aί�\��u�(C�����*�eW�����=�,L�WԻ�M�5�Z_�d�]������vo�c��qGV<p�my��h]�l�{�EiW%ڀ�9�x�Q7���>� 2kb6��n��[O�U���.�Ȯe��V����Z��Ym�C�n���Ϋ�Z�ώ��ֈ�9�+����M;m|�U{��߸%?$�9i-�]CI���3�#v��]%�����qi>IЂ�hQ'T��������~O�g��;�yi��Y����d᫺P�.W��\���d�bV�pҐ���>\a�<�2N�n���PB5!@��T6��h����C0t�쀶����)��v8�@mO8R��(c0�YMl��Z�FC=�a�5�Mv���}}knss�l�f��4g|p�WG���p�6hĎ�'~lOi_��D$lq������8��n�����6B��(X
O�"���A.;݃���XH-�K����B��v/�P�p�C���Dv��x�J�P)y@ć�5��_sb�t6%�M!ݣ"n��--��PrK�r��E�K^�����&|	�_3"IG:Bǎ
�d ��E�C���̹���3boY��X�D��s������ϰ��>�"
m.��a�f�L��\�IP���\��P�R j���GK"2y>�LG-wKt%lPJ��4>gR3�э��	EdB�9�[&x�4.�19���v�6��e�_�	�';���x_d �\�qW0� �"�QF2hBV@��d7y�E�ȕ�u�#�]���Pm�$�*D9N&�0�P'A)�P:Ԣ��� Qh��5���>�*6�G��G�c-&*qZb[��d�*����N��(��t�;�G��EfQD�{#I��/=]�q\�Sх}<�w%�U)�կ�%Y=�W����Hh��
��VJyw�$k�>7��Z�6*xB��
������`=I_:��5�­pp3�B��.�2S3�Y�2!ݬn��I+���^K�׶���2��%O&��nY��f$|��l�̬��[����هJ��S�(i˅��J��j�T
�ָ]����kJ�)�8�+Pv2lʂ�'�J�j��[�"_�����mUa������i	�G��K�f:js�l�fa֖�R�g+�9wE��C-���E0�O�jf�4��B�!��j����g�%��Fd�T��i��(���z�v�
10��ܢ�k�Q R
x���)#�x���F�0˲{�h�.[���/aY��f��̯:^gB�9˲��,�,e	��,����l��%S����-�Vip�I v�m��V���+�C�V�����ɍK����nM��Bڨ'J�@N�a��9cG�!O�6�*������:)���Q~�e��,?�_���*[��5,q��gۼFվ6�|�m�Y�='�6u+�;����|jRc%n�1�o����Λ����k;S��bJ���`l{������ -YI �Z�N���ˉ��P���*Ę��-k��4����V1�S�W��޴ �u�r������j��^�'�[�-T ���#g�Xvj�sEROgo�Y#=�=�c�����j��{�2��!c�:|�;��s�o��/�x���qư�\!�/t��D�o��8���(� �<N��ղ��;�?6�R�g|�뚔)��&o���[y�HNr��r��r0'��|�3c6z��s۶mvm�9g`��f��g''�5ޓC�{e�n�9�@�gE�EH�7/��c�%�i��@_g9R�|0�`̲�{}O�v�R"��}gw80~�'~I�pw1�p$9Y&1l�~��~j�r��$�'��4#��hB#9s�X�7��F,�7�l�5,�m��C9���f}h��`�6�qv��F��`�TRoc/g�7�c6�L�T�t&�jt[�0.\a�m�%tV%-N@�;�S4Bw�G~�WM� |�C���p� (=�$*>���7�[h$H^%���^��T�����r.7� �C���6火g���B%y8g��/xF�aU��t�a6�b�3Z|f�o�{%�S�M?e&�'}S�9v�ev��m��v�u�`"'Q'B"&�}`�߇C��}ׇ\Y+VU3';�"��:¶Jr#�N �'r�5rkH�H9]6i���'1hH��hl8�|1 !/�y�Cf��J��<��-�$?��o�VU������*H(��D�{�Fx�!F�ZZD��e�0�|�?˗�eK�(	U��}n�"#��Mx��Xw%�}B<�w+P�c�tj%�ƘW�&�7	��$�@�"����PC	��ٚBI�Ny��D��z.g�d�SI��H����Je)D�WT�-ÄZ��C���%NB�FM|�F�([,x9e����t�W��?��Eg�vǕ�E���wg}"�}��}�w�� kfj�9;�c�a!"zPOp=�P*�ٚ�Gy-��H��	��9��BV  ǆi�%�r�f�f�ɛ?$(�s*��RsZc��f*zg����b���D&L�uR�{&Q[�
�Ôd"u�א�M*R���4�����C�8���DH��wv'�A���J�&tB���b5��-�N�B�I���@�q�����X1�}����_�y���RY���s����9��ٛABv/�<��CE���%���<F�E�|�0��b���!�n{ӝ��-v�T��[��f��fk��9c-1����}\ڄbJ���pD�}	��$�3`�V�hJ��jroq*���Vp��88s��y���i(9T�\�q��š�W��#�����訏���:��j�6Z�汩�F�F�<\�#��L�5��/����B$BZ�f'�
pE5$8�i��{�� ���y�#�+��pXz}^�")�4���%��ZZwV��:��:��{e�V�ؚոBI9bئ����	���}�J"��Pi��l���������/AԢ2�?�:��ʫ{1Z5��LT������njsxS�����?��o�pO����,1� �,��S5�`j��;Q���B�48$����� 9۳ĳjڦ~J�Ai����)��w����HK��u�ڑi}�Q�	��J��ɵ�Ѣ(��j�B�M.:��j,�K�8ȗ�'	��b.~�{�IUw�n�Fr�|I�0c�@�h�(���Y�c
j�JwvѬHSC������pp�em13k��@L���f,�B)9�1�l�	���ؑ���*����Ά;��_6gm_�`�:��Q��b�j	�fB���f#��ڤ���C�u�u�5L'֙t�����Q��q����� !�clip2gif 0.7.2 by Yves Piguet ;        � xworlds team photo.gif  	@      F  � �  ;GIF89a� � �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   ,    � � G� �	H����*\Ȱ�Ç#JxoEE���Ȩ�I�U�xrc�O`����ʒ +�����+W:��1'H�"s����
{8�!E�)P�FW��	���.�d-]?u󠱲�ԩȊRW|Ӧ@�9k�����@ЬA���<���A��/4="�}��P�:�]I�hҡ�W°��e�M�:1�J?ì�2կ5�����2z�b��m㳲t�A��n�.� �[�o޾̎���3g�����=� ���Y�*����ʕsJ?o݉R��I�̧Ou�����뢝9�@%�G�cP���n��SJ�fE �q�O�O���c@R$8Q��D�u�U�~���~�t1T����R �"|0�g݈�}(R ��"���>�rT�0�X�T<�(�@�)5�����P$��O)�A��LV�R���4�<Q�p�(��DP����IB�IR�ş+&����` |v�'f2�H����5�Y�OX��>Ox��dY�ܥz�ӏ5������g��=�^I�$\��>�@#�^y��`��Z������f������ ��h���*�e�D��+��sO>2�.H���+���
��I�Ҳ��*��U�_�^�/���OI����_���az�c��@��*��_��#X_���OWC�G ��E�W��^�<q�7���{��ʚ���
��T
ͼ�J3�ּ�bw:��_�N��
�a�3�{���a	<�`Q+���(�AeK��S
�p&�*�?]�\XWLg
=!�7�+ 0��l�ìש��������tL8+UH^Sl�<�
��^�:q�X�l��7�qֹ��$�
�n}�:�+�W������6~�ҼJ���zZ�0;]���ͬ�����}�\j?�  ;��v.�p�	���yQ����_�_�
?>���e�A�,�KK=O�Oc~��RK����?�y�D���"+P�g��Y�����ZN��ի���xFⲦ����m��B��u.U��Z괶
��3T+P�¶��L���־,���/�4Va�z�#f�����4f��Y5�b� G�S��*��X���y�W�⥄F�R���X��E�iND�aS|R
��Ō}a��u���,4�_�"�X�W��Y����@�/����V��;Q�Z�#��x�������q�����/��մ��EafDz̍K8�
���+��>���p�
��?�B�Ν�{�1JG�1ücC|Y����T���'n���B��PUȕ�~�&DܧEb8�Ȓ�=����
 @Kv�(=��G<��8!#%y�C���0����H1�����.2��@�×�LNpƦ���^4m�l�0DU��&��6|5�s��TN��4@�IZ���PB����
%QA<���m��!��tH�b`if�j�~�e.Iu�=����Ɨ�=Nٝ��_)tr#�uM�bw�[�2�4s|X6��]*>��|�� ��8hSI�'<�r!-�!��D#҃c�+P����#�VAR��⎂��-y�h�/X��IB�t*�|�څHq�����~)Ŗj�8���,>��NU��џ�6��p���EE9u���伓��E,k"��Ԑ��&���!jLjz@�Q-�Аt$��v�eI���MG5�E�zEeA+��M��<�ם�2\����+#۟w�Q�*x�R�[W��\�Bw��}�e]��'�����`y�WgvE_`�IЛ�ɖ���Xj�StP�n�LG<ʋ�*d�� ��RВ U-A�QwS�*��I ������b�'V�`���`�ğ�C��,�=S���e�e�ޥ�0��n��8 �k�4za<�*Cw��.�2潑��X2F	^Tl�A��ޚ�dIKe���o��Y&\Yݺd��F l��躼Q�K��ʄ*��\�Ҙ����B�z���*��T]�r��0.��uR1�˄&�lI>J!zշ����W ���ۿ�HC������t��&&G�KI	s�T�f-P�6Kv+����)Pq����
��I:�q�
��O�LX�c���#Rb�X��V��2�)P�q.�	��<qIk�s�+X���ʓ!�p�1�!ۺ��H=��� d!}���Z�b�D��%��9�6��t!�U"��*�%'�FZ
���q
��;�X��Z�%��HA�APؚ��	��jX�1%��:TR~�.)U�>���T��,L��BO���zi͏G.�������#3I�(�*"'�9���7L<>h%m{ �z�N��/�U�f��G�W�|��-�� (-C�2;��l*��0�d�nݽ�紖�@/[EP�3�>˩$b���ԚP8�酓:�'6"ua���+iEB��¡/�b
%W>�a��A�b|�~����273�T��k1#y!) �2��Tw""���bh�<"N�Pt��+:$�D�"a�R�sx��1����/N67�vD�R��9KT##�+�i�2�F�R
�`
��n��+�30͢+�0-6��99僤�>�e)��,Q,H�6a5�7֒K��BE��}Շv�>$;[DQ!�@��G+@K$�7=3�r40Gj,g�>�Q��"&����G�1$2�L^3>�x7<�p��тC��������L�S�k�B~tB��6P�6�)��8�TA�dAԓ>N�0Cs(���8)�+�6�"�q@YsEcJQ�+��tP�W�@1�5K�4���d/ֈ��E7�؀z1�P�b)<SR�Q/��p��M&s1��+�#F��D��5f�[���>���3)֔+$�R��d����2VDkC)�@�]�4R�hO��>ux�p�vS>���8��/�b=i�g#�g-AQ+��4����2r�P3��
��G�!6Ԣ=yr%b�:�Y����g���c�bȔ���F8�EQ�XHL�y:b\A=9�3�C3�@$-23|3II��uu�2�R+��@�b) �G2$�qXIZs�  ��I�!�b(��R�kO�b��?V5�qGr$�brvb'd1J�z`7�ES��������������7m�	�#�)5H��W�fJ":�3�u�I�������[�Y�_�d�\�5P�DtQ0��7a�5+ k:o�>��`�dI�ĐKs)e�Z�.�19�و[s:�Y=���b���w2"���D��ՏD7�x0Q�Վ��f*@-�E]qsM�d�fC�9t��r,up��we>W���D�GBW[}Q�q��#yc]��T��@42q�bSU�
5Yj�U�TK��*��-��9�X��W`��j^�_iQ8A��áN�>;�ewCDa�Wqi�qw�����g��+�]]�B�`���Qe��b1fi�%c�]3�q%_^�$U�CA�Y�'��8���~�iI�Wb�e[�Dy��q�/&Qa�J����a��a��]�E� ��`��W��UK�~�g���B]�RP����?F]�p$sV��2�b$�if�^ÊOP
�2:2��TԵ
v6�`Q;�*f�Y��j�j�:,ÒzP&{�gl��a�`�r����@W���P��af&y ]}�
eY�J}L>����� �zV����-�*���1֭U�G��i' ����^�tB~iT�i��bf��VEn��_�vP�[����1�ml��l�r+o��k�f(��q#�gnpA��m��mͶk�[lP����Tr�[K��nU�m��m�mɸ��r�<pZ*�!p�� g�ކr?�rƆp%A%6�e��T!�K�k����o0Qo���ۺ��o�pDq ����ź��_+�;�|fU'��$��ptVm�j���&kĖ�h�&3�o�K�ȶ(;�[�o��,�Y�m'�a"V�> ����
al�m�mT�<(@��&|�������f��QTwV { oz�+�%[:#I�<mAmՖ���,"4��EQ?2���Qb�2�)ѧ�� �G�juܻ�aO 5��!�.�YG����a�����x�q��2yz	�5�DT7W�� �{�A����ȉ!{�{I�"H�'��4 ��H��t8��Qy�4!I�'�I�a����(��o�ġ�"�!x\wxKa���!\RB�P�y��@���W�$��y8���Pzlv~��М�$͙́ %M�"��%�#��˕Qt��N�p-B
�G��(�u 0�X" �ԺU ���MIb&Ury�E"tTt�|�uJ,��"J����!�#��(��$�v �wR$I�(t"#�t���0cwKع N@���'� z�sd�\ь�R	��a!�1~��u2�O�D�"' Rw�G��FrF�G����2~j���,�� �6!b��<?=��#A
`�:�p.Ag�]XXAbQ
��ϵ�-�\'ܷ't��C�w	}��$�%��~-�tFZ�1�v,U@�p��uD#ԇod��7�#�-8���g}=�4��BiX�1h���x4��('�נ���*1L3](v�.�"���./g���8�)R����a&�U3��V>��{��E�z=����Bk����ҁP
'y*�m�9�.ܭI-"�|5�D�A A�� B(�4� F"�������P��R�#C�b���ie�+�sH�S1�Pr�2Ce�<�2��N���E�>��&�+�AG�b0#s�!'h��J�8QF���1s��3`c(�89��4��/ ��r�~0��J�Sx�A|"���S�?zVON2ǡ�C�^s*z�Vx�3=�s4B�$�Ǣ&{q�:~������I����V!�� YJ�C��:sc���.�0�[��ᆩ�*��]����6�ٓ5�KC�,Y���,�F��2��n|1��4<�=�9U*0:��Q�����9��B��P�3b�:��^m#O ��6-���A��=���J���
�ȔV��g��7<�4�Dݎ4U���E���C�@�8�#&��y�:�6YBG�A�*�nA^Q�E���NH�����:��#")k��f��XdA=��W�A$ţ�����B�������2�Y�۵A��+X]�h�S��W���5X��4-T�����R��(J1>C�I�R��_��B�����2G鄎y�WVeU���T��C�y�(�YSE�������3�d�>�5D_�@cI]�,�=� ���~9�|k�W�4�U<#�n�s=��BI|�P�B�mӰ1��� �ߧxҁ+��5v
e]�B�87�3�H�)xh.�8�38t�L��ihh@������293Ԁ����4W�1�u䅄�{��B(�"ם;C7?�W#�#���ӎ�?~�
y��-�柾�HsE�1H�6J�B� B���4�Z�������DO��/8��� ��4��Y�7/4���A���C�	�=Tg-]B��m��
{$UԻ��E�+5��7��J��b�T9�#����׏$��'��Sa@	=�V>��paМ���˗U�>�,��\Y*)	dI EZ�,>|&K�0�B�Bk�2BSg�gƍ��:�8� ԇ��֤
;UZcESg݇���B�(9�e�9��#��R�D��ܩs�J��d��(g̃_[.�(i�C��U��'�������
/�ce�_ĠyW<Hp��tV�	ʘd�+-�,x�2�����ISV:��V!�Wr4٥�I�+O���y�9�.�A$�}A�+�2O�z�2 ���b?|�.8��;N�R�i9u�ɧ�|������G6�ڈ9�KG,��s���)O���I�~�j�FV��ɣ�
�C��*K�g�"Щ~	�Ab���@yR���2�J�w�'�8{�O�U�O�Tx">�T�!u��+G���g�1Q�ҡg��n�.�*�������0�Vڨ���-QS��G�@��̡���'�=W0�����ƚ�r�nT�PTO��Өv�����Z�$��+.�>�XAZ���#��Qi�@:�j;$bί� n��J*�

�x�z(:VLa����ꫂQ֒��$��l�!��e�0�0K��#--�~�'�<�˳����c�Hɥ��H�y��P������>�V��ժ�z�����Iր�x�'V��g��������3Os����,�$��Z!��{�{��!l'�YE��r�V\��YNׄn$�;k�V��he�K��X����x����*������v��\�|���:�(��j�S��	�b!�.4�ؚ6��V�c'���B��K�m5�6�B�*T�U �YZ��^Q�r���h��"}�J-��q�<H��h��~��i;=V���0�J҅����c��'���i/M}G��Ո�g��A�lͣO�Q���*��	O��P�}�Mƫ�M�¸j1&xB�KqV���DMd��[ba,��*W8�b��� ~����Ɔ��ͯli�7�u��P.�˵���Á0�X�����+���\u�u�'�
_��qO�bx6u-���#��>� �����4��FY��J��qXB��l��J�q�E��KE�UD�eDa�%6*�ЁN�Fp紿�
*6a�tU(t��c��]?��K��y+^�����-�ǧ��u��f�=&HD����>�W�J���2���-u"�<d8wIHB�Q5&�	����a��{`�X@�~|�ca��9ڥxz�@Ԗ��s"�vX���
l�Xƞ�̈&uU�=��Q������<�Q�EJma{�2�g��O~=�	���٤�������AdG�XE�r����́~f�����/#� �:����=�i�TA��j9�k�*1Y�P��5�ϴ����Rp4����H)���lZ3#�BK)�H���t&mv���>��>�2�d*9�d�V�L���0���Q:�}E���&��^[�ؼfV��#P`-D׺T�fS���f>VVו-�d��o-�W��
���@��
��Ɏ,w$h ��k��xX6��� �<�:�!��������A��M�N�}ro��Z�����o��э~ԣr��?��[���{��D'jQf*�:N��@׺`S�v���4<�aB�~:T<Y:�*���E�Dqm���O|d��Y�����.]�3�VCT<�1`�����]+%.z�-k���0[���
���(Jم>r�2FK!�t�G�H$")6�>���_ڲU�#J��V��tk��}���{�ɹWyOO
E&�d�.�sD�^�$��uP��n����hM���~˧!]�QЉ��^ӥi�%f�5�?5�Գ��oP�um�,cq]F':�Ɯ��7v��).!�
���W:f�k��]�fˊk���$1(�h����4���U���~\�x��G�	mh󦷼�j��{��w���G��q�;%��:Hz�]�,���c׳ҊƸ��'��1o��w��I
�1��I~��0{3Df�/=������Τ�^�:{��8�ۛ1%M�Cx���i��������������p���{�����#��x�g]�<�\�ych�o�б�/� �X��F[z���qh����08�y��rh3ڌ$����^-V�� Y%TX4>l��l6�̘��d�c��NpOT��&<�&��f��g8��!��2���{췻�%��y!����9?�T��-��x�a`����2�v���=�h7ɕ�>���;N���A8���h�凋yX��`�1����+�lcx�y�ﱊ��Ԧ�a-���k7��7g{6h#iˏ���9��;�����8y�'�3و�~H�h����~S��|�4K3��17<�
Q�~�o�4!���Q�Ahc���X���a����{�LI§S�T�(�@{1���h�;Y5�1��{�	o	&aRYX���8yӸ�R���@���@ҡ�g[@��&d��8@��c\?�D�A�)�ơ���:��@?����8DV�}x��BV��Y>���@{ ���TɗW�F|�C���P�=I�i+��?�>R�_a4��A�C�}��ӾP�#�8@z3�ȩ@(���s�D���Ô�1E�c�LQ�~(2$�0�SX������P
҉��!�y��7|h�A؇.��[Fڳ7=���>�9H�����|H��H�$[zb�0���Uk�y��(D�Bv�
�`��}�7�G�x�� ���0QI*\IE�H|�8p�Eh���k����$+�� �&	�z�����[�� 
\T�1Uه�X_��}pɫ������I��ʬ��1!�{�����G��G
������ɇ�P�ȫ`���I�3B�!�+�DTYG�C�B3������+�J���\ť��(L}����@�+p�͌��k��#	��ZLŜ�udv�y��r�L�<³\�h��@���H��!����Ѩ�
�����PE�`9_iG�t���G����t��<���q\���ji�+`�F���Ǚ���|̫)�� �u�_ȁ4�.h��D
��L�Ԑ����Q�z�+�}����D�8	�\����G�1�>58��'�
. �t�J�$Ϡ<	�N�\@{��F���@����D���΢�Џ��$�{@�� =��HE�P,�) ��X��dK�`�Jhu��VЇK��r҇U���G�D�μ]�\GoO��,����I��X�R���
k/HcH�������]\�-��\F�)�$8	 ��0y�'��P��V���SZ���NU�S��&]�D��� �}ؐ��SME[��>�@Y�����X�*o)t�V�������U�CU�;�N>Z@'�P�p
y=��Ș�('��A�x��@G@��U��R��ͤЀmOL2EA,뜓b���|���L��	n�,j���R������
YY(����iǉ�UH/AUˡ��
�x�<+��P	��T}]��=��I�x�DL��+�+���1V8�Q(M����a��@h | h��R@���OQ�%�Q� U�m��}�~i���(ĜWHu
�Ahp�Ġ���R��9h��}Sװ�hX�Rأ��8�PŲ�Y�8�$���� ��$K��i�~��������D&U$0��Y�I�63у@HS�#x��`�	Q[)��x� �L�P9<C[hx�}�y3���Ѡ��	��h����}�Ioڿ�8��#y��AZ�([\��9H'��	s�	�X	0ه��m���h���9Q�<X��<�(Rq2<	���Xˈ�Kq�5 ���]q��		k_ه+�#W�>��s��@Ȑ���0�X��Ժ��� �a���1�pּ`	@؏��`��=��@կ@�U��2<(����v���]�gȓ,)1��6��)I���ɇ=�-�M�P[������uإ���՘������̰�~��U��I�z��;fW��g8�@[=`�����)�	��g�U4�\
9%��c�`���&[�
� ��	���`c!�����0e������	�H��9�XkH�叕�U��gu�U	}�]�}!��v������j�0'�u��Ȋ[�	)��I��h�:����QZ�������سڵ��&�H\��P	d��(�U�A0}PdJV��p֚-�����A済�0��]i���X�����h��؍Om�.	= ��}�ژ\��������v	�H�f�H���HG6-↦[����!b���0��ɉq���e��=��� ��)��PZ���6G���Hy�:�^b�c���Z��e.ՓP䟆/!jdN2�k��qV���I㲠%�y��f{F����y#�Ȱ)�	����!Y~䓞��pI.N�_}J�ڡ�К��(9i��6�����k�����Y��kX����h]�i�H���-��m�N!��<C�)��hݕ1e_����:�	�c�,��l����u�Nm�F��^�}e�)-����ގ�&�m��,v�<�6�(l���N�Z��ᑹ!p���쐇���B��zEf�.j"�Xn�YyH���ݐ��h}�hq!��y�7�X��Kgi��UT��<z������A�����p�?	z)�~b��	�xFj�-���x̰�������������
��z`c�q���r�O���ƒc��e�Ѓ���6�@U�VfJ>r�������V�]p\��0*�%blڹߊM�L&]�p�'�[{��qA���~#:S:w
ƹ��aԎ�R6��V䂐}��@�a)�KEg� ��Hy����:���5;���^���@�;�������G	���
Y���¢���1J����N�o�`����z��R��;���������q��Up�$5J�q��5�%��q�A��ٜ�!=���\��b~
�	�(t�p!{��yo	����Xi�j���p1�R"��w��ݝ��إɣ��$�Nl�(�1�I��䳰���뺰��pVO��Aߎ�s��)wZ�Eٹ��l��w��v�ܑ\�YVx�w�,y�?i��H"�`,��1��������=�|h���(��=nM����(y���Э��ɐ�����v�r�
RN�#G\��P�.�U�eSW1HA/�2�"��r���1������A�_q!�X�����蔈}�����ף8�;f	<
��O�fx�W[��>����C��N���v�Xn��>��Y��:j��Ɍ��Y0��������[����	� �y���6��5�&��4k����C� �z�T Pᑄ
{���XQ��+��Y;�P�@��YKgp��y,!���!γ��F{���%,Q"��!B��U�N<H��W��Y����z UDџĈ[��c�o�>~����8v^T}/fT�Q	�G�4�Ѥ>�:�3�2]:�,
�\��Mɖgλ�Ѭ�z�b��k�gG}q�P�c�Ra�,a�hG^ץâ���%P }\�{X��3��5�1�G|�N:vȨ�y�='��ПM�¯�<4�*�C��7T�S��V�l:�_y�T?!mTZ��R:[)��?���9賗QN-$4*T�a�
��߭E�H�)U�&��^f;	D�N�I��A���#AB�Ӡ���@�
�d�Ղ��[B�u�|��6B&���bڭ��>~%��D��"]��O � t�P���*^�i"�cj��Bd4�C�<�ғ=���(=�@�莤��L9u�!)�T=N��V?�Ud?���e\��ד~��Fj�XC�΢���s�ݵ�!�bP��ԛ��t��� �
5:!h�+�W�M!��>V@�^9���M� �A���*��A�K#���C�~��uc4��p�b� �]�A�R
+�@'q � ��!�y�B��&I���=����\B9��m��>w�d��!ZL`��
N�%�=We�[`Ad�s� "�CD=�!D�<���T
n[���>�Nݯ����W!Ma�uG�I�\m�+<a��v�ǣz	��\V\��]��B��DK<���~^
R])�4�Tmv�^C�f��㙔T��!�х��W+���9t�d�h�	�U%4��p�a(n��xw�+���=QU��NF���\8� ��[�^/���%1� ~�wP��S�>�.�s����W�������:bU��W��Ə}{� �PУ���Cu�Ǌ�C0�
y%y���5�:�p�>�s�.�x��:Ѕ�x�,䙜�n� M��as�'�V�6�R�<z��(eLy�
��/����ȑ6c��!`�U�5��$1���iLS-�� �{�DB��$3��]��*��'}�������%�:S	NX��A
:y�WF��x��1fYZV���T�u��az��1��,��Ɖ��@ru�9�G,��'��	1��«�d(G�LN�U���tL���?�k@����N���1�tjP��\�*�
��fB�� dAfz�B�:ՙD�~
���{8!1Y�M�iǟ�&z,�^hB���$'+U�h�T��ؕ��F��d��=�����?J��K��Iu�!i&�:e�.Q<�d'�����>�O��������(}[TϞ�-zX�
�<Y?�q�T�uִ\�2�m�j�%��c�	��bay^7	�}��T��+L��N��Nx�Y�v U�Nx�z�JO��'3m4
�^Y�t��&A'��X���j�q���E�I����C�U
Y\� ϛ̤2���&R{�����	j$'=kN��i��R5�,�.����L������OXPe�
ڦ���dNWz��^�����Z!YKI�D/ �̆�hR�UE�XCe)iAb�㥬�j=c�F���0z�1T��7M�~m�� �N��I�A��^c��X�T8�Iv�$i�G���d@Sɀ�K9<k�U�ş?tIY\A��a�PA��4o�`�����T�h��[6� �����20�#U�B�z��T�+�sl�����4*ϵ $��Y�yB):�I���� ��B���2��(�0���#��Q�e(�ս�aI>T��U�7��{\��t�c]�g:������Lv�F��ڄzPA��X_MN�-φ�u�����n*��OO����Y'�bo\%���̖��h%�Tj�u�x�r
N�ge�$6����(F�0�&��BreE,��	���w�M���ã5T�bTߣ
�`��mb�7Q@Y�5`�(Y��2�`e�6�u�eO�62"쾧B��|�����Q��ѓKi��'ktW �+��ƥ�nОz�"��O`��E�bV\�Q����#E)L�R���W�f�s�R��tj(�� GjY�~��i| w�c��u�%�E9T:H�G�9�WW���r�2Q�&!u�G��5�|�l7���W�и��H1[q�J�y0��A�i��TҺ7���l�胕�#��u�o�ZUde�g���'�ɐ~�����1v#��E�J|�{���4��~���v讕/�˝b\�F�>yl�H�i5s��ߔ���~��ֺ#o��g2:�80�ULl9��Փ?"�AD��
�4}67���t����B��\c:���e�-�����*�?��Yă�qҔ-��=I��C����R��*�eP���P\V�C ��
�[S���Ԅ'�U�E�V9ވ���[������y ��L��{՞5X+� ��`���
�R�ay���O@lT����J������ �H]g@I{� �
�F��DDdF)0ʠ�n�U`�\O� �^�>�A�Ş�A���ץ��: ���!����� >���O\Q ��@�<DC��!����U`��JE�M�[�`�?�[h�k��g����T���Z�U��G��ɝ����M
��P��ˬ��z���� ��T���	��C��T}d�N B\�a�|�|�A������M+��=��I�e_?���\�]f �~�P�_��`�� >��,BA����]\�
/��ݱ��T�XA��` �\���݄��J֫؇P\���_ʑQ7��*x�q^�y[�X�]ʤԔ}����[<�⭭�,� >��^O�����EJ XA)P����*��ȱ_�	"S�#���a	&�����fّ'���$7��ݔة�@��=�B��q�vACX��'��:ŢU��x聹��_�a����]�$=� ʡ��������a���'��٢�y�v	���a���!VA� ��T�N<��� ?$��d�C��ꙈΙ�~l&���_�cXA�fʡJ �|��?�C����z4�>�!N֢b�����1��.^ۣd�pE�� ��^��۩"ۭ�^�Z?���>\G0��M����^����x�TO��n�_Z��A�&�-�:�C)�� ���Y>Т,*��E��"�%���W�^)d�K�X���_c�X��4��'��<4��܃]�C��lnfSbM��H�fZ_��B�f��!=0(�g��*(����-�s⃁�b�C%��5�CR�^�XP"���s��bʥ\�Y@JF>@eJ脡Pb�e��^2�_2�h�V���6���=�K)���]��I)���x���,j�뉆��č��>\S.��*Xj��H��ʥ܏�)ܵ�{�(-�`�&����1�VC��6e>��+���+�&��.+�6k� !�clip2gif 0.7.2 by Yves Piguet ;        � cross logo.gif  	@        ; 5  �GIF89a;5 �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   ,    ;5 G� �	H����*\Ȱ�Ç#J�H��ŋ!@X��Ǐ�	r�*�&O��Jɑ,���
�M@l�|�qK�?U���4_P�<;R�r�
���TTQ��=z=&�5$Ǥ^��P+ıf�U��_��f�+Wa��F�K�޼�w	%*tp���7��1�PyRƓ���Vu�"�*T8��4�z*� �� _��Ɔ]7�삷�6��1ވm���@�!�	�3T~��r��'/^P:B���ͳ����*�@�?�����'��	 ��p\>����߯ߚA��Qל��"���7׃F(�i�߅f���Q��A�������s���@*B�"�.�b��8�<�pxa�񈟏�dd�A!�h�H&����!�	G�v�Tie<�XYM�[V�ʖ_�	�*c�I&J'��fJ���Kp�$g�6�T'N:�	QC��g���a�a���cL&��	W�P\��餑�)K��b�L��) �ƥ)x�QjN����P�@
i>�z���*�O���d���x��Vji�I飿�v)o��V���Rk-D�ڕ�A�r�,�Q�@�Z4�䦋n�׍���Kn�7V�G�T��.U8Cf�R��w�9Qph�!<.	���«�@=�@�|��gVɹ˭���q^�b[�B��;��P�u��,s�2ü���]p�3�\3�	��3�@$t�D�Q�S�s	?�g�|�w��G�#�9�A#ݳ�14��:�r�b����fwp��s�m��s��L�Dv�-w�;�`߄3���="����m6�~�,�?C^㉗S��5�����B�8!��ы�����%4䊓3*���n;E \���\b�e�`/��g���Jl���>-�9�7E�'���	�`@e�c�������v[b���Քy��ś4&����>q.���3�t���cS{�`�G�� �P|�R����0�
���"�]U
6���AdUY��M-�H�T�8u$R����w�P�O��O�{�� �� -C���k*���wBs�r$�G�A,�-#�%S��`V��Z
�b�@b(Ł8J�ׂ�xSܔ� ~��L5��*.���p�?��(���O���
|��e|��{�	��
V d��.$�M��o�q�J��1x�0�f��%m�X�s��\q��]�u2޴�!�$Y�P��Z%�^�++S	��K21�T�"���3�IWh�r� 5�j���e���#��&nT�J^j�c��%,_�͐u�-�Hʌ�����:�1Ѐ�9Nz�"��p�qz5H�3`�!�vԤge `q�Ӛ��C�;�3��h���Ԧ2��i��͒3R�'p*)<UZ��T�Jki;�҇�a.�@�PS�g�f$��5�#6UCH{J�SS��t8I%�L���� ꨙΖz3�1d�\�V�����,�_M�V��ղ��i����*3���Z+B�
ֶ����EkC��M𰈝����X1�����"b��>�E�,��9�IȲ9���!uౠm�d"���R�n�U��P4[u��Fle���!��N�~D��9����-�Zlꘐs�+��
�r�nF�K!�r�AߝKx+�]l�W NB\���]�jװ���|�;�y\(J�ͯ~������� ����t�hw�]��
}c���޷��iyr�0�����p��#
Q3@ �	�}W<A�$�UZ��>���L�P�I(�kx��{�
�Ŀ<�)���� �R(&��1�LXLeF��/Q�<�Xx%*a��H=��y8O8�I �=�h�1$q���{�%,�sV��g�8��j���"���t_rC�$ dt7%���-��i���h f���a�{i�s���D+zѯ�sD�,hU'�����3�D*&�Y�Yɮ�O��S��è�L�M���#aJ����K1j�����R��_�4XU��H@j*x�@��A_'������o^�{��7=��nz���[e�EY�w_R��1�!DC�*z�	����?�a�w���{�A�۔Z
?�ի�p���##��М�.��'�(����t����rM�|ݠ,���2�0؊�<n�?��IĴ����G&��R^���C��+�,&�A���ő�k�&I��\�����ߎ���]r��9,��tK�8�iH+�;ƛ���������*����svd�晗G �B���=�p�ߋNF���7�O�[0j}�dv!'�4
��+;���奮sU��>D�U�2��k^�Dwz\�L��K	�Z=2�z��Kb������ڗsR�g��9U�����W�Qv�Q��_@e�Y�Ϭ ��Ox���G'4�Q�L�R5�1�!�w �t~+�I�Q�wc��TR ��� �}P��q)�O0|ds�CPPS#T�A�sQ�G~/Ձ	��~�\�G�?؃#OJ���}�q�DZ�p0����0��0�Q�4X1H5�8�ݳ���hR��Ep"UUqX6R�U�G6�13&��LuR�ՇM���A6 �Rp1c�qW'23��!x��f��M��?ȇ�����^�hAWl3XtXV�(Vg�V��6�(4v��I38D��:��ш�ȊI�8[�!�SF���X3��W����(�j�kp�H!���Xer��^V`��Z�����(�؍��bW6��h;�h���n�_+"X�"�u"h�7�%"��Y�c� `��\u��e��������:1b��Y�����Y5"��_>�:i��z�����H[�C�%ҏ�+������3�����]$�����]:	��B��3!F�II���pO�^��<iX奍^�EG0]^	!]�!cYe)�r���`y���:�]�`���p[��y��r����F����!j� �i�I���b�9]g���X���Xo�1�玜ٙ�������#� !�clip2gif 0.7.2 by Yves Piguet ;        � New Button  B
�on mousedown
  global normal_name, depressed_name
  show btn "ok_depressed"
  put the long id of me into normal_name
  put the long id of btn "ok_depressed" into depressed_name
  insert script of btn "button manager" of cd 1 of stack "metacard demo2" into front
end mousedown

on mouseup
  hide btn "ok_depressed"
  remove script of btn "button manager" of cd 1 of stack "metacard demo2" from front
  put_away
end mouseup
       �
 P   �         	  � 	       � ok_depressed  B       �
 P   �         	  �   � 	elephant   i       .7 � �  � 	elephant  	@      2; � �  
iGIF89a� � �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�  � ,    � � � �	H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�i��$S���K (I�<��fŖ/]��x�ϟ&mz�"ќ:���ɔiQ��5A�!N�HaV�:�+P�%�z����U�H�t�׵`�u���Y�x����l\�m���֓Y	;�+��_���h���˕�Z�,y��ǜ;�,{��e��-Zt��`[�&+���ӥ�<��cʽ������p����F��sb��o�{����q'̛������N|4m��⩂�>�d✩%������bK��/�~��Q��L���^����wce6�k���x��G]�|է�oe�_z68as�u5�%�7br!�H��!��w���h7���h0B(#���ߏ$�(�|D��&�$}Lf��*��ގI��]�}MY$�V���`��!�^�X�Lb�I&�\v����)�Sj������e�f��'����٠t��g���	(T��h�!�R��=���&V�����Z���eS��	�穠r���a���Z�����竟��׬JG,��>Zә�[��J�����[�"+]�Q�U���>�Ӗ�X��fۚa�n��Ek�i���f�m��iT�󱻝������������T��QL�Ȟ��:�.wXlJ����|��F��l�;��+�[�\Oi�څ*;����}�Q(�\��������<��?��2����iuE�#�67(t��==YTH��hIW���.(i�lu�ЂR�4�@cmbm�]Rj����aGkuܝB]�LC�m����w��6�ن�KDTx9��4��M,�y����Z����s_���8��&��tJ�nx�v	;��[�+���z{�����{��;P�5<�7]y�`�.f�촟���6tR���Kh��Bvz�}��=���vq_}�2u�K��Oz�u���� �{ݒ(C�K�H~�� I���$@s� �@�ip���O��@�T�):ҟP��	�σr��GH$�)�ZVh�I�E0���?���3Y	��`�(�H���9�K�纲V2R"���A~�
��b���@t��������=+�A�"��!0J10Tc��D�(9Q��HG3�1~TY"�\���OD�"�R"��U���<��6���ul��dYC/b+���d����2�w���HIIS��S%��H�����g�N����O
�J?�Җ�l�X��:V�M�����\����G4iM�Ts��d!�AN$�R�]�d$���c&��b:ө�u�
��6z'<��/n
�SR��ə�k�R2�L(I6O�E��	e�3HT�c�T�:���_��쐼ڙϊ��R�A��IT�Tn����QFvS7�ZI��їZ0CV\�Nk*Q��T�N�hK��M^�T�C}*g��L��t�J�D��Է� gK$O�w"�5R_�����;⴫@Q+��V�^�,��S����G��k_{�׼o�d��Z�*��u4�ulc9�ǜ�
q�5Id���u��,F%׾:ֳ��Ij�����B��}llKZ������Xk���d�Ʃ���YY׺궊�-oxƳ�햷��m�Hά�K�%��غh^wP��.�����zo��{^��^֩w��Sv߫���Q�-�}���wN����_��M�u��0�I	ʃwX��ME���i�ao�e6��⣍�a%�܉�b���-�'��̸�5�񍓚c���=Vݏyd��8��1���`�a+^r����'o�R.1�!h���]��}�d2B��O6����5�����`�<B*���m���l�ܞ�|^v'�B��| !�clip2gif 0.7.2 by Yves Piguet ;        � 	eye_ball  	@    � [n )    mm  368,222aa  370,222kk  366,222	straight  367,226  �GIF89a)  �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�  � ,    )  } �	H����*\�ệ��n�;  (V�(�bƄ1f��1�G��DIQ�F�)�I��K�Cj��p'͜;#�*T&Q� ��R�J�C�>�ڔ�ѝ%MbM�2�֮\�r�鵬ٳhӪ]˶a@ !�clip2gif 0.7.2 by Yves Piguet ;        � blink  @      Zh , $  2GIF89a, $ �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�  � ,    , $ � �	H�������B�>,�/��'�x1�F�-J|2�Ȅ%Cb$�Ҥ*O.l�"͘6ov̩S�A�4e
�Rh8�8g���t�P�E).��q�N�P�V��+׮[���Ju�ױg�rE�V�X�Sپ�ږ�ܰq�:����]�}�ū�(Y���i�l��AQ��'T��cz�hC�G?�:�J�GKwt�y(k�"�N�l��k�f�;�Č�}�$-�p�ȓ+_μ���� !�clip2gif 0.7.2 by Yves Piguet ;        � !coverup.gif  	@      5' �   �GIF89a�  �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   ,    �  � �	��� �{�b$\�Pὂ
cT)�� �*��H�(1FŎ-
,���ɓM�D)P>�e�<�a͒7KZ��eO6��TYR_����rd��S+\��*P>.z�,�H�եX�r����U�Z��}5*ԧMݲ�U��.v��풔.>����嫏�]�<�"� !�clip2gif 0.7.2 by Yves Piguet ;        � heart  @      � D    �GIF89a  �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�  � ,      h �	�GP������C�:�Q�D�^��q�����82dɇ/n<�P%6 (]�t3�̛Y��SfE�.+��0�śB3"5��'S��B�(5bäU?J !�clip2gif 0.7.2 by Yves Piguet ;          	text.gif  	@        =G �  *GIF89aG� �  ���   !�    ,    G� @���������ڋ�޼ː 0��H*hi���)ٮ�<�7��wjˡv�a/��[!"�V�c���ڔ������Sz=&��N�׈����$��j�a�����'����C�����X�v�1�hy��զE��t�tķ��鴩c�j�ә�+;K����V���i�:��z嫪t�V�{D��P�'�J��KX�̢|�.�(\;�y;���4�����mm�L����*-���=�"���5��{1�ĉ��`c�����?�(�k��<!�L(ƛF��(�|�̙>��mO�,�9w�ӭ}�8s�3˧Q�H�\"�ʎ4��J�+#�[�Z�
6�رd˚�`х���R�hJ���ڕ'p)ۧ������]�x%��3�8c�mUз��2�V� 3)n7+uq����TqM�:u,���BҲ$h��5e<D�G����K�`�2��0J�:����3@fy;c���PG*�v��ܻ{ۊс>?�Yh^�ڞ��?����a;.}�.�~�}E
���t���y�`�
���~�I�s�)�r>�F,���R���?�s�Z���߂*�x���vJ~:�Ǜ��������c�>�s\������������!�?>	��b��"��S6�����z
Ue�|�7tQ��&J��^��Qi%rl��e�Sa�h����7�7�ko�f��f萀�c{!��a�u�����]�(��~
�UNRS��V���^DD��~�׋�|�����k����k���R�^��r�R��ȊF��\���A�����k�kvv��8r��oL�ym���!�^zr6no�i�u�ɛ�~Kګ�Mfc��j�[[��T���+0���k	���g�-E�T��Ip��>�q�Pjǭ�%�[$�Y6i��*�����ݘ2�J3{R{���b�r�<:�p8��<��Xt�HF@��LϼQp%Cb��ݾɆ�N�1/�F7���~��*A� s�e��j�5�<��tߍ7wIs@o�]�$�KF�t�-[j�RۼtS�������y��4%��i���}yE�k=TЂ3�1I_��(�n��rO:{��h�ܙ�� C�>��Af�F�E������-�u?iŚ�e���c}���訃r[5n{{������@/~�G��;�}þ7��b��$����E����c%3l�W�F�%�dɫ�
f@N90��$ȏ�o�� M�'����MtA�ǌ ���Z��I��V�)��]vQa�x�j�TN{����3�1H�?�I��
#^�����PS��;���/�ц_|�4�.r�7���޴� >M?�57D5�q�t����<�)���s��@�Q~sZ�
���d.��uPEv�p�*���J:k�2����GCf%~�,��H���f~D����ķ ŕ�K� �I��
�N�!K�@5�KS</5y*�gsB�Owɷ��r�#L�
��ˉqx3j�+�Y��;\�V�Ihb�����Dʒ�$x����NHN\��e�t�,J̈́΄�k�ܦ>=i0L�c�S���	��i-:�<WE��N�.4F��HO�R���x̌�JS��޲�8�गγe�@0��O���>��8L�zt�T�$SG�����)�!���Fx��G�W��&�Mt��jP��Q�pR��-��VP8��l�$#�-�P(c0��6>8lv5�F8AM4f�w��b���ǰ~u�!� Xk��}D&�)���jx͘R�O�������TM��%n�_?�iS�ujj�r�:��dZR�"��a8�D�,��mh�&碶	�-�pK� ^�Q:e$���,؞�%{�4��%�"c��6��Tf�k]�6��B`1z�i�������U�vu�?�Jt�Rp�4�}�a_�صf74ӵ.O��,�pÏgp�%+ОԘC��go���ɖ��,OPZ���'ﵰ^��&����MG�˨���o�����q���fy�Pd`	��	�q�ZW�k���b}�� X�Hu�?Gb�J��]n"A4`�����Z��6J�6�ygf��3ˤ{ݽ�8����ڪ��椱����g$�7�S���/]/Q�O�í�V?-�
�no|��$E�*��Y�}羨�״N)t�����ɌƱ�MA�ȱ0YqO�wb;�y��,kSA�M�x�TwN�t��E2����l�a%���P�S��|L1���/V6����+K��f͘#�h�2ͮL.-�
h��{�E��W^+��?��Q"/h��4�/�qt�N�MSl�_�RA>(k�d+����:7���2�=^S�����Wj���0�\!�ބ���u|�s��P7�O:ѻZ�;���3D[�����X��"!�ډ��M?������8Ȭz�l��sr���Q�CJ�:̋>/��~��M��P�����n�m�w���4��`�g|��BtP񊚐u[9Zۊ�?S��挗M���x��%샿p�ť�w����Gr����Ym�gב��/8cI:*�˧\g��ֱ�%��t�D���&m#H�x�\1�+���v�1�]��5�ul����C��������0��r��zU�7�FnXxS7��j��#���u��z 3r/@��=�|�f	�x��{�&y��e�4i�KʢCk&~3�g�~>���f|FF�A��w�RFe�ͥiO�:n�g�r?�td(I�[�R ��p�7_z�hT{e X}��k�F�tՅ�U���~\��Ey>�7�����N6� h�w��y��{ȇ}���(��i�W��u����d>�&%"�pHWZ�w+�c7�lh&VA��k$o��w<�s0�ty|��i�#	Sv��|;�RvGm�35�2�(2UO�Y"\/ab4D���J��|[QH��,V�FvM�Y��q�eh��w���H�@a(x��~)HshX^�8#T}^XX3���X��cT�(���3�X�CW�X[��d�ȀZ"��uri�4f��`�'1�n��k��{~�Q.W �w��ŉV�q3�\�b���y �g��vYǋ�t�2I'9��Q�pw=Id1��gDXB٧{�u�7Z����V1o�(�V8o��l$�W��F���4y7=Ŕ^#X��t��+�����(�c逮D��hX�����/�d~�g�(s��q�W_l�o�'MY��ᐉ�{̥T&�18{j\_g�fzH��2�NѨS�9�#O��,�焈y[�R�n�x6�[��C���D�D�Z�'<Ҵ��)r��ap�x�"I6Uc�;���145vd���s�$��8���D��d)�ӹ-��D�7rhI�����f���qNɘVU����&�8�	V��nayZ�Ɛ�d��j^17��3g�Қ�I�gJ^)�tډ��xA&WpԙJ�Õ
��3�gZ�
�m{x��������Us�<�yU'�Ay�7�f�Y� H��%O1Ʉ�i}wx�C��SH��ח�(�A*�Cj;s�� :i$�Ds��j��/;U^�^T���(�ֈ�BUf3���y�5��M�I������{Ԣ˦��PF*�[�9(�t�|���Q�*Q�O�^�~��j��W혅�XGiJ�Z  !�clip2gif 0.7.2 by Yves Piguet ;        � k   C      d Y  ]     #o �o �o �o �o �o �n �n �n �m �m �m �m �m �m �m �m �m �m m wm qm om mm gm em cl ak _i ^h ^g ]f ]f \e [e Z  � m   C      o M   j     p �p �p �r �z �� �� �� �� �� �� �� �� }� {� s� k� e� ]� W� U� T� R� Q� P� O� N� N  � a   C      n M f i     qo �o �o �o �o �p �r �s �u �v �w �w �x �y �z �| �} � �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � ~� |� {� {� y� w� u� s� r� p� p� o� o� m� k� i� h� g� f� e� d� c� a� `� _� ^� \� [� Z� Y� X� W� V� U� T� S� R� Q� P� O� N   	text.gif  	@      I � � +  �GIF89a� + �  ���   !�    ,    � + @���������Z@�f���]�wvh���ǮT����^������>#�1��Tr$[�k�pJ���)�ܮ������N/d�Ė����V�+�}����8EGxg����w5x���%HYiy�����'��9�6z6�BeTU�T�HGC�d�@[�������k<ܸf����%y�K�'$�SH͋ȡ����-<N^n~���������L�=DR۰�g�&X}���G�
�gPeaU��}v�"����|�4:�
�4�y$�H�$;���d1�@)���QǙ(F���߾$BS�i4�ҥL�:�w��š&p��E�j��>�R؍jKY	K�u���=U�Ҋ�����hn[�m5�s)b%�rjǿ[	�Z#�K���FA�_Q!jkYF�I����J�����ѤK�>�:��լ�  !�clip2gif 0.7.2 by Yves Piguet ;        � 	exit_box   �p @on preopenstack
end preopenstack

on closestack
end closestack
  
        black � � �  white    � W�)                �    P�local subtract_amount, stack_loc

on preopenstack
  local i
  hide this stack
  get the loc of stack "metacard demo2"
  subtract 220 from item 1 of it
  subtract 77 from item 2 of it
  set the width of this stack to 1
  set the loc of this stack to it
  put item 1 of it into subtract_amount
  put it into stack_loc
  put the loc of this stack into stack_loc
  set the width of this stack to 1
  set the showborder of this cd to true
  hide group 1
end preopenstack


on expand_stack
  local total_time, start_time, t_rect
  show this stack
  put the milliseconds into start_time
  repeat
    get (round((the milliseconds-start_time)*1.012)+subtract_amount)
    if it < 1 then put 1 into it
    if it > (506+subtract_amount) then exit repeat
    put the rect of this stack into t_rect
    put it into item 3 of t_rect
    set the rect of this stack to t_rect
 wait 20 milliseconds--to let the window system
--catch up
  end repeat
  get the rect of this stack
  put 506+subtract_amount into item 3 of it
  set the rect of this stack to it
  send "bringingrcs" to me in 100 milliseconds
end expand_stack

on bringingrcs
  lock screen
  show group 1
  set the showborder of this cd to false
  unlock screen with visual effect dissolve fast
end bringingrcs

on put_away
  global return_to
  local total_time, start_time, t_rect, t_orig_rect
--252
  lock screen
  hide group 1
  set the showborder of this cd to true
  unlock screen with visual effect dissolve fast
  put the milliseconds into start_time
  put item 3 of the rect of this stack into t_orig_rect
  repeat
    get (round((the milliseconds-start_time)*1.012))
    if it > 506 then exit repeat
    if it < 1 then put 1 into it
    put the rect of this stack into t_rect
    put t_orig_rect-it into item 3 of t_rect
    set the rect of this stack to t_rect
wait 20 milliseconds
--to let the window system
--catch up
  end repeat
  get the rect of this stack
  put subtract_amount+1 into item 3 of it
  set the rect of this stack to it
  close this stack
  wait 100 milliseconds
  send "spin_logo exit_group" to cd 1 of stack "metacard demo2"
  visual effect iris close to black very slow
  put 17 into return_to
  go cd 18 of stack "metacard demo2"
  exit to metacard
end put_away
           �)  �  �    i       ����1  � New Button  B
           �)  	�         	  � 	       � New Button  B
�on mousedown
  global normal_name, depressed_name
  show btn "ok_depressed"
  put the long id of me into normal_name
  put the long id of btn "ok_depressed" into depressed_name
  insert script of btn "button manager" of cd 1 of stack "metacard demo2" into front
end mousedown

on mouseup
  hide btn "ok_depressed"
  remove script of btn "button manager" of cd 1 of stack "metacard demo2" from front
  put_away
end mouseup
       �
 P   �         	  �   � ok_depressed  R�       �
 P   �         	  �  � new exit text.gif  	@        �  oGIF89a��  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�    ,    �� H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��M��r�Ƴ�������+��F�!DJ��R�N�t���G�T��U�ׯs
�9��àB�z-�Ԩ@�X�*T�T!U�]��݋P,�yf��G8!Zx�
"N`񻠊�5(�],ɒbx�hQ��N �-�ѢO�f*0�h�HY��T�#�u4�5����P����x�������պ��8��*u W�\�}�֭�����>��y�:�$(/���x�X ���-�g~��5�_k�1fZ��y�Vi�-hZ���ԃ��&a�q��[RX��SO�f[nǍ8"r!7�[q�X�R(F�bwՁ�m��xU�XQ�cU��uސr���Y X#�`�Q�bAe}R
��E9`�r��=�i:x��v��j$b�m K#�����}���,�	g���]Q�xj�]�y5�cyDF:���%O{�5ٔ����|�A�_P��wPg���Y}�FX�PgFX&��6X�hL=8'Bl���n�Ix�R�H�t����!n�㞆
IWr[Ww�b#�R�A�)T͓i=�Y}�Z	CA���f���Y�:���+[�oM&�l�KZ��5��N��[sv��hA��)���"Z���q��5�r�qM�"i) ���иQ�X��}z��	]��Q]����ɛ=�fRuʩTQ�r�S�	<p���{�t�Ȱ�L�(�S�ָ0�/�5y^���d�D�<��'W3�a�z����	X7e���_����+����s�>��Y�D�4T@�V\RJ=.᯳W�q/�l�)��lo�F[�t䑎#��Q�h٬�����R�������T������O=]�i<n'��a������:�<��U�X��u����8�ݗ����+� ����k��Y�����k�y8�r(���S��� D�t�'��\�:�Ɏuv���H<?R��AH��rA��&ҟ��.A`��0H����(L�
W�����0��gH����8̡w��������H�"�HL���D���P���H�*ZQ%O�����.z�!�+Hb���1"%;�RF���pla	2G2�q o|H��>Z��l|cW�3�d�4� iG1�Q��D�#�HII�1����&��H6������(C��J"2��4H)�Bҕ�����X"$���%M:)�Q�R��&(}��R�Җ��(MiJ]:�/��%!g��_
���l$�9�d^����3�	�h�R��Tf,��JU�Ӗ�\�;��Mr�ڳ��%3��I~���\�9:Pk4��L�Lh��K�����gC	Ј���t�F3J�Yb��-J�q���(UI7W�Җ���0��Lg��l���
�(Nw�Ӟ�4����P�JԢ��HM�R��Ԧ�4�N��T�JժZ��XͪV��L�N�\U�N��M�t��Yc<}W�RBR�a�"6!"Ҳ�U�3ad8�)θ^ј�|�AS��t&2�ul ����B�'�:�Z��fԠ�<$*�҄������A�)LqJ��w�l۹����զ���Z_����U��|'1w[X�V6����Nq�N��լ�|�q�i\�>T��$�k}Eo2׶ȥ�Z�
���֘��g5�Y�F�����d�;й�ֺ�(h=�K�w��=�XAz��R�����e/FC
���eln|��7�Z<��Z��B8�F�s/���r�� ��GL����(NI7�{�O��u�Hxmڑi���1^�?2�kS��1˻c�Y"�$�z��#��������l`�NY���.t-Y��6������	K�I�f���1A|X��2�N~2|�iNҦR���g_)�Y�V�t�l�o;��:4�\�o{�k�8?���U2��۹F�����ӫ`�t�?ƴ]	��-����NkA׬N�����]�yk:K4ʦ��aÛi,��c~���j0�Y��͵��O��z��k](��Ɲ��l[3���mo���g���zV��+Y�s��!�lh�hf��i��b��z����N0���B����p���Ȁw�ɟU����6�y� �-�U�bN�n���ˆ?^T���(O��W��ܯj��1r�8�$�v�oNWe�{%9/i[c�s$��"ͱ�IRs3��O��нLuCN��f�ũ,����f��F��p������}�H��y�y���[�9�vG{د,s"�2��f������V����{�s;xRƛ�����	^��3���t�7�uk�ޞ߶�qM���v����jbo��.��Lij���xo��k�k�w�絅u�+Wi���V'>j+�^����w���
WW��w�����W���c�ۻ�w�w��%s��g/?��j|�;{�Ag�;�?lћ>������_�����W{�FV��K֦z:�x��C�g����Gd�Z�~��m�����ZWD������f��x��s}hE4�g�xbfvvM^Vqs�Q�ovp1c�l'p^Wujw`��_U�e�FMu']gv1xQ
g��fYƀ/�WY��gƅ^�~_�b8�dX�fx�)erx�z!�Fn�s �6s�v�?wG�r��leUcQ�Rl|=��t51c�(cHGa56v�vW��:HW�ׇ�8$jwc�v�}swwU'vGv��~�u�1��٧w��h����xe�7�0cw7uC�hY��M��`|'f�z�tg����n��j��{�ex5h�'k���	�{��z�ƌ�6Y��i:�x������5�h�h�|��lp��Ry�f���M&4V��ƍ�l���hVѶi7�]�({>�{Xm���d���Ǝ����z������M�~ܗ��5~̈~��ӕ|��l f���}��y"I��R1I�ۨ��o��{ט�jXg6)Yْ��!y�AGsy��h�PV�H�*^mx}��{�m3�������};�����~c錺7��g�,h���֔ֈ��q'8�l)��H�h�[֏ ho޸�x�yN�Ɂ�(i	�W�y!w�8^	�9�we�_H�\�Gw��Y�g}@x�8��XGvv�����I��ؙ��uUX�Y��9��8y�(������VA��I��e���h�s�iR�ij�S�؜�9���Y��y���CE��H���Yy�n9d"��H�ok(c˩�;'yh�jeÝwd](�����t���9�����^��ȹPd6�mՉ�)��(��q�v���j}�xkdy�H�c�����+�����u���w4{�Y��y�|�|v��/�u�)� �y�G�����n������8h���YwDځ��muɣ�ɍȤ�{zP�l�ؗ�؎EZyK����Ć�sh{*��?8��w�_�"(�~yg�f���<�i���w���x�U����j�n�צ��(ȓ�I���h�b秓%I�׸�i
l^�l����������u�q
��tG�k�~N�c�זb��hJ��v{�w����*o���r:�q�}���XJ���އm\	�(����AV�a*|�&�֦�ج�o���b��M�}^zfsf�(���tЪ�,XgH��Ƨ�
�n�X����u7(��9t�9���p/�?����e��v�����{���p�Y��h�*��	;����LH��z�W��d�+$���q$�q�d�\��/�wU��9�4[�6{�8��nɲ *�4ǳ�م@K�C��EktZ�:��
z��X��8�Z���{�Zx���R�����������y�Ȩ§�Ԋ���O>�dgۥ��0Ȥ5˫�֤ˆ�݊�9��ŭ��p:�2��x�z x�Է��Z\���ǒ�
�����
�m������˫l��+��*����ڷb;��J�<�y��
���ys��n˘z����yuU�=�������������
�o�w��X��6G�&v��kT0���۽������;��[��{�蛾껾�R�J��I�F�S�t�y��9�;�J�y5���������k�-q�6��ԡW8��H��t�g�h���]S+�lF��)�̇���Ch�ȷ�=�yp�hDx�����_�7���g�K�%l�N���;�r+����D�x���V5w��J�d����s���F����������I�\ą�l:鴑+�;��J^��y�k��^�W�ʎ+^�������f��{T���Hl�YL�����ڶ^���چ�;��[��4���iM)�Ie�VL�o� ����=
hI��������}`����C�b�z§Y�7�	����	����:Q���z�L���ل[��W��|ٲ���\(��$�7��SE�����������Lr,;��Ζؑ�l�D�Qge6�����ڵ����ξ�z�k��Yq���u��
�u��匾�}�e����O\ZjV��j�m��J�|M�#٪�|����l�π;�]�e˸�����ч��閷���'-��LR�~Rv��9�&��j�5�F�뢸�t������e�k��ȼCMt����<�Fd�X�S=��[��`�b�I�P�f}�h��j��l��n��p�r=�t]�v}�x��z��|��~��j�e-��@؆=؈]؉}؊�،�؋��c�T�]ٖ}٘�ٚ�ٜ�ٞ�٠�ד=ڤ]ڦ}ڨ�ڪ-E4�ڮ�ڰ۲=۴]۶}۸��>��9��@��׼ۤ��9��=���C��M�˽C͝�ϝC�}��}C�]��]C�=��=C�ݜ�Cፆ���ƽ���S�m��-G����S�M��]��}S�-���B����}B�=��=�^B���A	�r�;�r�;�r�:�r�����.tNR.�>�#�1'��%.�)�--n/.)1�j3��!�S7�P5.g+�;�q���`��Ι��D�(��{���+�_��r�$&����m���Z��\��^��`歽�d^�f~�h��j��l޾6��Qnኘo�H�s*��Vr<�,�t2N�U��~�p��_JY#
�x�vI�pk�=�6�s�Q�V��G�5x�Vׄ*���>�F�fTN6��ɩ������^\Z�T�����N�+x�(�jKǤgQ���.�{n��n��<����8��g���W엫e0��6�Ɉlǳ��{:�4}~�`���HȊ���\��n�՘�y�̬m����m\�������φ^r�<|x����;��[��,ݮ�ô����B���rG���*�u�ˋg��R�8��|�Px�#,�;QIhr]�|�
��X_�v�엜�|b;��>_b���}d�WMy ?�J����-f�K������^�l�U����+���g��M��H�|�w�aw�{7�),����8*��h��빅�8��N�����>�w*�xF�	֫���h�oпT�e����Ul��'Ĺ�j
��ǜo���ɦ�B�E��`�����?����E���o��g����f��p)�dI����V+��Ʈl,�M�ؐ����l��X���ҝ��G��-¿.��	��N�u����u�:��Xϧ.��V�F�����������?��_��? !�clip2gif 0.7.2 by Yves Piguet ;        �    	D   $������  ������  ������  ������  ������  ������  ������  ������  ������  ������  �̙���  ff����  ������  ���̙�  �̙���  ��ff��  ff����  ���̙�  ffff��  ������  ������  ��ff��  ������  ffff��  ��ffff  ��ffff  ����ff  ��ff��  �̙�ff  ������  ������  ��ffff  ��ff��  ����ff  ������  ������     + �} \  lk ��      � ��
   � ����
  ��   ����	������


���  ��	����� �  � �  � �  � �  �  � � �   � 	�	�	�		����� � �   �   ���   ���
�  �����		� ��
��������
���� �� ����� �   � � �  � � �  � �   � �  � �    �	��
����� ��   �   ��� �  �����	  ��� �����	������



��� �� ���� �    � �  � � � � � � � � �  �  �	�	�	�	�  ������� ��  � �  � �� � 
   ������ ���� ���	�����
���
��
�
��� � ����� � � � �  � �  �  �   � �  �� � ��	�	�� ����
� ��  � �   ��   � � ���	�� ���������			������
��
����� � �
  � � �  �  � � �  � � � � � 	    � � � ��	�	�	  �  � ������� �� � 	    �   �   ����� �	� 	����			�����
���
����� � ��� � � �  � � � � �   � �   � � � ��  ��	�	�   � �  �  ������ �� � � � � �    �   ���� �����	
��		�	���
�
��������   ���� �  �  �  � �  �  � � � �   � 
     ���	� �� � � �  �����  ��   � �    � ���  ����	���	������
�������
�� � � �� � �  � �  � �   � � � �  � ��  �� �	
	   � � � � � �  � �  � �  �    � ���� �����	�	����			�����

��
���������   �� �  �   �  � �  � � � � �  � � �  �� � � � ��	 �  � � � �  �  �   ����  �� � �    � � � ������� ����	�	�	���					������
�����	��� � � ��   � �  � � �  � � � � � � � � � �� �  � �� � �� ��  � �  � � �� � �� � �  �  �  � � ��������		�	���				����
�
��

�
������    � �  � �  � � � � � � � � � � � � � ��   �   ��   �  � � �    � � ���  �� � 	    � ����	���� �	�		�			��
					�	������
�

�
������ � � � �  �  � �   � � � � �  �  � �  �� ��   � � �� �� � � � � � �  �  ���  � � �   �   � ���  � �����	�		�	����	�
				�
���
�
�
�
������ � � � � � � �  � � � � ��  �  �  � � �   �   � �  � � � � �    � � �  ��  �� �      �  ���� �  ��	�	�	����	�		���
�
���
������  � �  �    � 	    �  � � � � � � �� � �  �� � � � � � �  � � � ��  ��    �� ���	� � ���				�		�����	�	��
��
�
���
��� � � � �  � � �   � �   �  � ��� �  �  � �    � � �  �  �  � � � � � � � � � ������ ���	��	�		���			����
���
��
������� � � � � �    �  � �   � � �� �  �  �   �� �  �� �  �      � � �� � �  ��  ��� �� � � ����	�		�		���	�	
				�� ��
�
�

��
�
�
� ����� � � � � � � � � � �   �� �   �� �� � �� ��  �� �  � �  � � ��  � �� � � �  �    �� ������	��	�		��	�				�	�	��
�
�
�� ��� � � � � �  � � � � � �   �  �� �  ��  � �� �  � � � �   ��   � �� � � ��� � ����� � ���
��	�	�			���							��	������
����

����� � �  � � � � � � �  � � � � �  � � �� ��   � � � � � � �� � � �  � �    �  ���� �����	�		�	���		�	�	�			�	��
��
����   � � � �  �  � � � � �   � � � � � �� �  � � �  �   � �   ��  � � �� �  �  ��������	�		�		�			�	�	�	�				�����
�
��
� �����  � � � � � �  �   � � �  � � � �  �   ��  � � � � � � � � � ���    ���������		�	�						�			�		���
��
��
�
�� �� � �  � �   � � � � � � �   � �  � � � �  �� �   �     �� �� � � �   �      ��	�����
��	�	�	�	�			�		�		�					�	���
�
�
�

��
�� ��� � � � �  �  � � �    ��  � �    �   � �  �� � � � �� �� ��  �� �  ����	����	�	�		�						�				�	�����
�
� �� ���  � � �  � � �  � �� �� �� � � � ��  �� � �   �  �  � ��  � �� �� �  ����������	�	�		�
		�	
			�		�	�
�


��
����� � ����  � � � � � � � � � � � �  �� �� �� ��  �� � � � � �  � � � �  ��   �  ������������ 			�	�
			�						�		���

�
�
�
��� � ����   � �   �  �  � �  � �   �  � �� � � �  � �  � � � �� � �� 
   � 	   �� � �����			�						�		�	�	�			���
�
�� ��� � � ���� � � � � � � � ��    � �  � � ��  �  �� � �  �  �  �� � �� � ���  � ���    ���������	��	�
					�
					�					���

�
��� � �	��� � �  � �      � �  � ��  � �  �  �� � �� � � �  �� �  ���    �� �
�����	�	�		�	�					�	�	�			�	�
��
�
�
� �
�� � �  � ��� �   �   � � � � �� �  � � � �� � �� � � � �  �  � �  �  �� � 	  �� ��,	�	�	�	��				�		�	�	�				��
�
�
��� � � ��	��  �   �  �  � � �� �� �  � � �� �  � �  �  �  �� �  � ��    ��� � �������	�	�	�	�			��		�			�	
		��
�� � �  � �  � �	��� �  � � � � � � �  � � ��   � �    � � � � � �  �  � �� �	    � � �	�����				�	��	�		�	�	
			���
�
�
�� ��   � � �	�� �  �  �  �  �   �� � � � � � �  �  �  � � � ��      � �� �������		�	�	�	�				�			�				���
�
���  � � � � ���� �� � � �� � � � � �      � � ��  �    � � ��� � �� �  �  � � ������
��������		�	�	��				�	�			�	�	���
�� �  �� � 
    �	����  �� �   �  � �  �   �    �� � � � � � � � �� �� �� �  � �����������	�	�		��	�	
				�			�	��
�� � �� � � � ��	�	� � �  � � � � ��   �  � �  �  �   �  � �  �� ��  ���� �� �������						�	�						�			�				����
�

��� � � � �   �  �	�	���    � �  � �  �  � � �� � �  � � � � � � � �� �  �   � � �   ���	������	��					�	�	�	�				�					�		���� ��� �� � � 
    ��	��� �� � � � ��  �� �   � � � �  � � � �� � � �  ��  �� �	��������				�		�	�						�	�						��
��
���  ��   �    � �	�� � �   � � � � �� ��  � � �  � �  � � � �	    � �� �����	��������				�	��							�			��� � � � �  �     �	�� � ��  � �� � �  � �   � � � � � � � �  � � � � �� � ��
�����������			�����			�		��	�	�		������
��� �� � �  �   � ����   �   � �  � �  �  � � � � � � � � �  �  � � �  ����  � ��	�����������				��	��	�		�		�			�����
 �  � � �  �  �   �	�	�  � � � � �� �� �    �  � � � ��  ��   �� � ���   �������������			����
		�	�	��	�	�	�						�
����
 � �  �  �    � ��	�� ��  � � ��  �� � � �    �  � � � � � � � �	  � �� ����������������
		�����	�	���	��			�	�	�
��  � �� � �  �   �  � �		���  �  � � � � � � � � � �  �  �  � �� � �� ��� �� ����������� 			�	���
��	��	�		�	�			�	���
�� � �   �  � � � � �	�	� �� �  � � � ��      � �   � � �  �  � ��   �� �  �������������				����	���	�		�	�	�		�	�		���� � 	    �  �   �   �   	�� � � �� �� �� � �  � �  � �  � �  �  � �� � ����   �� ��	�����������
 		�	����		��	��		��		�	��  �  �  � � � � �   � � �	�	��� � � � � ��  � � � ��  �  � � � ��  �  � �� � ��	���������	�	�	����	����	�	�		�			�	�		�
�� � 	    �  � � � � �  �   �	�	����   � �   � 	    � �� �  �   �   �  � �  � �� �� ���������������� 		�		������	�	��	�			����   �� �    � � �    �� � �  �		�	�� �  � � ��  � �    � �    �    �� � �  �� � �   ������������			�	��������	��	�		���� � � � � � �  �  � � � � � � 	�	��  � � �  � 	    �   �    � � �  �  ��  �  ��� � � �������������	�		�����	����			��		�� �   ��  �   � �  �   � � �   � 		�	� � � � �� � � � � � �    �� � �� � � � ���   �� ���������	��				�	�������	��	�		�	���	��� �� � � �   �  � �  � � � � � ��	�		��� � � � �� �  � � �� � � �    �	� �  ����  ��	��������			�	�	�����	���������	�	��� � �  � �   � � � � � � �  �  �  �	�	�� � ���� ��  � �� �    � �    � �  � �� � ������ �  �������	���			�		�������	���		������  � �� � � � �  � � � � �   � �  �		�		�� � � � �  � �� � �  �� � �  �  �� � �  �� � ��  ���������� 		�			�	�����������	����	�	��� �   � �  � � � � �  �  � � �  � 	��	� � �� �  � �� � � �  �  � � �    � � �� �	   ����������	�	�	�������	��
��	���  �� � �� �   �  � �  � 	    �  �� ���	�	��  � �  �       �   � � �  ��� �   �   ���������	�	�	�	����������	����	�� � � � � � � � � �   � � � � � � � ��	�	�	�� �� � � � � � � � �  � �   �� �� � � � �� �  �������� 		�	�	���������������� � � �  � � ��  �  �   � � �    � � �	��	���    � � �  �  �  ��  �� ���   �� �  �������
 �	�	�����������	������  �   �  � � � �  � � �  � � � �	�	� �  � � � �  �   �   �� � � � ��� �� �  ��  ����������			�	�	����������������  � �   �   �  � �      � � � � ����   � �  � �  � � � �  ��� � � � �  ����������  	�	�	��������	�������� �  � � � � � �� � � � �   �   �	�
				� � � � �� �  � �� �� �  �� � �  �  �	   ��������� �			�	����������	������� � � �  � � �   �  � � �� � �  					� �    �  � �� � � � � �� �  �  ����������
 	�		���������������	����    � �  �    �  � � � �  ��				�� � � � �  � �  � �� �� ��  � �     ��������  �			�	�	���������		�������   �    � � � �  � � �� �  �	�	�		�  � � �    � �  � ��  � ��  �������� �� �	�			�	�������������	�		�����  � � �  � � � � �   �	�	�	� ��   ��  �� � ���  � � � �	� �������� 			�		�����������	�	������� � 	    � � �      �  � �  	�	�	�� � ��  � � � � � � ��� �   ��   �������   �
	�		�	������������	��	�		������� 	    �  � � � � � � �� 		�		�� �� �   � � � ��� � � ��
 ����� 			�	�	��������	�	�	�			�	����� � � �  � 	    �  � ��  ���	�	���  ��    � � � �� � 	 � � �
  ���
� � 				�		���������
�	�	�		��������  � �  � �� � � �� � 	��	�	� � � � � � � � ���� � 		� ��  ������ 		�		���������	��	��		�����
���� �  � �   �  �  � � ��	��	�	� ��   � � ���� ��				 �� ������� �		�	�	�����������	��	������� �   �� �   �� � � ��	�			�� � � � ��  � �			  � �������  			�	���
������	��			�		��������  � �  � �� � �  �	�	�	�	� �  � � � ��� � �	�		�� ������� � � 				�	����������	�	�
		��	������   �  � � �   ���	�	� � �	  � �� �	�				 �	  �� � 			�	����������				�	���		�	�	���
�� � � �� � � �	�	��		� � � �  ���   					�			  ��� �	��			����������	�		�	�		��������    �� � � ��
			� � � � � ���  � �				�		�	 ����
  			�	�	���������	�		��			�			���������	�  � ��    � � � �	��	�		��  � � �� �� �	�	�			�	�		�	��� ��	��		�������������
		��	�	��	��
����	�	� �� � � �� ��	�	��	� � � ���� �� �		�		�	�			��  � � 			�	�		������ ���	���	��		���������� � � ��  �		�		�		� ��� �� ��						�			� �  ��	��	����	�����! ����	�	�	��������
�		��� � � � � �	�	�	��� �  ��� �� �	�				�	��  �   		�	�	��	�	��	  ����	��	�	�		�	��
�����		���	�  ��  � � �						� � �  �  � �
	�	�					�			��� ����	�		������  ������			�	�	�	�����
�
���	�� � � �� 	�			� � � � 	
	�					�						�   ���  	�	��������������	�����	����������   � 
    	��	��	����� � ��	
			�	�				�	�" �  �� 	�	�		���
��
 
������		��	�	�	�	�	�	�����
����	��� ��  ��  � �	��		� ����  �� ���
�						��			�� �   �		�	���	�� ������	����	�	��
��		���	��� � �  � � ��	�	�	���  �� ��
	�			�			�	���  � 	�	��	�	���   ��
���		��		�	�������	�		����� � � � ��	�		� ���� � 
�		�		��
			���  	�		�	���	��  ��������	��		�	�	�	������	����	�	��  �� �   �			�		�	��	�  � ��
			�			�		�� � ��		������	�  ����	�				�	����	�������   �   �				�� �  � ���	�	��	�	���	� � 	�			�	���	�������
 !���	�
		��	��	������	�������� � � �� �	�			�	���  � ���
	�	���					� 	��		�		�	�	�
�  ����
��		�	���	�	�		��
�����	��	�� �  � �	�				�� ��  ����#	�	��	�	��	�					�
				��		������ � ��������		���	���������	��������� � 						� � �  �� 
	�	�	��	�		�				������	�
  ������		�	���		����
�����	���� � � 	�	�			��� �
  �����
	�	���	��			���������  ������		�	�	�	�	��	���	���������������  � 					��� � 	  ��
���	�			�	�	��   ���������	�	��	�		�	�		���������
������� 				��		� � � �        � Dissection_menu  �p8on openCard
  
end openCard

on preopencard
  global labs
  put labs into fld 1
  set the height of fld 1 to the formattedheight of fld 1
  set the topleft of fld 1 to 1,75
  set the height of this stack to the bottom of fld 1 + 2
end preopencard

on preopenstack
end preopenstack

on closestack
end closestack
       9 � � k             X     W 
Helvetica   �    	`           � k  �  �  �  �  � Properties of this object �iP(on mouseUp
  local go_to, r_ex
  global current_target, advanced_user
  if the num of words in current_target is not 1 then
    get word 2 of current_target
    delete char 1 of it
    delete last char of it -- the quotes
    if advanced_user is true then put "advanced_properties_"&it into go_to
    else put "beginner_properties_"&it into go_to
    if there is not a card go_to of stack "object_information" then put false into r_ex else put true into r_ex
    go cd go_to of stack "object_information" as modeless
  else
    get current_target
    if advanced_user is true then put "advanced_properties_"&it into go_to
    else put "beginner_properties_"&it into go_to
    if there is not a card go_to of stack "object_information" then put false into r_ex else put true into r_ex
    go cd go_to of stack "object_information" as modeless
  end if
  if r_ex is false then
    toplevel "object_information"
    set the defaultStack to "object_information"
    new card
    set the name of this cd to go_to
    send "preopencard" to this cd
  end if
end mouseUp
           �                  	       � Script of this object �iPon mouseUp
  local go_to, r_ex
  global current_target, advanced_user
  if the num of words in current_target is not 1 then
    get word 2 of current_target
    delete char 1 of it
    delete last char of it -- the quotes
    if advanced_user is true then put "advanced_script_"&it into go_to
    else put "beginner_script_"&it into go_to
    if there is not a card go_to of stack "object_information" then put false into r_ex else put true into r_ex
    go cd go_to of stack "object_information" as modeless
  else
get current_target
    if advanced_user is true then put "advanced_script_"&it into go_to
    else put "beginner_script_"&it into go_to
    if there is not a card go_to of stack "object_information" then put false into r_ex else put true into r_ex
    go cd go_to of stack "object_information" as modeless
  end if
  if r_ex is false then
    toplevel "object_information"
    set the defaultStack to "object_information"
    new card
    set the name of this cd to go_to
    send "preopencard" to this cd
  end if
end mouseUp
          �                  	     
  �  �7)p �on mouseLeave
  set the hilitedlines of me to empty
end mouseLeave

on mouseUp
  if there is a card (line the (hilitedLines of me) of me) of stack "labs" then go cd (line (the hilitedLines of me) of me) of stack "labs"
end mouseUp
         K �            Images 
  �  	H             5 �            Relevant labs:   x Labs  �p�on preopenCard
  
end preopenCard

on preopenstack
  set the loc of this stack to screenloc()
end preopenstack

on openstack
end openstack

on closestack
  set the lockCursor to false
  if the vis of group "ok_group" then click at the loc of group "ok_group"
end closestack

--The time taken to type long handler names is often made up by not having to
--search to find the name of the handler, i.e. its easy to remember!
on check_if_I_should_go_somewhere
  local it
  if the textfont of the clickchunk is "courier" then
    if there is a card the clickText of stack "Concepts & Techniques"
    then go to card the clickText of stack "Concepts & Techniques"
    else if there is a card the clickText of stack "MetaTalk Reference"
    then go to card the clickText of stack "MetaTalk Reference"
    else if the clicktext is "custom property" then go cd 35 of stack "concepts & techniques"
    exit check_if_I_should_go_somewhere
  end if
  if the textstyle of the clickchunk is "bold" then
    if there is a card the clicktext of stack "labs" then
      go cd the clicktext of stack "labs"
      hide group "ok_group"
      hide fld "background information"
    end if
    exit check_if_I_should_go_somewhere
  end if
end check_if_I_should_go_somewhere

on show_field
  global current_field
  lock screen
  put the short name of the target into current_field
  show fld current_field
  get the bottomright of fld current_field
  subtract 39 from item 1 of it
  add 18 to item 2 of it
  show btn "ok" of group "ok_group" at it
  set the width of btn 1 of group "ok_group" to the width of fld current_field
  set the loc of btn 1 of group "ok_group" to item 1 of the loc of fld current_field, item 2 of the loc of btn "ok" of group "ok_group"
  show group "ok_group"
  set the hilite of the target to true
  insert script of btn "act_blocker" of cd 1 into front
  unlock screen
end show_field

--on focusOut
if the short name of this cd is not in the target then pass focusOut
remove script of btn "act_blocker" from front
end focusOut

--on focusIn
if the short name of this cd is not in the target then then pass focusIn
if the vis of group "ok_group" then insert script of btn "act_blocker" into front
end focusIn
        ` H��         Visual Effects Laboratory      W Lucida   U 
Helvetica  U 
Helvetica  U 
Helvetica   U Courier  W 
Helvetica   W 
Helvetica   U 
Helvetica  PU 
Helvetica  U 
Helvetica   U 
Helvetica  $U 
Helvetica  U 
Helvetica  U 
Helvetica   U Clean   U 
Helvetica  
 U 
Helvetica   � Visual effects   P �on PreopenCard
  hide fld "click_to"
  hide fld "background information"
  put empty into fld "current_script"
  set the title of this stack to "Visual Effects Laboratory"
end preopenCard

on closeCard
  set the effectrate to 2000
end closeCard
           ��  >  �  �  �       ?  A  H  I  N  U  J  Z  r  o   Images   	P|on preopenCard
  set the title of this stack to "Images Laboratory"
  animation_setup
end preopenCard

local frame_list, frame_number

on animation_setup
  put "2930,2931,2930,2932" into frame_list
  put 1 into frame_number
  send "animate" to me in 800 milliseconds
end animation_setup

on animate
  set the icon of btn "animation" to item frame_number of frame_list
  add 1 to frame_number
  if frame_number > 4 then put 1 into frame_number
  send "animate" to me in 800 milliseconds
end animate

on closeCard
  --this method is much more brute force than required, but is a good script to use
  --when you have multiple messages and want to be sure of canceling them all
  --(thats if you've been too lazy to record their IDs as each is sent)
  repeat until the pendingmessages is empty
    cancel (item 1 of the pendingmessages)
  end repeat
end closeCard

local margin_no, the_object, margin_id, it, sum_type, validation_test

on Start_scrolling direction
  put the target into the_object
  put fld "increment" into margin_no
  if direction is in "updown" then put "topmargin" into margin_id
  else put "rightmargin" into margin_id
  do "get the " & margin_id & " of btn " & quote & "scrolling_example" & quote
  if direction is in "upright" then put "add" into sum_type else put "subtract" into sum_type
  if sum_type is "add" then
    add margin_no to it
  else
    subtract margin_no from it
  end if
  switch direction
  case "up"
    put "if it > 390 then put 390 into it" into validation_test
    break
  case "down"
    put "if it < -381 then put -381 into it" into validation_test
    break
  case "right"
    put "if it > 488 then put 488 into it" into validation_test
    break
  case "left"
    put "if it < -481 then put -481 into it" into validation_test
    break
  end switch
  do validation_test
  do "set the " & margin_id & " of btn " & quote & "scrolling_example" & quote & " to it"
  if the hilitedbuttonName of group "sync" is "Asynchronous" then
    if the mouse is down then
      send "scroll_update" to me in 16 milliseconds
    end if
  else
    repeat while the mouse is down
      do "get the "& margin_id & " of btn " & quote & "scrolling_example" & quote
      if sum_type is "add" then
        add margin_no to it
      else
        subtract margin_no from it
      end if
      do validation_test
      do "set the " & margin_id & " of btn " & quote & "scrolling_example" & quote & " to it"
    end repeat
  end if
end start_scrolling

on scroll_update
  if within(the_object, the mouseloc) then
    do "get the " & margin_id & " of btn " & quote & "scrolling_example" & quote
    if sum_type is "add" then
      add margin_no to it
    else
      subtract margin_no from it
    end if
    do validation_test
    do "set the " & margin_id & " of btn " & quote & "scrolling_example" & quote & " to it"
  end if
  if the mouse is down then send "scroll_update" to me in 16 milliseconds
end scroll_update
           ��  Y  <  =  Q  P  T  X  _  `  b  c  d  e  f  g  i  Z  l  '  t  s  u  v  "  p  z  |  ~  o  . Fields   	P won preopenCard
  put empty into fld "clicked_on"
  set the title of this stack to "Fields Laboratory"
end preopenCard
           ��  �  �  �  �  �  �  �  �  �  �  �  �  �  Z  �  o  �  � Groups   	P Uon preopenCard
  set the title of this stack to "Groups Laboratory"
end preopenCard
           ��  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  o  �  �     Z   menus   	P Ton preopenCard
  set the title of this stack to "Menus Laboratory"
end preopenCard
           ��                        o      !  Z   Buttons   	P Pon openCard
  set the title of this stack to "Buttons Laboratory"
end openCard
           ��    o  	  *  +  /  0  Z  1  3   Scrollbars   	P �on preopenCard
  set the title of this stack to "Scrollbars laboratory"
end preopenCard

on closeCard
  cancel (item 1 of the pendingMessages)
  pass closeCard
end closeCard
           ��    
  7  >  B  C  D  E  F  H  J  o  Z
  �   �)p�on mouseUp
  local sound_var, image_direction
  if the hilite of btn "Play sound" is true then put "with sound " & quote & "swish.wav" & quote into sound_var
  if the hilite of btn "show script whilst running" is true then
    show fld "click_to"
    put "on mouseUp -- the mouse is pressed and released" into fld "current_script"
    wait until the mouseclick
    if fld "other_speed" is not empty then
      set the effectrate to fld "other_speed"
      put "set the effectRate to " & fld "other_speed" && "--the number of milliseconds the effect will take"into fld "current_script"
      wait until the mouseclick
    else
      set the effectrate to 2000
    end if
    if the hilitedButtonName of group "effect_type" is not "direct" then
      put "visual effect " & the selectedText of me & " to " & the hilitedButtonName of group "effect_type" && fld "effect_speed" & " --put this effect into the queue" into fld "current_script"
      wait until the mouseclick
      do "visual effect "& the selectedText of me & " to " & the hilitedButtonName of group "effect_type" && fld "effect_speed"
    end if
    if the vis of image "litter" then put "hide" into image_direction else put "show" into image_direction
    put image_direction & " image " & quote & "litter" & quote & " with visual effect " & the selectedtext && fld "effect_speed" && sound_var & " --the effect itself" into fld "current_script"
    wait until the mouseclick
    do image_direction & " image litter with visual effect" && the selectedtext && fld "effect_speed" && sound_var
    put "end mouseUp" into fld "current_script"
    wait until the mouseclick
    put empty into fld "current_script"
    hide fld "click_to"
  else
    if fld "other_speed" is not empty then
      set the effectrate to fld "other_speed"
    else
      set the effectrate to 2000
    end if
    if the hilitedButtonName of group "effect_type" is not "direct" then
      do "visual effect "& the selectedText of me & " to " & the hilitedButtonName of group "effect_type" && fld "effect_speed"
    end if
    if the vis of image "litter" then put "hide" into image_direction else put "show" into image_direction
    do image_direction & " image litter with visual effect" && the selectedtext && fld "effect_speed" && sound_var
  end if
end mouseUp
         � �           barn door close  barn door open  checkerboard  	dissolve  iris close  
iris open  plain  
push left  push right  push up  
push down  reveal left  reveal right  
reveal up  reveal down  scroll left  scroll right  
scroll up  scroll down  shrink to bottom  shrink to center  shrink to top  stretch from bottom  stretch from center  stretch from top  venetian blinds  
wipe left  wipe right  wipe up  
wipe down  zoom close  
zoom open   �    	`       � � 
  �  	          g �            Select an effect: 
  � current_script  	h          �] *        �      Show script whilst running `E�          � �              	     
   	click_to          �� �            Click to run this line. 
  ' margin_info  �p 9on mouseUp
  check_if_I_should_go_somewhere
end mouseUp
       Y � �        <There are many ways to simulate scrolling an image.  The simplest method to place the image in a group and set the group's scrolling property to true.  Alteratively, it is fairly simple to script a scrollbar object to scroll an image.  See the Groups and Scrollbar labs for more information about these two methods.        a     a      f �     �      �      � 	     3  BIn this example, the image is an icon inside the button.  The scrolling works by changing the buttons topMargin and rightMargin properties.  This would make it easy to move the button whilst it is scrolling, and would allow you to change the image to do animation - the new frame (icon) being displayed in the same place.        !     !      % A     f 	     o      t       �          $  }The synchronous scrolling is done by using an repeat loop to move the image while the mouse is down.  The asynchronous method uses the send command to send messages to check the mouse and scroll the image at regular intervals.  Examine the scripts of the buttons and the card.  Note that the up arrow uses a different script from the other buttons to provide an alternate example.        .     .      4 "     V      [ ,     �      �      �      � �  (    	`      Y �  �  > New Button B
         ����           	  � 	       < info button 1.gif  @      �� T E  �GIF89aT E �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�  � ,    T E � �	H����*\Ȱ�Ç#J�H��ŋ3jx��Ǐ C�I��ɐix�ǲ�˗0cʜI������S�<Y��Y��U��@�Y���g�y�����t�<��Xœ%U�QV@�ݬ��y+ �v[.[� ��V�ڷk�r�QW�ݻp��R%�*�Y|�h�y��J���?'�\�S֪���r�zիW�G�n���"��go�z���U�XM���T���R����ѣ��J5���3��+dɣu[�|w�������9k�~�����%�X���7��ӥ\�F*�|R�D6O#���W�mg�h@5��X)v�>����f�lX`٦�z���SNU��i�w�,���W�g�5��7�Rr(K<�YS�<�\�?D%7ہ]Œ��U��I�u�UŠW�w�K�"O,�D%U#��dMeW�Um�q�D^\a�?����f��U?����*|�#?�Yw`��}��zU�eC,��j�-(�*�|��w���*[=�)U�1�U��u��.2�����C�x�!r#���I�RWI�O�����>���x6� �;Z�d�
Ez�\,zf,Y��X�Y�P>��A�g&W�K#`��<->�Ы������?���Q7	���d��N�
������8-B��#��IU�,��hS�aGd !��L��Hr�ziYu�>�V�%���/U��B`r	[9�c����S����N���,/�X�%�jW�fڈO|����R�@]�|dعf�ejGqaM�-H�;j��WS��jM?��ҳ�C��+]dE"��u������Y�����=1��J�A�'�,YN��g��c�<E�� ^$ҊiP��;�Y����ꄲl�nm�}�a?�e�A�Te�#"0�� ?U㏳�l��;��2Z�U��6h��@c:�U�c�
��s">J�6��|�HiB�!�z��
Yɔ����(%9� �< ծߘ)2�*H ��7� �C�K�ӞfVlA{����� �R�	�W0�#�D� �����=�<.c���Ī��D�֨S	����\�W�Sr�ӕqu�p������`��q⥐��n"/��!%@?yFPV�@��dNU|e�y��qc8��L�(�I�:~�m���-PQ���
��
DȠ ���o�D��=�(_���z���#� ��(����6]Q����@�c�8DA�8�%h�ۡ^��Ӵ����z�"aG2=�J�vT:��dp����� *�L�V�@� �W��Ly.�7y(i���ָ{@2Z�Ժ~����4N�^Q�/}�� ,�f��CM&@�P�T8G4b����C��g�����M�H�n=�㇆BL&yT���#�P �n��`�6�.�ls��0&ĦD���
�J5C��L��$_����s35D=ô��XN���)t���= C�O�1�����	rJ��w�X�����b�f #��_��i��nI9?~�>�XT)4=D=?��>�s @t�lH)?Um���m�f���)EF����B]7��U+��ѩ�>%�e��P/u�eH"��ł�)4�mص
C�B�7��aX+����i���,������(>v�>~�
��O�����oe^��:Q�Y�l<z�����G"�+�2"*IK%T��3C4��_Z�C�F��O��E'A�V�."V`"�
d�u(߈,Vq����zs[[5�s�X��|��Pb�$�1Z+Ѓтzf;>�����:df�b�,��k�W�Q�A�!��d�O�;\,�������!U�~��\]A ��{#�� ��n��&(��F�������gG�+0�.�����|� �}�XA"ڏ�0�S��`Ɗ��K�v��H��KB6��_�u�+D���|r�8;c����:ğ{��V���wfK�29��^?����q�#�iU�gF4bˍ���s"v�S��Mg*U���&==�qO|`���1h��d&���<����"p�p���٭R5 �~������"��(�H�;.Q����8�<��}��C�0�ݻ���#�pADJ.�����Sw����x�w�C���"�}(���j�G6�(���5��oH����!bp��$>2J�B��o�.e�p�iۚ�K�L=�1,�>u_�Zn���)BB��\4�M���Z]-��琣����W���$s�xt&c�-/O�?X|��@��E;]�K]�+��ܪ���zUއ�Lb�����6�!�k�"<�@|A�⏾���~^ꂗ-l�[��bP�;?���Z��-QTa�Ї��C������"d�zTZc��C���?���X����w��������	�������&�8�X�x���
���� !�clip2gif 0.7.2 by Yves Piguet ;        = info button 2.gif  @      �� I Y  iGIF89aI Y �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�  � ,    I Y � �	H����*\Ȱ�Ç#J�H��ŋ3j�ȱc�/ C�I��ɓ(G6�r��˗0cʜI���/+��Z%�U,��d�
�3�5yB���T��UC�-kU#���2�H�!C�p2d)��.h�TQ˖ @f�=�v�ٳU�ʕ�eK�[b���a�b�d��'ЦG�ɒoh<�L�M�5�����6:����ӆb�	��lҝF'�BZY�ӡZ�N��Q�C�K5�:✱��zTvm˰���;^�U��'M��W�1����󨔅~��4V���y�nd�4�U_���?���g�TJ�T,���{�he�uKU�!����!�tu,vx�x�)Ē5� e�R���V�9��{�ȳ^e�@�J�\YhT;n�
#�R�q���d�%囋KZf��U鸣�Uq�#�r��* �xO<\��R>]%�h�ȔoZ��UUWi����r�����H���XU�5��4b�!i���h�r�T����*V�K}Z��Z�D)5�!Xeeh��j(u�͗���]��a��A�%����k���"���hKU%h���<�"�͉A�G�A,��R�%��I�jh�;�$ˉ�*��7��S.QڙH,�DV��}�TP&~{����l��X�>+X����,ԍ�����ا���3 ��kq��{.��T"K�Ӂ�U�O�����Ϸ��˯�֘k3��ԅ#A�$l�!{Hx���<��[�7�L������=:�|"S@���D( ���P��`UBQM� ���P�h�*�W4A#�&=O?K_촽	���59{�H+��4�R�Wߐwt44�����z���K˲�@��H˖3������p�� ]3��B{l,k"^x�H"���o��!hBjZ��b'��٬U9ࣿ�/�t�晣K���жvԶ�m�౼��>���
��|�*�:82�Bν�:%ݩU�N��'BJ?>G{��z@�[<,�8��)5]�5���Fi�C��q���Wԃ�����a����*p`�3c�c�l��
{�@�#"0Ó��Űf���b����ua�	�$&���s�j	+�C�!����Ab����%<�<Cx&WĬ�p "�(>ѻ6�oְ�*nPĜ �\R��X1�o1�D��7�. �b���7+#����̌�C��I���G?�����mN{]��7p���~\ٲ$�A�P�eO���܃ws�,���}-m]���0f1@��D�\,�a��\ኬ���f�	Z#���[��4��2bB!�@D'�h>���K8'�5��q��O�GA@��u��]͸�MKJ�<غ`B���1R W �v�r9�Ere��5&���,f���5�)/ b
B��/�e�D�S# �Mk� � &�ܶ�y�,h�GF�X��-͜c��CÑ/"VY�z(R{9M�Uf��%BZu@ %�,ԶND��|��Rd-fYk��hY�Z��$Kiw��<
R�A��%p���RD�ʝȥY�=�a�vu2�S���X@D� �]�~>�PL�qM,Y����ufd��>�YB��F������Ƣ�nJ<��<�p�&Ȏ$#�e�[�$hF��?Av��Ĥ�`�e:�&�ߪ�h��N=wP.�O4�$1�
&E�&�M��#fA�jNH�ɠ���=�O�$V����m�>� ��7l�1�r����L(��et$���b����(w#�XH/��oN��YTc>vx�S��u2ؙe>�M���x3`[��7k����s ��ͮқr]�=W	5p1q�^�(�$�D�Z˜��q��:1��%�m�!m�����K���!f/}�f|#�y��6�Ɯ{�Oj��,��/��Z��8�y<��/��z}X7n]Ť{����C]�FͬA�B3���J-k5�̽5J?�G�!��{��e�5�lb��<
4L�6'�p\~w�ܖ9c����
�Q��Ij��D�+$�w�)�$�F�=y�:$�ZݏF��-��=�����^�G"�W)��@"�XZ�%7.��*_m��y��_��bo|�����nU��D�t�9̀}_��a����!.� _��=����xZ�Q��]�<3�w\��[��}w�X`�E^��+��Ȁ�Bz��1���4uKW�}�+]#Lwz>8l�%W��y.8$��|ܣ�I�H8X�;o�}6p��lN�f��oni��s�u���ݾG�/�⤴Z������� ��w 4��!�v��F�g���_^!t���3^��5��p���Qz˟>!,h��k>��Q�-� ���n��/��N��a������7�D����6���3���)B�����2���-҂|�$�-?GZ ����������O������Ͽ�) !�clip2gif 0.7.2 by Yves Piguet ;        ? visual effects lab.gif  	@         � $  	�GIF89a� $ �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�    ,    � $ G� H����*\Ȱ�Ç#JT�
�EV�Z�_A{���Ha��V�[��?+�����U�B�/cɃ'-��)��͝�h���@{-S�hS�zU-��%�� V�엯�M~+^T
@fY�j���'�骑*Z�����{z�4j�_N�Q�:��r���T�c�/��0���c��!=
���H�*V��<0�~�!���_��s��� a��
u<_䔦��(���e���h���z�,s�L����	����Ip�r��Vž+<��޵W5�E���[u��A��' {(�0P^ȡ�Z����y�� <h�&�[�T��M�  �*0��J>��WF���YX.��Zu9xXB}�S�]�#ڄs�ǟE3ݳB=�qd�}�e�{��#�U���R?��#�c�X�!Cc��W����E+��$�*�+(���$�S�?��J %J��*��f��wD�*e]��]���
[ ��o����0�?�T��*��Ya���:X�/��JP�)ꪬzW�ū�t�yݩk���Q�;U�QV.��'`Qi��"�V	չ�KV��ҖL�E����]\+�d�[���=q�CWM��yL�;�{�H�Z�Z�.O�d���ZO�7E��@����*E)�MHF/����P\+���@+��l��r�
�(Z�K�ahn�O�ԟ?�lJ�]`e�Q���Dd�� J�=�����",�>�"԰L�	�W�Ii�[R���
}%z�c|�'�=)����&���E����bB}Z��ՙ��]4�SQ�i�����hT��#u �(�N���8u[�ԫ Re�2Ya��˖�R��6 vW�++Q�SJ�n��UQ�B[D_��B��'�i����޽o���'ax+�B|�^|=�ʥ�O��d�)�����-n�T�yu��������+����yj�qaV���D���Ŵ�"m�CW��E�&
U�^[������O"$���d��
�Ȑ�@ȞL�� ���=�<NM���F6&�	�+�����%�	�x�W3�
�v� �Mx�5�Iz�Y�ך�55��Kv�Wt��	?H�Menr���L!�K^�Q�z�}M�a�D���o��S��:�c3dl����,�K
��jPLm �q��
q�r�	3��`�m
�� 3����	LE�Nf�50@\@����4��8"/���\����R���	g����*���(
#,L�b��49fYe�KO�f��\28Q�C���d� >��AY�'i�'e��T��u1���0�)�D0�\TJ���� �L����τL�#��W�$=Cj��VY�/b#z
�c�&��v(d_'���9-e��siJ��(Hr���u�uA�@�z��N&�c񒜪��P���I�ݳ+�T��!$m#�!(���wکi���Q􁖆�z�؇> �
UL(9�Cӑ|r�&v	�i�"��8ɘ�۴r2Kq��*�����$]�^Z"O_�2O	�Y@hS�Z�n"�xPB2��뭀������Uh�ix��>�����c��(m(�Ӽ��p*�D�LbĹ)_TA�nb�@H���j�󦋳U�civ ��C���IDm�R��X��W�@�?�!�{7==�|�K���wU !�clip2gif 0.7.2 by Yves Piguet ;        A    
@  ������    U  �     H doggie  	@      V  �  GIF89a� �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   ,    � � +H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷���E*�Bᢁ6Z��⟉#/&X`�ˇb�\�c`  0O�ɹ��З�6�11hԩG���6�ǆ1��ͻ7��]�-��f��W�^�x��ɝ_y��ח�k�.�"������~�<���7�������E�7O�����c�n]|���W_`����	�_g�1�]n�	(�y�`����`���{�h_�^X���`b�q&⋠Hb��b�5r!w
���3�"E=��,򘡏"&�}CNt#�����zL�x��EQ�FVYܖ�M��dr����yފ@�x&�i�������q�9��}�Y��'���A��/�)h?x6�摃9Z&�t�联�螲Yz)��j�h��٩^��z��nY��%��}#���ڥ�/�v�����'���%��L��k��������u읆��l��6[�.6-�s�����^dh�r}���	l��.ؗ��f).���C���������n����o�3Vk�����b�8��p�n������Y���0�ך����*/_'�72���V���!�s,$����0Ġ���ĜR\q�O����1�ѐ*�p�H7|#����m�A�JW�X��ٌ��<�΂~mPؕ�����I*�A��MP�z��7�����$�ay��Ex�A[�,��[(6�<�w��%���r��wƇ^nu�r^��'���oj����]���v�/�.�ɶ��쪧��isGv�."�{�����gK�7%�CkK�@#?}ืh���+�s��n�х��ٷ+�ݭ�_����s����������4��L�[��V#!�	�l�_��C&��f���G0�@0����w�T��`0��M���(E�IA�1�������}�Ö��r����Є���3TC��oy*�Z���6���v��i�D�!Qmhڡ_�������bm�;��TrTg��ɈE� �zwE�5P����c�FqQ0yf[����(�%M�ݒ�$2�шU|W��1q�b��##7�6��s�ݏ�(�frP���hBe1}��#)K�����]S�@���mY��ހĞ]�q��Kf�#;�R��LT����1@k�N�lEHr��f�6c�9�/�m�U7#9˽H�s�)�Ƣ�L��pɛ�dY�+{�� (�f��3�����/� ��'�-���M��iI$r������R4��hm
�QqT��%�B:�E�4%e�I�ƴ����zYCI5S��G[��iK���?��?mVE��S�ըO�$}\wS�J�PQ�'�R�R�Yu���*���ӑ:��_uЧ��ӭz��+M�U�ֱ�FO
�\�Z�s֧�e�'Ca��4�u-�VY�צf3�e�b��ث>�:i`'���Z֜�,G7�٣yvj��_��O^��6���hUKлz����Q�h�M��hZͭaS���� �n>-���֭?�Ƅ'������@c��:�o�#�+�k^����<����9����z��\�6����K��z7�YԚ��_��v�(�0	\`�T���A�Vߐ���������������Y)��Z}���)�K��/�gT]1�¿9�x�yh�qzc�f��gL� f��@�f��K�%���醔��஺k�BM��]�Ly˟Z�<�)�#<_s���d2��˘����*Õ�n�&��,�>�3{ӈ��<���iN��-gD��M��P�MG��ыFr�}gB��җ���1�g-Ù}��4�A]iG+�ԥ��k��cv�՗�ͨ��hM���$§�������׽6r	eV�H޺�_���]�)�ZՕ�����t�|.�6RY�܄����4���l��Z�F�u�Ս�H����6���]oq�ݸ#����E�h��{v��8ot�{�
bs��*V���m̍�`����e���my�F8�B!ǳ�p����O�t���R����4�n�F1 �2Ss��o߬��N��7&�,3�o�ї����狌��)�\���1��ȳ�uuO��G�t+nq���є�߂WVd;S-��:|�0���v��Ι����E֘�>���8��;l��l�����X�Y��o��x���$/zs�7t��j�Ho�"�V嶹ꇅ�;]�{+d;��l�ū����]�b���J,7L�uO�D�����|�qz���<�Ti��y�
��zן/�?[��2���3����|�_�,�\g�~ԓ���������찳�}֗C�j�79 c�zH~��y��X�}��R���6�wt�n�G;��|f���!�Q�§~�~&xG��|9"��|.(6\6�2X%��}�W=�wb�A�GR}Hd)h��|�w!I�x�8x��B�R��jI�0HV-�Q�\T^�A��}�Gi7}h%h�/ Xlm(��gK)8$�'xФ3G�yo�}y��0�{aX�o,5�~��k�8�]�k��Xzl�x���y�.�Ç�~�(z��V�����f(��g��x������`R�w8w犳x��8�W9�؈�Ȃ�(����嵋��PzX���Kl�KM�^�8��!��Ƹpר}w��vH�m��\�V�xY�u������H��G���΃��v����U%�Ɨ����x�A����M��_B����ꈐ3���ǐV����y6�	�����8�TxQ����,f\�h�:�ݔ��(������7-�W|uS��If�Œ�2k#�tJ�`�蒓���T\:��8E�Q���@���|�l{gb!�^ɋ	�H�S?suNU�`�S�UH�hX�j�g�L	�u9�Y��vT9�<I[")���q�O� �HpY��u�����K��Y��y��������ٙ������9��Y��y��������ٚ������9��Y��y��������) !�clip2gif 0.7.2 by Yves Piguet ;        I litter  @      V  �  #YGIF89a� �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   ,    � � �H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0c��G��M�8s��YЦϟ7y
J�cM~H�"골ӧP�TJ�*?���j�Jt�կJ�rK��Q�h��,˶-ɳi�uK�.F�q��˷�C�y�6�K��@���5̸.�ā�6�xr�ǐ�6�5��ˀ3�I�f�Ө�~�S��}k�n�uuן�G��K3ug�Nq��Zylo�5�)_�������.�;���ʧ;�4:�����!�Nޜ��2;c���V��˟G�(�G��wg?*����G�I���"�x ~XE'`p4Hރ��S~�<� ����~���u^Ga�ل��*�����H�����?%Nh#����-"$�	z��`�x[����E*8�}
J�`�-n(�zb��#��9�$E4Q9��f�e�g�ǥ�O�&�cBT�WN�a�z"�#�2��g�E�yt�)U�E٧���ء�0&�Y$2����x`�yj	�B�(��C�CS�B��圭rz��~�*j��:�(�3�C�?A�J([�����މ��������y�O�
�[��ʥ�.��AJJ��hUm���zhvo���Oˆ�g�lު+��V����Uο �ހX���j�Y��;�:���|�s�E���\2ܰ�7B�O�l2��� ��\��0��qbkS9������擾.3�Ь�Wr$�4� �/�PG����|#�4-�5�V����`�L�ǥݼ��%����a�����:�5�w�uܓ���6�cݵ�t�\ �n8�5����W����o����so=��g^��)3vT�Dc�8Г����d���9W�9gS�<�߯cz�Η��z=�޺�{y$賃Mu�:%��M��~8����{ᷣ��{�Z|��M�︳���; ���#=��s~��:�=����˧�������S\鎖�i�o~@�� C��ԝ��{�7��Yo�v�I���@ȅ�B]��'��Q0z�X���W��Y�_�����7�D-�9�� OA��e�w�������0m���3�%�>/����@*�pB��ؿ(>�5�&�����	�}h>�E�+�b�BjE��*cef-�E��+��z�B�/��C���� ���j��bJ���6��ӳ"���BeA�|�%yJQ�=!&�@�y����V(�W?X���8[�*ӷKK"�}��IC&���S�.WiD�re������b�К}Ğ/IH.B������La�DR64�,?V��m���+b!�II���ӎw�G�zuLvb�c�4K})Ay~�}�l�=I�<}��e�3c6��:�ݣ��D\=-�i>+��<�9-�@�]Ԥ�;iJy��gm�@�Oc�̜E�N�R �狣��:\�4��Q��9�Qʴ%�s�J�JA+X!VD>�a:��g(�TSu����)U�+�#+ȇ>��U��H,ۏ��D���;�iᤇŌn�\#��*9�z��ilO���|�p*�&b�&ֆꓟ�)�
Ŝ
6� ��=V����jt�`e(�W:�o�\��@����mle;IF��W �#'z#�n�X��j���)T��l˝:�Ha1�fi{�������#��ӚK�{W�D�����n���f���j+Yf9�qv�0t�H�[V:5<��V[��7���/��9R1�7�g�-`S�U��c���B��Մ��%�L�&_vv�<+>a��O�"���&l�t�ب/&P�j[<"�(@��
�\W��&�PǏS��wG��9{�b"-�9lI�l'�?�R�rҐheVp3�F��6gt}p16�=����B9�n^/�ۜйy$C.pDCK_�Xu9`��۝��Ѩ40[wh��]]n4dը�3��%t�1��U�iⅯ��|��}��	��<� W�ʫ���j"lC�Z"��u�Ȇ�G��n����y}3(g:ؘ�ɵ�}�$[�ΰ��磞xڼ��Oڌ�L����(�w_pCn~\޳���tS���v�N�xo��*���h䄗V��6w���f��7���m��g���7@��\�7���w�Y��g��0_Y�-�:p�U#y�"]Tئ�ݼ~y�ao��&�	�p9O�#��7�t���/��c�6��2h���W�c��'A�Я�u��8^����X�fc��6��1��g��n|��{۹�M���.V�t��|�������Nr����>��2%�}g9��x�O����6A��y�^���dޭt�G~�[7}�)_�ާ������������g�����曞���~�U�,���p�����ߞ��':�w���S��¿~M���ػO��;�KO�������~�/P��j�6Z6!>�7`S<��r�7�~��X��G��&5�a���8b��wl�}��v���'�ӷ�d4,�&yӁ=�j,'�g6x�����-��W6�'8��}�GH~:��=؃;�zZ&�.�0`3xu5Ȁ#Ȅ9�;h�=��!�uRv�n؀#X��'��OH��b��gm�Wt[�{K؄`�(x;�8�*X��q����[��K��a�q(��h���cĶ��Ǉ��<8��(��p�H�IEIL�nǈ�ׄ�艠��@�����h�������<��8��8�/�C ���s�H��h����r(�(�����=���؅^Ȋ�O(�=�RX��T7ƨ����~��(��(���(�����l�|�'~�������8��X�
�;�X"؇�ؐ�������X�H�	U�C7�����������~)7��
�����{N���'��8�Ѹ�w��d=踊�؋�����9�Ә,8Y�đ�׏��A�#	�y����]��X�09�$	�Y�Ti׆�؋a�[�B���X�a9M����X�.�{h	��H����(����3*ɓ~��ȕ�l)��8���d�C��ؔ����ٗ_ɘn���8�K)}�x�i�$���ɘ�ə)�L��b8��)�Ay�Dٖ�����)��8�!�Θ�C9��y}i�C��߳������OI��ٖ��i��I@�В��4���9��i��I@�����6Q�������9�=��Y��2٘?�i�>��	����ǎ�8�ù��a�y���$ه����j)�`�~Ʃ�Z���=�~�!�)�yY�x�����"5�*z��74�����bB�:�,3�4��:���	�}�*�ڢ;��'�C�I�թH	FG��E:��ɕA
K��UJ�9:�+��$�/*��Y�=:)�bJo_:�]��_��Ź�夂k��I�yJ��>��v���9�o�z�w���Y�G�����!��3�����`�*C�a���89�ڞ�٩<*�P���,4����*m�%{�y������ڢ�����k�Z����
��:[��o�����$4'�י��ʢ�D���Κ�J���Ǫ��.3#ߪ}������,��,pNӲ��
��Z�
!���j��:�, ������ʯ��˺��1�4A�Xq� K3�=�°�
����yo�"��[��Z�[]p]�rV��Ү Ҭ��&+{51�,{�)�W�W�2�G��
��1���걲��?��.��0{�4�+gL۴����.T+ �j��@Q�����	P^0^@2;1�=H��z���2i��Z���:�[����x;dP�{�}�r�c���:�S�j˶k��s���K�#k]@�����9 ��pN6��^q��Ƴ�;�UK�o��Zk�0#I+g�0����ܺh���;�4�w[��{�֛�6�U��.xk2��G+��K���o���k�m��ۻxK���d ��{���x��K[Ž���K�\��K�ۺ�[���.����,K�����X1����� ���2{{�L�����s[�>���`�5!���L��+�������TĪK�%�( �_[�����۾�k��k��;�+�k��@����� ��;�X+�Y۶����-C���d��X��<�+����?�1�{��[�L��@��{�@��֊����U�o����*+�R��KO챽r�g��}\�U,;�����L�y|�Ti��+����۾5�-� I�֫�@L�[�O�Ldpˀ۳*��\�6q{��z��������T��S,Ã�eL,�P<�<�C�^p��\̢LY�E6��/�����]�B�����ܺґ�����ɜ��l�?��,��Ռ����S��^L� |��\�Wܻ@���-�K��̾�۶6A��ܽY���9Lt,�^����|�� ϋ�5�݌���{�]�Т��Ȝ�{ܸ�l�m�̟����ͦ۾j���ۿ'�ϒ���L���������Ŷ,�����`�c��5��5��U���ҍ\т�%��+Fѫ��L��1\�w��������\�����A�$�Ç��?��Lǋ����i��W��\��k�-��il����붃�z��r�����K�ƭ���L��݌φ����n�R]�C=�;���k��4L�z��3�6�T�)��@1���bm��K�6A�.��iK�4\��,ؒ�ڶ���]��]�!���-��@��؟L�C��|K�Ie@
�y͐�?��]\ũ�g���J�ƣ��Ѭ�Ì�Aܾ-лݳg����Ԩ��?��1�X��R���������	��������]�z<��=Ʀ��,�,�����-�I=�'��YK��l��}����D��}���9
����2ٍ�I~�wK-�����m���L]�Aþ��̌;�����U{��-�ٌ��k�F�Tڴ�;F�6��M��"M�M�e� -ж	����=��Ϙ��Ah�k� �x��Cl�`�-�{���Y.�?|������~]�K�NƳ,�V��?��-(�d��dm���H�=��-D\�5Q��K��^��꜑ ������,�^�;�;��\��[�P|�ƾ�\ղο�^�U����k�J��S��G+�]�}+�n�������y\���]����k[���.��������������}��>^����ì��>�6A���η�G3-#~^��Hm�����x�(��^�8}��Ҙ\�J��K/�����,�,>��\�X�����M�6߱ ?�z��")��%^�p����G� ��r.�]�����\�� P^����8��'��]��8~�X���K�����W0؏��H[�S�f�Rʝ�ҝ����|��;���o����M-��$��.;��Ѵ,�IL�w��*O��^�;�?�������\ޚ��{��|�����b�®�@�ے-�l4QL�m����\�|��^���M�{e�N�ߵ`{��*��>��籜����{� ����d�0����1^Ɛ�BfD�-V����!�Y8`�#	��`aI�,6��a�(I�Xx���ݺ�s�O'��f�sF�.��<�U�T�U�^��t �+�~=�` 7[L��`B�)�lyS�[�p��Ur!Ɖ�J��w�İ)G�-|�cۛ/�H|���X�*���K�Q�D���y%�P�]��F���.KKsM��r͹x�u{�n[�rk�=̘mH���b�HQ"���ǋslB����JF�L/�s|���#��4zt,�^�Z�����t]�z=�G��=�$�nc)��j���J�������
2L:�b�i �(;�@Ŧ+˲�);��n���	�?��۬�Z������)�v�*�t'��X#
3�z�lE�к��=z��
�8.˯p��0�zn-�vcr��Ĭp ��0��&3�Z13��I��D�+���G?{,���Z�m<�ԑ1@�F,�D�2ȫ�Ȃ�-��Ak�:�<kBI�C�8�Zs��h5��Ɍ<����Dz���.�����Z��B�N��v1���������>���
kc4D�S�Kk�2���*	LQqt�'�\��z6k��f���$6G<Y�� ��,��4�ò<�HRS�����,<�ڐD)�I��RZ��,ؼ�� u�l�'$E�7�{�Z�5�tE�?�=[
��f��U��(�*+&���."�ɠ�R������>X)W�d�ݨ�4����U���X*6W�z�N��K
�}�V����Y�is��`j�#&ǅ��˦�M)A��Oخ�M�.:j������h��!]�'�킆�tB�����N#�ȸ��n-�H���&��0�P�8X���]�]g͵���oê�&�r�W��+���7�9��=�[I5ar�}�H|��]���zHw8��Ѕ��f���=��\񼩃���X����*4��RD�����33s���$���u���lGnG"<��s��>�(OT�P�Z���m���J8�`ը++l�@:�<>�E2:��8��n�]9Ҝ���Р)��і�6�\�1���:��lD�뻌w@������6��
s�3]a��Ѓp��ǜr�#яZy#h��5 ��H��Sx�ƿI�8�#^��6���(W�D��@v+��J3�A��lV<!�$�,���\�J�ȗ@�����j^����׈�
҈_�8�����$���H�Z�hm�%���4�+<��~����f��L��BKo�r��:��* �IN^��K�&�c4����%= ��ar�ǠE�}m;��H4��I�!�MM!���ӅT�l�$�xZ����*f0ӨG����D���B�)�<�r�H���d�2"M:�[B�B���"�Z(C���o�0M���FI�B��N.��H�*��N5�xDfʖz��(� +X��MʭT�.��?|GH�|�=��͐���t��[u��S,Zr�H!�D�"�,X��`X��j���$�����_��:�R�~cEOٺ�R��qhj�H�5&E`���L;�ip;����"�%)T�+[�XB��w������ꄲ��7�1Z{:פHJ)K�K�%t-�'=�D�O���{�)AV*�h \���3�E��Z'R�"0�\5�E��b�g��ޏ�1%�v��R�{R�Tyqb��fN�^�Q���v=���&H�,$�b��	+��B,�˟�*(�26o�7�U W"����ĳ	5��]�/E.	��R1�9�g�ܻᾰ�_��z�C�ˌ�V}�q�壢+�q!7)�C'c������`/�� �N@�ʭ�d�U���p�S�`3Q��Mr(t�O,fF�)��ؒ?���TQ;��� #�&u[�8_S�+�W�p"tS6t?��*^��U�e=�xs���pHp�&HIg����֝瘄�>Zm�B�A��%Ab���H�k�ƶj.,j�9�%��EB����"A��5?�o٥LJ��l�P)�͚��s��"��b��V�I�	�)."+y	ou�����x�-�ג�x��iN}*ņ��'�;0j�cGy�⾊]V;��̶I�v�E���F�>���L�ڦW'[5εi�3q8�,[��B�ϥ�c�TsE�j?�q=���8��|X��hZ3����.k���	m��6�gN��5�{�Ʃ����l��g��#������WWv��.9H1A �ݿW>���V+*�Z��=;��V>��Ń��"��m:˷~�h�Yl��upd�m������\��k٢]?|��P_�:�U�겢�L�
��Mf����ǾiOA�5�i-<ϱ��L���G��1�ޫ�Slx�VX�O��t�ӿ���p��y'��Q-�#DӨ�h������¼�����3���:��Y��"�'�;$A?Y�AR�@����3�C!�Ή��
�9
+�+��5̓ר�$a>��	�$'���2%�2���'��V���-;ҹ���@�?B�"(;��J;($���wi�ڏ#q��3�0�.+�:����BG������>����A;$�_9���߱2ޙ��rĢ�#,�I4��:�!��
'*�Ί�ɑ��Q��"��0�ԉ��DR�ECt���0�2Z5W�!Yz�X�EG�+)3�|a��ZE��e̱i
O\=������1d�k�
9z��4\q�iC�A��q�
��'�23��2�ҪnHk$�xdT0R��G�F{�*��`.Q����qbG�����~A�TH"B4�����,�;���H������Ȫ���ȏɐɑ$ɒ4ɓȀ  !�clip2gif 0.7.2 by Yves Piguet ;        J Effect_type  $i(          � z � r Effect should be:   D Direct `D�          � � ~              	  �	       E Gray `D�          � � ~              	  � 	       F Black `D�          � � ~              	  � 	       G White `D�          � � ~              	  � 	       L Inverse `D�          � � ~              	  � 	       N Play sound `E�          � m              	       Q infobut2.gif  @       � K [  GIF89aK [ �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�  � ,    K [ � �	H����*\Ȱ�Ç#J�H��ŋ3j�ȱc�/ C�I��ɓ(G>�r��˗0cʜI��K�+�1d)k�,V��ʒkhС��]��S�EW�֔h�U���:�P#U�����ʊ��dq�¥-�*o�rh- �l��]˶
ۻw�l�rcK�7b(^,�+}�в�T�Ӥ�de�W4P���J�K^��Ybt(�kC1��}y!O.K{"�,K)g�P�r-��t�F[�f����i��U��Ԥ�w���r����2�U�j����qh6d�j�O�L�4������t#C���JX�6��1��^m
�fUf�T,�L(\~�pe�xMq&�!ʩ��!�|u,'�xC{��g�=� ��5L��S<\��Hy��"�}��#�*)z%�!R!��*�hHѹ�`Z\��eK!����u6�UG"i�U(.�d�(n�ʂhŃ�,2TV����N!�Uk[]�W%i",D��J����dW��T,[:�Ȥ��1���M:WR��g���I$, �ɢt/�5p�xw��V[M�F#�N��w�mE��Y���hR��蔲l��Q��"����jM]��i�6��<�b��CU9lB,�ÅR���٪K=;i�=�$��j��7��S�Q�H,�"t۱�5��n;�?��;�5�ೂ��K��D��Mm�o��{����� �.l����{���T"*S�ӄ^�O�J, ����?������Zc����SP��S���!��{K� ����"}t�G��t#���4:%T�CQe�W���Cӝp�C�UXae�
�	%1���2 tV�R������_�7q�Z��ˉ����]cKՀ B�xAXsQt��M��̵,g�S� ���z�)S�UX�s�V�Fߝm������ ��$����`,���Rz,�֑��������4Æ�[i�6E�����5���>q��.d:� ��Y��443j�Ht��٪��~��[3zPo���؃�k���a���gO�yZ�Q%��h��{�<�%�C�� �J�TV�����D7���<�
�`�N�3Z��E���,�N����D�D��7bu��)��n|�-�eo�cKX��%
�e�Ȍ݈����[��'��Q�'Ϡ^�'�@���GA�!���n�K�5���\q������x��B�!S�=A����+��T��	���b�8$�."��!�яx�p ���ׂ��D��F��d܀�-��HHb�T�A�� �p^�~)p�.[����R:���Q����\hX� W@�)ġ R�\��6�8��NuF�.CF�

�v3'��:��S �c�\�M���  �_9��3��<h8��.���`��,<)�+��<QI��F�3�b�gIQ�<b�:�-Lh��g8���}X�*+e����Ri^H"&i~��T�z�ѠI�h�+�$Q62���n�"i8��C��
1[�q
ҡʢ��#�<.	���k��"V�.8���Q�>�J��K(�!%��%���c�hI S�5I�t4"**�&+Lp���77A���A8Q���E�~�!N��Y:��]��E�i/} ����N6�'�FUE��g�e��u4��;H:af�ݳh���Y[��c2��-P�����0-Ax�
Vxf���`���.��o/�v�4���2W�x��VfG����Іb��rӨ��Q�:�KDa��)�xT()��L<L7��+��'��D��'4�,o��ҏ������eqx��9���M1B?���Te��x|R����K�ڌi�I�ӶGY+�-��ؽ�i��Z�����$�����2l��b-�*�+e�U�>�e��2����,8��Le^���Q�I��sd3���8��WR�!����:��Y�t&۬U@��vCq���&
;-j��V�(�
W�`Y�VW��¡�(���Wr�J|�����5?[t��5M4BS���<��*yH*j�!�<����%zHcn�S&=�N�3ՌO�㥷�2Bި��I��u�{WfF=��z�A^$����!����ǀ�|����?��3��I(�#���'D��^!.J[�q|x�4h����|X����?�g���f*��^Ћ�egF[��>��r����ȇNR�{�X�B�~�Cl1�\M�T-��䜋�i��~d�_�ڻ�@��f\H=���
3 �@r�l�h79&�2W~_!�s�{Yr���#~|>f�2���&�(�°�?^�O������[��,X�7ߛ���74Jx�縹�^�ˋ<��n�K�����=��"/�����|/�_����1���b�s	���{�s�O=�)���L׹Z����S�LG���o�����\�u$�5�mm�q��g�~q����u�5\�nwW�~t��xct?�o3��÷��ׁT�0ɧy�tw2`��ǀ*����1�ꇂ5X7<��>���}�@��g��|��EȄ�w-A�Rx�X��Z��\؅^��`�* !�clip2gif 0.7.2 by Yves Piguet ;        P infobut1.gif  @      � \ L  	GIF89a\ L �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�  � ,    \ L � �	H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C*<�ɓ(S�\ɲ%ʏ4�ܛI��͛8s��I�˽�6���o�QY�dɒg͚#V��*�g-)U�G筲�)ծ��bOWYQY)��E��c��7o @\�n��e�@V�����].8L��c�\�8^Ŗ��{Y|�h�y��rm�O��IG#��T֪�����-Z�Q�n�U��F,2�~^m6�Yk��}��7�Z���:���QWI�
5V��1c��Y ��E�^n�v�Z����hS���Ų�?-�X�e�E��3XUeւ�I��}S�Oh�4�l��Z{�ͦ�w�}a�xiv�>�ɖ�j���ZjG�%��UX}U�m��,�xW��5�(�UU�(K<�YS�<���?NiG\�g���V������?�-���h9�ݎV�<�ĳW��v�5���Z���Ř#^��V���ܭ��Se�3��S�"��R�z~h�e�W�d�82U��jr���#�I߂�ŲJY���U��դ�J�8��yaE>�Z_k�,�&"u.KUX\��# +��Oi�bU߇�tX�ֈI�D��#)������V~�1�����C�>��iVm���H�Q�%O��Vdl>� �O9�Oj�ՒX�kcP��,V����v��7g<ߝQ���c�i\](K�zzUh�a�A�8��U6���s�v��y����9�,�H�+�X��k6�YA+ BaW��,��h�Rg<G'�.sɳ[X��v��/�g���p,P=o�7����[T\X�tC����d���ZӏűPrS�A�JY�+ju�f#�4"���>��<�/�B�����R�e,������<򨘡Q[!"���b�V�!U�饿�aÄ�	�L�Ȳ�����Z���T�b��R�u�Hƒ�~W��>p��ZOj�+�^8Y����u��M�8RS?��z\R����%�o4"i8�S0��,z�j�L�t�1�*�Y��a)�AgO��WAq���'|3j_�f6۰b�^C^g$��,e4�rՂ���D�+*,H>/��)�K��$4@Km٠5��zU�,a�Vr��E_]�A�(�NŇ*׉b���ѯ!-@�5�E3���;�ʄ�򌥬"�h�҅�|�Z��G,J7�۔�6�j�AReJ�ʌ��H���i�h"dPA :]ڕ�L:A�lW��BZ��|ȣ����,�§�%Xa��*a�}�������2��}=��p�ɂ��{\�ւ���D�,z�s��-R V��9[s5���Xe�#��ũ�>+��<��?�	T$#]����J`�Y�kHGF���Xܥ�$���B
��h&�	���cpD#���șQ)�8���׌�p���=�r�(=rFM'��r+���\(��8��pC4�~�
��R�/��U��E�(ER�;�(���FĠ�Lݎ�,��B�v��n��v�Q���i�#�\��Hه��Tn+T�$c���ӎ:df`$�P��}5�m
&%zq�?�@�Ȕ*Q=�DmU�L�f�!��b�#L+��xќ��5+�UR=��V%�[��s�5��Z��nQW��1���)� l8���VYA�Ր3�U�u(�܅��D{<�Ylg�� �?^�GA��ݷ���q�b6U��B� r��>W4�{
F��>I6I�>�_A��[�1����'�s�ڐz$n�?��Wo[P�� ] ��
DHT߲lS�X��V�f��J�m���#�B�xЉ,VV�<�+���B?4�k�S�I�*�Ķ�jdۥmqR-��]D��P� �ė��
U��(&o�'yb
�B�v�֏ES)!S�W���cܽJ<T;H�Ȇ�yaF\4������;Oޮ�ֺWU6D�%+�BK�A�؊45��yWa�.ϵ,~���,W��tbzHX-DX�ڒ:!@[���#�;�U{WDվd����^S;�V_?q¬���7"�qUAjF4b�M��Su�L���rZê�9�9ʘߨd����A#���C�%J���t�]-if���Ӝ�
1�5��7�9�3�&\&�ODi%k���5�Қ&�?���i��z��fH��;�ɵ��\0I���6ę��t��h�st�*���,�Mp~fe����>�jIm���	q:���4�&���ЬQ:�.X���kdX���O� arb&Ň@�d���$�:��Z,Lm�3��10���J4+�Gk`V��jS����H}��Ȕ�_;ߗ�dt%�
���}�������G{ґ������Vm�c���^.�P�b� �F0���n��� U���c��-�E�1�Up����|!_@F�W��e8%�ud}Fjg�wYg+Gg^H&n@j�w~2�$X�&�($�,؂.�W���S�6x�8��:��<h�kv�p��DX�Fx�H��J��LX����'8�T�@!X��Z��\؅^��`�b8�dX�[ !�clip2gif 0.7.2 by Yves Piguet ;        T button icons B� %on mouseUp
  show_field
end mouseUp
        � � T B  P  <         	   	       U Effect Speed I(         U �
  � effect_speed          iA �             
  � other_speed  )p�on keyup
  if the vis of fld "effect_speed" then
    hide fld "effect_speed"
    put "very slow" into fld "effect_speed"
    set the hilitedButton of group 1 of group "effect speed" to 2
  end if
end keyup

on openField
  keyup
end openField

on selectionChanged
  keyup
end selectionChanged

on keydown thekey
  if thekey is not a number or the num of chars in me > 4 then beep
  else pass keydown
end keyDown
       lt �         �  
  �  	         fY � !           Other (milliseconds):   �    i       S* � H  �  `D� �on mouseUp
  if not the vis of fld "effect_speed" then
    put empty into fld "effect_speed"
    show fld "effect_speed"
    put empty into fld "other_speed"
  end if
end mouseUp
       W.               	  �	       �  `D� @on mouseUp
  click at the loc of fld "other_speed"
end mouseUp
       W\ �              	  � 	       S slider.gif  	@      f. �   tGIF89a�  �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�  � ,    �  � �	H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(SJ�2�˗0cʜI��͛8s��ɳ�ϟ��T��E�>+��)]ʴ�ӧP�J�J��իX�j��ϊ>A_�ԋXԊ�}��Y�'O��U��ʍ{(n�C��6Z���X�d�Z%8��Ä6���ǉ���Ope��bU��٭�C��z����fҞ�V=�3�ǲ��l��d¶�5\�o�U���mDw�����n��������bl�/GY�ZŊ��r��c�.#���\w,~�Iώ5�����I��\��ɹyVa�=VZk ����'�5��Rc���a|��o�u�y�g�xqE&Ow���l�4+^}q�u
y!�����l��qur�yw���_<�uHa�6[[��d�)�Ye���ʢZg jy�[�=)a�L~֗[�l�ap��6d�A��`R�ؖv-���?V�Ō}aE?_��J`|����<�\� I$z�Ңd�4b��'X}�Y�߀�8���p��Y���9�,֙�P�y�l��Op����_��	"��B�裃=�w�i�'��X��	�H4�T�\TQ�U�`�1��n���.�玻E�� �7����V�/ ��[��λ��k�.\X�C�p�V�q��p�[x�/��nq���L.�1�[���[.��n>��n�Ңl�|�O>+(d(��9�!p�\�<z,�PM�*�HJ�qF�o�Զ$�i��[ص��a���؆�&�rC��n��f*`ֈ�k}���}g�f��i-$֏Z]��Q�
#%���n�g<�~��>��x�?�1�J��,�(qp���!����BR��*��'ωp���{y���a��Gk���VY[v���Ʒ�<�!��C���;Rl���f?�?nH�u���뭟��*�D�]�ۭ´�������d���A5�9�v��,���9�v���|~�N�J>���ԦZ�zfb���	��4��U�$#>0&8ރ!c��	8�Z��79��pv�` U����b��ߋb��-de9KZD����<����n��� �Q�Ë^l���x�-�q�f<��!3cb�[���ȍ�JM~2�Yx4i���;�|/��F>MRU{t�R:�	��C����D1
R�B�R��L�*�ҕ���;� ��I}��'�̥.w��^��&A�Ntd�O�#h�2���f:�Ќ�4�I�jZ��̦2��|`��+�B>�A�r���L�:���v�����<�I�z9�3V��D걂U�� �@��O���M�B�І:����D'JъZ��ͨF7�Q� !�clip2gif 0.7.2 by Yves Piguet ;        R 	knob.gif  )P�on mousedown
  if not the vis of fld "effect_speed" then
    put empty into fld "effect_speed"
    show fld "effect_speed"
    put empty into fld "other_speed"
    set the hilitedButton of group 1 of group "effect speed" to 1
  end if
  repeat while the mouse is down
    get the loc of me
    if the mouseh < 375 or the mouseh > 558 then
      if the mouseh < 375 then put 375 into item 1 of it
      if the mouseh > 558 then put 558 into item 1 of it
      set the loc of me to it
      next repeat
    end if
    put the mouseh into item 1 of it
    set the loc of me to it
    get the mouseh - 330
    get it / 44
    put item (round(it)) of "very slow,slow,normal,fast,very fast" into fld "effect_speed"
  end repeat
end mousedown
       �.    �GIF89a  �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�  � ,      � �	H����*\��Ō/g�`8ˌ�2�������d5�E��
/����(��X����a=G��$��D����HL��6"�b��SD#eɓ*�ޗ�M5J3��xV��j�fL#��bV�z0�V4Z�ZER�A��V��W+����w�Й?.l%C�5r�(�!�/?)k�̹�� !�clip2gif 0.7.2 by Yves Piguet ;        X images.gif  	@         _ "  �GIF89a_ " �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�    ,    _ " G� H����*\ȰaB{�"��O�����S�Q`���T��U W�Xr+��TɴG��;x�`��'p#N�W�*��{���qտ{Lq�P�$?�U]�)��?�QW������{��gԡ۷�I��6_?�&���˷�߿�Nd�����J� ?���u�/iϛ���qj�B!6��R�])n*�
V�	^u�sDV��n^Q��M��[��M����P��@�^%P-<V�kw}R�����*n7H�y�Uƫ�ng����W	��*}:Wb�1л|�t� QGSU��?���+����S��dE���+tQS�T����F��H��@�y��j.�3�?�PaS��?"J�"�z��J�u�FU � ��
Mك�>�fNR��
T�3 H�4Y��3�P�0��T �3�{���U?4	��K�tyONi�eNk�4�
9�(A{�$�?ƷWKZ
Ta��f�V=+�c�Kj*�ك�����N����av����'���A�
奇�=�b_D�t�2�Q�AU����59뜫	vڇ�}?V�+�m��?�a�#�b�M>]�gG%bW�m�9UV�[޶J>� ��@+$U��4�'�@���-6Hi�䈏S�Fh^��O{!�Vmض*PU�t�0�W�,�|��B#���\����t��T�Y�&L+-r?yEAI�dsAan�%�P�JU�Hz�5�*��������i�W2?����@��yPVtZ@R��LǏ*�P��*�ܵo>�	H�E]v�vA6��M	=e��:����T?eΆ��]\��c荅ŔW�P�=��{A�ǖO���31A�bO:�^�X�>����A+��?��C-�qu�vܷ�J=|�0P�^M��zv���W�������v !�clip2gif 0.7.2 by Yves Piguet ;        Y New Button B
         ����           	     Z info   i           2 � <   Background information B�    %on mouseUp
  show_field
end mouseUp
         6 � 4  t  s         	  � 	   	   	   	  � 	  . 	   	     
  � Background information  �p 9on mouseUp
  check_if_I_should_go_somewhere
end mouseUp
         p5D        � oVisual effects are used to provide video style transitions between cards, or when hiding and showing controls.              =     C      H &   �MetaCard supports 32 different effects, each one of which can be played at variable speed.  In addition, it is possible to play a sound with a visual effect, which will automatically be synchronised to the best of MetaCard's ability.        {     {       j   �This lab provides easy access to all of the various visual effect options.  In addition, you can learn by watching the script for the effect you have chosen while it runs.    KSee the visual effects section of MetaTalk reference for more information.                    4   HMetaCard supports three types of scrollbar: normal, scale and progress.        !     ! 	     *   Whilst the first can be used to move controls, it is more normally used for other purposes such as incrementing a numeric value.  For moving controls, it is usually easier to place controls in a group an set that group to scroll.  See the Groups lab for more information.        �     �      �    CThe scale bar is used to create sliders, e.g. in a volume control.    �The progress bar displays a standard progress bar which can be incremented in a repeat loop to show the status of an opperation.   	Buttons are one of the most important types of controls.  Apart from normal buttons, checkboxes, radio buttons, etc. they are also used to make menus and tabs.  See the Menus labs for more infomation.  For information on using icons in buttons, see the Images lab.        �     �      � O     �         uThis card contains a small selection of buttons.  As you can see, buttons can be virtually any size, color or style.    )Menus are easy to implement in MetaCard.    YMenus are simply another style of button.  They can be positioned anywhere on any stack.                    :   �There are two main ways of creating menus.  Either you can set the button contents (text) to contain a list of items, or you can open up a stack as a menu panel.        T     T      X I   GSee the examples on this card for more information on both techniques.   � FIn MetaCard, sets of one or more control(s) can be placed in a group.        ?     ?      D    �Groups have many functions.  They can be used to manipulate sets of controls with one command, e.g. by moving them.  Controls in a group also inherit color and style information if it is not set individually in each control.    WGroups are the main method of scrolling sets of controls, as they can have scrollbars.    �Most importantly, groups can be placed on multiple cards on the same stack.  This is like the backgrounds feature found in HyperCard, except that there is no limit to the number of groups you can have, and they can be placed or removed at will.    �Note that whilst it is often desirable to place a single script for all controls in a group at the group level, it is possible for individual controls to have their own script.  Indeed, controls continue to function as normal whilst inside a group.   . !Fields are used to display text.                 nFields are very flexible, and have a wide range of properties.  A single field can contain gigabytes of text.    �You can have hypertext links, scrolling fields (both horizontally and vertically), multiple styles, colors, fonts, sizes and patterns.  You can even place objects overlapping scrolling fields.              	      �   OFields can be searched using the find command, or any of the offset functions.        !     !      %      =      C    FThe few examples on this card can only begin to show what you can do.    �Images can be imported via the import command.  A palette which uses this command can be found under the file menu of the Menu Bar.                   % ^   mOn UNIX systems, MetaCard has painting facilities to allow you to create and edit images inside the program.   RThe image object has many uses.  You can use the same image in different places and in different ways, throughout an application.  As a general rule, you will only need to import or create one copy of any particular image.  That copy can then be refered to (linked) so that it will be displayed in different places and in different ways.   KIts often a good idea to place all the images on a single card,  and the create a button in each place you want to display the image and set the "icon" property of a button to the id of the image.  This makes it easy to find an image, and to swap one image for another without having to make a change each place the image appears.    �MetaCard supports the most popular image file formats.  Once imported, the image remains in its original form, which means that any compression applied (e.g. to a JPEG image) remains intact.   When using a CD-ROM to distribute work, images can be imported from a directory on the CD before display.  This allows the application to run on the hard drive, and the images to be loaded when needed.  This is an important technique for video and audio too.    �MetaCard supports transparent masks in GIF images.  This means that an image can have an irregular shape (or even holes) which show the object behind it.    PSee the Images section of the Concepts & Techniques stack for more information.                    A  O    	`      8 p D  _ cursors B� %on mouseUp
  show_field
end mouseUp
        � T B  P  <         	   	       ` animat B� %on mouseUp
  show_field
end mouseUp
        �n T B  P  <         	   	       b pattern B� %on mouseUp
  show_field
end mouseUp
       n T B  P  <         	   	       c Cursors i(           � <  h New Button  B
 6on mouseUp
  set the lockcursor to false
end mouseUp
        $      .         	   	       w New Button  B
 Xon mouseUp
  set the cursor to the icon of me
  set the lockcursor to true
end mouseUp
        T      �         	   	       x New Button  B
 Xon mouseUp
  set the cursor to the icon of me
  set the lockcursor to true
end mouseUp
        �      t         	   	       d Button Icons i(           o � �  # Icon on button �F�`       � � h Click to view moving icon   r  s         	   	       e 
Animation i(          J � �  * 
animation  B
        )g | K  s         	   	       f 
Scrolling i(         T o �   scrolling_example  
           � � � � _   
margin_id  -141  �  !          	   	        	bottom_d �C�p yon mouseDown
  --see the script of the upward arrow for more info on this script
  start_scrolling "down"
end mouseDown
       �
 & ,  �         	        top_d �C�p�--This handler is an slightly simpler example than the other buttons.
--The other buttons use a single handler (in the card) which checks the direction and alters the
--calculations.  This is simpler - there are no calculations to alter dependant on the direction
--of travel.  The direction, whether to add/subtract, etc. are all "hardwired" into this script.
--Begin by understanding this, then if you want, look at the "begin_scrolling" script
--in the script of this card.

local margin_no

on mouseDown
  put fld "increment" into margin_no
  get the topmargin of btn "scrolling_example"
  add margin_no to it
  if it > 390 then put 390 into it
  set the topmargin of btn "scrolling_example" to it
  if the hilitedbuttonName of group "sync" is "Asynchronous" then
    if the mouse is down then
      send "scroll_update" to me in 16 milliseconds
    end if
  else
    repeat while the mouse is down
      get the topmargin of btn "scrolling_example"
      add margin_no to it
      if it > 390 then put 390 into it
      set the topmargin of btn "scrolling_example" to it
      
      --the following hack is much less efficient than using "send in", but could be
      --used to provide async. scrolling with a bit less work than "send in"
      --Its *not* recommended, and has been left here commented out only for interest.
      
      --if the long milliseconds >= item 2 of the pendingMessages then
      --  put "send " & quote & item 3 of the pendingMessages & quote & " to " & item 4 of line 1 of the pendingMessages into do_me
      --   do do_me
      --   cancel (item 1 of the pendingMessages)
      --   end if
      
    end repeat
  end if
end mouseDown

on scroll_update
  if within(me, the mouseloc) then
    get the topmargin of btn "scrolling_example"
    add margin_no to it
    if it > 390 then put 390 into it
    set the topmargin of btn "scrolling_example" to it
  end if
  if the mouse is down then send "scroll_update" to me in 16 milliseconds
end scroll_update
       � x & ,  �         	        right_d �C�p zon mouseDown
  --see the script of the upward arrow for more info on this script
  start_scrolling "right"
end mouseDown
       3 � , &  �         	        left_direction �C�p yon mouseDown
  --see the script of the upward arrow for more info on this script
  start_scrolling "left"
end mouseDown
       a � , &  �         	     
   
increment  )p �on closefield
  if me is not a number then
    beep
    put 1 into me
    exit closefield
  end if
  if me < 1 then put 1 into me
  if me > 200 then put 200 into me
end closefield
       T  Pixel increment          5   g Pattern i(         TJ � �  y    C       ��       i margin_info B� $on mouseUp
 show_field
end mouseUp
       %  F K  Q  =         	   	       l sync  i       W w (  j Asynchronous `D�      [" �              	   	       k Synchronous `D�      [ �              	  	       o 	ok_group   a        � � (  � border  @`       � �               	  � 	   	   	   	  � 	  . 	   	       n ok B� �on mouseUp
  global current_field
  lock screen
  hide fld current_field
  set the hilite of btn current_field to false
  hide the owner of me
  remove script of btn "act_blocker" of cd 1 from front
  unlock screen
end mouseUp
        �� D   �  �         	  � 	   	   	   	  � 	  . 	   	     
  p pattern  �p 9on mouseUp
  check_if_I_should_go_somewhere
end mouseUp
       YW � k         .MetaCard supports the patterning of images.      hThis example is simply a square graphic with the backGroundPattern set to the id of the Elephant image.        1     1      B %  Note that there is no way to set a backPattern from the properties palettes.  You must use a script, or the message box.  Example: select the object you wish to pattern; then type "set the backPattern of the selectedObject to 1234" where 1234 is the id of the image you want to use.        �     �      � <   �Patterns are always drawn relative to 0,0.  Thus if you move the object, it will move "over" the pattern - creating a window like effect.   q    	`      �W  k  r act_blocker �E�pJon mouseUp
  global current_field
  if "labs" is not in the long name of the target then pass mouseUp
  if the short name of the owner of the target is not "ok_group" and the short name of the target is not current_field then
    beep
    exit mouseUp
  end if
  pass mouseUp
end mouseUp

on mouseDown
  global current_field
  if "labs" is not in the long name of the target then pass mouseUp
  if the short name of the owner of the target is not "ok_group" and the short name of the target is not current_field then
    beep
    exit mouseDown
  end if
  pass mouseDown
end mouseDown
        �F ;              	       t more info button norm WT.gif  @      L u � 3  �GIF89a� 3 �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   ,    � 3 � g9���߾�t0�>�� ��Ǌ�@�<�ӧG�@�>���@�L���r_2~)W��ȯ�͕�j�[�s�Eh��B��l�3��V�����R9����'T��"�̚U_��I)��I��E�����_�Y��8�S�݄�:|���ϊ(��
Y�䧍W��RFuf_�i���S�2kB�J��RV+!�3�'�R�^N���ë\�&�����~m�]�g?o��M�(�]Rv%*wدy�~=F܃ѫ��i+�Z�f2�A�sNl��A�A'}
��K�<m��z�+�}��ڄ�t,d�c���Y��T�)�7�7�p�H"�L�!�) �8�_C��܇�<�QWY�Ei�hVe4��Ui��UD^m��kń�A��W^�Q�'���*�-�+��Zh!�T?�5�7� � ��H4�$�����X�Y������VQi6Z�Q�k���ڍ(���Y���N?R�g)^!�	F��h��;��N��4Q��`V�W_?�a"� ��6�8�T4f��Fm��I9���"Һ�M��	#U�U�ڌY�9"�}>�)�7+�H5�9R��M*�����!9q�-�TQ.��*p�t��#���7�t&�_!k��g4��D�2M�gd�H�8߰�r��V���	H���Ut@fH�(�)���q�=1%�}R���Q�,.?��M����*7��lu�Ίa���+m!Jf�S^vi���Ȫ�(�C
�^�(G��lV��_�N���Zw�d|�RZ�>�v������.��2q�"�,��襰γ�_� �XQ����T�H�W�4q)G���ú(�^m�'l�ŭf�NX���xk�f������[��"���h�F7p���C���M�����M�Eۮ�)VWɜN��*�:�'�]=��������q<��L	_�j��S諩,��<�`�%"��%h�<_Fp൦�$mY���5n3kֈ�@<�Xp��g�R�|�dU������~i��NF���Mo��,�!S�N��0�V<�1iG��UO""��\�I���}��4�<9�STF
�(�Q,5�M2C��)	�����B!��[˺��Q�y��Xz��p7���0z99��|�C��PP��v����I	a3ja�(
ɉ�q�m\���%'LO�A�a�HJ�B������C��D�@^�.ى`T�ⴾ�UE-�a�)�2�a}9(��`���l�l-��X����.`Q�o���(�W�%�Ų��Pv�L��;Y�E^	�h`��<n�$8*^d�CJ%�f�Zq����|~A�nzc�RDIIiIR$�یm"���=��m1c��&�g�y 瓠�K�j��,����w���  V��~�K�qO���G�P��,+B�I���*\;��A��S�������c}�eaE��B���(\��������
Vp��|GM9�ck�a�|�C6�z��Fj�\&kU�LY��)2i, ] ĉ�� «��C`�I
�b��p�_4(B ����]	W��r�}XJW�J� ���8� �P���3�I��9.+��by��j.6�юM�b��2�E6l���X!h�i��`� tH��J=��O�l�e��7X�Q��L�]PAXې���)��=����6Q%��p5�8����ς���%���G����z�������Q���!\�����âg|�7s�xu�� �?���G�<��'��r�Rԣ�o�DJ��T�Gc��_��솯�)�Y��
�HI��@e�D��V���H�H6
~2�v�Y����n/̒��hZV�NdP�S��z�ʰ�>�{�&��+�Q|��O�X�� �@�����j�`�|P�/���X�Ai�d�'�q��Q�{T�
� @)�Sإ��
���X.k�zX�7z��F��J�
TA�*��AE�� ~Љ?��,K�0-�q�z��n�G㬰� ��鴍k�;��_I��a�"���
�Y�|�c!�򏳬�߃؃@1��ǆy�OAī�V ��Bm�o�?Ï{�C,��Ǚ��
R���toN7ț.V�Mf�2�C�P��c��J��^~�R۝AMn|�q)��Dk�}8�9�N+��*<���N�Iq%s������Fq�,�N��i+��d��H�xǜ9�?�+T�E"�������0-"��+܃J�~0z �X��<�I(�|\vp�n�c�"�+W��������r.�,ޜ�I�,�|�ŏW�C�  |�«��T�1����5�L��X:>L�R=b]�"�� G��J��<�k�X#րF?V[}X;��#E��{��*��7��P�S���m{�{���XA>��6V�^�w�dMvp��j��
��u\`{}�yt1X�3��`8$#i�v���.\B*�� � ֐b�g}�um�g�Ux��e7�Oa�6{6���!�a]��~i�b�G>���!����V��ZG_=�N6E5�z�v�!9"��
�`K�bl|����.Sw����!(�'$}� �EFְ�W]ڧ.�/Kfg� o�B�����!<8A�z�C�&��JȈJ�dL O�/��z!2x����F�!��W�J�#>1R�d����*� �V�
���}� F�
�0l�gt��X=~|�~K�Cn�T���na{�u�6l���܆��8kH�\��ȈJ17� ��P]�i��!N7�!ڢ[7�o���B��׋n� �s���1{��X�0N<?���N@�`m �+T�z�Ƅh!zј&]e���m�~�&K���z���6�(�0x���G45qgd�ko�joG��"(�� ��(�>ȋ�e�xZ�w �m�u}�m��ϑ�{(+��8��d��j_A�FgsnQ�X�O��u��Z�T���u�`� ��&z�7����s�0� ��և}Ei� �~}vPi�`Q `!X�w}�6V`�v
V
'e��]�v���g�ƈ�e���du����)�XX�p�T�9�c�+�r��hmU��V��hde�y��h��0�!�j�v����W��	��gQ��Y%��a��)9�HrON��28��xH�'g��uP��EyAU7��t���j<R��z1T�V�7�������JyT�&�I�������r��)}rX�)�wC5�g�/�����&��8� �y��d����޶w�42K]��!��T2��yzT7����$��^��_�=�ϐ&��m68<��{'�|U�F�C@t@j� {r�O,�1��yG�$\6���� iR����� ��I�����i��w}ח(4�Ys��C�+e��L�c��-"6�z<Q�ACo�d��cc
���/��=R�1sڇ���f��
��i�oX�� ��OqXc�V�)J�OIf`�xI1d�AcҎ�j�\�AI�  ��;�z8�
fQ���y�i�#Z��j��*[�4*\����S�:d�K����Co��ĕ�5lqxG�{��L�R%�P%А����ژY�$�����ڋ�@��g��tQ��0�B�d|�z:�܊���RKr8`Mq������V߁o��`Q��e����y�(�sX��V�#��A����0�3�ݳC��9�>�Lv\���d`G�-3>��
�!�:�*���&ۋY۵�Z�[�/��Q��@���(`c!l��	eb�E&�T+��Hv�K�F��QL�eE����@�`ʵ�k���*+�=44
K���D���~E�������JV�F�c��c��7620a��)�+�(���@oe��3 �j�3ϻW������@<ҽ�aC�z\�&K��L��������;�)˸�G�y� �:��/ ��H���G���z\�]��-��ر��P`KQ���� b�J��K�^[�`����G,�� �	W��J�G�k�K�w;����k�K�2�1�<;B�Y
`{���@ܥnX�_�m�/�"2���;\�e�?��Pf�t�%^�=Kƴ�
�� �B�٘�{����Z����n<��;�l��BNI�G�<�L����[4qf���`j�p{\O��YjF��ƍ{}�˘�$+���yLɠ}r\���"�{`�W6�1 �h��(`��=K"L	��A�b�8dH�\�0W��|�eh�����\�d8��,����d������l�������PƷ��"���K� �
M�拏���W+�
�����������6Ѻ�����σ������,���L�0��2=���/-�M�-����>mQ��A}.�B��!=�H��JmQ@��e��L=�)�I���S��X��4��d��=�����M΍z.G��G��H-�p��k��T��*O-�i��Y�Ba֣�؂=؄]اף5��V�������؍�ؕ�ؓ�y�=��m�:Ju� !�clip2gif 0.7.2 by Yves Piguet ;        s more info button dep WT.gif  @      ( 5 � 3  �GIF89a� 3 �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   ,    � 3 � �	dŪ��\�0aA���8��A�B��F�9���Ì%Zl�cȖ";���m�7�p��)'O�@s��+h�����t����5�<�C�ũ5�<���n����~b����Sl?ha�����?�u�;V�ءS����*�?p�n�ٓqc��{���#��j!���O�خn���+:�⪌Q_���ݻ�}�-��b�_C���j��o��͚٣ʖƑ?�͊"E�LGڥK�n���/W���{���O4���y��F����>��j"���>@��Ϗ�>���H��#QK�����G>��R� �$�O��X�>����>��H�J�a)��x_)��h߆ n�b ��(a~��Ȣ�<�â���g�����!��W��J���!��?�8��2#��	  (`>�H�@	�ZXᅥ�R�N&X�� �xc �䉟��̨b)��X�>���>��1`���}��^���&� ~b� ��a߀��|�8���,~��%��@k�A�)���)х���>�h�本�(!��I�'�-�ة�4򉣏z��#�z̹J������ݎ*�	�!�fj`���7�#����#����z�`���j���)gso�̤o��d�"�j�+n	h��Z����x-�1^亅&9.?P��)��}Z"�	����s�,� /7�tc +�-r��y\s��L��,�E�X㎉2��'����;����>�؞���¡�Bɭ��:)*�F^z2�"�<�M5�%b�#�tӏ7'[�nXv��Ɖ��*-$�H�ɶ�%�#),����%���)h��n��-������pф"�0�*�m����Re"��<�,Nb`�n����Bw�.���1	c�5":��(V����Nd�B������`�Q����$Ý��y{�5��x��,'��o{����.5'�I`��D��q=�s�����,�al|Abw��m+TP��j�oJ!��Ʉ4���8�B��#����N%BZ�C��-�I@
RC@D4;��N-j�����eK��4g>�.Hc���ӛ�!.H#�b�����>�Ba��u����p���S�KF��'7J��C�`���d��LP��O�J�Dj1�Ze�$1xE�q�I�T���:��B� �6��J���Fg1�n识5C��̉h�*��5.�MFR��Jt(����Ҟ�B�$�uq��,��źPRsm�BY�D����n��p�5o8�~{���MDX���@dV���y垅���E�ю��.�P�X܇�G�ґ�D#DEd+��S�_$�7�2>�d%:�~p��xV~��+��C�X ���"q�!/"�lħEa/BG�'IZ�=���
&B$ڪWi+�=���f}�҇$�F�
�=�8����JU�����L�3+��ҕ��V)$� �X�<�}JP��Q�$��8E�pD%�ڰx!@�� �) ��i���я@�2����z��a�7.��#fA�*�͇�@� �CrQ�.C�3�.���K�\g�1�͠��'{�SP�uH}l?�w�ږ��n�a����[��j8�F������_+VyN�匭7yD?���
�i�K
U��!^'�HD�
�}w5�%�p�e�{CT�3�A��R�K�����=_�V�Y9����p�b���0��E"B�
U!�f�`�����2h�- �X%�ތ�kS+���
�S��*(���6�NR�15�s{,�PV3J���>�MN�9��^ޛ��$E��ȊۚS�� "!�VT�Th>b�9٘Z��Pd�{T4��V>�!S}4gVZ����޼'�^�=�k ,���G��lE,�w"@� 8ܛR�֢>�E�=�ͳ^�[gb��ұf�7�a[<�w�8���ۖ���`����
>���z����a��i}]V�:H�g�� @ly��da��C�ϵ�A�
!��a�wb+Ҹp�-K5�2�w��_��0���#�*28b����hY1k�X����"a���@փ$�x�"XF>��~X� �����ݏ����y?�1g��Z�{x�_f�.n� Ԇ�CJ��֖dvBa�!��o����x����rc �d���/t��`��=�	��ƥ�G�z�n�� �	A�q��r��y$Ot�X�wX�{�p�9U��彭���i�7Q~��71��sV32���`+=���U `��3�dϲ��h���[�Z��ٜ-[�{cQ����h*[�ޛ��?~[.ͧ�R#6H�ά��t��7'�(4dC����\G�>��,%�c��ey�����q�`���VPu���@��}iw`�`�R�~�e~�l!�
?'}�`A�@%�V@yR���uy��y�2~�6�
e��
�RQyfS�W��1C�`qr$��
� J��0{JU5�U�ϰ#8�N@�Wt��+�Y9�/(e�@Y=�CVw?�n#Xdx5oq�:7]�By�t����E<�j6Hz��e&2�!���`��;���PYKȄ ����q��qX�Uw]Iy��W �S�h�~�W6�Pxv���o�#�wA���Be=�d��tۢ��6~6�n�@sϴ
k�$A����v�d�(� �K�Ҩ�i7`�q��m��K�!������aSU��|eT[R���
�&���'�FD�
��_ҥ`��e($�s��Cr{̵
:��H��5�@8��8���ih�0Za�~t�`�0���EwՀ��puA�m�n �Qp]�
�`�Xxx�'X6'�
�E�po��4�'~fh~3Hg%'ER��R���s�3���8�� �f�w��
�td���q��%�В)�h� 3���nE�#S�U6PRp�!�AtV���r
��"��h6�Pp�b{�\���V+r�g�����!(h��A��@�|�i�]��K�{�(R�q� ޸
�qC�"�u1��e�QU0ѐ�8 o�\"��x_Ad\f6rN�I�G�qu�P�`���q&�������h�J�����)���ɰ��/a{.�`֩\��ԙ�U6�x��ؐCeG6>@tFF����qq�����o��Y�깄!��$��\����q�@X�%\AZ$R#WI�߇XETP�@�X&$7���U��8A��*L�
Z�]	�#������X�3�(��hi
'�� 4�8*D@Jd;�Eѩ�/g�LvE��\��A	sS����a�߁��j�'j��Z�Z*��|��D0U#�kJ�4�s�7)���;��馽R6d�d&IT+δe\!!Q������j�و�)��[ʖ�r����`��`��J�
ZTG���uSE�d��tJPQ�P�sS���q�����I��:��j��X�V�
��JCxv���r�8u�
v�B5T�1CcXU��U��r '�UIv�@��	�)��X��z�I��Z�J�sG�
�ʅ�EE�4\F�A��'��Sn8zX-z��D�\�L���9��i�����J������b
��@�|�In���\�J�"�@M�j���=�u��**�!F���^Y�Ԉ����+��E�H �[a#��e�:�&����z�`Y�pگtr8��8�8˚�ǳ;��j�^)�2�{�����`N[�)�rJ����-�+��ǘ���X�NF
�=a�S�O(��[�Yڻ���|F��|�`D�+�i���FUn��r��բ����zE�+��Ŧ�Ѹ\ٳ������˻�ʤqr��KF�&@y{]�k�
z��y��$�&��+��	���\ʹ������;��!:�kK�Y��l+���tˤʥ4�+���X�£�40K���`��T�;0����۝���;��z����(J���o������5�xVjO�:ģ�*�.��㷤��
]��+Ϡ�������g��ڳ1��[��_\����Y[��Fa�Q�dn���+�$�+�+�f�TK�k���eH٩���鶃�n۞��Ȋ����A�W9&�8J��1�'a-1����G�\��ɠ���y�8ܞ�̞��Ȯ����J��,��X���ɛ��)�Q6�<��|��<�i���jg� =��sҼ
��՜����������ά���\���
fl�	F�a�W����|۲BԢB��C�AJv��̋�U:� !�clip2gif 0.7.2 by Yves Piguet ;        u more info button norm WT.gif  @       � > � 3  �GIF89a� 3 �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   ,    � 3 � g9���߾�t0�>�� ��Ǌ�@�<�ӧG�@�>���@�L���r_2~)W��ȯ�͕�j�[�s�Eh��B��l�3��V�����R9����'T��"�̚U_��I)��I��E�����_�Y��8�S�݄�:|���ϊ(��
Y�䧍W��RFuf_�i���S�2kB�J��RV+!�3�'�R�^N���ë\�&�����~m�]�g?o��M�(�]Rv%*wدy�~=F܃ѫ��i+�Z�f2�A�sNl��A�A'}
��K�<m��z�+�}��ڄ�t,d�c���Y��T�)�7�7�p�H"�L�!�) �8�_C��܇�<�QWY�Ei�hVe4��Ui��UD^m��kń�A��W^�Q�'���*�-�+��Zh!�T?�5�7� � ��H4�$�����X�Y������VQi6Z�Q�k���ڍ(���Y���N?R�g)^!�	F��h��;��N��4Q��`V�W_?�a"� ��6�8�T4f��Fm��I9���"Һ�M��	#U�U�ڌY�9"�}>�)�7+�H5�9R��M*�����!9q�-�TQ.��*p�t��#���7�t&�_!k��g4��D�2M�gd�H�8߰�r��V���	H���Ut@fH�(�)���q�=1%�}R���Q�,.?��M����*7��lu�Ίa���+m!Jf�S^vi���Ȫ�(�C
�^�(G��lV��_�N���Zw�d|�RZ�>�v������.��2q�"�,��襰γ�_� �XQ����T�H�W�4q)G���ú(�^m�'l�ŭf�NX���xk�f������[��"���h�F7p���C���M�����M�Eۮ�)VWɜN��*�:�'�]=��������q<��L	_�j��S諩,��<�`�%"��%h�<_Fp൦�$mY���5n3kֈ�@<�Xp��g�R�|�dU������~i��NF���Mo��,�!S�N��0�V<�1iG��UO""��\�I���}��4�<9�STF
�(�Q,5�M2C��)	�����B!��[˺��Q�y��Xz��p7���0z99��|�C��PP��v����I	a3ja�(
ɉ�q�m\���%'LO�A�a�HJ�B������C��D�@^�.ى`T�ⴾ�UE-�a�)�2�a}9(��`���l�l-��X����.`Q�o���(�W�%�Ų��Pv�L��;Y�E^	�h`��<n�$8*^d�CJ%�f�Zq����|~A�nzc�RDIIiIR$�یm"���=��m1c��&�g�y 瓠�K�j��,����w���  V��~�K�qO���G�P��,+B�I���*\;��A��S�������c}�eaE��B���(\��������
Vp��|GM9�ck�a�|�C6�z��Fj�\&kU�LY��)2i, ] ĉ�� «��C`�I
�b��p�_4(B ����]	W��r�}XJW�J� ���8� �P���3�I��9.+��by��j.6�юM�b��2�E6l���X!h�i��`� tH��J=��O�l�e��7X�Q��L�]PAXې���)��=����6Q%��p5�8����ς���%���G����z�������Q���!\�����âg|�7s�xu�� �?���G�<��'��r�Rԣ�o�DJ��T�Gc��_��솯�)�Y��
�HI��@e�D��V���H�H6
~2�v�Y����n/̒��hZV�NdP�S��z�ʰ�>�{�&��+�Q|��O�X�� �@�����j�`�|P�/���X�Ai�d�'�q��Q�{T�
� @)�Sإ��
���X.k�zX�7z��F��J�
TA�*��AE�� ~Љ?��,K�0-�q�z��n�G㬰� ��鴍k�;��_I��a�"���
�Y�|�c!�򏳬�߃؃@1��ǆy�OAī�V ��Bm�o�?Ï{�C,��Ǚ��
R���toN7ț.V�Mf�2�C�P��c��J��^~�R۝AMn|�q)��Dk�}8�9�N+��*<���N�Iq%s������Fq�,�N��i+��d��H�xǜ9�?�+T�E"�������0-"��+܃J�~0z �X��<�I(�|\vp�n�c�"�+W��������r.�,ޜ�I�,�|�ŏW�C�  |�«��T�1����5�L��X:>L�R=b]�"�� G��J��<�k�X#րF?V[}X;��#E��{��*��7��P�S���m{�{���XA>��6V�^�w�dMvp��j��
��u\`{}�yt1X�3��`8$#i�v���.\B*�� � ֐b�g}�um�g�Ux��e7�Oa�6{6���!�a]��~i�b�G>���!����V��ZG_=�N6E5�z�v�!9"��
�`K�bl|����.Sw����!(�'$}� �EFְ�W]ڧ.�/Kfg� o�B�����!<8A�z�C�&��JȈJ�dL O�/��z!2x����F�!��W�J�#>1R�d����*� �V�
���}� F�
�0l�gt��X=~|�~K�Cn�T���na{�u�6l���܆��8kH�\��ȈJ17� ��P]�i��!N7�!ڢ[7�o���B��׋n� �s���1{��X�0N<?���N@�`m �+T�z�Ƅh!zј&]e���m�~�&K���z���6�(�0x���G45qgd�ko�joG��"(�� ��(�>ȋ�e�xZ�w �m�u}�m��ϑ�{(+��8��d��j_A�FgsnQ�X�O��u��Z�T���u�`� ��&z�7����s�0� ��և}Ei� �~}vPi�`Q `!X�w}�6V`�v
V
'e��]�v���g�ƈ�e���du����)�XX�p�T�9�c�+�r��hmU��V��hde�y��h��0�!�j�v����W��	��gQ��Y%��a��)9�HrON��28��xH�'g��uP��EyAU7��t���j<R��z1T�V�7�������JyT�&�I�������r��)}rX�)�wC5�g�/�����&��8� �y��d����޶w�42K]��!��T2��yzT7����$��^��_�=�ϐ&��m68<��{'�|U�F�C@t@j� {r�O,�1��yG�$\6���� iR����� ��I�����i��w}ח(4�Ys��C�+e��L�c��-"6�z<Q�ACo�d��cc
���/��=R�1sڇ���f��
��i�oX�� ��OqXc�V�)J�OIf`�xI1d�AcҎ�j�\�AI�  ��;�z8�
fQ���y�i�#Z��j��*[�4*\����S�:d�K����Co��ĕ�5lqxG�{��L�R%�P%А����ژY�$�����ڋ�@��g��tQ��0�B�d|�z:�܊���RKr8`Mq������V߁o��`Q��e����y�(�sX��V�#��A����0�3�ݳC��9�>�Lv\���d`G�-3>��
�!�:�*���&ۋY۵�Z�[�/��Q��@���(`c!l��	eb�E&�T+��Hv�K�F��QL�eE����@�`ʵ�k���*+�=44
K���D���~E�������JV�F�c��c��7620a��)�+�(���@oe��3 �j�3ϻW������@<ҽ�aC�z\�&K��L��������;�)˸�G�y� �:��/ ��H���G���z\�]��-��ر��P`KQ���� b�J��K�^[�`����G,�� �	W��J�G�k�K�w;����k�K�2�1�<;B�Y
`{���@ܥnX�_�m�/�"2���;\�e�?��Pf�t�%^�=Kƴ�
�� �B�٘�{����Z����n<��;�l��BNI�G�<�L����[4qf���`j�p{\O��YjF��ƍ{}�˘�$+���yLɠ}r\���"�{`�W6�1 �h��(`��=K"L	��A�b�8dH�\�0W��|�eh�����\�d8��,����d������l�������PƷ��"���K� �
M�拏���W+�
�����������6Ѻ�����σ������,���L�0��2=���/-�M�-����>mQ��A}.�B��!=�H��JmQ@��e��L=�)�I���S��X��4��d��=�����M΍z.G��G��H-�p��k��T��*O-�i��Y�Ba֣�؂=؄]اף5��V�������؍�ؕ�ؓ�y�=��m�:Ju� !�clip2gif 0.7.2 by Yves Piguet ;        v more info button dep WT.gif  @       � * � 3  �GIF89a� 3 �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   ,    � 3 � �	dŪ��\�0aA���8��A�B��F�9���Ì%Zl�cȖ";���m�7�p��)'O�@s��+h�����t����5�<�C�ũ5�<���n����~b����Sl?ha�����?�u�;V�ءS����*�?p�n�ٓqc��{���#��j!���O�خn���+:�⪌Q_���ݻ�}�-��b�_C���j��o��͚٣ʖƑ?�͊"E�LGڥK�n���/W���{���O4���y��F����>��j"���>@��Ϗ�>���H��#QK�����G>��R� �$�O��X�>����>��H�J�a)��x_)��h߆ n�b ��(a~��Ȣ�<�â���g�����!��W��J���!��?�8��2#��	  (`>�H�@	�ZXᅥ�R�N&X�� �xc �䉟��̨b)��X�>���>��1`���}��^���&� ~b� ��a߀��|�8���,~��%��@k�A�)���)х���>�h�本�(!��I�'�-�ة�4򉣏z��#�z̹J������ݎ*�	�!�fj`���7�#����#����z�`���j���)gso�̤o��d�"�j�+n	h��Z����x-�1^亅&9.?P��)��}Z"�	����s�,� /7�tc +�-r��y\s��L��,�E�X㎉2��'����;����>�؞���¡�Bɭ��:)*�F^z2�"�<�M5�%b�#�tӏ7'[�nXv��Ɖ��*-$�H�ɶ�%�#),����%���)h��n��-������pф"�0�*�m����Re"��<�,Nb`�n����Bw�.���1	c�5":��(V����Nd�B������`�Q����$Ý��y{�5��x��,'��o{����.5'�I`��D��q=�s�����,�al|Abw��m+TP��j�oJ!��Ʉ4���8�B��#����N%BZ�C��-�I@
RC@D4;��N-j�����eK��4g>�.Hc���ӛ�!.H#�b�����>�Ba��u����p���S�KF��'7J��C�`���d��LP��O�J�Dj1�Ze�$1xE�q�I�T���:��B� �6��J���Fg1�n识5C��̉h�*��5.�MFR��Jt(����Ҟ�B�$�uq��,��źPRsm�BY�D����n��p�5o8�~{���MDX���@dV���y垅���E�ю��.�P�X܇�G�ґ�D#DEd+��S�_$�7�2>�d%:�~p��xV~��+��C�X ���"q�!/"�lħEa/BG�'IZ�=���
&B$ڪWi+�=���f}�҇$�F�
�=�8����JU�����L�3+��ҕ��V)$� �X�<�}JP��Q�$��8E�pD%�ڰx!@�� �) ��i���я@�2����z��a�7.��#fA�*�͇�@� �CrQ�.C�3�.���K�\g�1�͠��'{�SP�uH}l?�w�ږ��n�a����[��j8�F������_+VyN�匭7yD?���
�i�K
U��!^'�HD�
�}w5�%�p�e�{CT�3�A��R�K�����=_�V�Y9����p�b���0��E"B�
U!�f�`�����2h�- �X%�ތ�kS+���
�S��*(���6�NR�15�s{,�PV3J���>�MN�9��^ޛ��$E��ȊۚS�� "!�VT�Th>b�9٘Z��Pd�{T4��V>�!S}4gVZ����޼'�^�=�k ,���G��lE,�w"@� 8ܛR�֢>�E�=�ͳ^�[gb��ұf�7�a[<�w�8���ۖ���`����
>���z����a��i}]V�:H�g�� @ly��da��C�ϵ�A�
!��a�wb+Ҹp�-K5�2�w��_��0���#�*28b����hY1k�X����"a���@փ$�x�"XF>��~X� �����ݏ����y?�1g��Z�{x�_f�.n� Ԇ�CJ��֖dvBa�!��o����x����rc �d���/t��`��=�	��ƥ�G�z�n�� �	A�q��r��y$Ot�X�wX�{�p�9U��彭���i�7Q~��71��sV32���`+=���U `��3�dϲ��h���[�Z��ٜ-[�{cQ����h*[�ޛ��?~[.ͧ�R#6H�ά��t��7'�(4dC����\G�>��,%�c��ey�����q�`���VPu���@��}iw`�`�R�~�e~�l!�
?'}�`A�@%�V@yR���uy��y�2~�6�
e��
�RQyfS�W��1C�`qr$��
� J��0{JU5�U�ϰ#8�N@�Wt��+�Y9�/(e�@Y=�CVw?�n#Xdx5oq�:7]�By�t����E<�j6Hz��e&2�!���`��;���PYKȄ ����q��qX�Uw]Iy��W �S�h�~�W6�Pxv���o�#�wA���Be=�d��tۢ��6~6�n�@sϴ
k�$A����v�d�(� �K�Ҩ�i7`�q��m��K�!������aSU��|eT[R���
�&���'�FD�
��_ҥ`��e($�s��Cr{̵
:��H��5�@8��8���ih�0Za�~t�`�0���EwՀ��puA�m�n �Qp]�
�`�Xxx�'X6'�
�E�po��4�'~fh~3Hg%'ER��R���s�3���8�� �f�w��
�td���q��%�В)�h� 3���nE�#S�U6PRp�!�AtV���r
��"��h6�Pp�b{�\���V+r�g�����!(h��A��@�|�i�]��K�{�(R�q� ޸
�qC�"�u1��e�QU0ѐ�8 o�\"��x_Ad\f6rN�I�G�qu�P�`���q&�������h�J�����)���ɰ��/a{.�`֩\��ԙ�U6�x��ؐCeG6>@tFF����qq�����o��Y�깄!��$��\����q�@X�%\AZ$R#WI�߇XETP�@�X&$7���U��8A��*L�
Z�]	�#������X�3�(��hi
'�� 4�8*D@Jd;�Eѩ�/g�LvE��\��A	sS����a�߁��j�'j��Z�Z*��|��D0U#�kJ�4�s�7)���;��馽R6d�d&IT+δe\!!Q������j�و�)��[ʖ�r����`��`��J�
ZTG���uSE�d��tJPQ�P�sS���q�����I��:��j��X�V�
��JCxv���r�8u�
v�B5T�1CcXU��U��r '�UIv�@��	�)��X��z�I��Z�J�sG�
�ʅ�EE�4\F�A��'��Sn8zX-z��D�\�L���9��i�����J������b
��@�|�In���\�J�"�@M�j���=�u��**�!F���^Y�Ԉ����+��E�H �[a#��e�:�&����z�`Y�pگtr8��8�8˚�ǳ;��j�^)�2�{�����`N[�)�rJ����-�+��ǘ���X�NF
�=a�S�O(��[�Yڻ���|F��|�`D�+�i���FUn��r��բ����zE�+��Ŧ�Ѹ\ٳ������˻�ʤqr��KF�&@y{]�k�
z��y��$�&��+��	���\ʹ������;��!:�kK�Y��l+���tˤʥ4�+���X�£�40K���`��T�;0����۝���;��z����(J���o������5�xVjO�:ģ�*�.��㷤��
]��+Ϡ�������g��ڳ1��[��_\����Y[��Fa�Q�dn���+�$�+�+�f�TK�k���eH٩���鶃�n۞��Ȋ����A�W9&�8J��1�'a-1����G�\��ɠ���y�8ܞ�̞��Ȯ����J��,��X���ɛ��)�Q6�<��|��<�i���jg� =��sҼ
��՜����������ά���\���
fl�	F�a�W����|۲BԢB��C�AJv��̋�U:� !�clip2gif 0.7.2 by Yves Piguet ;        "    KP �local dontmove

on mouseUp
  if dontmove is true then exit mouseUp
  put true into dontmove
  move me relative -100,0 in 1 second
  move me relative 100,0 in 1 second
  put false into dontmove
end mouseUp
       r_Y � n   
  z button icons  �p 9on mouseUp
  check_if_I_should_go_somewhere
end mouseUp
         ~ � u        Any image can be an icon.  In this example, the button has its icon set to Penelope the MetaCard elephant, and the hilite icon set to another image in which Penelope has moved.  The buttons autoHilite is true, so the images are automatically swapped when the button is depressed.                    '     ?      C {     � 
     � O  Note that placing icons on buttons is an important technique - use it to place the same image in different places in a stack.  Turning off all the buttons properties (e.g. showName, showBorder, etc.) will make the button look and behave just like a static image.        �     �      �      � 
     � F  {    	`       � ~  u
  | cursors  �p 9on mouseUp
  check_if_I_should_go_somewhere
end mouseUp
         � *         pAny image can be a cursor.  However, most systems only accept smaller images that are multiples of 8x8 in size.                    V  These examples set the cursor to the image clicked on, and set the lockCursor to true.  LockCursor prevents the cursor from being updated when the script has finished running.  The hand icon sets the cursor back to normal by setting the lockCursor to false.                    &     C 
     M      X 
     b      p      v D     �      � 
     �      �      � 
     � 
  }    	`       �  *
  ~ animat  �p 9on mouseUp
  check_if_I_should_go_somewhere
end mouseUp
        e � U         xThis animation is done by setting the icon property of a button to the images that make up the frames of the animation.        &     &      * M  `The script starts running when the card is opened (on preOpenCard).  It uses the send command to send an "animate" message to itself.  This handler changes the icon being displayed and then sends the "animate" message again in a few hundred milliseconds.  This allows the animation to run asynchronously - i.e. while the card is being interacted with.        6     6      A      Q      U      a      e ;     �      � M     �      � b      	`       �e  U  � fields.gif  	@         S   eGIF89aS  �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�    ,    S  G� H����*\Ȱ��w�"��2�ʪ����ϡ@{�]���OH~�<T��>�U��[!�^ȑ B����)mF��'M�-\�޽�������F����j��}��c��U�W�JR�XVlv�:��خ^��d������!�S5P�I� X��g*ӡ�d9t_�#U鷸1 ������P��	��4fDVZW��GV�A����O>}:;�}GӴ�~���ӹʊ*@���vVnKђ�k�ν;�{U�.��a�*� ����H���1uYt�톻a/,�v����
 �Se�UD]��^~{�+���nc���BB�W�|J��O~!%c�������EG�����U+4!d�Lm`����Cы�)J��N�U��{(��k	ݳ�H� �TY^�
z�H%�"֖��CfY��֘k8y'�t�i�
�5t{vt�* v%<�lx�jMʹ]>M�sWD��'����B�U���hj�?��v"���2rg���� �%�#A�:+�Y��,R����A C��S]L����N��\���byڳ�?��ʥ&�g�c��ZP=M1�ρf�$P�;��aY ��@,����1��W��*���#�
2K���D�b4!*Qu��SQS�j�?��j  ��P O�׿�!�@W�;Ъ"�z�~�t�M4�h�*,����(d���@�0ɧA��B*A���G���Od/�?V���r �X�5]\1�[��Su�6mj7UEҿn� +�T�z'A���G��>9f�j?��㲏���ϑ�xj���(�}V^g@ !�clip2gif 0.7.2 by Yves Piguet ;        � New Button B
         ����           	  .   � Data Validation i(           t � �
  � validation  )pTon keyDown thekey
  switch (the hilitedButton of group "data validation")
  case 1 --a number
    if thekey is not a number then
      beep
      exit keyDown
    end if
    break
  case 2 --not a number
    if thekey is a number then
      beep
      exit keyDown
    end if
    break
  case 3 --10 chars
    if the num of chars in me > 9 then
      beep
      exit keyDown
    end if
    break
  case 4 --no spaces
    if thekey is space then
      beep
      exit keyDown
    end if
    break
  end switch
  pass keyDown --if its not been exited, pass it on to MC to type the key
end keyDown
        ! � �         . 12345   � 	a number `D� �on mouseUp
  if fld "validation" is not a number then
    beep
    put "12345" into fld "validation"
    select text of fld "validation"
  end if
end mouseUp
        # � �              	  .	       � not a number `D� �on mouseUp
  if fld "validation" is a number then
    beep
    put "abcde" into fld "validation"
    select text of fld "validation"
  end if
end mouseUp
        # � �              	  . 	       � no more than 10 characters `D� �on mouseUp
  if the num of chars in fld "validation" > 10 then
    beep
    put char 1 to 10 of fld "validation" into fld "validation"
    select text of fld "validation"
  end if
end mouseUp
        # � �              	  . 	       � 
no spaces `D�$on mouseUp
  if fld "validation" contains space then
    beep
    repeat
      get offset(space,fld "validation")
      delete char it of fld "validation"
      if not (fld "validation" contains space) then exit repeat
    end repeat
    select text of fld "validation"
  end if
end mouseUp
        # �              	  . 	     
  �  	         � x            Text must be:   � Hypertext Linking i(          , � �
  �   	x   ,on mouseDown
  if the textcolor of the clickchunk is "0,0,255" then set the textcolor of the clickchunk to "red"
  put the clicktext into fld "clicked_on"
  wait until the mouse is up
  if the textcolor of the clickChunk is "255,0,0" then set the textcolor of the clickChunk to "blue"
end mouseDown
        !? � Y        . cThis is an example of hypertext linking.  Clicking on a link gives correct color change behaviour.         @     �  blue         9 @     �  blue  K      W 
  �  	        � �            The text clicked on: 
  � clicked_on 	        � �               � List Fields i(         V 0 � �
  � list_field  �)`      \ C � �           Pears  Apples  Oranges  Peaches  	Tomatoes  Grapefruit  Grapes  Plumbs   �    	`      � C  �  � Multiple hilites `D� Zon mouseUp
  set the multipleHilites of fld "list_field" to the hilite of me
end mouseUp
       \ � �              	  . 	       � Disconnected hilites `D� _on mouseUp
  set the nonContiguousHilites of fld "list_field" to the hilite of me
end mouseUp
       \ � �              	  . 	       � Reverse hilites `D� Xon mouseUp
  set the toggleHilites of fld "list_field" to the hilite of me
end mouseUp
       \ �              	  . 	       � Styled Text i(         V. � �
  � styles_field  �	h     ������    zu � P        .      	          	     �Fields can scroll, have fancy boxes, and even have text colored in!  Don't forget about Subscript and SuperScript.  All with images on top...     	                    
              @ �      Red                    #    � �    yellow  8      ?      [      a 
   �� k      q      t 	 @     �  Blue  } 	     �   �    	`      u  A  �    a      z� �   � validation_if B� %on mouseUp
  show_field
end mouseUp
        � T B  P  <         	  .   � hypertext_if B� %on mouseUp
  show_field
end mouseUp
       b T B  P  <         	  .   � list_if B� %on mouseUp
  show_field
end mouseUp
       " � T B  P  <         	  .   � 
styled_if B� %on mouseUp
  show_field
end mouseUp
       "b T B  P  <         	  . 
  � validation_if  �p 9on mouseUp
  check_if_I_should_go_somewhere
end mouseUp
         � � �        . �Usually, the easiest way to do data validation is using a keyDown handler.  That way, you can check what is going into the field before it is inserted.        :     :      A V   �In this example, the MetaCard validation operators are used to check that the data entered matches criteria specified by the radio buttons below.   'It is possible to do validation on keyUp (after a character has been entered), or on closeField (when a field is losing the keyboard focus and has been changed).  The latter is likely to be useful in situations where the data being entered is more complex, or must conform to a detailed format.        #     #      ( -     U 
     _ �   �In addition to the normal operators (e.g. if me is not a number then...) MetaCard has an advanced matchText function for doing regular expression matching.        b     b 	     k 0  �    	`       � �  �
  � hypertext_if  �p 9on mouseUp
  check_if_I_should_go_somewhere
end mouseUp
        > � �        . 6MetaCard has advanced hypertext linking capabilities.    �In this example, a mouseDown handler checks the color of the text clicked on (the clickChunk) and if it is blue, sets it to red.  When the mouse is released, the text is set back to blue again.              	      6     R 
     \ e   RThe mouseDown handler also displays the text that was clicked on - the clickText.              	      :     G 	     P    `The words "color change" have the group style applied, so are treated as one word when clicked.   �    	`       �>  �
  � list_if  �p 9on mouseUp
  check_if_I_should_go_somewhere
end mouseUp
       \ ? � �        . <List fields are used to maintain selectable lists of items.    GThey are ordinary fields with their listBehavior property set to true.        $     $      0    KThere are a number of properties that govern how a list field will behave.    ~The three radio buttons in this example alter this field's multipleHilites, nonContiguousHilites and toggleHiltes properties.        ;     ;      J      L      `      e      q   �    	`       ?  �  �    	a      \ � 
  � 
styled_if  �p 9on mouseUp
  check_if_I_should_go_somewhere
end mouseUp
       \= �         . mAll MetaCard fields support mulitple colors, fonts and styles.  These can be set in a script or by the user.    kThe yellow color behind the word "colored" was done by setting the backGroundColor of that word to yellow.        C     C      R   �    	`      =    � New Button B
         ����           	  �   � E:groups.gif  	@         ` $  �GIF89a` $ �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�    ,    ` $ G� H����*\Ȱ�B�"����^�w�9��Q�=���u<�Q�z�o��+��q`��,
�
�? 5���������Ѥś,�2���j�U�X��o`�}/�&�W���~�֫�2��*��Jm�������+x���#^���=��֫���Ux{K��ph�i2f%�<�CB���(`@VF�WS�K UީN*u��Ѭ,��it��Y���iA��|
lџF���zG��?U�V ź�����t�s-����t�_Ͼ=G{��"�\ؽCЪ��^�O�B�{�ƊM�]QjA'l�t�E� +��k��[	��B?���O ����u��M �Ni�����H+��RaVDF�x�H�~�Y�Oy�#����? �݌ՈX|0[K���k�Y��[ �dT��UO��u KI��k���>�0��mFٜ��zc��	j�F��y袌6���T� �"���W?�4�&��V�W��$��e�X� �f��p���6�ș�H�G}U�ZA��3a���"e��X��Zz���A��2�j>YFQu�pȪk�h�e�I����O �Q�����m�����8)�|��fm��FFUg�vV��n�eAt�+ M�#e�i� a?(Ճ�� j+�Գ݊69�k��YZp��R��[t�X���,jJt�tU`t!��Q��ITʝ��A,��k|�N�a��:?��c����
�-�r�2�K��RM�T�E䚾����J�|�Sl)����q'�tD�
��e�!�j55�����T����ZJ�h%�a>��c:?�*P��"d�>J�Z��3,>�S V�O���R��*el�|���5�������'R����g�X@ !�clip2gif 0.7.2 by Yves Piguet ;        � 
group_one   i           � � {  � 	A button �E�`  ��      ������     t � Z !             	       � Object `E�        � V !             	       k    KC  ����33     5 � + &     [ E � E � @ � < � : � 7 � 6 � 6 � 6 � 7 � ; � > � > � > � > � > � > � >  > > ? @ A B C C D  E � F � H � J � J  K  L M N O P  Q  R � T � T � T � T � T � T � U � V � W � Y � Z � [ � ] � ^ � _ � _ � _ � ^ � ] � ] � \ � Z � Y � X � V � U � T � T � T � T � T � T � T � S � N � M � L � K � J � J � I � I � I � H � H � G � G � F � F � E � E �  � Graphic �E�`       t � Z !             	       f    K@  ��         1 �       g    KD    33��     ! � ! !     h  � Move �E�p �local dontmove

on mouseUp
  if dontmove is true then exit mouseUp
  put true into dontmove
  move group "group_one" relative 0,25 in 400 milliseconds
  move group "group_one" relative 0,-25 in 400 milliseconds
  put false into dontmove
end mouseUp
        t` o              	       � Show �E�p 1on mouseUp
  show group "group_one"
end mouseUp
        t� o              	       � Hide �E�p 1on mouseUp
  hide group "group_one"
end mouseUp
        t� o              	       � Example Group i(           u �X  � New Button �E�`       � �               	       � example_if B� %on mouseUp
  show_field
end mouseUp
        T B  P  <         	  �   � image!.gif  	@      X8 � `  �GIF89a� ` �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�    ,    � ` � H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ%�0cʜI��͛8s��ɳgΉ��Y�H_��H�Uz��R�M�BeJu�U�X�f���+ׯU��g�?���巏�۶m��K�\�u�捋��^�|�
L��`Á��r6�?���I�L���˘3k�̹��ϕ�k�_�}�|�^ͺ�k���~h:��۸s��o_����C�����9{�F�6��Ћ�^��tj�����ν��~��{*��4�Y���^n����ß/�>}��Y����7y��]�\?��uTT&��R���F� �J�`���ǟN���P�:iǊo��c�(��⊂d��0�(�elc�8��7"�!x���y7�x�*�P�ΒL6��N
�BSVI�Vf��_h��`�)�_��?nx�xC
h����N;��i�x�g /�P@�~�g��J��/���6�裐F�h6k�3�~���&N� tN�Ψ��jꩥ�R������꫰.pͬ��j뭸��h6]4'�BVGdM�
�젪����쳮�*���.J�Q��li֭9b ��3M�̖K�Ц�Զ��ڐq��4u�雞�CM������ �*��O���I춴uK��+j��p�`S�Ƹ�����B�Ll
�&ɞ���/�� G��̶�E['�d��[.�-+k1��fL�����-o�0o)��������kܼ4�M��tL�@�ʾS/���в�����[��<C]5����l*���
УN���Y�M���5L%s;,L~���;tPye�>�;+�����5kӫs`S���e�Lg�� b9"x>t�����qD��l#7�t�>S�w�C1;�t�<��]*;��Z�^c6�bC)Q"3�zÏO��{!z5��r��~�}�A��6�׺h׾��B �ɷ~ֲ�;��Ǫ\o~��_�;]ō��M����ELz��+�4Qݎ�Y��5(� ��].����mt�c�c\� 46�����ڇ�19U�n`���?	�K|AcU&B�A�B��!�/�a�P\b��E1n����_���875��ē����/T��2"A(&v1P~d�R�*6���6���%��L�Ȇ#wP�#hK�d")�E(R������}�/!d�b��:�Y��{�܁/R�L�c����,�ʊ.�A6���G���XC6<�Dn�В`�2�I�Gf��6��|����i�*%�5�%�Py^� v��,4�O�t'��9�U�]�J/p ���A1��&�;i�����]���=mⰛ;3��|s�9*+L�žT!�v�#���A�R��w2���'�
�.&��Y��'G0+0���(��mTP�g�7�NŌ�\^`�7Y~a�L"H���Xq
S�����ԯ�k�b1:�\�.���UL_*V�,^������F߼C\�|jG��
b���S�XC���ZDYͱb򩋬�K}���^��2��S
T�At�t%�>�jQT=U�,� �
X'���]ݪb]�T��j��`�5b����d�;�G��^�lǴ�����I�7�Ws���� a���T)ڳ[%T��K�����Rl��S�r����LQ��)ScY\C6�ŵmu�*?F;�r�5��#�T�XVt��P]� ��Ue��5h�;�^Z5���h"���2h�L����I�#0W��+Q���K��h�Z4�jd�����-ծR���0T-��A��Yt�3���RP�˼�I�V��� p��[���
b��2s5�X %WxUNn�^p^���5 ���P�A�8X�O
�OZrV�[!��+A�W�<��K[*����y��6ǹ�/�s�Tg6�y
�� �q��>�c^�oY��>,*����g������
D��`�	{����|���.�Ұ��Ui���eԅ���FIvؽ��;5�Z�0�1t"]q�K�b�y������Z�m�y�S�s��]�)l�ڠ����9���p$a:�e��kh�(�Q���.k�DB�V��eÖ	���i#y���O1�)��}HD���O���6Tϫ_B�oESQ!��T��)0�
S�B��)�ʎλ@ns(�,��z�r�>�~a���� H��-!>?1� �<�;S�S�n��[1��4�A�Ƈ*p�@��`���.ª��U���6҆����o#� y%iŵD t��rq�?K�r����1'fىw"�ɥ
V����T� 5�V!r�#��ᵆ��'�ʬ�T�A�hwe�tqU%��<,��ozC�ױ����zجF@�>��c�M����a�^Cid6@�6�rB�c4�GV���p��=J�w/1a6df���@��@אz�������V�b �0�Wx!]޴JȢ���>��9e@r�����S�5�t2�t��/s�~2(8�*�4w��zj5l�A��F���7��CiS������b�@st7�t��1J37��q����'��B�Y�(^�I�}/��X�u��2�"5r8Ixy5)=�5� J��3VȆ9C��AÁ�6RH-֒�#�k�{mh$烉S|I�5�8-��5G�M�e�2�AO'������h��=h8���(Q��{₊�B��#?��?��+�!��ł�:C��s�렋�Ë����:4��66vs�ڸU�@�،��?	#�qD�a��HQhc����É��1�C��{�؆(c,1x�����㎯�=!�3�Gkb>�x���؉��5k���2`�(�H��r��(�X=��8?�h:��ix�HF1��':��Ӡ���@�̗�")F)ݶ���4��)�H�y<p1I�xV�$Xy�Z���GX�|�'a9�sF��(�_lybnٖpk'F)f2�� �Oق5I,�A"+���"�U�d�3��0R#<Ҙ��>2�${Y�}�#�P��L��NqO� 2��Y��y����E�����&"I�8��b�q��1���q��i����	��Iu����Q��x�6��A���	٬��@��kс����ɝ�1�|��y��9��I�̙��y��4� P��Y��1��>���9��������!�i��q	���!���ڠ�Y�a�BA�I!
b!ڡ� ���yXQ�Za� �da@a�.j�.�2:�4Z�6z�8��:��<ڣ>��@�B:�D� !�clip2gif 0.7.2 by Yves Piguet ;        � 
group_two  �i       { � � b  �    	`      � �  S  �    	a      { � w   � 	A button �E�`  ��        � � Z !             	       � Object `E�      � � V !             	       � Graphic �E�`      � � T !             	       �    K  �̙�       � � C     c� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �����������
�	��� � �  � �  �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �  � Radio Buttons i(         a � L  � Radio Button 1 `D�      g' �              	  �	       � Radio Button 2 `D�      g9 �              	  � 	       � Radio Button 3 `D�      gK �              	  � 	       � Message Passing i8    �on mouseUp
  get the short name of the target
  repeat with i = 1 to it
    hide control i of me
    wait 6 ticks
  end repeat
  repeat with i = 1 to it
    show control i of me
    wait 6 ticks
  end repeat
end mouseUp
       ao � ^  � 1 �E�`      ��               	       � 2 �E�`      ��               	       � 3 �E�`      ��               	       � 4 �E�`      ��               	       � 5 �E�`      ��               	       � 6 �E�`      ��               	       � 7 �E�`      ��               	       � 8 �E�`      ��               	       � Scrolling Group i(         a u � �  � New Button �E�`      g �               	       � scrolling_if B� %on mouseUp
  show_field
end mouseUp
       ! � T B  P  <         	  �   � 	radio_if B� %on mouseUp
  show_field
end mouseUp
       ! T B  P  <         	  �   � message_if B� %on mouseUp
  show_field
end mouseUp
       !� T B  P  <         	  � 
  � example_if  �p 9on mouseUp
  check_if_I_should_go_somewhere
end mouseUp
         � �        � rWhilst this set of control looks and behaves like a normal set of controls, the controls are actually in a group.        k     k      p   It is possible to move the group, or show, hide the objects with a single command.  It is also possible to change an attribute like color or style, which will be inherited by all the controls in the group (if they do not have this information set individually).                         %      )      +      / �  �    	`       � �   � 
Bold Text `E�    �on mouseUp
  if the hilite of me is true then set the textStyle of group "group_one" to "bold"
  else set the textStyle of group "group_one" to "plain"
end mouseUp
        y: q              	     
  � scrolling_if  �p 9on mouseUp
  check_if_I_should_go_somewhere
end mouseUp
       c � � {        � kThese controls have been grouped, and the hscroll and vscroll properties of the group have been turned on.        *     *      1      6      = -   �The lockloc property of the group has also been set to true, otherwise it would resize itself to fit the controls (meaning there would be no point in having the scrollbars).                    �   OThis is usually the easiest way to implement scrolling interfaces in MetaCard.   �    	`       �  {
  � 	radio_if  �p 9on mouseUp
  check_if_I_should_go_somewhere
end mouseUp
       c# � :        � UPlacing radio buttons inside a group means they will automatically hilite correctly.    �Selecting one radio button will turn of the hilite of the others.  You can use the hilitedButton and hilitedButtonName properties to determine which button is hilited.        S     S      `      e      v 1  �    	`      #  :
    message_if  �p 9on mouseUp
  check_if_I_should_go_somewhere
end mouseUp
       c| � E        � GThese controls only have one script - placed in the group they are in.    �The mouseUp handler uses the target function to determine which control was clicked on, then repeats that many times to hide and show the buttons.                               #      @      G 1     x      |      �      �    �Note that it is necessary to place blank on/end mouseUp lines in the script of the card, to prevent controls outside the group sending messages to the group.       	`      |  E   New Button B
         ����           	      New Button B
         ����           	      New Button B
         ����           	      
menus.gif  	@         \    �GIF89a\   �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�    ,    \   G� H����*\Ȱ�Bx!�#h/"���9�ȱ#��Y���|�"��"���} �Y����L��V���@ ��K)Q�*Y�<jq�@}F֫�R���4���8Q`ň��T�ʏ�W��"�/ �W��>~k�
��ϭǿ�>�s���|��Wrժ���k���q��J3����2���؆2�i�����QY���_�g��돥@��hRM
��cʃ�+_μ��-�2X8D�ϳ'�{q�M����#���0�~�I������>��w|+U����H�tܮp�S|]��C��@S�Y�]k����Xq��ZK`���
h��*��T�-�P� ���b�7"k��J���O��S�*�X�O���?3>�{`�=���d?� ŏ?����?X�6�Fb�}a�N��aY䘅K�P�?��X+���+#���|�����#&��d W���?�:X��tE���>��aW9��h�S � �@+��g=�:�
�!�f=��)�T��ZG2��)�z�UktFdw��c�;�����:
D K�Eyh�'�6 �	Vqթ�\�Y�+N� ҏ>��+�d=`�3�*5:&/CH	�iT΄[�4�Խ�3p~��[�v�EJr�Pu�2|�]eQ\�@i��I���f*Ś�%�C���\���jCĊb��a�
�xϭ����S�
�xVOz�D���GT?x/ �V�*��Vsp����x� ��Ǐ*��7��	�u6�s1��ʓH��ψy)�0ii�ؚ��R	@z���G+��A�kA��O �R$hA+蓹@�`N�
��3(>�������� !�clip2gif 0.7.2 by Yves Piguet ;        	 buttons.gif  	@         j   �GIF89aj  �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�    ,    j  G� H����*\Ȱ�C���I�O`D���=$x޿{%J��q�ɓ����O�>���$��> UV�(�#H �z��B���41j�s��z����gE�U{j���տ}����oE�U�*�Y��X%�����;�d���J�Z���X��]�7ދ;�^=��#Kv���{�~��'��b�rf�U?V�E��׷�?�D^͊�޻���l���
��H�&ȎU��Y��ȏ� ��l��ݖ�
��Jpg͏���Rź@|�O^Ͼ�����/\����0%���X���򱗙S!�D�_U �Sc��UL��S�=�� P	��
Q�ʂ8��z+��! ���_=݇�vT�P�U�U0 w`qӍ׉ U���*��L�8�QX�%��P�%�w�$v,!�Z �������� ���Y�5��**t�D�hW�Dj���;���<V�#�r��ŏ*���+?e�O�hx�YH�)�v�8_����X�W��@�r&A��hA�����
����gO>����>,�sj��+��k�	M���Z���
U���AV�> v�*�	URG����th�%��b�R�gEۨ��V��ԟat��Y ���*q%�O}S94'<� ��}��e[o��+�QK�G�-G�?��Sv�<�#]����o��8�s͹
X�̵
��^�p~~�Ý`�k�jRvT���]��|��ح�SG�$V+�B�Z�,���mL�?t��rd\�5)��@�ID�Bw�L&�h[�=��]<�AK&FRb�ϼ�$��`Wې�4��Q�L�J?��H>��`�ƨ��r=�-�rUZ��|�!�B=��5m����>��C�Ҟ�pU�&�jm��c��E �	�B���O`df�?�����zY�V��k���V��y_W�t��k���?^}v��듅x����| !�clip2gif 0.7.2 by Yves Piguet ;        
 scrollbars.gif  	@         �   �GIF89a�  �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�    ,    �  G� H����*\Ȱ�ÇV�G����V����*�����$?~'R�Ǫ�˗�����z3�]4xO�ʑ IqU���@���H���c(�R~����J���@}jX/�ɣ7wΤ��' @N����Tཱུ4����+EVu� 	�cޖg��
@*�65�걾�8�.�W�(]���i-�
�>���B�W��?�a����Ϣ��*�'�wC� /v���L}�W�����s��+J�pH+V�֥��J���B�:�wR���o_ �h=�,H��뫄��_|��a��z ��d� >�S�m��C�Q���OO���@��2 ���ۈ$�h�(>dO��"�)���?�v1&t�g�sP��y�OU�P�*��h���ä
�����6�� �Bb^�s�q�dk QI֕N^� YU,	��e�xqiY ���J�(O 6�u5���Vb�<�ݤ+��5?8Z�^vS��E���y)�>�ȕ=䡄�s� �%E�my�X��_���m���p��d�g���Z�%��M��m�2��H���%}E�ZO��X�#M�bW�X��J"(�N��T�E�S�^���@��2e�"��>���d�>'��!R�$�P>�퓏�7�#AV\l>룥^ �l��=��I&)��4�,�
U�� ���3<� ��mlsGU�"�6/[�M�pu�
!N�����
c B��̴�d�R�E��X/�؇UT�vN�Zg�y��6D��%�!MU�ˠR����|SGЄ�n��eQ�U�M�]fJϑ{�C魢�@��r�����I���Q��;��u�	�h�fZ��E��g#�גk6���!ϊVDE��mr�[۾ ��O(+��?����?��
&M#9�d�)	�}�&]6!��>]�=�P6������j�F$��d'D�^aNW�s]�C5́W���
��"���T�B��k ��~�e���cdt�>.'��<J[
�Iuj�W��̶,��D�CUS���ɽyn!����E�6�&�����C�`�ls�G���@��ߪo�����$��G��G���b4�
XA>�Û@.B�+�L����Nhy#J2}�d-�*KQ���/�霱�c�&��0�P�A^��JV�p$>,i�����$B5KbŐ
c�^>tI����Y)5��ԣ���O=N����z��݆Ĩ !�clip2gif 0.7.2 by Yves Piguet ;         Pulldown Menus �(           � 5   Simple Pulldown  �M           � v        ,Pulldown 1
Pulldown 2
Pulldown 3
Pulldown 4      	        Complex Pulldown  EM          � � �      MC Demo Menu      	        Tabbed Button i(           � �   New Button ��)m           � � t       Tab 1
Tab 2
Tab 3
Tab 4        	        Option Menu i(         n � � H   Option Menu  �m         t � l       	Option 1    $Option 1
Option 2
Option 3
Option 4       	        PopUp menu  i(         n � � �
     x    0on mouseUp
  popup "popup_example"
end mouseUp
       t � � s           &Click in this field for a Popup menu.    pulldown_if B� %on mouseUp
  show_field
end mouseUp
        � T B  P  <         	      
tabbed_if B� %on mouseUp
  show_field
end mouseUp
        T B  P  <         	      
option_if B� %on mouseUp
  show_field
end mouseUp
       % � T B  P  <         	      	popup_if B� %on mouseUp
  show_field
end mouseUp
       % T B  P  <         	   
   pulldown_if  �p 9on mouseUp
  check_if_I_should_go_somewhere
end mouseUp
         � � D         >These two buttons use two different techniques to draw menus.   �The simple menu is a single object.  The button has its contents set to contain the names of the items, which are drawn automatically when the button is depressed.  Setting the font of the button will affect all the items.  When an item is chosen, a menuPick message is sent to the button (together with the name of the item chosen).  Normally, you can use a switch structure to choose the correct course of action.        �     �      e    g     m 2  The complex menu is actually another stack.  The button has its menuName property set to the name of this stack, which is opened as a menu when the button is clicked.  As it is a normal stack, it can contain any kind of control, even including icons and images.        @     @      H �      	`       � �  D
   
tabbed_if  �p 9on mouseUp
  check_if_I_should_go_somewhere
end mouseUp
         � � v         wThis is a single button.  Its style has been set to menu.  Its contents (text) has been set to the names of the items.                   # &     I      M )   �When it's clicked on, a menuPick message is sent to the button, with the name of the previously chosen item and the item being chosen.                     f   �Its usually simplest to have a series of groups named the same as each tab, and to hide the old one and show the new one when the button is clicked.       	`       � �  v
   
option_if  �!p 9on mouseUp
  check_if_I_should_go_somewhere
end mouseUp
       q � � E         rThis is a single button.  Its style has been set to option.  Its contents (text) contains the names of the items.                   # (     K      O "   RWhen its clicked on, a menuPick message is sent with the name of the item chosen.                    2       	`       �  E
  ! 	popUp_if  �p 9on mouseUp
  check_if_I_should_go_somewhere
end mouseUp
       q � � i         �This example differs from the others in being the only one to use a command to load the menu.  The popUp command is used to load a stack with the items in it.  Like the complex pulldown on the left, this stack can contain any kind of control.        c     c      h �  "    	`       �  i  * Styles Of Button  i(           � � �  # Normal �E�h           � �              	       $ Default �M�h           � �              	       % 	Shadowed �E��           � �              	       & 
2D button �E�h       @   �              	       ' 	Checkbox `E�          > �              	       ) Radio Button `D�          Y �              	   	       + 
styles_if B� %on mouseUp
  show_field
end mouseUp
        � � T B  P  <         	     / Colored Buttons i(         ! � � ~  , Red �E�` � ������  ww      DD      ��      ������    4 � �               	       - Yellow �E�` �         ����33  ����    ������    4 � �               	       . Green �E�`    ��      DD      4 � �               	       0 colored_if B� %on mouseUp
  show_field
end mouseUp
       � � T B  P  <         	   
  1 
styles_if  �p 9on mouseUp
  check_if_I_should_go_somewhere
end mouseUp
         � � �         &Buttons can be many different styles.                   $    pNone of these buttons have scripts, all the tracking and hiliting is done automatically by the MetaCard engine.   2    `       � �  �
  3 colored_if  �p 9on mouseUp
  check_if_I_should_go_somewhere
end mouseUp
       $ � � j         �These buttons have their backGroundColor properties set to red, yellow and green, their hiliteColor set to dark red, dark yellow and dark green.  Additionally, the red button has its foreGroundColor set to white, to make the text show much.                   ( 0     X      c T     �      � *  4    	`      � �  j  7 Number Example i(           � � ;  5    )p �on scrollbarLineInc
  subtract 1 from fld "scrollbar_number"
end scrollbarLineInc

on scrollbarLineDec
  add 1 to fld "scrollbar_number"
end scrollbarLineDec
        � �  
  6 scrollbar_number  )h           � v          1   > Scale Example  i(          �  8 scale_example  �i         2 � (  � (� 0  100       
  :   )x    �on closeField
  if me is a number then
    set the startValue of scrollbar "scale_example" to me
  else
    beep
put 0 into me
  end if
end closeField
       Ya k          0 
  ;   )x    �on closeField
  if me is a number then
    set the endValue of scrollbar "scale_example" to me
  else
    beep
    put 100 into me
  end if
end closeField
       Y� k          100 
  <  	         b F            Starts: 
  =  	         � ;            Ends:   B Progress Example  i(          � s  9 progress_example  Ia       � �   33333   5         ? 	Fill it! �E�p�on mouseUp
  set the endValue of scrollbar "progress_example" to fld "progress_seconds"
  send "update_bar" to me in 1 second
end mouseUp

on update_bar
  get the thumbposition of scrollbar "progress_example"
  add 1 to it
  if it > fld "progress_seconds" then
    beep
    set the thumbposition of scrollbar "progress_example" to 0
    exit update_bar
  end if
  set the thumbposition of scrollbar "progress_example" to it
  send "update_bar" to me in 1 second
end update_bar
        � ]              	     
  @  	          � �            Seconds (approx): 
  A progress_seconds  )p �on closeField
  if me is not a number then
    beep
    put 5 into me
  end if
  if me < 1 then
    beep
    put 1 into me
  end if
  if me > 100 then
    beep
    put 100 into me
  end if
end closeField
       � � _          5   C 
number_if B� %on mouseUp
  show_field
end mouseUp
        � � T B  P  <         	     D progress_if B� %on mouseUp
  show_field
end mouseUp
        � T B  P  <         	     E 	scale_if B� %on mouseUp
  show_field
end mouseUp
       G T B  P  <         	   
  F 
number_if  �p 9on mouseUp
  check_if_I_should_go_somewhere
end mouseUp
         � � Z         This is a normal scrollbar.    hIt intercepts the scrollbarLineInc and scrollbarLineDec to add and subtract to the values in the field.    uNote that it would be possible to alter how fast this bar scrolls by changing the repeatRate and repeatDelay values.        R     R 
     \      a      l   G    	`       � �  K  M    	a        � � 
  H 	scale_if  �p 9on mouseUp
  check_if_I_should_go_somewhere
end mouseUp
        @ � p         !This is a scale style scrollbar.    fThe Start and End fields set its startValue and endValues.  It will scroll between these values only.        !     ! 
     +      0 	     9 ,   cThe current position is displayed numerically because the showValue property has been set to true.        :     : 	     C   I    	`       �@  p
  J progress_if  �p 9on mouseUp
  check_if_I_should_go_somewhere
end mouseUp
        � � ^         $This is a progress style scrollbar.   	The Seconds field is used to set its endValue.  The send command is then used to send a message every second which increments the thumbPosition of the bar.  When the position equals the value displayed in the field, a beep is played and the position is reset to 0.        %     %      -      4      8 J     �      � y  K    	`       �  ^  � 	how_work  �p con preopenCard
  
end preopenCard

on preopenstack
end preopenstack

on closestack
end closestack
       �t�|         How Does It Work?      X     U Courier  U 
Helvetica   �    	@          �|  �
  �   �	`        �{        � �So you've seen the demo, now you want to know "How does it work"?  This document is a quick off-the-track look at how the demo was put together, and how you can open it up for "editing" - i.e. read all the scripts, etc.   �A warning: the entire demo was put together at great speed.  As a result the scripts are not particularly well layed out.  Many of the scripts could in fact be shortened considerably by grouping more of the common tasks into function handlers.  However, it is always faster to produce scripts by copying and pasting, then "hardwiring" the numbers (e.g. co-ordinates) directly into them.  This is not generally a recommened technique.  You'll have to decide for yourself how much time to put into making your own scripts reusable, vs. creating them quickly.  I wouldn't advise the scripting style employed in this demo in any but the most time-pressured scenerios.  The time spent making code reusable is usually time very well spent.  @ �      Red   � @ �      Red � ;   #To "open" the demo up for editing:    H1) Open it in the normal way, and wait for the contents screen to load.  )2) Type Control-M to get the message box              	       :3) Type palette "Metacard menu bar" into the message box.                    #  ^4) You can now edit the objects and scripts using the tools on the menubar in the normal way.    $Here are a few points worth noting:   fOn the contents screen, the 3d buttons have been scripted.  The script is used to track the mouse movement and provide hiliting when the mouse is moving and held down.  It is possible to simply place the IDs for each image directly onto the button palette (icon and hilite icon), which would do this job automatically.  Why wasn't it done this way?  Because during the MetaCard 2.1.1 beta testing phase, the Windows 95 version of Metacard offset all icons (by 1 pixel right and 1 pixel down) when depressed (which would have made the 3D-rendered depressed image move incorrectly).  It is now possible to turn this off by turning off the buttons "3D" property.  It would have taken a fair bit of time to go back and change all the buttons, so this has not been done.  If the auto-hiliting feature had not been altered like this, it would have been a good script to copy!       �    � A    � >     =    Q   8During the self-running sections, the line if the mouseclick then exit_h appears regularly.  This line is used to check for the mouse having been pressed (the mouseclick returns true if the mouse has been pressed since the script started running).  If it has been pressed, the exit_h handler is called.  This brings up a dialog box window (stack "halt") at the bottom of the screen.  The fact that the window is borderless means that it doesn't look like a seperate window.  When this is open, the script of the self running section is suspended.  When the user clicks a button on the dialog, it returns the button name to the exit_h handler, which then gives up control and the self running section continues, or it restarts the current section, goes to the menu, etc.  This approach has the advantage of preventing user interaction with the self running section when it is paused, and of being quick to put in place.  However, it does mean that the state of the mouse is not checked very regularly.  For example, it is only checked at the end of each wait statement.  Some of the wait statements are several seconds long (to allow the user to read the text), so the response may be a bit sluggish.  It would be possible to alter each mouseclick check to improve response time.  For example, a 4 second wait currently looks like this:        +      +      H S      �      � l          X     s     y�          ! �     � 
    � Y   wait 4 seconds          if the mouseclick then exit_h            But if written like this...    #put the seconds into start_seconds         " wait until the mouse is down \          %  or the seconds - start_seconds > 4         $ /if the seconds - start_seconds < 5 then exit_h         .  �...the exiting would be instant.  But that would have been too much work - the first option requiring only simple pasting into the script!  Another option would have been to split the single long handler (opencard) into multiple handlers linked with send "doTheNextBit" to me in x milliseconds instead of wait.  This would have been much better design: as all the information on what to do next could have been stored in customProperties; there would be no delay in pressing the mouse (just respond to a mouseUp event as no other handler is running); and there would have been no need to open a dialog box (the send command could have been cancelled and resumed).  But, it would have taken quite a while to set up an architecture like that.        �      �      � %      � +    % �     �     � �  �The self running sections consist of cards for each section.  Every time you see a title scroll in on the right (an image controlled by the move command), you have actually gone to another card.  Each card is self-contained.  The preOpenCard handler resets all the objects, and the openCard handler runs the presentation.  This makes it possible to go to any card individually (the map does this).  To get around this autostart feature, try running the following in the Message Box:        �      �      � V      �      � )          " � lock messages; go next   vAn important handler that gets called on preOpenCard is auto_update.  This resets the positions of all the objects on the card, and hides and shows them according to customProperties set for each object.  When building the demo, a palette was created which allowed selecting an object, and specifying its position and visibility.  The palette set the autovisible and autoloc customProperties of the selectedobject.  Auto_update loops through all the objects and sets them to these values.  This is a good example of modifying the MetaCard environment to make development easier.  The palette was added to our copy of the menubar.        )      )      4       8      C2  �The large miniscreen (in the second self-running section) is made up of a single group, with multiple sub-groups to contain all the dialogs and menus, etc.  This is a good technique, as the miniscreen can be placed on all the relevant self-running cards without using extra disk space.  A single script (reset_miniscreen) moves everything back to the start.  All the objects on the miniscreen are real controls, e.g. the menubar is made of real buttons, so it changes appearance correctly dependant on the lookandfeel (Windows or Motif).  The only exception are the window borders, which are imported images.  The reset_miniscreen handler changes which set of border images is visible, dependant of the lookandfeel.       0     0     @ �     �      a     f     v I     �  �The group architeuture also means that once the objects have loaded, they dont have to be loaded again.  So whilst there may be a delay (on slow systems) starting the self-running section, there won't be delays between each card. �Finally, the cursor in the miniscreen is simply a button.  The icon of that button is set to represent which-ever tool is choosen (e.g. pointer, browse, etc.), and the layer is set to display the button on top of all the other graphics.  It is moved to the positions of the various buttons and fields on the miniscreen with the move command (usually move in x milliseconds, to look the same on all systems).       H     H     L      ^     t #   �The workings of the "Personal Organizer Stack" are described in detail in the dissection mode for that stack, so there is no need to look at them again here.    }The "Delivery Example" (from the advanced section) can be opened by typing toplevel "delivery example" into the message box.        K      K      f    'Hope you enjoy dissasembling the demo.           RIf you've read this far, you may as well know: the demo was created on a Macintosh, running a Windows emulator!  Whilst the Windows environment was slow, it meant we had top-class facilities for drawing all the graphics, rendering the 3D parts, and recording the sounds, etc.  (A real PC was used very occasionally, to test performance.)   �    	`      �  {  � object_information  �p�on mouseUp
  local it
  if word 1 of the target is not "field" then exit mouseup
  do "get the num of " & the target
  if it is not "1" then exit mouseUp
  if the textfont of the clickchunk is "courier" then
    if there is a card the clickText of stack "Concepts & Techniques"
    then go to card the clickText of stack "Concepts & Techniques"
    else if there is a card the clickText of stack "MetaTalk Reference"
    then go to card the clickText of stack "MetaTalk Reference"
    else if the clicktext is "custom property" then go cd 35 of stack "concepts & techniques"
    exit mouseup
  end if
  if the textstyle of the clickchunk is "bold" then
    if there is a card the clicktext of stack "labs" then go cd the clicktext of stack "labs"
    exit mouseup
  end if
end mouseUp

on preopenstack
  set the loc of this stack to the loc of stack "personal organiser"
end preopenstack

on preopencard
  put the name of this cd into fld "cd_name"
end preopencard
       , ��w              	  U courier   U 
Helvetica   U courier   W 
Helvetica  @U 
Helvetica  @U courier  U 
Helvetica  U 
Helvetica  
 U 
Helvetica   � advanced_properties_notes   	P--on preopenCard
  -- format_field_one
end preopenCard

on format_field_one
  local start_char, end_char
  repeat
    get offset("#", fld 1)
    if it is 0 then exit repeat
    put it into start_char
    delete char start_char of fld 1
    get offset("#", fld 1)
    if it is 0 then exit repeat
    put it into end_char
    delete char end_char of fld 1
    set the textfont of char start_char to end_char of fld 1 to "courier"
  end repeat
  repeat
    get offset("$", fld 1)
    if it is 0 then exit repeat
    put it into start_char
    delete char start_char of fld 1
    get offset("$", fld 1)
    if it is 0 then exit repeat
    put it into end_char
    delete char end_char of fld 1
    set the textstyle of char start_char to end_char of fld 1 to "bold"
  end repeat
end format_field_one
           �w  �  �  beginner_script_New Appointment   	@          �w  �  �  advanced_script_New Appointment   	@          �w  �  �  � #beginner_script_delete appointment   	@          �w  �  � #advanced_script_delete appointment   	@          �w  �  �  � advanced_script_calendar   	@          �w  �  �  C beginner_script_new record   	@          �w  �  D beginner_script_left   	@          �w  �  E beginner_script_right   	@          �w  �  F advanced_script_left   	@          �w  �  �  G advanced_script_right   	@          �w  �  �   beginner_properties_r_number   	@          �w  �   advanced_properties_r_number   	@          �w  �   beginner_script_r_number   	@          �w  �    beginner_properties_photo_label   	@          �w  �    advanced_properties_photo_label   	@          �w  �   "advanced_properties_record_labels   	@          �w  �   advanced_script_record_labels   	@          �w  �  ! beginner_script_record_labels   	@          �w  �  " "beginner_properties_record_fields   	@          �w  �  # "advanced_properties_record_fields   	@          �w  �    "beginner_properties_record_labels   	@          �w  �   advanced_script_photo_label   	@          �w  �  $ advanced_script_record_fields   	@          �w  �  % beginner_script_record_fields   	@          �w  �  & beginner_properties_photo   	@          �w  �  ( beginner_script_photo   	@          �w  �  ) advanced_script_photo   	@          �w  �  * advanced_properties_import   	@          �w  �  . beginner_script_import   	@          �w  �  / advanced_script_import   	@          �w  �  �  1 beginner_script_clear   	@          �w  �  3 advanced_properties_new record   	@          �w  �  H advanced_script_new record   	@          �w  �  �  I beginner_script_delete record   	@          �w  �  9 beginner_properties_new record   	@          �w  �  : "beginner_properties_delete record   	@          �w  �  ; #beginner_properties_search records   	@          �w  �  < !beginner_properties_sort records   	@          �w  �  =  beginner_properties_copy record   	@          �w  �  > "beginner_properties_export record   	@          �w  �  2 advanced_script_clear   	@          �w  �  �  J advanced_script_delete record   	@          �w  �  �  K advanced_script_search records   	@          �w  �  �  L beginner_script_search records   	@          �w  �  M beginner_script_sort records   	@          �w  �  N advanced_script_sort records   	@          �w  �  �  O advanced_script_copy record   	@          �w  �  �  P beginner_script_copy record   	@          �w  �  Q beginner_script_export record   	@          �w  �  R advanced_script_export record   	@          �w  �  �  + beginner_properties_import   	@          �w  �  f beginner_properties_today   	@          �w  �  g beginner_properties_tomorow   	@          �w  �  h $beginner_properties_New Appointment   	@          �w  �  t  beginner_properties_close_boxes   	@          �w  �  u !beginner_properties_resize_boxes   	@          �w  �  v !advanced_properties_resize_boxes   	@          �w  �  i 'beginner_properties_delete appointment   	@          �w  �  j advanced_properties_today   	@          �w  �  k advanced_properties_tomorow   	@          �w  �  l $advanced_properties_New Appointment   	@          �w  �  m 'advanced_properties_delete appointment   	@          �w  �  , beginner_properties_clear   	@          �w  �  - advanced_properties_clear   	@          �w  �  4 "advanced_properties_delete record   	@          �w  �  5 #advanced_properties_search records   	@          �w  �  ? advanced_properties_left   	@          �w  �  @ advanced_properties_right   	@          �w  �  d advanced_properties_next_ap   	@          �w  �  e advanced_properties_prev_ap   	@          �w  �  A beginner_properties_left   	@          �w  �  B beginner_properties_right   	@          �w  �  b beginner_properties_prev_ap   	@          �w  �  c beginner_properties_next_ap   	@          �w  �  6 !advanced_properties_sort records   	@          �w  �  7  advanced_properties_copy record   	@          �w  �  8 "advanced_properties_export record   	@          �w  �  ' advanced_properties_photo   	@          �w  �   advanced_script_r_number   	@          �w  �  � beginner_script_title   	@          �w  �  � beginner_properties_title   	@          �w  �  � advanced_properties_title   	@          �w  �  a beginner_properties_timer   	@          �w  �  { beginner_script_timer   	@          �w  �  � advanced_script_timer   	@          �w  �  �  | beginner_script_time_bar   	@          �w  �  � advanced_script_time_bar   	@          �w  �  �  � beginner_script_month_bar   	@          �w  �  � advanced_script_month_bar   	@          �w  �  �  � advanced_script_year_bar   	@          �w  �  �  � beginner_script_year_bar   	@          �w  �  � beginner_script_today   	@          �w  �  � beginner_script_tomorow   	@          �w  �  ~ beginner_script_prev_ap   	@          �w  �  � advanced_script_prev_ap   	@          �w  �  �  � advanced_script_next_ap   	@          �w  �  �   beginner_script_next_ap   	@          �w  �  } beginner_script_month_year   	@          �w  �  � advanced_script_title   	@          �w  �  �  � advanced_script_notes   	@          �w  �  �  � beginner_properties_notes   	@          �w  �  w beginner_script_calendar   	@          �w  �  � beginner_properties_file   	@          �w  �  � advanced_properties_file   	@          �w  �   advanced_script_edit   	@          �w  �  �   advanced_properties_navigation   	@          �w  �   advanced_script_navigation   	@          �w  �  �  � beginner_script_resize_boxes   	@          �w  �  �  � beginner_script_close_boxes   	@          �w  �  �  
 advanced_script_tab   	@          �w  �  �  S advanced_script_date   	@          �w  �  U  advanced_properties_close_boxes   	@          �w  �  V advanced_properties_calendar   	@          �w  �  X !advanced_properties_days_of_week   	@          �w  �  Y !beginner_properties_days_of_week   	@          �w  �  W beginner_properties_calendar   	@          �w  �  Z !beginner_properties_record_title   	@          �w  �  ` advanced_properties_timer   	@          �w  �  n advanced_properties_time_bar   	@          �w  �  r advanced_properties_month_bar   	@          �w  �  s advanced_properties_year_bar   	@          �w  �  o beginner_properties_time_bar   	@          �w  �  p beginner_properties_month_bar   	@          �w  �  q beginner_properties_year_bar   	@          �w  �  [ !advanced_properties_record_title   	@          �w  �  \ advanced_properties_date   	@          �w  �  ] beginner_properties_date   	@          �w  �  ^ beginner_properties_month_year   	@          �w  �  _ advanced_properties_month_year   	@          �w  �   advanced_properties_tab   	@          �w  �  	 beginner_script_tab   	@          �w  �   beginner_properties_tab   	@          �w  �    beginner_properties_org_pattern   	@          �w  �   beginner_script_org_pattern   	@          �w  �  � advanced_script_resize_boxes   	@          �w  �  �  � advanced_script_close_boxes   	@          �w  �  �  x beginner_script_date   	@          �w  �  y beginner_script_days_of_week   	@          �w  �  z beginner_script_record_title   	@          �w  �   advanced_script_org_pattern   	@          �w  �  � advanced_script_month_year   	@          �w  �  � advanced_script_days_of_week   	@          �w  �  � advanced_script_record_title   	@          �w  �   beginner_script_photo_label   	@          �w  �    advanced_properties_org_pattern   	@          �w  �   beginner_script_navigation   	@          �w  �   beginner_properties_navigation   	@          �w  �   beginner_script_edit   	@          �w  �  � advanced_script_file   	@          �w  �  �  � beginner_properties_edit   	@          �w  �    advanced_properties_edit   	@          �w  �  � beginner_script_file   	@          �w  �  � beginner_script_notes   	@          �w  �  � main_group   i       �����w
  �   �	h            ������      �I        � ZThis is a normal scrolling field.  It has been named "Notes" for easy referal in scripts.    The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �         :The toolTip property has been set to "Appointment notes".                    -   SThis is a normal field.  It has been named "r_number" for easy referal in scripts.    oThe textfont of the field has been set to a larger point size.  The foreGroundColor has been set to dark blue.                    8     D      S    The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �         �The toolTip property has been set to "Record number".    This causes MetaCard to display a yellow box containing this information when the mouse pauses over the object.                    �  G IThis script does a visual effect (push left) then goes to the next card.                    /  F NThis script does a visual effect (push right) then goes to the previous card.                    4  E IThis script does a visual effect (push left) then goes to the next card.                    /  D NThis script does a visual effect (push right) then goes to the previous card.                    4  C  This script creates a new card.                      kMetaCard automatically places all the existing controls from this card onto the new card.  This is because all the controls are in groups (backgrounds).  The text in the Contact entries is different on each card because those fields have their sharedText properties set to false.  The image on each record is not part of a group, and so is specific to each card.        �     �      � k     � 
     � l   eAll the components of the Diary group are placed onto the new card too, as they are also in a group.        ^     ^      c   � �These buttons all use a single script that has been placed in the group containing them.  It determines which button has been clicked on using the target function, and then looks up data for that day, displays it, and hilites the button.        B     B      G L     �      � A     �      �      �    �The data for each record is stored in a custom property attached to the diary group.  For each day that there is a record, a set of custom properties are created which store information on that day.          (     (      7 �   	Example:    �The script in the group receives the mouseUp message when you click, and knows which button you clicked on by querying the target.        %     %      , O     {      �   �It then puts together a date from the day clicked on, using the month and year (visible in the fields below).  This is displayed in the "date" field.  The convert function is then used to convert the date to seconds.  Try typing "the date" into the message box to see the date, then clear the line and type "convert the date to seconds; put it" for an example of the same date represended like this.  (You can get the message box at any time by typing CNTRL-M.)        �     �      � .     �      � �   �This number is then used to access the correct custom property that holds the list of records for that day.  The records are displayed using by using the put command to put the custom property into the fields.        /     /      > \     �      � 4  <Each day has a record called "titles"&day, where day is the date for that day represented as seconds.  This contains a list of the titles for the records stored on that day, one per line.  This is used to access each record, and to display the popUp menu when the Calendar is clicked on with the right mouse button.        <     <      @ �   �Similarly, each day has a record called "times"&day.  This contains a list of the times for each appointment.  This record is sorted so that Appointments appear in chronological order.   +In order that each title is linked to the correct line, an ID is attached to each record.  It is the first item on each line, and is stripped before the record is displayed.  This allows the times to be sorted (by item 2, the actual data), and item 1 (the ID) will still refer to the correct title.    �Finally, the "notes" field is stored in a seperate custom property, one for each Appointment on each day.  The custom property name is built from "notes"&day&record_id.  Record_id is a variable which stores the record ID (as described above).    �Here are the custom properties and contents set for Jun 4th, 1997 - the date the Calendar has been set to open at (because that date containts a sample appointment).      gtitles865378800  --the record holding the titles (remember the number is Jun 4th converted to seconds)              W   $              1,Dentist for Floppet                 6times865378800 --the record holding the list of times              '                 1,11:00 AM              
   +notes8653788001 --notes, day and record_id                 T              must remember to take Floppet to the dentist for that root canal work              E     bIf you want, you can try viewing these yourself.  Select the Personal Organizer stack, then type:    2palette "metacard menu bar"; select group "diary"        1   �Then choose "Object properties" from the edit menu, click the "Extras" tab on the right, and click "Custom properties" to view them.      mSaving records uses the current date and record number being viewed to create the correct custom properties.   �The popUp menu which appears when you click the right mouse button on a day is created from the titles list of the day selected.  The popUp menu is a seperate stack, which is resized dependant on the number of records saved in the day selected.  The popUp command is used to load this stack as a menu, at the position the user clicked.  The resizing is done during preOpenStack (a message which is sent before the stack is drawn on the screen).                   	 �     �      � n    m     y C  � ~This script creates deletes the current appointment.  See the Calendar group for more details on how appointments are stored.   � ~This script creates deletes the current appointment.  See the Calendar group for more details on how appointments are stored.   � pThis script creates a new appointment.  See the Calendar group for more details on how appointments are stored.   � pThis script creates a new appointment.  See the Calendar group for more details on how appointments are stored.   � �This field has a closeField handler.   The closeField message is sent whenever a field *has* been changed and is loosing the keyboard focus.              
           + 
     5 W   �This script calls a handler (located in the stack script) which stores any changes made. A seperate custom property is used to store information specific to each day.        d     d      s 3   �Note that if the field has not been changed, the exitField message is sent instead.  This message is not intercepted by this field (if no changes have been made there is no need to store them).        1     1 	     : �  � uThis button has a menuPick hander.  This handler determines which item was chosen, and runs the appropriate command.                    Z   �The Save command saves this stack, and the Exit command closes this stack.  If this were a standalone application, the quit command would be called.                    o     w      {      This is a pulldown menu button.    �The text property has been set to contain the names of the menu items.  These are displayed as a menu panel automatically by MetaCard when the button is clicked on.                    �   !The text property is as follows:    4&Undo        --The & symbol places the accelerator.        '     '      (  /-                    --This creates a divider.  &Cut  C&opy  &Paste   �  This is a pulldown menu button.    �The text property has been set to contain the names of the menu items.  These are displayed as a menu panel automatically by MetaCard when the button is clicked on.                    �   !The text property is as follows:    4&Undo        --The & symbol places the accelerator.        '     '      (  /-                    --This creates a divider.  &Cut  C&opy  &Paste   � �This button has a menuPick hander.  The name of the command chosen is sent as a parameter to the handler.  A switch structure is used to choose the appropriate course of action.                    S     m      s >   �The Save command saves this stack, and the Exit command closes this stack.  If this were a standalone application, the quit command would be called.                    o     w      {    uThis button has a menuPick hander.  This handler determines which item was chosen, and runs the appropriate command.                    Z   VEach command (undo, cut, copy, paste) executes the MetaCard command of the same name.                                                       $ 1    This is a pulldown menu button.    �The text property has been set to contain the names of the menu items.  These are displayed as a menu panel automatically by MetaCard when the button is clicked on.                    �   !The text property is as follows:    :&Diary             --The & symbol places the accelerator.        -     -      .  
&Contacts  3-                        --This creates a divider.  C&alculator    vThis button has a menuPick hander.  This handler determines which item was chosen, and runs the appropriate command.                    Z   �Diary: uses the MetaCard click command to click at the loc of the Diary tab.  This is equivalent to clicking at this point with the mouse.                         7      : P   "Contacts: does the same as Diary.    GCalculator: this opens a palette window which contains the Calculator.                     &  1The patterned image is done by setting the backgroundPattern of the a square graphic object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �            This is a static object which does not have a script.  The only script to affect it is the resizeStack handler which scales it when the Window is resized.  See the information for the close box  and resize boxes for more information about the resizeStack handler.        [     [      f �     �      � 	  � $This object does not have a script.    �The Appointment number is placed into it by a script in the stack (displayrecord) which is called every time the day is changed.   �This is a static object which does not have a script.  The only script to affect it is the resizeStack handler which scales it when the Window is resized.  See the information for the close and resize boxes for more information about the resizeStack handler.        [     [      f �     �      � 	  � �These fields do not have a script.  Their contents is set by the scrollbars on the left, or by the script of the stack (whenever the month or year being displayed is changed).   This is a static object which does not have a script.  The only script to affect it is the resizeStack handler which scales it when the Window is resized.  See the information for the close box  and resize boxes for more information about the resizeStack handler.        [     [      f �     �      � 	  z $This object does not have a script.    �The Appointment number is placed into it by a script in the stack which is called every time the day is changed.  Note that field was designed to display the total number of Appointments for this day, not in the entire Diary.   yThis is a static object which does not have a script.  The only script to affect it is the resizeStack handler which scales it when the Window is resized.  See the information for the close and resize boxes for more information about the resizeStack handler.        [     [      f �     �      � 	  x 8This is a static object which does not have a script.      �The date is placed into it by a script in the stack which is called whenever the day being displayed is changed.  The date itself is created using the MetaCard date function.        �     �      � 
  � �This is not a real object, and therefore doesn't have a script.  However, when its used, a closeStackRequest message, and then a closeStack message is sent to the current stack.        [     [      l      � 
     � &  If this were a real application, the closeStackRequest message could be used to check if the user wanted to save changes before closing.  If the handler is exited rather than passed, stack closing will be aborted (this can be used to create a "Really Quit?" cancel dialog).        %     %      6 �  � �This is not a real object, and therefore doesn't have a script.  However, when its used, a resizeStack message is sent to the current stack.        [     [      f &   }This message is intercepted and used to resize all the controls in the stack to the correct sizes, relative to the new size.    SThere are a number of approaches you can take to this kind of geometry management.        >     >      Q   The approach taken here has been to attach a custom property to each control on the card, which stores its width as a percentage of the card's width; its height as a percentage of the card's height; and its location as percent of its position on the card across and down.    |When the stack is resized, the width, height, and loc of each object is set to the percentage values of the new stack size.                   $      &      ,      2      5 F   �It would be possible to simply resize each control to a percentage of the stack size without using custom properties, but this would quickly lead to rounding off errors as the stack was resized up and down to uneven sizes.    �A handler (geosetup) is present in the script of the Organizer.  It was used to assign custom properties to each control, and it should be possible to copy it and the resizeStack handler into your own stacks.    yA more complex geometry manager could have resized the text in each field too, but this is not usually worth the effort.   This is a static object which does not have a script.  The only script to affect it is the resizeStack handler which scales it when the Window is resized.  See the information for the close and resize boxes for more information about the resizeStack handler.        [     [      f �     �      � 	  1The patterned image is done by setting the backgroundPattern of the a square graphic object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �             This a tabbed button.    >The text property of this button contains Diary and Contacts.                    5   eThe textfont has been set to a larger size and dark blue color to improve the tab labels appearance.                    X  	 �This button has a menuPick hander.  This handler shows the group coresponding to the item chosen, and hides the other group.  See the Groups lab for more information on groups.                    !     ;      @ 6     v      {      �      � $   This a tabbed button.    >The text property of this button contains Diary and Contacts.                    5   eThe textfont has been set to a larger size and dark blue color to improve the tab labels appearance.                    X  _ _These are normal fields.  They have been named "Month" and "Year" for easy referal in scripts.    The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        ^ ^These are normal fields. They have been named "Month" and "Year" for easy referal in scripts.    The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        ] OThis is a normal field.  It has been named "Date" for easy referal in scripts.    2The textSize has been set to a larger point size.                    %   The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �         �The toolTip property has been set to "Date of appointments currently being viewed".  This causes MetaCard to display a yellow box containing this information when the mouse pauses over the object.                    �  \ OThis is a normal field.  It has been named "Date" for easy referal in scripts.    2The textSize has been set to a larger point size.                    %   The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �         TThe toolTip property has been set to "Date of appointments currently being viewed".                    H  [ WThis is a normal field.  It has been named "Record_title" for easy referal in scripts.    The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �         <The toolTip property has been set to "Appointment number".                     0  qThis a scrollbar object.  It has been sized very small.  The thumbSize has been set to 0.  The startValue and endValue have been set to 1 and 2 respectively.  This means that the scrollbar position will always be either 1 or 2 depending on direction of travel.              	      -     = 	     F      _ 
     i      n      v �   �The toolTip property has been set to "Change Year".  This causes MetaCard to display a yellow box containing this information when the mouse pauses over the object.                    �  pThis a scrollbar object.  It has been sized very small.  The thumbSize has been set to 0.  The startValue and endValue have been set to 1 and 2 respectively.  This means that the scrollbar position will always be either 1 or 2 depending on direction of travel.              	      -     = 	     F      _ 
     i      n      v �   �The toolTip property has been set to "Change Month".  This causes MetaCard to display a yellow box containing this information when the mouse pauses over the object.                    �  oThis a scrollbar object.  It has been sized very small.  The thumbSize has been set to 0.  The startValue and endValue have been set to 1 and 2 respectively.  This means that the scrollbar position will always be either 1 or 2 depending on direction of travel.              	      -     = 	     F      _ 
     i      n      v �   �The toolTip property has been set to "Change Time".  This causes MetaCard to display a yellow box containing this information when the mouse pauses over the object.                    �  sThis a scrollbar object.  It has been sized very small.  The thumbSize has been set to 0.  The startValue and endValue have been set to 1 and 2 respectively.  This means that the scrollbar position will always be either 1 or 2 depending on direction of travel.              	      -     = 	     F      _ 
     i      n      v �   4The toolTip property has been set to "Change Year".                    (  rThis a scrollbar object.  It has been sized very small.  The thumbSize has been set to 0.  The startValue and endValue have been set to 1 and 2 respectively.  This means that the scrollbar position will always be either 1 or 2 depending on direction of travel.              	      -     = 	     F      _ 
     i      n      v �   5The toolTip property has been set to "Change Month".                    )  nThis a scrollbar object.  It has been sized very small.  The thumbSize has been set to 0.  The startValue and endValue have been set to 1 and 2 respectively.  This means that the scrollbar position will always be either 1 or 2 depending on direction of travel.              	      -     = 	     F      _ 
     i      n      v �   4The toolTip property has been set to "Change Time".                    (  ` PThis is a normal field.  It has been named "Timer" for easy referal in scripts.    The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �         9The toolTip property has been set to "Appointment time".                    ,  Z WThis is a normal field.  It has been named "Record_title" for easy referal in scripts.    The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �         �The toolTip property has been set to "Appointment number".  This causes MetaCard to display a yellow box containing this information when the mouse pauses over the object.                    �  W �This panel is made up of a group of buttons.  They were created by duplicating a single button.  The hilitecolor of the buttons has been set to a turquoise color.  The gray buttons at the start and finish are disabled.                     E     e      p a     �      �   Y This is a normal field.    The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        X This is a normal field.    The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        VPThis panel is made up of a group of buttons.  They were created by duplicating a single button.  The hilitecolor of the buttons has been set to a turquoise color.  An alternative would have been to set the hilitecolor of the group.  The buttons would then have inherited this property from the group (if it was not set on each button).                     E     e      p ^     �      �      �      � i   7The gray buttons at the start and finish are disabled.        -     -      5   U kWhen the Organizer is running, this is not an object, but rather part of the window frame drawn by the OS.    �Its appearance is affected by the mode that the stack is opened in; and by the decorations stack property.  Depending on these properties, close boxes may be present or absent.        "     "      & 
     0      5      O      Z V   eIt is also possible to set a stacks style property - a feature included for SuperCard compatibility.        $     $      ) ;  S 8This is a static object which does not have a script.      �The date is placed into it by a script in the stack (displayrecord) which is called whenever the day being displayed is changed.  The date itself is created using the MetaCard date function.        �     �      � 
  
 �This button has a menuPick hander.  The name of the tab chosen is sent as a parameter to the handler, together with the name of the tab that was previously selected.                    �   �These two parameters are used to hide the previously showing group and show the new group.  See the Groups lab for more information on groups.        =     =      B      T      Y      d      j $  � �This is not a real object, and therefore doesn't have a script.  However, when its used, a closeStackRequest message, and then a closeStack message is sent to the current stack.        [     [      l      � 
     � &  If this were a real application, the closeStackRequest message could be used to check if the user wanted to save changes before closing.  If the handler is exited rather than passed, stack closing will be aborted (this can be used to create a "Really Quit?" cancel dialog).        %     %      6 �  � �This is not a real object, and therefore doesn't have a script.  However, when its used, a resizeStack message is sent to the current stack.        [     [      f &   }This message is intercepted and used to resize all the controls in the stack to the correct sizes, relative to the new size.    �This button has a menuPick hander.  The name of the command chosen is sent as a parameter to the handler.  A switch structure is used to choose the appropriate course of action.                    S     m      s >  fDiary: uses the MetaCard click command to click at the location of the Diary tab.  This is equivalent to clicking at this point with the mouse.  An alternative would have been to set the menuHistory property of the tab, and then send a menuPick message to the tab to execute the commands needed to switch to the Diary.  Generally click at is a better technique, particularly with buttons - as it will show them hiliting.  However, the alternative may be used when objects are layered over other objects or an object with multiple hotspots is moved (when clicking directly at the loc of the object cannot be used).                         *      / �     �      � &     �      � V    J     O �    C     F    "Contacts: does the same as Diary.    GCalculator: this opens a palette window which contains the Calculator.                     &    This is a pulldown menu button.    �The text property has been set to contain the names of the menu items.  These are displayed as a menu panel automatically by MetaCard when the button is clicked on.                    �   !The text property is as follows:    :&Diary             --The & symbol places the accelerator.        -     -      .  
&Contacts  3-                        --This creates a divider.  C&alculator    �This button has a menuPick hander.  The name of the command chosen is sent as a parameter to the handler.  A switch structure is used to choose the appropriate course of action.                    S     m      s >   VEach command (undo, cut, copy, paste) executes the MetaCard command of the same name.                                                       $ 1  �  This is a pulldown menu button.    �The text property has been set to contain the names of the menu items.  These are displayed as a menu panel automatically by MetaCard when the button is clicked on.                    �   !The text property is as follows:    3&Save       --The & symbol places the accelerator.        &     &      '  ,-                 --This creates a divider.  6&Exit          --The & symbol places the accelerator.        )     )      *   �  This is a pulldown menu button.    �The text property has been set to contain the names of the menu items.  These are displayed as a menu panel automatically by MetaCard when the button is clicked on.                    �   !The text property is as follows:    3&Save       --The & symbol places the accelerator.        &     &      '  ,-                 --This creates a divider.  6&Exit          --The & symbol places the accelerator.        )     )      *   w �These buttons have a single script which has been placed in the group that they are in.  It determines which button has been clicked on using the target function, and then looks up data for that day, displays it, and hilites the button.        @     @      E M     �      � A     �      �      �    �The data for each record is stored in a custom property attached to the diary group.  For each day that there is a record, a set of custom properties are created which store information on that day.          (     (      7 �   	Example:    �The script in the group receives the mouseUp message when you click, and knows which button you clicked on by querying the target.        %     %      , O     {      �   �It then puts together a date from the day clicked on, using the month and year (visible in the fields below).  This is displayed in the "date" field.  The convert function is then used to convert the date to a number.  Try typing "the date" into the message box to see the date, then clear the line and type "convert the date to seconds; put it" for an example of the same date represended numerically.  (You can get the message box at any time by typing CNTRL-M.)        �     �      �.   �This number is then used to access the correct custom property that holds the list of records for that day.  The records are displayed using by using the put command to put the custom property into the fields.        /     /      > \     �      � 4   �Saving records does the same process in reverse.  The current date and record number being viewed are used to create a custom properties of the correct name to store the information.   �The popUp menu which appears when you click the right mouse button on a day is created from the custom property which stores the list of appointment titles for the day selected.  The popUp menu is a seperate stack, which is resized dependant on the number of records saved in the day selected.  The popUp command is used to load this stack as a menu, at the position the user clicked.  The resizing is done during preOpenStack (a message which is sent before the stack is drawn on the screen).                   	 W     `      o �    +     0 n    �     � C  � ZThis is a normal scrolling field.  It has been named "Notes" for easy referal in scripts.   The patterned image is done by setting the backPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        '     '      6 �     �      �    �The toolTip property has been set to "Appointment notes".  This causes MetaCard to display a yellow box containing this information when the mouse pauses over the object.                    �  � �This field has a closeField handler.   The closeField message is sent whenever a field *has* been changed and is loosing the keyboard focus.              
           + 
     5 W   �This script calls a handler (located in the stack script) which stores any changes made. A custom property is used to store information specific to each day.  See the Calendar panel for more details on how this information is stored.        [     [      j    �Note that if the field has not been changed, the exitField message is sent instead.  (This message is not intercepted by this field.)        1     1 	     : K  � �This field has a closeField handler.   The closeField message is sent whenever a field *has* been changed and is loosing the keyboard focus.              
           + 
     5 W   ~The closeField handler checks to see if there is more than 1 line of script.  If there is, it deletes all but the first line.              
      o   �It then calls a handler (located in the stack script) which stores any changes made. A custom property is used to store information specific to each day.  See the Calendar panel for more details on how this information is stored.        W     W      f    �Note that if the field has not been changed, the exitField message is sent instead.  (This message is not intercepted by this field.)        1     1 	     : K  The field also contains returnInField and enterInField messages, which are used to stop the user from creating a new line.  Both these handlers contain a single beep command.  The new line is not inserted because the handlers don't inclue a pass statement.                   %      *      6 �     �      �   } �These fields do not have a script.  Their contents is set by the scrollbars on the left, or by the script of the stack (whenever the month or year being displayed is changed).    �This button checks the text placed in the field containing the number of appointments (above) to determine if there is another record.    �If there is, it sends a message to the stack to display that record.  See the Calendar group for more information on how records are stored and displayed.   � �This button checks the text placed in the field containing the number of appointments (above) to determine if there is another record.    �If there is, it sends a message to the stack to display that record (displayrecord).  See the Calendar group for more information on how records are stored and displayed.   � �This button checks the text placed in the field containing the number of appointments (above) to determine if there is a previous record.    �If there is, it sends a message to the stack to display that record (displayrecord).  See the Calendar group for more information on how records are stored and displayed.   ~ �This button checks the text placed in the field containing the number of appointments (above) to determine if there is a previous record.    �If there is, it sends a message to the stack to display that record.  See the Calendar group for more information on how records are stored and displayed.   � �This uses the MetaCard date function to determine tomorow's date.  It then sends a message to the stack/Calendar to change which day is being displayed.                    }   �The date function only returns todays date.  To get tomorrow's, this is converted to seconds using the convert command.  The number of seconds in a day is then added to this (60*60*24), and then the number is converted back to a date.                    M     U      \      g      n |  � �This uses the MetaCard date function to determine today's date.  It then sends a message to the stack/Calendar to change which day is being displayed.                    {  � ]This scrollbar contains a scrollBarDrag handler.  This is sent whenever the bar is scrolled.                   ' 5   �This handler adds or subtracts to the values in the field on the right, dependant on the direction of scrolling.  It then sends a message to the stack to alter the record being viewed (and update the Calendar).   � ]This scrollbar contains a scrollBarDrag handler.  This is sent whenever the bar is scrolled.                   ' 5   �This handler adds or subtracts to the values in the field on the right, dependant on the direction of scrolling.  It then sends a message to the stack to alter the record being viewed (and update the Calendar).   � ]This scrollbar contains a scrollBarDrag handler.  This is sent whenever the bar is scrolled.                   ' 5   �This handler adds or subtracts to the values in the field on the right, dependant on the direction of scrolling.  It then sends a message to the stack to alter the record being viewed (and update the Calendar).   As a month is textual not numerical, it must be converted to a number, the calculation done, and the result converted back to text.  This is done by using a list of months, seperated by commas: "January,Febuary,Mar...".  The itemOffset function is used to determine the number of the current text: e.g. itemOffset("Febuary","January,Febuary") would be 2.  The same principale is used in reverse to convert a number back to a month.  Its a little simpler though: item 3 of  "January,Febuary,March" would be March.        �     � 
     � �    �     � .   �Note that MetaCard supports the array as a faster alternative which is suited to large or more complex sets of data.  For example, a variable could be created which contained 12 elements, one for each month.  Thus months[3] would be March.                   & �  +This is typically faster and easier to maintain than using items (known as chunk expressions) above.  The difference is particularly marked when manipulating large volumes of data, or data that contains a wide range of symbols (e.g. commas) that would be hard to deliminate using chunk expressions.   � ]This scrollbar contains a scrollBarDrag handler.  This is sent whenever the bar is scrolled.                   ' 5   �This handler adds or subtracts to the values in the field on the right, dependant on the direction of scrolling.  It then sends a message to the stack to alter the record being viewed (and update the Calendar).   As a month is textual not numerical, it must be converted to a number, the calculation done, and the result converted back to text.  This is done by using a list of months, seperated by commas: "January,Febuary,Mar...".  The itemOffset function is used to determine the number of the current text: e.g. itemOffset("Febuary","January,Febuary") would be 2.  The same principale is used in reverse to convert a number back to a month.  Its a little simpler though: item 3 of  "January,Febuary,March" would be March.        �     � 
     � �    �     � .   uNote that MetaCard supports the array as a faster alternative which is suited to large or more complex sets of data.                   & N  � ]This scrollbar contains a scrollBarDrag handler.  This is sent whenever the bar is scrolled.                   ' 5   pThis handler adds or subtracts to the values in the field on the left, dependant on the direction of scrolling.   !The scrollbar refers to a variable which is updated by the field each time it is edited.  The variable stores which part of the time was edited last (either hours, minutes or AM/PM).  If this value is empty (i.e. the "timer" field has not been clicked on) it defaults to the AM/PM values.   | ]This scrollbar contains a scrollBarDrag handler.  This is sent whenever the bar is scrolled.                   ' 5   pThis handler adds or subtracts to the values in the field on the left, dependant on the direction of scrolling.   !The scrollbar refers to a variable which is updated by the field each time it is editid.  The variable stores which part of the time was edited last (either hours, minutes or AM/PM).  If this value is empty (i.e. the "timer" field has not been clicked on) it defaults to the AM/PM values.   �VThis field has a selectionChanged handler.  This message is sent whenever the mouse is used to change the current selection.  This handler places information about which part of the field has been selected into a variable.  This variable is used by the scrollbar on the right to determine which part of the date to alter when it is scrolled.                   !4   ^An arrowkey handler also uses the send command to send this field a selectionChanged message.                         "      &      D      T 	   �This field also has a closeField handler.   The closeField message is sent whenever a field *has* been changed and is loosing the keyboard focus.              
            0 
     : W   �The closeField script calls a handler (located in the stack script.  This stores any changes made. A seperate custom property is used to store information specific to each day.  See the Calendar group for more information on how Appointments are stored.              
      `     n      } �   �Note that if the field has not been changed, the exitField message is sent instead.  This message is used by this field to record which character was last selected (for use by the scrollbar).        1     1 	     : �   vThe field contains returnInField and enterInField messages, which are used to stop the user from creating a new line.                          %      1 D   �Finally, the field contains rawKeyDown and keyUp handlers to validate that the text entered is a valid date.  The rawKeyDown handler (sent before the key is entered into the field) stores the current contents of the field in a variable.              
     &      +      0 7     g      k      r 
     | p   �The keyUp handler then checks to see if the contents of the field (with the key that has just been entered) is a date.  If it is not, the field is reset to the variable that was stored by the rawKeyDown handler.                   	 h     q      u K     � 
     � 	  {VThis field has a selectionChanged handler.  This message is sent whenever the mouse is used to change the current selection.  This handler places information about which part of the field has been selected into a variable.  This variable is used by the scrollbar on the right to determine which part of the date to alter when it is scrolled.                   !4   ^An arrowkey handler also uses the send command to send this field a selectionChanged message.                         "      &      D      T 	   �This field also has a closeField handler.   The closeField message is sent whenever a field *has* been changed and is loosing the keyboard focus.              
            0 
     : W   �The closeField script calls a handler (located in the stack script.  This stores any changes made. A seperate custom property is used to store information specific to each day.              
      `     n      } 3   �Note that if the field has not been changed, the exitField message is sent instead.  This message is used by this field to record which character was last selected (for use by the scrollbar), but does not save changes.        1     1 	     : �   vThe field contains returnInField and enterInField messages, which are used to stop the user from creating a new line.                          %      1 D  	Finally, the field contains rawKeyDown and keyUp handlers to validate that the text entered is a valid time (or date in MetaTalk terms).  The rawKeyDown handler (sent before the key is entered into the field) stores the current contents of the field in a variable.              
     &      +      0 @     p      t      � 
     � p   �The keyUp handler then check to see if the contents of the field (with the key that has just been entered) is a date.  If it is not, the field is reset to the variable that was stored by the rawKeyDown handler.                   	 g     p      t K     � 
     � 	  a OThis is a normal field.  It has been named "Time" for easy referal in scripts.   The patterned image is done by setting the backPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        '     '      6 �     �      �    �The toolTip property has been set to "Appointment Time".  This causes MetaCard to display a yellow box containing this information when the mouse pauses over the object.                    �  � PThis is a normal field.  It has been named "Title" for easy referal in scripts.    The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �         :The toolTip property has been set to "Appointment title".                    -  � PThis is a normal field.  It has been named "Title" for easy referal in scripts.   The patterned image is done by setting the backPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        '     '      6 �     �      �    �The toolTip property has been set to "Appointment title".  This causes MetaCard to display a yellow box containing this information when the mouse pauses over the object.                    �  � �This field has a closeField handler.   The closeField message is sent whenever a field *has* been changed and is loosing the keyboard focus.              
           + 
     5 W   ~The closeField script first checks that there is only one line.  If there is more than one line, the extra lines are deleted.              
      o   �Then a handler (located in the stack script) is called.  This stores any changes made. A seperate custom property is used to store information specific to each day.        b     b      q 3   �Note that if the field has not been changed, the exitField message is sent instead.  This message is not intercepted by this field (if no changes have been made there is no need to store them).        1     1 	     : �   |The field also contains returnInField and enterInField messages, which are used to stop the user from creating a new line.                    %      *      6 E  This is a static object which does not have a script.  The contents are set during the preOpenCard handler (in the stack script), which puts the card number and the total number of cards into it when navigation takes place.  To view the script of this stack, type ALT-CNTRL-S.        W     W      b �  ' ;This is a button, with its icon set to the imported image.                       _All the button's properties have been turned off, e.g. showName, showBorder, traversalOn, etc.        7     7      ?      A 
     K      M      X    �Placing the image in a button means that it can be cropped to any size required, and the button scaled to any size (when the stack is resized).   8 This is a normal button.    The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        7 This is a normal button.    The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        6 This is a normal button.    XThe foregroundColor has been set to a dark red, and the textStyle has been set to bold.                    %     8 	     A    The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        c This is a normal button.    8Its icon has been set to an imported image of an arrow.                    /   The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        b This is a normal button.    8Its icon has been set to an imported image of an arrow.                    /   The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        B This is a normal button.    8Its icon has been set to an imported image of an arrow.                    /   The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        A This is a normal button.    8Its icon has been set to an imported image of an arrow.                    /   The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        e This is a normal button.    �Its icon has been set to an imported image of an arrow.  The button's threeD property is true, so this image is automatically offset by 1 pixel when the button is depressed.                    >     F      L a   The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        d This is a normal button.    �Its icon has been set to an imported image of an arrow.  The button's threeD property is true, so this image is automatically offset by 1 pixel when the button is depressed.                    >     F      L a   The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        @ This is a normal button.    �Its icon has been set to an imported image of an arrow.  The button's threeD property is true, so this image is automatically offset by 1 pixel when the button is depressed.                    >     F      L a   The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        ? This is a normal button.    �Its icon has been set to an imported image of an arrow.  The button's threeD property is true, so this image is automatically offset by 1 pixel when the button is depressed.                    >     F      L a   The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        5 This is a normal button.    XThe foregroundColor has been set to a dark red, and the textStyle has been set to bold.                    %     8 	     A    The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        4 This is a normal button.    XThe foregroundColor has been set to a dark red, and the textStyle has been set to bold.                    %     8 	     A    The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        - This is a normal button.    The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        , This is a normal button.    The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        m This is a normal button.    The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        l This is a normal button.    The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        k This is a normal button.    The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        j This is a normal button.    The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        i This is a normal button.    The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        v kWhen the Organizer is running, this is not an object, but rather part of the window frame drawn by the OS.    �Its appearance is affected by the mode that the stack is opened in; by the decorations stack property; and by the resizable stack property.  Depending on these properties, resize boxes may be present or absent, enabled or disabled.        "     "      & 
     0      5      K      V      r 	     { l   eIt is also possible to set a stacks style property - a feature included for SuperCard compatibility.        $     $      ) ;  u kWhen the Organizer is running, this is not an object, but rather part of the window frame drawn by the OS.    �Its appearance is affected by the mode that the stack is opened in; by the decorations stack property; and by the resizable stack property.  Depending on these properties, resize boxes may be present or absent, enabled or disabled.        "     "      & 
     0      5      K      V      r 	     { l  t kWhen the Organizer is running, this is not an object, but rather part of the window frame drawn by the OS.    �Its appearance is affected by the mode that the stack is opened in; and by the decorations stack property.  Depending on these properties, close boxes may be present or absent.        "     "      & 
     0      5      O      Z V         hNote that the dissection must be closed by using the right mouse button in the middle of the title bar.   h This is a normal button.    The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        g This is a normal button.    The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        f This is a normal button.    The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        + This is a normal button.    The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        R �This button uses a custom function to place the text from all the Contacts fields into a variable.  The same function is used to collect the text from all the fields by the Copy Record button.    �It then uses the ask file command to allow the user to create a file to copy the record to.  The open command is used to open the file, and the write command is used to write the fields to that file.  Finally, the close command is used to close the file.                    M     a      e +     �      � A     �      � #  QDThis button places the text of each Contacts field into a variable.  It then uses the ask file command to allow the user to create a file to copy the record to.  The open command is used to open the file, and the write command is used to write the fields to that file.  Finally, the close command is used to close the file.        V     V      Y M     �      � +     �      � A           #  PThis button places the text of each Contacts field into a variable, and then places that variable on the clipboard.  Because a variable cannot be directly transfered to the clipboard, it is first placed in a hidden field, which is then copied (a field can be copied).   O �This button uses a custom function to place the text from all the Contacts fields into a variable.  This is then copied to the clipboard.  The same function is used to collect the text from all the fields by the Export Record button.    �Because a variable cannot be directly transfered to the clipboard, it is first placed in a hidden field, which is then copied (a field can be copied).   N �This button shows a group of fields on top of the existing Contacts fields.  The group containing these fields has a script which checks the target and uses the sort command to sort the cards by whichever one has been clicked on.        Q     Q      V 7     �      �      �      � @  BIn addition, a script is inserted in front of the message path (using the insert script command).  This receives mouseUp messages before any other controls on the card.  It checks if the object clicked on was one of the fields in the sort group, and if it is not, hides the sort group with a beep - i.e. cancels the sort.        J     J      P !     q      x �    $     (   M �This button shows a group of fields on top of the existing Contacts fields.  These fields have a script which uses the sort command to sort the cards by whichever one is chosen.                    ^     w      { 6  LTThis script brings up a Search window.  The Search window is a copy of the Find stack included with MetaCard.  It uses variants of the find command to do searches, and has been redesigned to be in keeping with the style of the Personal Organizer stack.  You are free to use and redesign any of the stacks that are included in the MetaCard.        �     �      � �  K�This script brings up a Search window using the modeless command (to open the stack in that mode).  The Search window is a copy of the Find stack included with MetaCard.  It uses variants of the find command to do searches, and has been redesigned to be in keeping with the style of the Personal Organizer stack.  You are free to use and redesign any of the stacks that are included in the MetaCard.        0     0      8 �     �      � �  J �This button checks that there is more than 1 card.  If there is, it uses the answer command to ask if you really want to delete this record.  If you choose yes, it deletes the current card.        M     M      S &     y       >   �Note that it is simple to design your own dialog box to ask a question if you want more control over the design than the answer dialog offers.   2 �This button checks for the existance of an image on this card.  If one is found, it uses the answer command to bring up a dialog box asking if you really want to delete it.  If the answer is yes, the image (and button used to display it) is deleted.          ]     ]      c �   �Note that it is simple to design your own dialog box to ask a question if if you want more control over the design than the answer dialog offers.   > This is a normal button.   *The patterned background was achieved by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        4     4      G �    	        = This is a normal button.   *The patterned background was achieved by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        4     4      G �    	        < This is a normal button.    XThe foregroundColor has been set to a dark red, and the textStyle has been set to bold.                    %     8 	     A    The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        ; This is a normal button.    XThe foregroundColor has been set to a dark red, and the textStyle has been set to bold.                    %     8 	     A    The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        : This is a normal button.    XThe foregroundColor has been set to a dark red, and the textStyle has been set to bold.                    %     8 	     A    The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        9 This is a normal button.    XThe foregroundColor has been set to a dark red, and the textStyle has been set to bold.                    %     8 	     A    The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        I �This button checks that there is more than 1 card.  If there is, it uses the answer command to ask if you really want to delete this record.  If you choose yes, it deletes the current card.        M     M      S &     y       >   �Note that it is simple to design your own dialog box to ask a question if you want more control over the design than the answer dialog offers.   H  This script creates a new card.                      kMetaCard automatically places all the existing controls from this card onto the new card.  This is because all the controls are in groups (backgrounds).  The text in the Contact entries is different on each card because those fields have their sharedText properties set to false.  The image on each record is not part of a group, and so is specific to each card.        �     �      � k     � 
     � l   eAll the components of the Diary group are placed onto the new card too, as they are also in a group.        ^     ^      c   The sharedText of the fields which display Diary appointments is true, so changing to from Contacts to Diary goes to the same set of appointments from any card in the Contacts section.  See the Calendar group in the Diary section for more information about how appointments are stored.              
       3 This is a normal button.    XThe foregroundColor has been set to a dark red, and the textStyle has been set to bold.                    %     8 	     A    The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        1 �This button checks for the existance of an image on this card.  If one is found, it uses the answer command to bring up a dialog box asking if you really want to delete it.  If the answer is yes, the image is deleted.          ]     ]      c x   �Note that it is simple to design your own dialog box to ask a question if you want more control over the design than the answer dialog offers.   / bThis object uses the MetaCard answer file command to allow the user to select an image to import.                   $ =   jProvided that a file is selected, the script then goes on to replace the existing image with the new one.    �Firstly, the screen is locked using the lockscreen command.  This prevents the user from seeing images being deleted or imported whilst the changes are taking place.        (     ( 
     2 s   NIf the exist, the old image and buttons are deleted using the delete command.        >     >      D 	   :The import command is used import the file user selected.                   
            !   rThe imported image is then hidden, and a new button is created to contain the image.  The properties of the templateButton are set to create a button of the correct size and with the correct icon.  The new button command then creates the button - which will have all the correct attributes set.  This is much faster than creating a new button and then resizing it, etc.                         )      , @     l      z P     �      � �   SFinally, the screen is unlocked, which causes it to be redrawn with the new image.   . bThis object uses the MetaCard answer file command to allow the user to select an image to import.                   $ =   jProvided that a file is selected, the script then goes on to replace the existing image with the new one.    �Firstly, the screen is locked using the lockscreen command.  This prevents the user from seeing images being deleted or imported whilst the changes are taking place.        (     ( 
     2 s   3The old image is deleted using the delete command.        #     #      ) 	   :The import command is used import the file user selected.                   
            !    aThe imported image is then hidden, and the icon of the button above is set to contain the image.                         +      /      7      = #   SFinally, the screen is unlocked, which causes it to be redrawn with the new image.   * This is a normal button.    The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        ) WThis button does not have a script.  Its icon is set and deleted by the buttons below.        )     )      - )  ( WThis button does not have a script.  Its icon is set and deleted by the buttons below.        )     )      - )  & ;This is a button, with its icon set to the imported image.                       _All the button's properties have been turned off, e.g. showName, showBorder, traversalOn, etc.        7     7      ?      A 
     K      M      X    �Placing the image in a button means that it can be cropped to any size required, and the button scaled to any size (when the stack is resized).   % cNone of these fields have scripts.  All text editing is done automatically by the MetaCard engine.    �The only script to affect them is the resizeStack handler which scales all the card when the Window is resized.  See the information for the close box  and resize boxes for more information about the resizeStack handler.        &     &      1 �     �      � 	  $None of these fields have scripts.  All text editing is done automatically by the MetaCard engine.  It might be desirable to add keyDown handlers in the Telephone and Fax fields to validate that a number was being entered, but this has not been done in this example.    �The only script to affect them is the resizeStack handler which scales all the card when the Window is resized.  See the information for the close box  and resize boxes for more information about the resizeStack handler.        &     &      1 �     �      � 	  This is a static object which does not have a script.  The only script to affect it is the resizeStack handler which scales it when the Window is resized.  See the information for the close box  and resize boxes for more information about the resizeStack handler.        [     [      f �     �      � 	    These are normal fields.    /The foregroundColor has been set to dark blue.                       The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        # �These are normal fields.  To allow editing of text, they have the following properties set differently from the other fields on this screen.    BLocktext - this is false, to allow text to be edited by the user.              9   uTraversalOn - this is true, to allow text the field to be focused (i.e. the insertion point moved into) by the user.              i   �Sharedtext - this is false, which means that text entered on this card will not be the same as text entered into the field on another card.  This allows individual records to be stored on each card.        
     
 �   The patterned image is done by setting the backgroundPattern of each field to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        " �These are normal fields.  To allow editing of text, they have the following properties set differently from the other fields on this screen.    BLocktext - this is false, to allow text to be edited by the user.              9   uTraversalOn - this is true, to allow text the field to be focused (i.e. the insertion point moved into) by the user.              i  %Sharedtext - this is false, which means that text entered on this card will not be the same as text entered into the field on another card.  This allows individual records to be stored on each card.  All the other fields have this set to true, and so appear as labels - the same on each card.        
     
   The patterned image is done by setting the backgroundPattern of each field to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �        !There are static objects which do not have scripts.  The only script to affect them is the resizeStack handler which scales them to be scaled when the Window is resized.  See the information for the close box  and resize boxes for more information about the resizeStack handler.        [     [      f �          	  There are static objects which do not have scripts.  The only script to affect them is the resizeStack handler which scales them to be scaled when the Window is resized.  See the information for the close box  and resize boxes for more information about the resizeStack handler.        [     [      f �          	   These are normal fields.    /The foregroundColor has been set to dark blue.                       The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �         This is a normal field.    /The foregroundColor has been set to dark blue.                       The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �         This is a normal field.    /The foregroundColor has been set to dark blue.                       The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �         �This is a static object which does not have a script.  The only script to affect it is the preOpenCard handler (in the stack script), which puts the card number and the total number of cards into it when navigation takes place.        [     [      f }   SThis is a normal field.  It has been named "r_number" for easy referal in scripts.    oThe textfont of the field has been set to a larger point size.  The foregroundColor has been set to dark blue.                    8     D      S    The patterned image is done by setting the backgroundPattern of the object to the ID of an imported image (consisting of one square of the pattern).  Note that this property must be set from the message box - it is not available in the palettes.  See the Images lab for more information.        *     *      = �     �         6The toolTip property has been set to "Record number".                    )       0    	`      �  I  � OK �E�p +on mouseUp
  close this stack
end mouseUp
       >U i              	     
  � cd_name  h         	Q �         � !card "advanced_properties_notes"    $card "beginner_properties_r_number"   G card "advanced_script_right"   F card "advanced_script_left"   E card "beginner_script_right"   D card "beginner_script_left"   C "card "beginner_script_new record"   �  card "advanced_script_calendar"   � *card "advanced_script_delete appointment"   � *card "beginner_script_delete appointment"   � 'card "advanced_script_New Appointment"   � 'card "beginner_script_New Appointment"   � card "beginner_script_notes"   � card "beginner_script_file"      card "advanced_properties_edit"   �  card "beginner_properties_edit"   � card "advanced_script_file"    card "beginner_script_edit"    &card "beginner_properties_navigation"    "card "beginner_script_navigation"    'card "advanced_properties_org_pattern"    #card "beginner_script_photo_label"   � $card "advanced_script_record_title"   � $card "advanced_script_days_of_week"   � "card "advanced_script_month_year"    #card "advanced_script_org_pattern"   z $card "beginner_script_record_title"   y $card "beginner_script_days_of_week"   x card "beginner_script_date"   � #card "advanced_script_close_boxes"   � $card "advanced_script_resize_boxes"    #card "beginner_script_org_pattern"    'card "beginner_properties_org_pattern"    card "beginner_properties_tab"   	 card "beginner_script_tab"    card "advanced_properties_tab"   _ &card "advanced_properties_month_year"   ^ &card "beginner_properties_month_year"   ]  card "beginner_properties_date"   \  card "advanced_properties_date"   [ (card "advanced_properties_record_title"   q $card "beginner_properties_year_bar"   p %card "beginner_properties_month_bar"   o $card "beginner_properties_time_bar"   s $card "advanced_properties_year_bar"   r %card "advanced_properties_month_bar"   n $card "advanced_properties_time_bar"   ` !card "advanced_properties_timer"   Z (card "beginner_properties_record_title"   W $card "beginner_properties_calendar"   Y (card "beginner_properties_days_of_week"   X (card "advanced_properties_days_of_week"   V $card "advanced_properties_calendar"   U 'card "advanced_properties_close_boxes"   S card "advanced_script_date"   
 card "advanced_script_tab"   � #card "beginner_script_close_boxes"   � $card "beginner_script_resize_boxes"    "card "advanced_script_navigation"    &card "advanced_properties_navigation"    card "advanced_script_edit"   �  card "advanced_properties_file"   �  card "beginner_properties_file"   w  card "beginner_script_calendar"   � !card "beginner_properties_notes"   � card "advanced_script_notes"   � card "advanced_script_title"   } "card "beginner_script_month_year"    card "beginner_script_next_ap"   � card "advanced_script_next_ap"   � card "advanced_script_prev_ap"   ~ card "beginner_script_prev_ap"   � card "beginner_script_tomorow"   � card "beginner_script_today"   �  card "beginner_script_year_bar"   �  card "advanced_script_year_bar"   � !card "advanced_script_month_bar"   � !card "beginner_script_month_bar"   �  card "advanced_script_time_bar"   |  card "beginner_script_time_bar"   � card "advanced_script_timer"   { card "beginner_script_timer"   a !card "beginner_properties_timer"   � !card "advanced_properties_title"   � !card "beginner_properties_title"   � card "beginner_script_title"     card "advanced_script_r_number"   ' !card "advanced_properties_photo"   8 )card "advanced_properties_export record"   7 'card "advanced_properties_copy record"   6 (card "advanced_properties_sort records"   c #card "beginner_properties_next_ap"   b #card "beginner_properties_prev_ap"   B !card "beginner_properties_right"   A  card "beginner_properties_left"   e #card "advanced_properties_prev_ap"   d #card "advanced_properties_next_ap"   @ !card "advanced_properties_right"   ?  card "advanced_properties_left"   5 *card "advanced_properties_search records"   4 )card "advanced_properties_delete record"   - !card "advanced_properties_clear"   , !card "beginner_properties_clear"   m .card "advanced_properties_delete appointment"   l +card "advanced_properties_New Appointment"   k #card "advanced_properties_tomorow"   j !card "advanced_properties_today"   i .card "beginner_properties_delete appointment"   v (card "advanced_properties_resize_boxes"   u (card "beginner_properties_resize_boxes"   t 'card "beginner_properties_close_boxes"   h +card "beginner_properties_New Appointment"   g #card "beginner_properties_tomorow"   f !card "beginner_properties_today"   + "card "beginner_properties_import"   R %card "advanced_script_export record"   Q %card "beginner_script_export record"   P #card "beginner_script_copy record"   O #card "advanced_script_copy record"   N $card "advanced_script_sort records"   M $card "beginner_script_sort records"   L &card "beginner_script_search records"   K &card "advanced_script_search records"   J %card "advanced_script_delete record"   2 card "advanced_script_clear"   > )card "beginner_properties_export record"   = 'card "beginner_properties_copy record"   < (card "beginner_properties_sort records"   ; *card "beginner_properties_search records"   : )card "beginner_properties_delete record"   9 &card "beginner_properties_new record"   I %card "beginner_script_delete record"   H "card "advanced_script_new record"   3 &card "advanced_properties_new record"   1 card "beginner_script_clear"   / card "advanced_script_import"   . card "beginner_script_import"   * "card "advanced_properties_import"   ) card "advanced_script_photo"   ( card "beginner_script_photo"   & !card "beginner_properties_photo"   % %card "beginner_script_record_fields"   $ %card "advanced_script_record_fields"    #card "advanced_script_photo_label"     )card "beginner_properties_record_labels"   # )card "advanced_properties_record_fields"   " )card "beginner_properties_record_fields"   ! %card "beginner_script_record_labels"    %card "advanced_script_record_labels"    )card "advanced_properties_record_labels"    'card "advanced_properties_photo_label"    'card "beginner_properties_photo_label"     card "beginner_script_r_number"    $card "advanced_properties_r_number"        � New Button �E�p %on mouseUp
  go next cd
end mouseUp
       O               	       � New Button �E�p %on mouseUp
  go prev cd
end mouseUp
       M               	       � script_group   i        �Q � %  � View actual script �E�p �on mouseUp
  global current_target
  do "edit script of " & current_target & " of stack " & quote & "personal organiser" & quote
end mouseUp
        �U �              	       � View actual script �E�p Don mouseUp
  edit script of stack "personal organiser"
end mouseUp
        �U �              	       � View actual script �E�p Don mouseUp
  edit script of stack "personal organiser"
end mouseUp
        �U �              	        MC Demo Menu 	 �p Bon preOpenStack
end preOpenStack

on resizeStack
end resizeStack
  7  Black ������  FF>>AA DimGray ������ White  Black   C� � �            ����      �    	p Ron help
  go to card "File Menu" of stack "Dialog Box Help" as modeless
end help
            � �  �  �  �    �           � 
Check Box `TiC         �            	  �   � 	Button 1 `TiP �on mouseEnter
  set the backcolor of me to "sky blue"
end mouseEnter

on mouseLeave
  set the backcolor of me to empty
end mouseLeave
          �            	  �   � File Separator 1 �@          �             	  �   � Cascade Menu �TiE        h �      MC Demo Cascade 	     	  �     Icon �Ri@        � � '         	  �    File Separator 1 �@         � �             	  �    File Separator 1 �@         f �             	  �       �          2 � 8  � Radio Button 1 `TiD        6 �            	  �   Radio Button 2 `TiD        N �            	  �    calculator.gif  @       + I  &  �GIF89a & �  �����������f��3�� �������̙��f��3�� �����������f��3�� �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����������f��3�� �������̙��f��3�� ̙�̙�̙�̙f̙3̙ �f��f��f��ff�f3�f �3��3��3��3f�33�3 � �� �� �� f� 3�  �����̙����f��3�� �����̙̙��f��3�� �����̙����f��3�� �f��f̙f��ff�f3�f �3��3̙3��3f�33�3 � �� ̙ �� f� 3�  f��f��f��f�ff�3f� f��f��f̙f�ff�3f� f��f��f��f�ff�3f� ff�ff�ff�fffff3ff f3�f3�f3�f3ff33f3 f �f �f �f ff 3f  3��3��3��3�f3�33� 3��3��3̙3�f3�33� 3��3��3��3�f3�33� 3f�3f�3f�3ff3f33f 33�33�33�33f33333 3 �3 �3 �3 f3 33   �� �� �� �f �3 �  �� �� ̙ �f �3 �  �� �� �� �f �3 �  f� f� f� ff f3 f  3� 3� 3� 3f 33 3   �  �  �  f  3�  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "     �  �  �  �  �  w  U  D  "  �����ݻ��������wwwUUUDDD"""   !�    ,     & � AH����*\Ȱ��x#J�8D���Th�ȱc�y+.�H�d� �P���o�A��bʜsJ{�V�|�"�< @�
`�N�.G������O�=�2)A�C�N�Y�g�y`Ê{��N�Ҫ]�6�� Hy��G7�ܺwSލ��ߓ'�P��0J��^U���c��	G���+ڶ��*~�"�]�zA6k�sa�x����ǖ,۱k3�ky��ߢ��6���j­��f<y6eڷs���s��x�V7νx�S��o�����kYW�9/��u�o�A�>��כ��<���U�р)'�X&>�	T�
F(��tЃ+d��n(�C �(� !�clip2gif 0.7.2 by Yves Piguet ;        � popup_example  �`      R~ � P             X      �    	`           � P  �  �  �  � Popup 1 �Ti@         �          m	  � 	  �   � Second Choice �Ti@         �          m	  � 	  �   � Popup 3 �Ti@        4 �          m	  � 	  �   � MC Demo cascade  �`      Q� t h             X      �    	`           t h  �  �  �  �  � 	Option 1 �Ei@         t              	       � 	Option 2 �Ei@         t              	       � 	Option 3 �Ei@        4 t              	       � 	Option 4 �Ei@        L t              	      