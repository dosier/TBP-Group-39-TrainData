# TBP-Group-39-TrainData
Contains Matlab code for generating training data.

The **simple_f.m**, **simple_ode113.m**and **timestamp.m** files are all taken from the following web page https://people.sc.fsu.edu/~jburkardt/m_src/three_body_simulation/three_body_simulation.html

The **training_data_generator.m** file is based of the **simple_ode113.m** file but instead of generating images it generates a specified number of data sets. 
For each data set the first body's initial position is constant with x,y being *(1, 0)*, for the second body the initial position is random with x in the range *-0,5..0* and y in the range *0..1.0*, and for the third body the initial position is derived from symmetry with the second body where x is *-1-x_2* and y is *-1-y_2*.
This is based of the following paper: https://arxiv.org/pdf/1910.07291.pdf
