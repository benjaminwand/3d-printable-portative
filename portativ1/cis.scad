// flue pipe

include <OpenSCAD_support/common.scad>
include <OpenSCAD_support/loft.scad>
include <OpenSCAD_support/elliptic_flue_polyhedron.scad>
include <OpenSCAD_support/elliptic_labium.scad>

// variables
outerDiameter = 30;
innerDiameter = 26;
labiumWidth = 22.4;
outCut = 6.2;
lengthFlue = 32.7;
air_supply_diameter = 10;
minWallThickness = 1.6;
floorThickness = 2;
flueWidth = 0.6;
flueSteps = 20;         // only works well for few values
number_of_layers = 8 ;   // .. of the flue loft

// proportions, are most likely good like that
tubeInsert = air_supply_diameter + 2.5;       // length
pipeInsert = innerDiameter * 0.1 + 5; // length
height = floorThickness
    + lengthFlue
    + labiumWidth / sqrt(2)
    + (outerDiameter - innerDiameter) * 2; 
    
// calculations, don't touch in production use
labiumX = sin(labiumWidth * 180 / outerDiameter / PI) * outerDiameter; 
labium_angle_45 = labiumWidth * 360 / outerDiameter / PI / sqrt(2);
ground = (lengthFlue + floorThickness)*-1;
airSupplyX = (ground + tubeInsert) / sqrt(2);
airSupplyY = sin(270+labium_angle_45*0.4)*(outerDiameter+flueWidth)/4 - outerDiameter/4;
soundingLength = height - pipeInsert - floorThickness;
labium_polygon_points = 
    [[-outCut/sqrt(2), -outerDiameter/4, -outCut/sqrt(2)],
    [outerDiameter/2-outCut/sqrt(2), -outerDiameter/4, outerDiameter/2-outCut/sqrt(2)],
    [0, -outerDiameter/2, 0],
    [outerDiameter/2-outCut/sqrt(2) , -outerDiameter*3/4, outerDiameter/2-outCut/sqrt(2)],
    [-outCut/sqrt(2) , -outerDiameter*3/4, -outCut/sqrt(2)]];

// announcing sounding length
echo(str("the sounding length inside the model in mm: ", soundingLength));

// flueLength warning
if ((lengthFlue + floorThickness) < (tubeInsert + labiumWidth/2/sqrt(2) + outCut/sqrt(2)))
    echo("(lengthFlue + floorThickness) is too short");

// inner flue loft calculations
function alpha(c) = (360 * (0.5*c-0.25) / flueSteps); //starts with 1 on unit circle

flueloft_upper_inner_points = [
    for (i =[(270+labium_angle_45*0.5) : (-labium_angle_45/(flueSteps-1)) : (270-labium_angle_45*0.5)]) 
        concat(
            cos(i)*(outerDiameter+flueWidth)/2 - (outCut-0.1)/sqrt(2), 
            sin(i)*(outerDiameter+flueWidth)/2, 
            -cos(i)*(outerDiameter+flueWidth)/2 - (outCut-0.1)/sqrt(2)
        ),
    for (i =[(270-labium_angle_45*0.5) : (labium_angle_45/(flueSteps-1)) : (270+labium_angle_45*0.5)]) 
        concat(
            cos(i)*(outerDiameter-flueWidth)/2 - (outCut-0.1)/sqrt(2), 
            sin(i)*(outerDiameter-flueWidth)/2, 
            -cos(i)*(outerDiameter-flueWidth)/2 - (outCut-0.1)/sqrt(2)
        )
];
    
flueloft_lower_inner_points=[
    for (i =[1 : (2*flueSteps)]) 
        concat(
            cos(alpha(i))*air_supply_diameter/2 + airSupplyX, 
            -sin(alpha(i))*air_supply_diameter/2 + airSupplyY, 
            ground+tubeInsert)
];

// outer flue loft calculations

flueloft_upper_outer_points=[
    for (i =[(270+labium_angle_45*0.55) : (-labium_angle_45*1.1/(flueSteps-1)) : (270-labium_angle_45*0.55)]) 
        concat(
            cos(i)*((outerDiameter+flueWidth)/2+minWallThickness) - (outCut-0.05)/sqrt(2), 
            sin(i)*((outerDiameter+flueWidth)/2+minWallThickness), 
            -cos(i)*((outerDiameter+flueWidth)/2+minWallThickness) - (outCut-0.05)/sqrt(2)
        ),
    for (i =[(270-labium_angle_45*0.55) : (labium_angle_45*1.1/(flueSteps-1)) : (270+labium_angle_45*0.55)]) 
        concat(
            cos(i)*((outerDiameter-flueWidth)/2-minWallThickness) - (outCut-0.05)/sqrt(2), 
            sin(i)*((outerDiameter-flueWidth)/2-minWallThickness), 
            -cos(i)*((outerDiameter-flueWidth)/2-minWallThickness) - (outCut-0.05)/sqrt(2)
        )
];
   
flueloft_lower_outer_points=[
    for (i =[1 : (2*flueSteps)]) 
        concat(
            cos(alpha(i))*(air_supply_diameter+2*minWallThickness)/2 + airSupplyX, 
            -sin(alpha(i))*(air_supply_diameter+2*minWallThickness)/2 + airSupplyY, 
            ground+tubeInsert)
];
    
