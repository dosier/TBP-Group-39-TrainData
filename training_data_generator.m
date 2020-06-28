function training_data_generator()

    global m0 m1 m2
    
    m0 = 5.0;
    m1 = 3.0;
    m2 = 4.0;
    
    t_initial = 0.0;
    t_final = 10.0;
    t_range = [ t_initial, t_final ];
    
    randomX = 1.*rand(10000,1) + -1.0;
    randomY = 1.*rand(10000,1) + -0.5;
        
    for testIndex=1:10
        
        x2=randomX(testIndex);
        y2=randomY(testIndex);
        
        x_initial = [ 1.0;  0.0;  0.0;  0.0;
                      1.0;  3.0;  0.0;  0.0;
                     -1.0-x2; -1.0-y2;  0.0;  0.0 ];

        options = odeset ( 'RelTol', 1.0e-10, 'AbsTol', 1.0E-10 );

        [ T1, Y1 ] = ode113 ( 'simple_f', t_range, x_initial, options );

        fid = fopen(sprintf('data/output_%d.txt', testIndex),'w'); 
        size = numel(T1);

        for i = 1:size
           fprintf(fid, '%d,', T1(i));
           YCols = Y1(i, :);
           YColSize = numel(YCols);
           for j = 1:YColSize
               fprintf(fid, '%d', YCols(j));
               if(j ~= YColSize)
                   fprintf(fid, ',');
               end
           end
           fprintf(fid, '\n');
        end
        fclose(fid) ;
    end
    return    
end