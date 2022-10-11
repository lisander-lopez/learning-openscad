$fn = 30;
// Layout Variables
SHOW_ASSEMBLED = true;

// Base Variables
base_length = 110;
base_width = 40;
base_height = 5;
base_text_bot_offset = 4;
base_text_height = 1;
// Pole Variables
pole_height = 40;
pole_radius = 3;
poles_y_pos = [-35,0,35];

// Ring Variables
ring_largest_radius = 15;
ring_tolerance = .5;
ring_height = 5;
ring_count = 6;

// Base
cube([base_width,base_length,base_height], true);
color("white") translate([-base_width/2 + base_text_bot_offset,0,base_height/2]) rotate(270,[0,0,1]) linear_extrude(base_text_height) text("Big3DWorld",5,halign="center");

// Three Poles that rings will go ontop of
for (y_pos = poles_y_pos) {
  translate([0,y_pos,0]) cylinder(pole_height, pole_radius, pole_radius);
}

_ring_start_y_pos = poles_y_pos[0];

// Create the rings
if (SHOW_ASSEMBLED) {
    
    _ring_z_pos = [for (i = [0:ring_count - 1]) base_height/2 + (i * ring_height)];
    _ring_radis = [for (i = [0:ring_count - 1]) ring_largest_radius - (i * 1.9)];
    
    for (i = [0:ring_count-1]) {
        translate([0,_ring_start_y_pos, _ring_z_pos[i]]) 
        linear_extrude(ring_height) 
        difference() {
            circle(_ring_radis[i]);
            circle(pole_radius + ring_tolerance);
        }
    }
} else {
    _ring_start_x_pos = 50;
    _ring_z_pos = [for (i = [0:ring_count - 1]) base_height/2 + (i * ring_height)];
    _ring_radis = [for (i = [0:ring_count - 1]) 15 - (i * 1.9)];
    // TODO: LEARN HOW TO GET THE FOLLOWING TO WORK!!!
    // _ring_y_pos = [for (i = [0:ring_count - 1]) i == 0 ? base_length/2 : base_length/2 - (_ring_radis[i] * 10) ];
    // _ring_y_pos = [for (i = [0:ring_count - 1]) i == 0 ? base_length/2 : 
    //     i == 1 ? base_length/2 - _ring_radis[i-1] * 2 : 
    //     i == 2 ? base_length/2 - _ring_radis[i-1] : 100
    //  ];
    _ring_y_pos = [50,20,-5,-27, -45, -60];

    for (i = [0:ring_count-1]) {
        translate([_ring_start_x_pos,_ring_y_pos[i], 0]) 
        linear_extrude(ring_height) 
        difference() {
            circle(_ring_radis[i]);
            circle(pole_radius + ring_tolerance);
       
        }
    }
}
