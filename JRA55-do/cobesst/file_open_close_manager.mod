       k820309    9          19.0        |��_                                                                                                          
       src/file_mng/fileocmng.F90 FILE_OPEN_CLOSE_MANAGER                      @                              
       #         @                                                      #OUNIT                                                          #         @                                                      #IUNIT              
                                            #         @                                                       #FILE_UNIT    #FILE_NAME    #RECLEN 	   #L_SUCCEED 
   #CONVERT_MODE    #ACTION              
D @                                                    
  @                                                 1           
                                 	                     F @                               
                      
 @                                                 1           
 @                                                 1 #         @                                                       #FILE_UNIT    #FILE_NAME    #CONVERT_MODE    #ACTION              
D @                                                    
  @                                                 1           
 @                                                 1           
 @                                                 1 #         @                                                       #FILE_UNIT    #FILE_NAME    #ACTION              
D @                                                    
  @                                                 1           
 @                                                 1 #         @                                                       #FILE_UNIT              
  @                                            �   ;      fn#fn "   �   @   J   FILE_UNIT_MANAGER 0     S       ALLOCATE_UNIT+FILE_UNIT_MANAGER 6   n  @   a   ALLOCATE_UNIT%OUNIT+FILE_UNIT_MANAGER /   �  S       RELEASE_UNIT+FILE_UNIT_MANAGER 5     @   a   RELEASE_UNIT%IUNIT+FILE_UNIT_MANAGER !   A  �       OPEN_FILE_DIRECT +   �  @   a   OPEN_FILE_DIRECT%FILE_UNIT +      L   a   OPEN_FILE_DIRECT%FILE_NAME (   l  @   a   OPEN_FILE_DIRECT%RECLEN +   �  @   a   OPEN_FILE_DIRECT%L_SUCCEED .   �  L   a   OPEN_FILE_DIRECT%CONVERT_MODE (   8  L   a   OPEN_FILE_DIRECT%ACTION %   �  �       OPEN_FILE_SEQUENTIAL /     @   a   OPEN_FILE_SEQUENTIAL%FILE_UNIT /   H  L   a   OPEN_FILE_SEQUENTIAL%FILE_NAME 2   �  L   a   OPEN_FILE_SEQUENTIAL%CONVERT_MODE ,   �  L   a   OPEN_FILE_SEQUENTIAL%ACTION     ,  r       OPEN_FILE_PLAIN *   �  @   a   OPEN_FILE_PLAIN%FILE_UNIT *   �  L   a   OPEN_FILE_PLAIN%FILE_NAME '   *  L   a   OPEN_FILE_PLAIN%ACTION    v  W       CLOSE_FILE %   �  @   a   CLOSE_FILE%FILE_UNIT 