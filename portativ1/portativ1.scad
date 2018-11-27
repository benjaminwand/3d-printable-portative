include <OpenSCAD_support/M4.scad>;
include <OpenSCAD_support/valves_support.scad>;

end_of_keyboard = 70;
pipes_start_z = 25;

minWallThickness = 1.2;

move_c = [20, 40 + end_of_keyboard, 31.5 + pipes_start_z];
move_cis = [41, end_of_keyboard, 1.5 + pipes_start_z];
move_d = [55,40 + end_of_keyboard, 31.5 + pipes_start_z];
move_dis = [72, end_of_keyboard, 1.5 + pipes_start_z];
move_e = [85, 40 + end_of_keyboard, 31.5 + pipes_start_z];
move_f = [102, end_of_keyboard, 1.5 + pipes_start_z];
move_fis = [115, 40 + end_of_keyboard, 31.5 + pipes_start_z];
move_g = [132, end_of_keyboard, 1.5 + pipes_start_z];
move_gis = [139, 40 + end_of_keyboard, 31.5 + pipes_start_z];
move_a = [156, end_of_keyboard, 1.5 + pipes_start_z];
move_ais = [163, 40 + end_of_keyboard, 31.5 + pipes_start_z];
move_h = [180, end_of_keyboard, 1.5 + pipes_start_z];
move_c1 = [186.5, 40 + end_of_keyboard, 31.5 + pipes_start_z];

/*
// pipe dummies
#    translate(move_c)import("c_dummy.stl");
#    translate(move_cis)import("cis_dummy.stl");
#    translate(move_d)import("d_dummy.stl");
#    translate(move_dis)import("dis_dummy.stl");
#    translate(move_e)import("e_dummy.stl");
#    translate(move_f)import("f_dummy.stl");
#    translate(move_fis)import("fis_dummy.stl");
#    translate(move_g)import("g_dummy.stl");
#    translate(move_gis)import("gis_dummy.stl");
#    translate(move_a)import("a_dummy.stl");
#    translate(move_ais)import("ais_dummy.stl");
#    translate(move_h)import("h_dummy.stl");
#    translate(move_c1)import("c1_dummy.stl");
*/

case_points= [
    [20, 0, 0],                 // 0 
    [160, 0, 0],                // 1
    [190, end_of_keyboard + 10, 0], // 2 
    [195, end_of_keyboard + 62, 0], // 3
    [0, end_of_keyboard + 83, 0],   // 4
    [20, end_of_keyboard + 10, 0],  // 5
    [20, 0, pipes_start_z],         // 6
    [160, 0, pipes_start_z],        // 7
    [190, end_of_keyboard + 20, pipes_start_z],     // 8
    [190, end_of_keyboard + 25, pipes_start_z],     // 9
    [190, end_of_keyboard + 30, pipes_start_z + 30], // 10
    [195, end_of_keyboard + 62, pipes_start_z + 30],// 11
    [0, end_of_keyboard + 83, pipes_start_z + 30],  // 12
    [3, end_of_keyboard + 45, pipes_start_z + 30],  // 13
    [20, end_of_keyboard + 39, pipes_start_z],      // 14
    [20, end_of_keyboard + 20, pipes_start_z],      // 15
    [195, end_of_keyboard + 62, 180],// 16
    [0, end_of_keyboard + 83, 180],  // 17
];

screw_points = [
    [26, 6, 0], 
    [70, 5, 0],
    [115, 5, 0],
    [155, 6, 0],           
    [169, end_of_keyboard/2 + 8, 0],
    [184, end_of_keyboard + 10, 0], 
    [188, end_of_keyboard + 56, 0], 
    [129, end_of_keyboard + 63, 0],
    [67, end_of_keyboard + 70, 0],
    [13, end_of_keyboard + 73, 0],   
    [26, end_of_keyboard +10, 0],  
];


key_points = [
    [34, 20, pipes_start_z],    // c
    [50, 20, pipes_start_z],    // d
    [66, 20, pipes_start_z],    // e
    [82, 20, pipes_start_z],    // f
    [98, 20, pipes_start_z],    // g
    [114, 20, pipes_start_z],   // a
    [130, 20, pipes_start_z],   // h
    [146, 20, pipes_start_z],   // c
    [42, 46, pipes_start_z],
    [58, 46, pipes_start_z],
    [90, 46, pipes_start_z],
    [106, 46, pipes_start_z],
    [122, 46, pipes_start_z],
];

