$fn = 50;
difference() {
    sphere(10);

    cylinder(h = 12, r = 5);
    mirror([0,0,-5]) cylinder(12,5,5);

    rotate(90, [0,1,0]) cylinder(h = 12, r = 5); 
    mirror([-5,0,0]) rotate(90, [0,1,0]) cylinder(h = 12, r = 5); 

    rotate(90, [1,0,0]) cylinder(h = 12, r = 5); 
    mirror([0,5,0]) rotate(90, [1,0,0]) cylinder(h = 12, r = 5); 
}
