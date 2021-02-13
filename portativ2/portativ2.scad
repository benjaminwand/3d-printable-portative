include <OpenSCAD_support/M4.scad>;
include <OpenSCAD_support/valves_support.scad>;
include <all_pipes_2.scad>;

case_points= [
    [20, 0, 0],                 // 0 
    [168, 0, 0],                // 1
    [180, end_of_keyboard + 12.5, 0], // 2 
    [186, end_of_keyboard + 49, 0], // 3
    [5, end_of_keyboard + 77, 0],   // 4
    [12, end_of_keyboard + 10, 0],  // 5
    [20, 0, z1],         // 6
    [168, 0, z1],        // 7
    [178, end_of_keyboard + 5, z1],     // 8
    [178, end_of_keyboard + 20, z1],     // 9
    [186, end_of_keyboard + 26, z2], // 10
    [186, end_of_keyboard + 49, z2],// 11
    [5, end_of_keyboard + 77, z2],  // 12
    [6, end_of_keyboard + 40, z2],  // 13
    [8, end_of_keyboard + 33, z1],      // 14
    [20, end_of_keyboard + 20, z1],      // 15
    [186, end_of_keyboard + 49, 180],// 16
    [5, end_of_keyboard + 77, 180],  // 17
];

screw_points = [
    [26, 6, 0], 
    [70, 5, 0],
    [112, 5, 0],
    [163, 6, 0],           
    [171, end_of_keyboard, 0], 
    [178, end_of_keyboard + 44, 0], 
    [121, end_of_keyboard + 54, 0],
    [68, end_of_keyboard + 61, 0],
    [13, end_of_keyboard + 70, 0],   
    [19, end_of_keyboard + 8, 0],  
];


key_points = [
    [34, 20, z1],    // c
    [51, 20, z1],    // d
    [68, 20, z1],    // e
    [85, 20, z1],    // f
    [102, 20, z1],    // g
    [119, 20, z1],   // a
    [136, 20, z1],   // h
    [153, 20, z1],   // c
    [42.5, 46, z1],
    [59.5, 46, z1],
    [93.5, 46, z1],
    [110.5, 46, z1],
    [127.5, 46, z1],
];

floor_polygon_points = [[30, 12], [158, 12], [166, 72], [172, 110], [20, 132], [26, 80] ];