// case
difference(){

    union(){
        hull(){ //front
            translate(case_points[0]) sphere(1.5);
            translate(case_points[1]) sphere(1.5);
            translate(case_points[6]) sphere(1.5);
            translate(case_points[7]) sphere(1.5);
        }; 
        hull(){ //right side 1
            translate(case_points[1]) sphere(1.5);
            translate(case_points[2]) sphere(1.5);
            translate(case_points[7]) sphere(1.5);
            translate(case_points[8]) sphere(1.5);
        }; 
        hull(){ //right side 2
            translate(case_points[2]) sphere(1.5);
            translate(case_points[3]) sphere(1.5);
            translate(case_points[8]) sphere(1.5);
            translate(case_points[9]) sphere(1.5);
        }; 
        hull(){ //right side 3
            translate(case_points[3]) sphere(1.5);
            translate(case_points[9]) sphere(1.5);
            translate(case_points[10]) sphere(1.5);
            translate(case_points[11]) sphere(1.5);
        };
        hull(){ // back
            translate(case_points[3]) sphere(1.5);
            translate(case_points[4]) sphere(1.5);
            translate(case_points[16]) sphere(1.5);
            translate(case_points[17]) sphere(1.5);
        };
        hull(){ // left 4
            translate(case_points[4]) sphere(1.5);
            translate(case_points[12]) sphere(1.5);
            translate(case_points[13]) sphere(1.5);
        };
        hull(){ // left 3
            translate(case_points[4]) sphere(1.5);
            translate(case_points[13]) sphere(1.5);
            translate(case_points[14]) sphere(1.5);
        };
        hull(){ // left 2
            translate(case_points[4]) sphere(1.5);
            translate(case_points[5]) sphere(1.5);
            translate(case_points[14]) sphere(1.5);
        };
        hull(){ // left 1
            translate(case_points[0]) sphere(1.5);
            translate(case_points[5]) sphere(1.5);
            translate(case_points[14]) sphere(1.5);
            translate(case_points[6]) sphere(1.5);
        };    
        hull(){ // keyboard
            translate(case_points[14]) sphere(1.5);
            translate(case_points[6]) sphere(1.5);
            translate(case_points[9]) sphere(1.5);
            translate(case_points[7]) sphere(1.5);
        };
        hull(){ // uppr pipes
            translate(case_points[10]) sphere(1.5);
            translate(case_points[11]) sphere(1.5);
            translate(case_points[12]) sphere(1.5);
            translate(case_points[13]) sphere(1.5);
        };
        hull(){ // hill
            translate(case_points[9]) sphere(1.5);
            translate(case_points[10]) sphere(1.5);
            translate(case_points[13]) sphere(1.5);
            translate(case_points[14]) sphere(1.5);
        };
        hull(){ //front
            translate(case_points[0]) sphere(1.5);
            translate(case_points[1]) sphere(1.5);
            translate(case_points[2]) sphere(1.5);
            translate(case_points[5]) sphere(1.5);
        }; 
        hull(){ //right side 1
            translate(case_points[2]) sphere(1.5);
            translate(case_points[3]) sphere(1.5);
            translate(case_points[4]) sphere(1.5);
            translate(case_points[5]) sphere(1.5);
        }; 
        for (i= [0 : len(key_points)-1 ])
            translate(key_points[i]) key_hole() ;
        hull(){                                     // cis
            translate ([0, 0, -15])
            translate (key_points[8]) sphere(5.5);
            translate ([0, 0, -5])
            translate (move_cis) sphere(5);
        };
        hull(){                                     // dis
            translate ([0, 0, -15])
            translate (key_points[9]) sphere(5.5);
            translate ([0, 0, -5])
            translate (move_dis) sphere(5);
        };                                          // c
        hull(){
            translate ([0, 0, -15])
            translate (key_points[0]) sphere(5.5);
            translate ([0, 0, -5])
            translate ([20, 40 + end_of_keyboard, pipes_start_z]) sphere(5);
        };                                          
        hull(){
            translate (move_c) cylinder(0.1, 6.2);
            translate ([0, 0, -5])
            translate ([20, 40 + end_of_keyboard, pipes_start_z]) sphere(5);
        };
        hull(){                             // d
            translate ([0, 0, -15])
            translate (key_points[1]) sphere(5.5);
            translate ([0, 0, -5])
            translate ([50,40 + end_of_keyboard, pipes_start_z+2]) sphere(5);
        };                                          
        hull(){
            translate (move_d) cylinder(0.1, 6.2);
            translate ([0, 0, -5])
            translate ([50,40 + end_of_keyboard, pipes_start_z+2]) sphere(5);
        };
        hull(){                             // e
            translate ([0, 0, -15])
            translate (key_points[2]) sphere(5.5);
            translate ([0, 0, -7])
            translate ([85,40 + end_of_keyboard, pipes_start_z]) sphere(5);
        };                                          
        hull(){
            translate (move_e) cylinder(0.1, 6.2);
            translate ([0, 0, -7])
            translate ([85,40 + end_of_keyboard, pipes_start_z]) sphere(5);
        };
        hull(){                                     // f
            translate ([0, 0, -15])
            translate (key_points[3]) sphere(5.5);
            translate ([0, 0, -5])
            translate ([80, 50, pipes_start_z]) sphere(5);
        }; 
        hull(){                                     
            translate ([80, 50, pipes_start_z - 5]) sphere(5.5);
            translate ([0, 0, -5])
            translate (move_f) sphere(5);
        }; 
        hull(){                             // fis
            translate ([0, 0, -15])
            translate (key_points[10]) sphere(5.5);
            translate ([0, 0, -5])
            translate ([115,40 + end_of_keyboard, pipes_start_z]) sphere(5);
        };                                          
        hull(){
            translate (move_fis) cylinder(0.1, 6.2);
            translate ([0, 0, -5])
            translate ([115,40 + end_of_keyboard, pipes_start_z]) sphere(5);
        };
       hull(){                                     // g
            translate ([0, 0, -15])
            translate (key_points[4]) sphere(5.5);
            translate ([0, 0, -5])
            translate ([98, 55, pipes_start_z]) sphere(5);
        }; 
        hull(){                                     
            translate ([98, 55, pipes_start_z - 4]) sphere(5.5);
            translate ([0, 0, -5])
            translate (move_g) sphere(5);
        };         
        hull(){                             // gis
            translate ([0, 0, -15])
            translate (key_points[11]) sphere(5.5);
            translate ([0, 0, -5])
            translate ([139,40 + end_of_keyboard, pipes_start_z]) sphere(5);
        };                                          
        hull(){
            translate (move_gis) cylinder(0.1, 6.2);
            translate ([0, 0, -5])
            translate ([139,40 + end_of_keyboard, pipes_start_z]) sphere(5);
        };
        hull(){                                     // a
            translate ([0, 0, -15])
            translate (key_points[5]) sphere(5.5);
            translate ([0, 0, -5])
            translate ([114, 53, pipes_start_z]) sphere(5);
        }; 
        hull(){                                     
            translate ([114, 53, pipes_start_z - 5]) sphere(5.5);
            translate ([0, 0, -5])
            translate (move_a) sphere(5);
        }; 
        hull(){                             // ais
            translate ([0, 0, -15])
            translate (key_points[12]) sphere(5.5);
            translate ([0, 0, -5])
            translate ([163,40 + end_of_keyboard, pipes_start_z]) sphere(5);
        };                                          
        hull(){
            translate (move_ais) cylinder(0.1, 5.2);
            translate ([0, 0, -5])
            translate ([163,40 + end_of_keyboard, pipes_start_z]) sphere(5);
        };
        hull(){                                     // h
            translate ([0, 0, -15])
            translate (key_points[6]) sphere(5.5);
            translate ([0, 0, -5])
            translate (move_h) sphere(5);
        };
         hull(){                                        //c1
            translate ([0, 0, -15])
            translate (key_points[7]) sphere(5.5);
            translate ([0, 0, -5])
            translate ([195, 40 + end_of_keyboard, 8.6]) sphere(5);
        };                                          
        hull(){
            translate (move_c1) cylinder(0.1, 5.2);
            translate ([0, 0, -5])
            translate ([195, 40 + end_of_keyboard, 8.6]) sphere(5);
        };
    };
    union(){  // minus
        translate([95, 70, 0]) cube ([130, 120, 5], true);
        translate([100, end_of_keyboard + 72, pipes_start_z+13]) 
            sphere(16);    
        // screw spacers
        for (i= [0 : len(screw_points)-1 ])
            translate(screw_points[i]) M4_spacer () ;
        // key holes
        for (i= [0 : len(key_points)-1 ])
            translate(key_points[i]) 
                cylinder(15, wideOuter-0.5, wideOuter-0.5, true);
        // key holes
        translate ([0, 0, -12])
        for (i= [0 : len(key_points)-1 ])
            translate(key_points[i]) 
                cylinder(20, wideOuter+0.1, wideOuter+0.1, true);
        hull(){                                     // cis
            translate ([0, 0, -15])
            translate (key_points[8]) sphere(4);
            translate ([0, 0, -5])
            translate (move_cis) sphere(3.5);
        };
        translate (move_cis) cylinder(8, 3.5, 3.5, true);
        hull(){                                     // dis
            translate ([0, 0, -15])
            translate (key_points[9]) sphere(4);
            translate ([0, 0, -5])
            translate (move_dis) sphere(3.5);
        };                                          // c
        hull(){
            translate ([0, 0, -15])
            translate (key_points[0]) sphere(4);
            translate ([0, 0, -5])
            translate ([20, 40 + end_of_keyboard, pipes_start_z]) sphere(3.5);
        };  
        translate (move_dis) cylinder(8, 3.5, 3.5, true);        
        hull(){
            translate ([0, 0, 0.1]) translate (move_c) cylinder(0.1, 4);
            translate ([0, 0, -5])
            translate ([20, 40 + end_of_keyboard, pipes_start_z]) sphere(3.5);
        };
        hull(){                             // d
            translate ([0, 0, -15])
            translate (key_points[1]) sphere(4);
            translate ([0, 0, -5])
            translate ([50,40 + end_of_keyboard, pipes_start_z+2]) sphere(3);
        };                                          
        hull(){
            translate ([0, 0, 0.1]) translate (move_d) cylinder(0.1, 4);
            translate ([0, 0, -7])
            translate ([50,40 + end_of_keyboard, pipes_start_z+2]) sphere(3);
        };
        hull(){                             // e
            translate ([0, 0, -15])
            translate (key_points[2]) sphere(4);
            translate ([0, 0, -7])
            translate ([85,40 + end_of_keyboard, pipes_start_z]) sphere(3.5);
        };                                          
        hull(){
            translate ([0, 0, 0.1]) translate (move_e) cylinder(0.1, 4);
            translate ([0, 0, -5])
            translate ([85,40 + end_of_keyboard, pipes_start_z]) sphere(3.5);
        };
        hull(){                                     // f
            translate ([0, 0, -15])
            translate (key_points[3]) sphere(4);
            translate ([0, 0, -5])
            translate ([80, 50, pipes_start_z]) sphere(3.5);
        }; 
        hull(){                                     
            translate ([80, 50, pipes_start_z - 5]) sphere(3.5);
            translate ([0, 0, -5])
            translate (move_f) sphere(3.5);
        };    
        translate (move_f) cylinder(8, 3.5, 3.5, true);
        hull(){                             // fis
            translate ([0, 0, -15])
            translate (key_points[10]) sphere(4);
            translate ([0, 0, -5])
            translate ([115,40 + end_of_keyboard, pipes_start_z]) sphere(3.5);
        };                                          
        hull(){
            translate ([0, 0, 0.1]) translate (move_fis) cylinder(0.1, 4);
            translate ([0, 0, -5])
            translate ([115,40 + end_of_keyboard, pipes_start_z]) sphere(3.5);
        };
       hull(){                                     // g
            translate ([0, 0, -15])
            translate (key_points[4]) sphere(4);
            translate ([0, 0, -5])
            translate ([98, 55, pipes_start_z]) sphere(3.5);
        }; 
        hull(){                                     
            translate ([98, 55, pipes_start_z - 5]) sphere(3.5);
            translate ([0, 0, -5])
            translate (move_g) sphere(3.5);
        }; 
        translate (move_g) cylinder(8, 3.5, 3.5, true);        
        hull(){                                  // gis
            translate ([0, 0, -15])
            translate (key_points[11]) sphere(4);
            translate ([0, 0, -5])
            translate ([139,40 + end_of_keyboard, pipes_start_z]) sphere(3.5);
        };                                          
        hull(){
            translate ([0, 0, 0.1]) translate (move_gis) cylinder(0.1, 4);
            translate ([0, 0, -5])
            translate ([139,40 + end_of_keyboard, pipes_start_z]) sphere(3.5);
        };
       hull(){                                     // a
            translate ([0, 0, -15])
            translate (key_points[5]) sphere(4);
            translate ([0, 0, -5])
            translate ([114, 53, pipes_start_z]) sphere(3.5);
        }; 
        hull(){                                     
            translate ([114, 53, pipes_start_z - 5]) sphere(3.5);
            translate ([0, 0, -5])
            translate (move_a) sphere(3.5);
        }; 
        translate (move_a) cylinder(8, 3.5, 3.5, true);
        hull(){                             // ais
            translate ([0, 0, -15])
            translate (key_points[12]) sphere(4);
            translate ([0, 0, -5])
            translate ([163,40 + end_of_keyboard, pipes_start_z]) sphere(3.5);
        };                                          
        hull(){
            translate ([0, 0, 0.1]) translate (move_ais) cylinder(0.1, 3.5);
            translate ([0, 0, -5])
            translate ([163,40 + end_of_keyboard, pipes_start_z]) sphere(3.5);
        };
        hull(){                                     // h
            translate ([0, 0, -15])
            translate (key_points[6]) sphere(4);
            translate ([0, 0, -5])
            translate (move_h) sphere(3.5);
        };
        translate (move_h) cylinder(8, 3.5, 3.5, true);
        hull(){                                        //c1
            translate ([0, 0, -15])
            translate (key_points[7]) sphere(4);
            translate ([0, 0, -5])
            translate ([195, 40 + end_of_keyboard, 8.6]) sphere(3.5);
        };                                          
        hull(){
            translate ([0, 0, 0.1]) translate (move_c1) cylinder(0.1, 3.5);
            translate ([0, 0, -5])
            translate ([195, 40 + end_of_keyboard, 8.6]) sphere(3.5);
        };
        //// cutoff lower half
//        translate ([-5, -5, -3])
//#cube([250, 160, 75], false);
    };
};