//  beard points
upper_beard_points=[
    for (i =[(270+labium_angle_45*0.55) : (-labium_angle_45*1.1/(flueSteps-1)) : (270-labium_angle_45*0.55)]) 
        concat(
            cos(i)*((outerDiameter+flueWidth+minWallThickness)/2), 
            sin(i)*((outerDiameter+flueWidth+minWallThickness)/2), 
            -cos(i)*((outerDiameter+flueWidth+minWallThickness)/2)
        ),
    for (i =[(270-labium_angle_45*0.55) : (labium_angle_45*1.1/(flueSteps-1)) : (270+labium_angle_45*0.55)]) 
        concat(
            cos(i)*outerDiameter/4, 
            sin(i)*outerDiameter/4, 
            -cos(i)*outerDiameter/4
        )
];
    
lower_beard_points=[
    for (i =[(270+labium_angle_45*0.55) : (-labium_angle_45*1.1/(flueSteps-1)) : (270-labium_angle_45*0.55)]) 
        concat(
            cos(i)*((outerDiameter+flueWidth)/2+minWallThickness) - outCut/sqrt(2), 
            sin(i)*((outerDiameter+flueWidth)/2+minWallThickness), 
            -cos(i)*((outerDiameter+flueWidth)/2+minWallThickness) - outCut/sqrt(2)
        ),
    for (i =[(270-labium_angle_45*0.55) : (labium_angle_45*1.1/(flueSteps-1)) : (270+labium_angle_45*0.55)]) 
        concat(
            cos(i)*outerDiameter/4 - outCut/sqrt(2), 
            sin(i)*outerDiameter/4, 
            -cos(i)*outerDiameter/4 - outCut/sqrt(2)
        )
];
    
// elliptic loft filler
fill_upper_points = [flueloft_upper_outer_points[0] + [0.01, 0, 0.01],
    flueloft_upper_outer_points[round(flueSteps/2)] + [0.01, 0, 0.01],
    (flueloft_upper_outer_points[flueSteps-1] + [0.01, 0, 0.01]),
    [-outCut/sqrt(2), 0, -outCut/sqrt(2)] + [0.01, 0, 0.01]];

fill_lower_points = [flueloft_lower_outer_points[0],
    flueloft_lower_outer_points[round(flueSteps/2)],
    flueloft_lower_outer_points[flueSteps-1],
    [-outCut, 0, ground + tubeInsert]];
    
// labum cut points
    
labium_line=[
    for (i =[(270-labium_angle_45*0.5) : (labium_angle_45*1.1/flueSteps) : (270+labium_angle_45*0.6)]) 
        concat(
            cos(i)*outerDiameter/2, 
            sin(i)*outerDiameter/2, 
            -cos(i)*outerDiameter/2)
];
    
lower_inner_labium_cut=[
    for (i =[(270-labium_angle_45*0.5) : (labium_angle_45*1.1/flueSteps) : (270+labium_angle_45*0.6)]) 
        concat(
            cos(i)*outerDiameter/8 - outCut / sqrt(2), 
            sin(i)*outerDiameter/8, 
            -cos(i)*outerDiameter/8 - outCut / sqrt(2))
];

lower_outer_labium_cut=[
    for (i =[(270-labium_angle_45*0.5) : (labium_angle_45*1.1/flueSteps) : (270+labium_angle_45*0.6)]) 
        concat(
            cos(i)*outerDiameter*7/8 - outCut / sqrt(2), 
            sin(i)*outerDiameter*7/8, 
            -cos(i)*outerDiameter*7/8 - outCut / sqrt(2))
];
    
upper_inner_labium_cut=[
    for (i =[(270-labium_angle_45*0.5) : (labium_angle_45*1.1/flueSteps) : (270+labium_angle_45*0.6)]) 
        concat(
            cos(i)*outerDiameter/8 + outerDiameter/2 - outCut / sqrt(2), 
            sin(i)*outerDiameter/8, 
            -cos(i)*outerDiameter/8 + outerDiameter/2 - outCut / sqrt(2))
];
    
upper_outer_labium_cut=[
    for (i =[(270-labium_angle_45*0.5) : (labium_angle_45*1.1/flueSteps) : (270+labium_angle_45*0.6)]) 
        concat(
            cos(i)*outerDiameter*7/8 + outerDiameter/2 - outCut / sqrt(2), 
            sin(i)*outerDiameter*7/8, 
            -cos(i)*outerDiameter*7/8 + outerDiameter/2 - outCut / sqrt(2))
];

labium_cut_points=[
		for (i = [0 : flueSteps - 1])
            for (j = [0:4])
                if (j%5 == 0) lower_inner_labium_cut[i]
                else if (j%5 == 1) upper_inner_labium_cut[i]
                else if (j%5 == 2) labium_line[i]
                else if (j%5 == 3) upper_outer_labium_cut[i]
                else lower_outer_labium_cut[i]
                
	];
                
labium_cut_faces=[                     // Copying from loft module
        [for (i= [0 : 4]) i], // Upper plane
        for (i = [0 : flueSteps -2])
            for (j = [0 : 4]) // Towards lower points
                [5 * i + (j+1)%5, 
                5 * i + j, 
                5 * (i+1) + j],
        for (i = [1 : (flueSteps-1)])
            for (j = [0 : 4]) // Towards upper points
                [5 * i + j, 
                5 * i + (j+1) % 5, 
                5 * (i-1) + (j+1) % 5],
        [for (i= [5 * (flueSteps) -1  : -1 : 5 * (flueSteps-1) ]) i], // Lower plane    
];

// logic
rotate ([0, 0, 60])
translate ([-airSupplyX, -airSupplyY, lengthFlue])
difference(){
    union(){
        basicShapeRound(height); 
        outer_elliptic_loft();
        elliptic_loft_fill();
        elliptic_beard();
    };
    union(){
        inner_elliptic_loft(); 
        elliptic_labium_cut();
    };
};
