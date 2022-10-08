//Snowman

$fn=50;

//Bottom
sphere(25);

//Mid
translate([0,0,25]) sphere(20); 

//Top
translate([0,0,45]) sphere(15);  

// Eyes
translate([12,6,50]) sphere(2); 
mirror([0,1,0]) translate([12,6,50]) sphere(2); 

// Nose
translate([14,0,45]) rotate(90,[0,1,0]) cylinder(7, 3, 0);

// Hat
translate([0,0,55]) cylinder(4, 11,11);
translate([0,0,59]) cylinder(14, 9,9);