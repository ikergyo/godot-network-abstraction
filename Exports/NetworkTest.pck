GDPC                                                                                <   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex�5      �      d�a;1s���mыei�-   res://Scenes/Lobby.tscn @      �      �|tj7dO|����u/    res://Scenes/LobbyPlayer.tscn   �      z      ��q�\��=��:���   res://Scenes/PlayScene.tscn p      �       Z��s�)C�(�;z��   res://Scenes/Player.tscn`      w      EZ��Y�9��Nx�*$   res://Scripts/HostButton.gd.remap   �E      -       �0�é����~���   res://Scripts/HostButton.gdc�      �      �|"*�eA�a�g��,$   res://Scripts/JoinButton.gd.remap   F      -       ̽�{F;M-��#�:�)h   res://Scripts/JoinButton.gdc�      �      Ȏr�v���˗�$�?   res://Scripts/Lobby.gd.remap@F      (       �z*���ə�fU�5	   res://Scripts/Lobby.gdc p            �(����}Ã��莁$   res://Scripts/LobbyPlayer.gd.remap  pF      .       �0�B�Ć#-��s�V�	    res://Scripts/LobbyPlayer.gdc   �1      \      ̗ X��3����6�(   res://Scripts/NetworkGlobals.gd.remap   �F      1       ����c�
9c�X�#.    res://Scripts/NetworkGlobals.gdc�3            ��7�|�|� ��&�   res://default_env.tres   5      �       um�`�N��<*ỳ�8   res://icon.png  �F      v      ge��@o�7�|AZ   res://icon.png.import   `C      �      �����%��(#AB�   res://project.binary`T      �      �?{��x[S,Zi�{[gd_scene load_steps=4 format=2]

[ext_resource path="res://Scripts/Lobby.gd" type="Script" id=1]
[ext_resource path="res://Scripts/HostButton.gd" type="Script" id=2]
[ext_resource path="res://Scripts/JoinButton.gd" type="Script" id=3]

[node name="Lobby" type="Node"]
script = ExtResource( 1 )
lobbyMainPanel = NodePath("LobbyMenu")
lobbyStartPanel = NodePath("LobbyMenu/LobbyStartPanel")
readyPanel = NodePath("LobbyMenu/InLobbyPanel")
playerList = NodePath("LobbyMenu/InLobbyPanel/PlayerList")

[node name="LobbyMenu" type="Node2D" parent="."]

[node name="LobbyStartPanel" type="Panel" parent="LobbyMenu"]
__meta__ = {
"_edit_use_anchors_": false
}

[node name="HostButton" type="Button" parent="LobbyMenu/LobbyStartPanel"]
margin_left = 399.0
margin_top = 121.0
margin_right = 611.0
margin_bottom = 176.0
text = "Host Game"
script = ExtResource( 2 )
__meta__ = {
"_edit_use_anchors_": false
}

[node name="JoinButton" type="Button" parent="LobbyMenu/LobbyStartPanel"]
margin_left = 397.0
margin_top = 354.0
margin_right = 609.0
margin_bottom = 397.0
text = "Join Game"
script = ExtResource( 3 )
__meta__ = {
"_edit_use_anchors_": false
}

[node name="IpAddressText" type="TextEdit" parent="LobbyMenu/LobbyStartPanel"]
margin_left = 383.0
margin_top = 284.0
margin_right = 619.0
margin_bottom = 332.0
__meta__ = {
"_edit_use_anchors_": false
}

[node name="InLobbyPanel" type="Panel" parent="LobbyMenu"]
visible = false
margin_left = 410.0
margin_top = 138.0
margin_right = 410.0
margin_bottom = 138.0
__meta__ = {
"_edit_use_anchors_": false
}

[node name="ReadyButton" type="Button" parent="LobbyMenu/InLobbyPanel"]
margin_right = 181.0
margin_bottom = 45.0
text = "Ready"
__meta__ = {
"_edit_use_anchors_": false
}

