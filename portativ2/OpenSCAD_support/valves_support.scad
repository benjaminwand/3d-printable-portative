// The valve is made with two tubes that fit into each other.
// As for the size, choose the largest pair 
// where the wider tube isn't wider than your keys.

// Outer radius of wider tube:
wideOuter = 5.5;
// Inner radius of narrower tube:
narrowInner = 4.1; 

module outer_plug() 
rotate_extrude($fn=50)
    polygon( points=[
        [narrowInner -1,0],
        [wideOuter + 1.2,0],
        [wideOuter + 1.2, wideOuter ],        
        [wideOuter + 0.7, wideOuter ],
        [wideOuter + 0.1, wideOuter  - 0.7],
        [wideOuter, 1.2],
        [narrowInner -1, 1.2]] );
        
module inner_plug()
rotate_extrude($fn=50)
    polygon( points=[
        [narrowInner -1,0],
        [narrowInner ,0],
        [narrowInner + 0.5,0.5],
        [narrowInner + 0.5, 1.2],        
        [narrowInner, 1.2],
        [narrowInner, 4],
        [narrowInner -1, 5],
        [narrowInner -1, 1.2]] );

module key_hole() 
rotate([0, 180, 0])
rotate_extrude($fn=50)
    polygon( points=[
        [wideOuter -0.7, 1],
        [wideOuter + 1.5, 1],
        [wideOuter + 1.5, wideOuter*2 ],        
        [wideOuter + 0.8, wideOuter*2 ],
        [wideOuter + 0.1, wideOuter*2 - 0.7],
        [wideOuter + 0.05, 2.2],
        [wideOuter -0.7, 2.2]] );
        
module key(){
union(){
    rotate_extrude($fn=50)
    polygon( points=[
        [0,0],
        [narrowInner ,0],    
        [narrowInner - 0.1, 7],
        [narrowInner -1, 8],
        [0, 8],
        ] );
    cube([15, 25, 2], true);
};
};
// test
//key_hole();