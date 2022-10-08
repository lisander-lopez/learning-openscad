$fn = 50;

difference() {
    circle(r = 10); // The object we will end up with

    // Following will create left eye 
    translate(v = [-4, 3.5, 0]) circle(r = 2.5);

    // Following will create right eye
    translate(v = [4, 3.5, 0]) circle(r = 2.5);

    // Create Smile
    // difference() {
    //   translate([0, -5, -1]) cylinder(h=7, r1=10, r2=10);
    //   translate([0, 13, -2]) cylinder(h=9, r1=20, r2=20);
    // }
    difference() {
        translate(v = [0, -1, 0]) circle(r = 7);
        translate(v = [0, 0, 0]) circle(r = 7);
    }
}

// Create Pupils
translate(v = [-4, 1, 0]) circle(r = 1.5);
translate(v = [4, 1, 0]) circle(r = 1.5);

// Following will create the keyring hole
difference() {
    translate(v = [0,10,0]) circle(r = 2);
    translate(v = [0,10,0]) circle(r = 1);
}

