Vim�UnDo� [-����xTH59��mS��r���Iw]�߼   D   '	bgctx.clearRect(0,0,c.width,c.height);   3                          `5+r    _�                            ����                                                                                                                                                                                                                                                                                                                                                             `5&�     �         ?      let c, ctx;5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `5&�     �         ?      let fg, ctx;5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `5&�     �         ?      let fg, fgctx;5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `5&�     �         ?      let fg, fgctx, bg, bgct;5�_�                           ����                                                                                                                                                                                                                                                                                                                                                       `5*_    �         ?      !	 = document.getElementById('c');�         ?      "	c = document.getElementById('c');   	c.width = 500;   	c.height = 350;5�_�                           ����                                                                                                                                                                                                                                                                                                                                                       `5*e     �         ?      #	fg = document.getElementById('c');5�_�      
                     ����                                                                                                                                                                                                                                                                                                                                                       `5*k     �         ?      	ctx = c.getContext('2d');5�_�                
          ����                                                                                                                                                                                                                                                                                                                                                       `5*s     �         ?    �         ?    5�_�   
                        ����                                                                                                                                                                                                                                                                                                                                                       `5*v     �         C      "	 = document.getElementById('fg');�         C      $	fg = document.getElementById('fg');   	fg.width = 500;   	fg.height = 350;   	fgctx = c.getContext('2d');5�_�                           ����                                                                                                                                                                                                                                                                                                                                                       `5*�    �         C      $	bg = document.getElementById('fg');5�_�                    &       ����                                                                                                                                                                                                                                                                                                                                                       `5*�    �   %   '   C      (	kamera = new Kamera(c, level, spieler);5�_�                       	    ����                                                                                                                                                                                                                                                                                                                                                       `5*�     �         C      	fgctx = c.getContext('2d');5�_�                       	    ����                                                                                                                                                                                                                                                                                                                                                       `5*�    �         C      	bgctx = c.getContext('2d');5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  v       `5+     �                	bgctx = bg.getContext('2d');�                	bg.height = 350;�                	bg.width = 500;�                $	bg = document.getElementById('bg');�                	fgctx = fg.getContext('2d');�                	fg.height = 350;�                	fg.width = 500;�                $	fg = document.getElementById('fg');5�_�                            ����                                                                                                                                                                                                                                                                                                                                                v       `5+     �                 	let kollisionURL = get()?.k;�                0	let skizzeURL = get()?.s ?? 'level/Landschaft';5�_�                    &        ����                                                                                                                                                                                                                                                                                                                            (          &          v       `5+    �   '   )          	window.level = level;�   &   (          	window.kamera = kamera;�   %   '          -	kamera = new Kamera(fg, bg, level, spieler);5�_�                    #       ����                                                                                                                                                                                                                                                                                                                            (          &          v       `5+"   	 �   "   $   C      ,	level = new Level(skizzeURL, kollisionURL);5�_�                   2       ����                                                                                                                                                                                                                                                                                                                            (          &          v       `5+_     �   1   3   C      %	ctx.clearRect(0,0,c.width,c.height);5�_�                    2       ����                                                                                                                                                                                                                                                                                                                            (          &          v       `5+a     �   2   4   C    �   2   3   C    5�_�                    3       ����                                                                                                                                                                                                                                                                                                                            (          &          v       `5+b   
 �   2   4   D      '	fgctx.clearRect(0,0,c.width,c.height);5�_�                    2       ����                                                                                                                                                                                                                                                                                                                            (          &          v       `5+i     �   1   3   D      '	fgctx.clearRect(0,0,c.width,c.height);5�_�                    2       ����                                                                                                                                                                                                                                                                                                                            (          &          v       `5+l     �   1   3   D      (	fgctx.clearRect(0,0,fg.width,c.height);5�_�                    3       ����                                                                                                                                                                                                                                                                                                                            (          &          v       `5+n     �   2   4   D      '	bgctx.clearRect(0,0,c.width,c.height);5�_�                     3       ����                                                                                                                                                                                                                                                                                                                            (          &          v       `5+q    �   2   4   D      (	bgctx.clearRect(0,0,c.width,bg.height);5�_�                    -       ����                                                                                                                                                                                                                                                                                                                            (          &          v       `5+V     �   ,   .   C       * @fgfires level#update5�_�                           ����                                                                                                                                                                                                                                                                                                                            (             	       v       `5+     �                C	fg                                = document.getElementById('fg');�                )	fg.width                          = 500;�                )	fg.height                         = 350;�                9	fgctx                             = fg.getContext('2d');�                C	bg                                = document.getElementById('bg');�                )	bg.width                          = 500;�                )	bg.height                         = 350;�                9	bgctx                             = bg.getContext('2d');�                	// URL entziffern�                D	let skizzeURL                     = get()?.s ?? 'level/Landschaft';�                 .	let kollisionURL                  = get()?.k;�      !          	// Spieler laden�       "          O	spieler                           = new Player(undefined, undefined, 3000, 0);�   !   #          	// Level als "level" laden�   "   $          H	level                             = new Level(skizzeURL, kollisionURL);�   #   %          	level.entities.push(spieler);�   $   &          #	// Kamera für das Level erstellen�   %   '          H	kamera                            = new Kamera(fg, bg, level, spieler);�   &   (          ,	window.kamera                     = kamera;�   '   )          +	window.level                      = level;5�_�                            ����                                                                                                                                                                                                                                                                                                                                         #       v   &    `5*�    �                3	fg                = document.getElementById('fg');�                	fg.width          = 500;�                	fg.height         = 350;�                )	fgctx             = fg.getContext('2d');�                3	bg                = document.getElementById('bg');�                	bg.width          = 500;�                	bg.height         = 350;�                )	bgctx             = bg.getContext('2d');�                	// URL entziffern5�_�      	       
             ����                                                                                                                                                                                                                                                                                                                                                       `5*p     �         ?       5�_�                  	           ����                                                                                                                                                                                                                                                                                                                                                       `5*p     �         @    �         @      $	fg = document.getElementById('fg');   	fg.width = 500;   	fg.height = 350;   	fgctx = c.getContext('2d');5��