// case 
difference(){
    
    union(){                            // plus
        union(){                        // case-outside
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
        hull(){ // back upper
            translate(case_points[11]) sphere(1.5);
            translate(case_points[12]) sphere(1.5);
            translate(case_points[16]) sphere(1.5);
            translate(case_points[17]) sphere(1.5);
        };
        difference(){
            hull(){ // back lower
                translate(case_points[3]) sphere(1.5);
                translate(case_points[4]) sphere(1.5);
                translate(case_points[11]) sphere(1.5);
                translate(case_points[12]) sphere(1.5);
            };
            intersection(){         // holes to bellow
                translate([100,140, 90])
                for (j = [-11: 11]) translate([-5*j, 0, 5*j])
                    for (i = [-11: 11])
                        translate([5*i, 0, 5*i]) 
                            rotate([0, 45, 0]) cube([5, 50, 5], true);
                translate([95,153, 90]) 
                    rotate([90,0,0]) cylinder( 50, 75, 75,false);
            };
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
            translate(case_points[8]) sphere(1.5);
            translate(case_points[7]) sphere(1.5);
        };
        
            hull(){ // upper pipes and hill
            translate(case_points[9]) sphere(1.5);
            translate(case_points[10]) sphere(1.5);
            translate(case_points[11]) sphere(1.5);
            translate(case_points[12]) sphere(1.5);
            translate(case_points[13]) sphere(1.5);
            translate(case_points[14]) sphere(1.5);
            translate([0, 10, 0])translate(case_points[14]) sphere(1.5);
            translate([0, 10, 0])translate(case_points[9]) sphere(1.5);
        };
        difference(){       // floor
            union(){
                hull(){ // floor front
                    translate(case_points[0]) sphere(1.5);
                    translate(case_points[1]) sphere(1.5);
                    translate(case_points[2]) sphere(1.5);
                    translate(case_points[5]) sphere(1.5);
                }; 
                hull(){ // floor back
                    translate(case_points[2]) sphere(1.5);
                    translate(case_points[3]) sphere(1.5);
                    translate(case_points[4]) sphere(1.5);
                    translate(case_points[5]) sphere(1.5);
                }; 
            };                    
            translate ([0, 0, -2])       // floor hole
                linear_extrude(height = 6) 
                    polygon(points = floor_polygon_points);
        };
        };
        for (i= [0 : len(key_points)-1 ])       // stick-ins
            translate(key_points[i]) key_hole();
        
        union(){                        // conveyancing
        hull(){                                     // cis
            translate ([0, 0, -15])
            translate (key_points[8]) sphere(5.5);
            translate ([0, 0, -5])
            translate (move_cis) 
                sphere(air_supply_diameter[1]/2 + minWallThickness);
        };
        hull(){                                     // dis
            translate ([0, 0, -15])
            translate (key_points[9]) sphere(5.5);
            translate ([0, 0, -5])
            translate (move_dis) 
                sphere(air_supply_diameter[3]/2 + minWallThickness);
        };                                          // c
        hull(){
            translate ([0, 0, -15])
            translate (key_points[0]) sphere(5.5);
            translate ([10, 35 + end_of_keyboard, z1 -5]) sphere(5);
        };                                          
        hull(){
            translate (move_c) 
                cylinder(0.1, air_supply_diameter[0]/2 + minWallThickness);
            translate ([10, 35 + end_of_keyboard, z1 -5]) sphere(5);
        };
        hull(){                             // d
            translate ([51.2, 45, 8]) sphere(5);      
            translate ([42.5, 33 + end_of_keyboard, z1 -5]) sphere(5);
        };     
        hull(){                             
            translate ([0, 0, -15])
            translate (key_points[1]) sphere(5.5);
            translate ([51.2, 45, 8]) sphere(5); 
        };          
        hull(){
            translate (move_d) 
                cylinder(0.1, d=(air_supply_diameter[2] + minWallThickness*2));
            translate ([42.5, 33 + end_of_keyboard, z1 -5]) sphere(5);
        };
        hull(){                             // e
            translate ([0, 0, -15])
            translate (key_points[2]) sphere(5.5);
            translate ([75, 29 + end_of_keyboard, z1 -7]) sphere(5);
        };                                          
        hull(){
            translate (move_e) 
                cylinder(0.1, air_supply_diameter[4]/2 + minWallThickness);
            translate ([75, 29 + end_of_keyboard, z1 -7]) sphere(5);
        };
        hull(){                                     // f
            translate ([0, 0, -15])
            translate (key_points[3]) sphere(5.5);
            translate ([82, 45, z1 -5]) sphere(5);
        }; 
        hull(){                                     
            translate ([82, 45, z1 - 5]) sphere(5);
            translate ([0, 0, -5])
            translate (move_f) sphere(air_supply_diameter[5]/2 + minWallThickness);
        }; 
        hull(){                             // fis
            translate ([0, 0, -15])
            translate (key_points[10]) sphere(5.5);
            translate ([100, 29 + end_of_keyboard, z1 -5]) sphere(5);
        };                                          
        hull(){
            translate (move_fis) 
                cylinder(0.1, air_supply_diameter[6]/2 + minWallThickness);
            translate ([100, 29 + end_of_keyboard, z1 -5]) sphere(5);
        };
       hull(){                                     // g
            translate ([0, 0, -15])
            translate (key_points[4]) sphere(5.5);
            translate ([101.5, 47, z1 -5]) sphere(5);
        }; 
        hull(){                                     
            translate ([101.5, 47, z1 - 5]) sphere(5);
            translate ([0, 0, -5])
            translate (move_g) sphere(air_supply_diameter[7]/2 + minWallThickness);
        };         
        hull(){                             // gis
            translate ([0, 0, -15])
            translate (key_points[11]) sphere(5.5);
            translate ([124.5, 28 + end_of_keyboard, z1 -5]) sphere(5);
        };                                          
        hull(){
            translate (move_gis) 
                cylinder(0.1, air_supply_diameter[8]/2 + minWallThickness);
            translate ([124.5, 28 + end_of_keyboard, z1 -5]) sphere(5);
        };
        hull(){                                     // a
            translate ([0, 0, -15])
            translate (key_points[5]) sphere(5.5);
            translate ([119, 50, z1 -5]) sphere(5);
        }; 
        hull(){                                     
            translate ([119, 50, z1 - 5]) sphere(5.5);
            translate ([0, 0, -5])
            translate (move_a) sphere(air_supply_diameter[9]/2 + minWallThickness);
        }; 
        hull(){                             // ais
            translate ([0, 0, -15])
            translate (key_points[12]) sphere(5.5);
            translate ([147, 25 + end_of_keyboard, z1 -5]) sphere(5);
        };                                          
        hull(){
            translate (move_ais) 
                cylinder(0.1, air_supply_diameter[10]/2 + minWallThickness);
            translate ([147, 25 + end_of_keyboard, z1 -5]) sphere(5);
        };
        hull(){                                     // h
            translate ([0, 0, -15])
            translate (key_points[6]) sphere(5.5);
            translate ([0, 0, -5])
            translate (move_h) 
                sphere(air_supply_diameter[11]/2 + minWallThickness);
        };
         hull(){                                        //c1
            translate ([0, 0, -15])
            translate (key_points[7]) sphere(5.5);
            translate ([166, 30 + end_of_keyboard/2, z1 -10]) sphere(5);
        };     
         hull(){                      
            translate ([166, 30 + end_of_keyboard/2, z1 -10]) sphere(5);
            translate ([169, 23 + end_of_keyboard, z1 -5]) sphere(5);
        };         
        
        hull(){
            translate (move_c1) 
                cylinder(0.1, air_supply_diameter[12]/2 + minWallThickness);
            translate ([169, 23 + end_of_keyboard, z1 -5]) sphere(5);
        };
        };
    
        difference(){           // vaults
            union(){
                hull(){         // keys area
                    translate(case_points[0]) sphere(1.5);
                    translate(case_points[1]) sphere(1.5);
                    translate(case_points[2]) sphere(1.5); 
                    translate(case_points[5]) sphere(1.5);
                    translate(case_points[6]) sphere(1.5);
                    translate(case_points[7]) sphere(1.5);
                    translate(case_points[5]) sphere(1.5);
                    translate(case_points[8]) sphere(1.5);
                    translate(case_points[14]) sphere(1.5);
                    translate(case_points[9]) sphere(1.5);
                };
                hull(){         // lower pipes area
                    translate(case_points[2]) sphere(1.5);
                    translate([180, end_of_keyboard + 15, 0]) sphere(1.5);
                    translate([14, end_of_keyboard + 28]) sphere(1.5);
                    translate(case_points[5]) sphere(1.5);
                    translate(case_points[7]) sphere(1.5);
                    translate(case_points[5]) sphere(1.5);
                    translate(case_points[8]) sphere(1.5);
                    translate([0, 10, 0])translate(case_points[14]) sphere(1.5);
                    translate([0, 10, 0])translate(case_points[9]) sphere(1.5);
                };
            };
            union(){
                for (i= [0:5])
                    translate ([44*i-18, 200, 0]) rotate([90, 0, 0])
                        linear_extrude(height = 200) 
                            polygon(points = [
                                [-16, -6], 
                                [16, -6], 
                                [16, z1 - 25.5], 
                                [0, z1 - 9.5], 
                                [-16, z1 - 25.5]]);
                translate ([0, 20, 0]) rotate([90, 0, 90])
                    linear_extrude(height = 200) 
                        polygon(points = [
                            [-8, -6], 
                            [8, -6], 
                            [8, z1 - 25.5], 
                            [0, z1 - 15.5], 
                            [-8, z1 - 25.5]]);
                translate ([0, 46, 0]) rotate([90, 0, 90])
                    linear_extrude(height = 200) 
                        polygon(points = [
                            [-8, -6], 
                            [8, -6], 
                            [8, z1 - 25.5], 
                            [0, z1 - 15.5], 
                            [-8, z1 - 25.5]]);
                translate ([0, 79, 0]) rotate([90, 0, 87]) 
                   linear_extrude(height = 200) 
                        polygon(points = [
                            [-8, -6], 
                            [8, -6], 
                            [8, z1 - 25.5], 
                            [0, z1 - 15.5], 
                            [-8, z1 - 25.5]]);           
            };
        };
    };
    union(){    // minus
        // screw spacers
        for (i= [0 : len(screw_points)-1 ])
            translate(screw_points[i]) M4_spacer () ;
        // upper key holes
        for (i= [0 : len(key_points)-1 ])
            translate(key_points[i]) 
                cylinder(15, wideOuter-0.5, wideOuter-0.5, true);
        // lower key holes
        translate ([0, 0, -17])
        for (i= [0 : len(key_points)-1 ])
            translate(key_points[i]) 
                cylinder(30, wideOuter+0.2, wideOuter+0.2, true);
        union(){                // conveyancing inside
        hull(){                                     // cis
            translate ([0, 0, -15])
            translate (key_points[8]) sphere(3);
            translate ([0, 0, -5])
            translate (move_cis) sphere(d=air_supply_diameter[1]);
        };
        translate (move_cis) cylinder(8, air_supply_diameter[1]/2, air_supply_diameter[1]/2, true);
        hull(){                                     // dis
            translate ([0, 0, -15])
            translate (key_points[9]) sphere(3);
            translate ([0, 0, -5])
            translate (move_dis) sphere(d=air_supply_diameter[3]);
        };  
        translate (move_dis) 
            cylinder(8, air_supply_diameter[3]/2, air_supply_diameter[3]/2, true); 
        hull(){                                     // c
            translate ([0, 0, -15])
            translate (key_points[0]) sphere(3);
            translate ([10, 35 + end_of_keyboard, z1 -5]) sphere(3);
        };         
        hull(){
            translate ([0, 0, 0.1]) translate (move_c) 
                cylinder(0.1, d=air_supply_diameter[0]);
            translate ([10, 35 + end_of_keyboard, z1 -5]) sphere(3);
        };
        hull(){                             // d
            translate ([51.2, 45, 8]) sphere(3);
            translate ([42.5, 33 + end_of_keyboard, z1 -5]) sphere(3);
        };                                          
        hull(){                             
            translate ([0, 0, -15])
            translate (key_points[1]) sphere(3);
            translate ([51.2, 45, 8]) sphere(3);
        };
        hull(){
            translate ([0, 0, 0.1]) translate (move_d) 
                cylinder(0.1, d=air_supply_diameter[2]);
            translate ([42.5, 33 + end_of_keyboard, z1 -5]) sphere(3);
        };
        hull(){                             // e
            translate ([0, 0, -15])
            translate (key_points[2]) sphere(3);
            translate ([75, 29 + end_of_keyboard, z1 -7]) sphere(3);
        };                                          
        hull(){
            translate ([0, 0, 0.1]) translate (move_e) 
                cylinder(0.1, d=air_supply_diameter[4]);
            translate ([75, 29 + end_of_keyboard, z1 -7]) sphere(3);
        };
        hull(){                                     // f
            translate ([0, 0, -15])
            translate (key_points[3]) sphere(3);
            translate ([82, 45, z1 - 5]) sphere(3);
        }; 
        hull(){                                     
            translate ([82, 45, z1 - 5]) sphere(3);
            translate ([0, 0, -5])
            translate (move_f) sphere(d=air_supply_diameter[5]);
        };    
        translate (move_f) 
            cylinder(8, air_supply_diameter[5]/2, air_supply_diameter[5]/2, true);
        hull(){                             // fis
            translate ([0, 0, -15])
            translate (key_points[10]) sphere(3);
            translate ([100, 29 + end_of_keyboard, z1 -5]) sphere(3);
        };                                          
        hull(){
            translate ([0, 0, 0.1]) translate (move_fis) 
                cylinder(0.1, d=air_supply_diameter[6]);
            translate ([100, 29 + end_of_keyboard, z1 -5]) sphere(3);
        };
       hull(){                                     // g
            translate ([0, 0, -15])
            translate (key_points[4]) sphere(3);
            translate ([101.5, 47, z1 - 5]) sphere(3);
        }; 
        hull(){                                     
            translate ([101.5, 47, z1 - 5]) sphere(3);
            translate ([0, 0, -5])
            translate (move_g) sphere(d=air_supply_diameter[7]);
        }; 
        translate (move_g) 
            cylinder(8, air_supply_diameter[7]/2, air_supply_diameter[7]/2, true);        
        hull(){                                  // gis
            translate ([0, 0, -15])
            translate (key_points[11]) sphere(3);
            translate ([124.5, 28 + end_of_keyboard, z1 -5]) sphere(3);
        };                                          
        hull(){
            translate ([0, 0, 0.1]) translate (move_gis) 
                cylinder(0.1, d=air_supply_diameter[8]);
            translate ([124.5, 28 + end_of_keyboard, z1 -5]) sphere(3);
        };
       hull(){                                     // a
            translate ([0, 0, -15])
            translate (key_points[5]) sphere(3);
            translate ([119, 50, z1 - 5]) sphere(3);
        }; 
        hull(){                                     
            translate ([119, 50, z1 - 5]) sphere(3);
            translate ([0, 0, -5])
            translate (move_a) sphere(d=air_supply_diameter[9]);
        }; 
        translate (move_a) 
            cylinder(8, air_supply_diameter[9]/2, air_supply_diameter[9]/2, true);
        hull(){                             // ais
            translate ([0, 0, -15])
            translate (key_points[12]) sphere(3);
            translate ([147, 25 + end_of_keyboard, z1 -5]) sphere(3);
        };                                          
        hull(){
            translate (move_ais) sphere(d=air_supply_diameter[10]);
            translate ([147, 25 + end_of_keyboard, z1 -5]) sphere(3);
        };
        hull(){                                     // h
            translate ([0, 0, -15])
            translate (key_points[6]) sphere(3);
            translate ([0, 0, -5])
            translate (move_h) sphere(d=air_supply_diameter[11]);
        };
        translate (move_h) 
            cylinder(8, air_supply_diameter[11]/2, air_supply_diameter[11]/2, true);
        hull(){                                        //c1
            translate ([0, 0, -15])
            translate (key_points[7]) sphere(3);
            translate ([166, 30 + end_of_keyboard/2, z1 -10]) sphere(3);
         };     
         hull(){                           
            translate ([166, 30 + end_of_keyboard/2, z1 -10]) sphere(3); 
            translate ([169, 23 + end_of_keyboard, z1 -5]) sphere(3);
        };         
        hull(){
            translate (move_c1) sphere(d=air_supply_diameter[12]);
            translate ([169, 23 + end_of_keyboard, z1 -5]) sphere(3);
        };
        };
    };
};

// keys
*for (i= [0 : len(key_points)-1 ])
    translate(key_points[i]) cube([15, 25, 5], true);



// floor
*translate([0, 0, -20])
difference(){
    union(){
        hull(){ // front
            translate(case_points[0]) sphere(1.5);
            translate(case_points[1]) sphere(1.5);
            translate(case_points[2]) sphere(1.5);
            translate(case_points[5]) sphere(1.5);
        }; 
        hull(){ // back
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
*translate([-25, 5, 0])
rotate([0, 0, -9])
difference(){
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
        translate([113,155, 50])rotate([90,0,0]) cylinder(20, 5, 5,true);
        translate([100,155, 50])rotate([90,0,0]) cylinder(20, 5, 5,true);
        translate([87,155, 50])rotate([90,0,0]) cylinder(20, 5, 5,true);
    };
};

// todo: Transportsicherung für Balg