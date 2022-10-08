$fn = 50;
// union() {
// translate([-5, 5, 0]) cylinder(2, 5, 5);
// translate([5, 5, 0]) cylinder(2, 5, 5);

// translate([0,-10,0]) rotate(45) cube([15, 15, 2]);
// }


hull() {
    cylinder(h=1, r1=1, r2=1);
    translate([7, 3, 0]) cylinder(h=1, r1=4, r2=4);
}

mirror([0, 1, 0]) hull() {
    cylinder(h=1, r1=1, r2=1);
    translate([7, 3, 0]) cylinder(h=1, r1=4, r2=4);
}