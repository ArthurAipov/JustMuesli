   M S B A M L   `   `   `  ????E  AJustMuesli, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:JustMuesli.PagesJustMuesli.Pages  5           JustMuesli.Pages.OrderPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      0localclr-namespace:JustMuesli.Pages     5        N? Title$  	OrderPage??5
      .??5      ? 
??????? ? RowDefinitions 5   
   ?? 5      $??90 ?6   ?? 5      ?? 5      $??60 ?6    ? ColumnDefinitions 5   
   ?? 5      ?? 5      $	??270 ?6   .+?5   
   ?? $??1??6   $??1??5      $??3q?5      
???????$??12q?5       ?? CornerRadius$ 6??5      ._?5      ?? .+?5      ??  ?? Orientation$ 
Horizontal=?6   $??	10,30,0,0q?5      .+?5      ?? $??Muesli??6    ?? 5       -   5        $??PriceForMuesli??5$       $??85,0,0,0q?5        $	??100??5!       $??0??5"        ?? TextAlignment$ Center=?5#       5$       5%      ?? 5&      $ 
Horizontal=?6   $??	10,10,0,0q?5'      .+?5(      ?? $??Shipping??6    ?? 5)      -   5        $??PriceForShipping??5-       $??73,0,0,0q?5)       $	??100??5*       $??0??5+       $ Center=?5,       5-       5.      ?? 5/      $ 
Horizontal=?6   $??	10,10,0,0q?50      .+?51      ?? $??Taxes??6    ?? 52      -   5        $??TextBlockTaxes??55       $??92,0,0,0q?52       $	??100??53       $??0??54       $ Center=?56       57      ?? 58      $ 
Horizontal=?6   $??	10,10,0,0q?59      .+?5:      ?? $??Grand Total??6    $??Medium"?5;       ?? 5<      -   5        $??TextBlockAllPrice??5?       $??57,0,0,0q?5<       $	??100??5=       $??0??5>       $ Center=?5@       5A      5B      5C      ?? 5D   
   $
??Left=?6   $	??Top=?5E      $??	20,10,0,0q?5F      .+?5G      ?? $??Just Muesli??6   $??DemiBold"?5H      $??30(?5I      ?? 5J      $??Center=?6   $??Order??5K      $??17(?5L      5M      ?? 5N   
   $ 
Horizontal=?6   $
??Left=?5O      $??Center=?5P      $??20,0,0,0q?5Q      $??2??5R      .+?5S      ?? -   5        $??
ButtonBack??5U      $??back to menu??5S      $	??130??5T      5V      5W      ?? 5X   
   $ 
Horizontal=?6   $??1??5Y      $??2??5Z      $??Right=?5[      $??Center=?5\      $??0,0,20,0q?5]      .+?5^      ?? -   5        $??ButtonSubmit??5`      $??submit order??5^      $	??140??5_      5a      5b      &   System.Windows.Controls.DataGrid  5c   
   -   5        $??DataGridMusliMix??5e      $??1??5c      $??10,0,0,0q?5d         
IsReadOnly .    AutoGenerateColumns .     Columns 5h      0  *System.Windows.Controls.DataGridTextColumn  5i      ,  &System.Windows.Controls.DataGridColumn	   Header$
	 Name??6%   
   Width5  /System.Windows.Controls.DataGridLengthConverter$
 * 5k   %   1  +System.Windows.Controls.DataGridBoundColumn   Binding 5j   %   ?? *MuesliMix.Name+5k   %   4  .System.Windows.Controls.DataGridTemplateColumn  5l      $
 * 6)   $
	 Size??5m   )      CellTemplate 5n      ?? 5o      .R?5p      ?? $ 
Horizontal=?6)   .+?5q   "   ?? $??CheckeBoxSize??6+    d? 	IsChecked 5r   +   ?? *Size+ ?? UpdateSourceTrigger$ PropertyChanged=??? 5t   "   $	??XXL??6,   5u      5v      5x        5y      $
 * 6%   $	 Price??5z   %    5{   %   ?? *MuesliMix.Price+  5|      $	 Quantity??6)   $
 * 5}   )    5~      ?? 5      .R?5?      ?? $??TextBoxQuantity??6&    ?? TextAlignment$ Center=?5?   &   ??5?   &   ?? *
Quantity+$ PropertyChanged=?5?      5?        5?      $	 Total??6)   $
 * 5?   )    5?      ?? 5?      .R?5?      ?? $??TextBlockTotalPrice??6(   $ Center=?5?   (   ??5?   (   ?? *
TotalPrice+5?   (   5?      5?      5?      5?      5?      