[node name="PlayerList" type="ItemList" parent="LobbyMenu/InLobbyPanel"]
margin_left = 2.0
margin_top = 46.0
margin_right = 180.0
margin_bottom = 301.0
[connection signal="pressed" from="LobbyMenu/LobbyStartPanel/HostButton" to="." method="_on_HostButton_pressed"]
[connection signal="pressed" from="LobbyMenu/LobbyStartPanel/JoinButton" to="." method="_on_JoinButton_pressed"]
[connection signal="pressed" from="LobbyMenu/InLobbyPanel/ReadyButton" to="." method="_on_ReadyButton_pressed"]
           [gd_scene load_steps=2 format=2]

[ext_resource path="res://Scripts/LobbyPlayer.gd" type="Script" id=1]

[node name="LobbyPlayer" type="HBoxContainer"]
rect_min_size = Vector2( 120, 15 )
script = ExtResource( 1 )
__meta__ = {
"_edit_use_anchors_": false
}
playerId = NodePath("PlayerId")
status = NodePath("Status")

[node name="PlayerId" type="Label" parent="."]
margin_right = 51.0
margin_bottom = 14.0
text = "Player 3"
align = 1
valign = 1
__meta__ = {
"_edit_use_anchors_": false
}

[node name="Status" type="Label" parent="."]
margin_left = 55.0
margin_right = 117.0
margin_bottom = 14.0
text = "Not ready"
align = 1
valign = 1
      [gd_scene format=2]

[node name="Play" type="Node2D"]

[node name="MenuOne" type="Panel" parent="."]
margin_left = 63.0
margin_top = 8.0
margin_right = 961.0
margin_bottom = 83.0
__meta__ = {
"_edit_use_anchors_": false
}

[node name="MessageText" type="TextEdit" parent="MenuOne"]
margin_left = 50.0
margin_top = 18.0
margin_right = 493.0
margin_bottom = 60.0
__meta__ = {
"_edit_use_anchors_": false
}

[node name="SendButton" type="Button" parent="MenuOne"]
margin_left = 544.0
margin_top = 26.0
margin_right = 648.0
margin_bottom = 51.0
text = "Send message"
__meta__ = {
"_edit_use_anchors_": false
}

[node name="MenuOne2" type="Panel" parent="."]
margin_left = 62.0
margin_top = 99.0
margin_right = 960.0
margin_bottom = 174.0
__meta__ = {
"_edit_use_anchors_": false
}

[node name="MessageTextID" type="TextEdit" parent="MenuOne2"]
margin_left = 311.0
margin_top = 18.0
margin_right = 754.0
margin_bottom = 60.0
text = "Message"
__meta__ = {
"_edit_use_anchors_": false
}

[node name="SendButton" type="Button" parent="MenuOne2"]
margin_left = 769.0
margin_top = 26.0
margin_right = 873.0
margin_bottom = 51.0
text = "Send message"
__meta__ = {
"_edit_use_anchors_": false
}

[node name="TextEdit" type="TextEdit" parent="MenuOne2"]
margin_left = 86.0
margin_top = 19.0
margin_right = 242.0
margin_bottom = 59.0
text = "Player ID"

[node name="PlayersContainer" type="Panel" parent="."]
margin_left = 68.0
margin_top = 202.0
margin_right = 972.0
margin_bottom = 552.0
__meta__ = {
"_edit_use_anchors_": false
}

[node name="PlayerScoll" type="ScrollContainer" parent="PlayersContainer"]
margin_right = 903.0
margin_bottom = 347.0
__meta__ = {
"_edit_use_anchors_": false
}

[node name="PlayersList" type="HBoxContainer" parent="PlayersContainer/PlayerScoll"]
         [gd_scene format=2]

[node name="Player" type="Panel"]
margin_top = 151.0
margin_right = 245.0
margin_bottom = 492.0
rect_min_size = Vector2( 245, 340 )
__meta__ = {
"_edit_use_anchors_": false
}

[node name="PlayerName" type="Label" parent="."]
margin_right = 244.0
margin_bottom = 41.0
rect_min_size = Vector2( 245, 40 )
text = "Player"
align = 1
valign = 1
__meta__ = {
"_edit_use_anchors_": false
}