// keys
*for (i= [0 : len(key_points)-1 ])
    translate(key_points[i]) cube([15, 25, 5], true);



// floor
*translate([0, 0, -20])
difference(){
    union(){
        hull(){ //front
            translate(case_points[0]) sphere(1.5);
            translate(case_points[1]) sphere(1.5);
            translate(case_points[2]) sphere(1.5);
            translate(case_points[5]) sphere(1.5);
        }; 
        hull(){ //right side 1
            translate(case_points[2]) sphere(1.5);
            translate(case_points[3]) sphere(1.5);
            translate(case_points[4]) sphere(1.5);
            translate(case_points[5]) sphere(1.5);
        }; 
    };
    translate([0, 0, 2])
    for (i= [0 : len(screw_points)-1 ])
    translate(screw_points[i]) M4_spacer ();
};
    

//bellow
*difference(){
    union(){
        translate([10,150, 90]) 
            cube ([180, 3, 90], false);  
        translate([100,153, 90]) 
            rotate([90,0,0]) cylinder( 3, 90, 90,false);
        translate([100,160, 30]) 
            intersection(){
                rotate([0,90,0])cylinder( 20, 8, 8,true);
                cylinder(20, 8, 8,true);
            };
    };
    union(){
    translate([113,155, 50])rotate([90,0,0]) cylinder( 20, 5, 5,true);
    translate([100,155, 50])rotate([90,0,0]) cylinder( 20, 5, 5,true);
    translate([87,155, 50])rotate([90,0,0]) cylinder( 20, 5, 5,true);
    };
};

// testing
module rainbow 
    (points,		    // A vector of points, the only must-have
	many_colors = 20,   // Determins width of gradient
	size_sphere = 1.8)    // Depends on the size of your model
{
for (i= [0 : len(points)-1 ])
    color([cos(many_colors*i)/2+0.5, 
        -sin(many_colors*i)/2+0.5, 
        -cos(many_colors*i)/2+0.5, 
        1])
    translate(points[i]) sphere(size_sphere);
}

//rainbow(screw_points);