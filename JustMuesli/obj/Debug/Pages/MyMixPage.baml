   M S B A M L   `   `   `  ????E  AJustMuesli, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:JustMuesli.PagesJustMuesli.Pages  5           JustMuesli.Pages.MyMixPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      0localclr-namespace:JustMuesli.Pages     5        N? Title$  	MyMixPage??5
      .??5      ? 
??????? ? RowDefinitions 5   
   ?? 5      $	??100 ?6   ?? 5      ?? 5      $??80 ?6   .+?5   
   ?? $??Center=?6   $??Center=?5      .+?5      ?? $??Just Muesli??6   $??25(?5      $??DemiBold"?5       ?? TextAlignment$ Center=?5      ?? 5      $??my muesli mixes??6   $ Center=?5      $??15(?5      $??0,5,0,0q?5      5      ?? 5   
   $??2??6    ?? Orientation$ 
Horizontal=?5      $??Center=?5      $??Center=?5       .+?5!      ?? -   5        $??
ButtonBack??5#      $??back to menu??5!      $	??150??5"      5$      ?? 5%      -   5        $??
ButtonEdit??5'      $
??edit??5%      $??75??5&      $??90,0,0,0q?5)      ?? 5*      -   5        $??ButtonDelete??5,      $??delete??5*      $??75??5+      $??20,0,0,0q?5.      5/      &   System.Windows.Controls.DataGrid  50   
   -   5        $??DataGridMyMuesliMix??50      $??1??51      $??	20,0,20,0q?52         AutoGenerateColumns .     
IsReadOnly .    Columns 55      0  *System.Windows.Controls.DataGridTextColumn  56      ,  &System.Windows.Controls.DataGridColumn   Header$
 Name??6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 57   %   1  +System.Windows.Controls.DataGridBoundColumn	   Binding	 58   %   ?? *Name+  59      $ Price / 600g??6%   $ * 5:   %   	 5;   %   ?? *Price+  5<      $ 
Created on??6%   $ * 5=   %   	 5>   %   ?? *Date+5@      5A      5B      