[node name="Messages" type="Label" parent="."]
margin_top = 40.0
margin_right = 244.0
margin_bottom = 344.0
rect_min_size = Vector2( 245, 305 )
text = "Messages
"
align = 1
valign = 1
__meta__ = {
"_edit_use_anchors_": false
}
         GDSC             5      �����ض�   �����϶�   ���������������������Ҷ�   ���Ķ���   �����������������������¶���   ����   ������������Ķ��   �������������Ŷ�   �����������ⶶ��   �����������   �������Ӷ���   ���������������Ķ���                         
                           	   )   
   2      3      3YYY0�  PQV�  -YY0�  PQV�  ;�  �  T�  PQ�  �  T�  P�  T�  R�  T�	  Q�  �
  PQT�  P�  Q�  Y`              GDSC             5      �����ض�   �����϶�   ���������������������Ҷ�   ���Ķ���   �����������������������¶���   ����   ������������¶��   �������������Ŷ�   �������   �����������ⶶ��   �������Ӷ���   ���������������Ķ���                         
                           	   )   
   2      3      3YYY0�  PQV�  -YY0�  PQV�  ;�  �  T�  PQ�  �  T�  P�  T�  R�  T�	  Q�  �
  PQT�  P�  Q�  Y`  GDSC   F   !   �   u     ���Ӷ���   �������������ڶ�   ��������������ڶ   ���������ڶ�   ���������¶�   �����϶�   �������Ӷ���   ������¶   ����������ٶ   ����Ҷ��   ����������������Ҷ��   �Ҷ�   ��������������������Ҷ��   �����Ҷ�   �������������������Ҷ���   ����Ӷ��   ���������������¶���   ������������ݶ��   �������������������Ҷ���   ��������������ڶ   ��������������Ķ   �����Ҷ�   ����������������Ҷ��   ��������������ٶ   ��������Ҷ��   ����϶��   ��Ŷ   �������������ٶ�   �����������������Ӷ�   ����������   ����Ҷ��   �������Ӷ���   �������Ӷ���   ��������Ҷ��   ��������Ķ��   �������Ӷ���   �����������������Ķ�   ƶ��   �����Ķ�   ������۶   �����Ŷ�   ����������Ķ   ����������Ҷ   ��������Ŷ��   ���������۶�   ߶��   ����Ҷ��   ��������������¶   ����������Ҷ   �����������Ҷ���   ����Ķ��   �������۶���   ���������������������Ҷ�   ���Ķ���   �����������������������¶���   ����   ������������¶��   �������������Ŷ�   �������   �����������ⶶ��   ���������������Ķ���   ���Ӷ���   ��������   ���������������������Ҷ�   ������������Ķ��   �����������   ��������������Ŷ   ����������Ŷ   ����������������������Ҷ   ��ն      network_peer_connected        _player_connected         network_peer_disconnected         _player_disconnected      connected_to_server       _connected_ok         connection_failed         _connected_fail       server_disconnected       _server_disconnected      My id:        _player_connected input ID:       register_player              RPC sender ID, after connect:         Local player_info dictionary      res://Scenes/PlayScene.tscn       /root         res://Scenes/Player.tscn      /root/world/players       /root/Play/PlayersContainer             done_preconfiguring       res://Scenes/LobbyPlayer.tscn         Ready      	   Not ready                ID:    	    Status:          My_id         PLAYER INFOS:               setPlayerStatus                                               	   "   
   #      $      *      7      D      Q      ^      k      l      m      s      v      w      ~      �      �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,   �   -   �   .   �   /   �   0   �   1     2     3     4     5   &  6   0  7   4  8   5  9   <  :   G  ;   H  <   I  =   U  >   _  ?   `  @   a  A   m  B   w  C   ~  D   �  E   �  F   �  G   �  H   �  I   �  J   �  K   �  L   �  M   �  N   �  O   �  P   �  Q   �  R   �  S   �  T   �  U   �  V   �  W   �  X   �  Y     Z     [   (  \   5  ]   9  ^   :  _   ;  `   A  a   M  b   S  c   X  d   c  e   g  f   �  g   �  h   �  i   �  j   �  k   �  l   �  m   �  n   �  o   �  p   �  q   �  r   �  s   �  t   �  u   �  v   �  w   �  x   �  y   �  z   �  {     |     }     ~          �   -  �   .  �   2  �   3  �   4  �   >  �   G  �   X  �   Y  �   Z  �   `  �   i  �   r  �   s  �   YY3YYY8P�  Q;�  Y8P�  Q;�  Y8P�  Q;�  Y8P�  Q;�  YYY0�  PQV�  �  PQT�  PRR�  Q�  �  PQT�  P�  RR�  Q�  �  PQT�  P�  RR�  Q�  �  PQT�  P�  RR�  Q�  �  PQT�  P�  RR�	  QYYY;�  NOY;�	  YY0�
  P�  QV�  �?  P�
  �>  P�  PQT�  PQQQ�  �?  P�  �>  P�  QQ�  �  �  P�  R�  R�  QYY0�  P�  QV�  �  T�  P�  Q�  �  PQYY0�  PQV�  -YY0�  PQV�  -YY0�  PQV�  -YYD0�  P�  QV�  �  ;�  �  PQT�  PQ�  ;�  N�  �  R�  �  O�  �  �  L�  M�  �  �  &P�  T�  P�	  QQV�  ;�  N�  �	  R�  �  O�  �  L�	  M�  Y�  �?  P�  �>  P�  QQ�  �?  P�  �>  P�  QQ�  �  PQYYD0�  PQV�  ;�  �  PQT�  PQY�  �  ;�  �L  P�  QT�  PQ�  �   P�  QT�!  P�  QY�  �  ;�"  ?P�  QT�  PQ�  �"  T�#  P�>  P�  QQ�  �"  T�$  P�  Q�  �   P�  QT�!  P�"  QY�  �  )�%  �  V�  ;�&  ?P�  QT�  PQ�  �&  T�#  P�>  P�%  QQ�  �&  T�$  P�%  Q�  �   P�  QT�!  P�&  QY�  �  �  P�  R�  R�  QYY0�'  P�  R�(  QV�  ;�)  ?P�  QT�  PQ�  �)  T�*  P�  Q�  &P�(  QV�  �)  T�+  P�  Q�  (V�  �)  T�+  P�  QYY0�,  P�  QV�  ;�-  �  �  )�.  �K  P�  R�   P�>  P�  QQT�/  PQQV�  &�  �   P�>  P�.  QQT�0  PQV�  �   P�>  P�  QQT�1  P�-  Q�  �-  �  �  YY0�  PQV�  �   P�>  P�  QQT�2  PQ�  )�%  �  V�  ;�(  �  �  &P�  L�%  MT�  QV�  �(  �  �  �   P�>  P�  QQT�3  P�  �>  P�  L�%  MT�  Q�  �(  Q�  YYYY0�4  PQV�  ;�5  �6  T�7  PQ�  �5  T�8  P�9  T�:  R�9  T�;  Q�  �  PQT�<  P�5  Q�  �   P�>  P�  QQT�=  PQ�  �   P�>  P�  QQT�>  PQ�  �  �	  �  PQT�  PQ�  �  �  PQ�  Y0�?  PQV�  �  ;�5  �6  T�7  PQ�  �5  T�@  P�9  T�;  R�9  T�A  Q�  �  PQT�<  P�5  Q�  �   P�>  P�  QQT�=  PQ�  �   P�>  P�  QQT�>  PQ�  �  �	  �  PQT�  PQ�  �  �  L�	  MN�  �	  R�  �  O�  �  �  PQ�  YYD0�B  P�  R�C  QV�  �  L�  MT�  �C  �  �?  P�  �>  P�	  Q�  �>  P�  QQYYY0�D  PQV�  �  L�	  MT�  �  �  �E  P�   R�	  R�  Q�  Y`         GDSC             e      ������������Ķ��   �������Ҷ���   �����Ŷ�   ��������Ҷ��   ����������Ҷ   �Ҷ�   �������Ӷ���   �������¶���   ����������Ҷ   ��������Ŷ��   �����϶�                                                    	      
   "      2      3      9      <      =      D      T      U      V      \      ^      _      `      a      b      c      3YYY8P�  Q;�  Y8P�  Q;�  YY;�  YY0�  P�  QV�  �  �  �  �  P�>  P�  QQT�  P�>  P�  QQ�  Y0�  PQV�  .�  �  Y0�	  P�  QV�  �  P�>  P�  QQT�  P�>  P�  QQYYY0�
  PQV�  -YYYYYY`    GDSC         
         ���Ӷ���   �����������ⶶ��   �����������   �������   �����϶�   �           	   127.0.0.1                                                       	      
   3YY:�  Y:�  �  Y:�  �  YYY0�  PQV�  -Y`         [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             GDST@   @           �  PNG �PNG

   IHDR   @   @   �iq�   sRGB ���  ?IDATx��{pTU�����;�N7	�����%"fyN�8��r\]fEgةf���X�g��F�Y@Wp\]|,�D@��	$$���	��I�n���ҝt����JW�s��}�=���|�D(���W@T0^����f��	��q!��!i��7�C���V�P4}! ���t�ŀx��dB.��x^��x�ɏN��贚�E�2�Z�R�EP(�6�<0dYF���}^Ѡ�,	�3=�_<��(P&�
tF3j�Q���Q�B�7�3�D�@�G�U��ĠU=� �M2!*��[�ACT(�&�@0hUO�u��U�O�J��^FT(Qit �V!>%���9 J���jv	�R�@&��g���t�5S��A��R��OO^vz�u�L�2�����lM��>tH
�R6��������dk��=b�K�љ�]�י�F*W�볃�\m=�13� �Є,�ˏy��Ic��&G��k�t�M��/Q]�أ]Q^6o��r�h����Lʳpw���,�,���)��O{�:א=]� :LF�[�*���'/���^�d�Pqw�>>��k��G�g���No���\��r����/���q�̾��	�G��O���t%L�:`Ƶww�+���}��ݾ ۿ��SeŔ����  �b⾻ǰ��<n_�G��/��8�Σ�l]z/3��g����sB��tm�tjvw�:��5���l~�O���v��]ǚ��֩=�H	u���54�:�{"������}k����d���^��`�6�ev�#Q$�ήǞ��[�Ặ�e�e��Hqo{�59i˲����O+��e������4�u�r��z�q~8c
 �G���7vr��tZ5�X�7����_qQc�[����uR��?/���+d��x�>r2����P6����`�k��,7�8�ɿ��O<Ė��}AM�E%�;�SI�BF���}��@P�yK�@��_:����R{��C_���9������
M��~����i����������s���������6�,�c�������q�����`����9���W�pXW]���:�n�aұt~9�[���~e�;��f���G���v0ԣ� ݈���y�,��:j%gox�T
�����kְ�����%<��A`���Jk?���� gm���x�*o4����o��.�����逊i�L����>���-���c�����5L����i�}�����4����usB������67��}����Z�ȶ�)+����)+H#ۢ�RK�AW�xww%��5�lfC�A���bP�lf��5����>���`0ċ/oA-�,�]ĝ�$�峋P2/���`���;����[Y��.&�Y�QlM���ƌb+��,�s�[��S ��}<;���]�:��y��1>'�AMm����7q���RY%9)���ȡI�]>�_l�C����-z�� ;>�-g�dt5іT�Aͺy�2w9���d�T��J�}u�}���X�Ks���<@��t��ebL������w�aw�N����c����F���3
�2먭�e���PQ�s�`��m<1u8�3�#����XMڈe�3�yb�p�m��܇+��x�%O?CmM-Yf��(�K�h�بU1%?I�X�r��� ��n^y�U�����1�玒�6..e��RJrRz�Oc������ʫ��]9���ZV�\�$IL�OŨ��{��M�p�L56��Wy��J�R{���FDA@
��^�y�������l6���{�=��ή�V�hM�V���JK��:��\�+��@�l/���ʧ����pQ��������׷Q^^�(�T������|.���9�?I�M���>���5�f欙X�VƎ-f͚ո���9����=�m���Y���c��Z�̚5��k~���gHHR�Ls/l9²���+ ����:��杧��"9�@��ad�ŝ��ѽ�Y���]O�W_�`Ֆ#Դ8�z��5-N^�r�Z����h���ʆY���=�`�M���Ty�l���.	�/z��fH���������֗�H�9�f������G� ̛<��q��|�]>ں}�N�3�;i�r"�(2RtY���4X���F�
�����8 �[�\锰�b`�0s�:���v���2�f��k�Zp��Ω&G���=��6em.mN�o.u�fԐc��i����C���u=~{�����a^�UH������¡,�t(jy�Q�ɋ����5�Gaw��/�Kv?�|K��(��SF�h�����V��xȩ2St쯹���{6b�M/�t��@0�{�Ԫ�"�v7�Q�A�(�ľR�<	�w�H1D�|8�]�]�Ո%����jҢ꯸hs�"~꯸P�B�� �%I}}��+f�����O�cg�3rd���P�������qIڻ]�h�c9��xh )z5��� �ƾ"1:3���j���'1;��#U�失g���0I}�u3.)@�Q�A�ĠQ`I�`�(1h��t*�:�>'��&v��!I?�/.)@�S�%q�\���l�TWq�������լ�G�5zy6w��[��5�r���L`�^���/x}�>��t4���cݦ�(�H�g��C�EA�g�)�Hfݦ��5�;q-���?ư�4�����K����XQ*�av�F��������񵏷�;>��l�\F��Þs�c�hL�5�G�c�������=q�P����E �.���'��8Us�{Ǎ���#������q�HDA`b��%����F�hog���|�������]K�n��UJ�}������Dk��g��8q���&G����A�RP�e�$'�i��I3j�w8������?�G�&<	&䪬R��lb1�J����B$�9�꤮�ES���[�������8�]��I�B!
�T
L:5�����d���K30"-	�(��D5�v��#U�����jԔ�QR�GIaó�I3�nJVk���&'��q����ux��AP<�"�Q�����H�`Jң�jP(D��]�����`0��+�p�inm�r�)��,^�_�rI�,��H>?M-44���x���"� �H�T��zIty����^B�.��%9?E����П�($@H!�D��#m�e���vB(��t �2.��8!���s2Tʡ �N;>w'����dq�"�2����O�9$�P	<(��z�Ff�<�z�N��/yD�t�/?�B.��A��>��i%�ǋ"�p n� ���]~!�W�J���a�q!n��V X*�c �TJT*%�6�<d[�    IEND�B`�           [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
[remap]

path="res://Scripts/HostButton.gdc"
   [remap]

path="res://Scripts/JoinButton.gdc"
   [remap]

path="res://Scripts/Lobby.gdc"
        [remap]

path="res://Scripts/LobbyPlayer.gdc"
  [remap]

path="res://Scripts/NetworkGlobals.gdc"
               �PNG

   IHDR   @   @   �iq�   sRGB ���  0IDATx��}pTU����L����W�$�@HA�%"fa��Yw�)��A��Egةf���X�g˱��tQ���Eq�!�|K�@BHH:�t>�;�����1!ݝn�A�_UWw����{λ��sϽO�q汤��X,�q�z�<�q{cG.;��]�_�`9s��|o���:��1�E�V� ~=�	��ݮ����g[N�u�5$M��NI��-
�"(U*��@��"oqdYF�y�x�N�e�2���s����KҦ`L��Z)=,�Z}"
�A�n{�A@%$��R���F@�$m������[��H���"�VoD��v����Kw�d��v	�D�$>	�J��;�<�()P�� �F��
�< �R����&�կ��� ����������%�u̚VLNfڠus2�̚VL�~�>���mOMJ���J'R��������X����׬X�Ϲ虾��6Pq������j���S?�1@gL���±����(�2A�l��h��õm��Nb�l_�U���+����_����p�)9&&e)�0 �2{��������1���@LG�A��+���d�W|x�2-����Fk7�2x��y,_�_��}z��rzy��%n�-]l����L��;
�s���:��1�sL0�ڳ���X����m_]���BJ��im�  �d��I��Pq���N'�����lYz7�����}1�sL��v�UIX���<��Ó3���}���nvk)[����+bj�[���k�������cݮ��4t:= $h�4w:qz|A��٧�XSt�zn{�&��õmQ���+�^�j�*��S��e���o�V,	��q=Y�)hԪ��F5~����h�4 *�T�o��R���z�o)��W�]�Sm銺#�Qm�]�c�����v��JO��?D��B v|z�կ��܈�'�z6?[� ���p�X<-���o%�32����Ρz�>��5�BYX2���ʦ�b��>ǣ������SI,�6���|���iXYQ���U�҅e�9ma��:d`�iO����{��|��~����!+��Ϧ�u�n��7���t>�l捊Z�7�nвta�Z���Ae:��F���g�.~����_y^���K�5��.2�Zt*�{ܔ���G��6�Y����|%�M	���NPV.]��P���3�8g���COTy�� ����AP({�>�"/��g�0��<^��K���V����ϫ�zG�3K��k���t����)�������6���a�5��62Mq����oeJ�R�4�q�%|�� ������z���ä�>���0�T,��ǩ�����"lݰ���<��fT����IrX>� � ��K��q�}4���ʋo�dJ��م�X�sؘ]hfJ�����Ŧ�A�Gm߽�g����YG��X0u$�Y�u*jZl|p������*�Jd~qcR�����λ�.�
�r�4���zپ;��AD�eЪU��R�:��I���@�.��&3}l
o�坃7��ZX��O�� 2v����3��O���j�t	�W�0�n5����#è����%?}����`9۶n���7"!�uf��A�l܈�>��[�2��r��b�O�������gg�E��PyX�Q2-7���ʕ������p��+���~f��;����T	�*�(+q@���f��ϫ����ѓ���a��U�\.��&��}�=dd'�p�l�e@y��
r�����zDA@����9�:��8�Y,�����=�l�֮��F|kM�R��GJK��*�V_k+��P�,N.�9��K~~~�HYY��O��k���Q�����|rss�����1��ILN��~�YDV��-s�lfB֬Y�#.�=�>���G\k֬fB�f3��?��k~���f�IR�lS'�m>²9y���+ �v��y��M;NlF���A���w���w�b���Л�j�d��#T��b���e��[l<��(Z�D�NMC���k|Zi�������Ɗl��@�1��v��Щ�!曣�n��S������<@̠7�w�4X�D<A`�ԑ�ML����jw���c��8��ES��X��������ƤS�~�׾�%n�@��( Zm\�raҩ���x��_���n�n���2&d(�6�,8^o�TcG���3���emv7m6g.w��W�e
�h���|��Wy��~���̽�!c� �ݟO�)|�6#?�%�,O֫9y������w��{r�2e��7Dl �ׇB�2�@���ĬD4J)�&�$
�HԲ��
/�߹�m��<JF'!�>���S��PJ"V5!�A�(��F>SD�ۻ�$�B/>lΞ�.Ϭ�?p�l6h�D��+v�l�+v$Q�B0ūz����aԩh�|9�p����cƄ,��=Z�����������Dc��,P��� $ƩЩ�]��o+�F$p�|uM���8R��L�0�@e'���M�]^��jt*:��)^�N�@�V`�*�js�up��X�n���tt{�t:�����\�]>�n/W�\|q.x��0���D-���T��7G5jzi���[��4�r���Ij������p�=a�G�5���ͺ��S���/��#�B�EA�s�)HO`���U�/QM���cdz
�,�!�(���g�m+<R��?�-`�4^}�#>�<��mp��Op{�,[<��iz^�s�cü-�;���쾱d����xk瞨eH)��x@���h�ɪZNU_��cxx�hƤ�cwzi�p]��Q��cbɽcx��t�����M|�����x�=S�N���
Ͽ�Ee3HL�����gg,���NecG�S_ѠQJf(�Jd�4R�j��6�|�6��s<Q��N0&Ge
��Ʌ��,ᮢ$I�痹�j���Nc���'�N�n�=>|~�G��2�)�D�R U���&ՠ!#1���S�D��Ǘ'��ೃT��E�7��F��(?�����s��F��pC�Z�:�m�p�l-'�j9QU��:��a3@0�*%�#�)&�q�i�H��1�'��vv���q8]t�4����j��t-}IـxY�����C}c��-�"?Z�o�8�4Ⱦ���J]/�v�g���Cȷ2]�.�Ǣ ��Ս�{0
�>/^W7�_�����mV铲�
i���FR��$>��}^��dُ�۵�����%��*C�'�x�d9��v�ߏ � ���ۣ�Wg=N�n�~������/�}�_��M��[���uR�N���(E�	� ������z��~���.m9w����c����
�?���{�    IEND�B`�          ECFG      _global_script_classes             _global_script_class_icons             application/config/name         NetworkTest    application/run/main_scene          res://Scenes/Lobby.tscn    application/config/icon         res://icon.png     autoload/NetworkGlobals(          *res://Scripts/NetworkGlobals.gd)   rendering/environment/default_environment          res://default_env.tres      