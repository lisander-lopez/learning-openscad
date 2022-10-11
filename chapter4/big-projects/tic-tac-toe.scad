$fn = 50;

// Pieces Variables
piece_tolerance = .3; // Raise this number if the pieces don't fit on the game board
piece_size = 14;

// Cross Piece Variables
cross_size = piece_size; // Length and width of cross
cross_thickness = 5; // How big the "tips" of the crosses are

// Circle Piece Variables
circle_radius = piece_size/2; // Circle piece same size as cross

// Board Variables
board_width = 10; // PRECOMPUTED FROM SIZE PIECES
board_length  = 10; // PRECOMPUTED FROM SIZE PIECES
board_height = 5;
board_peg_radius = 2;
board_peg_height = 4;
plate_height = 1;



// Cross Piece
// rotate(45,[0,0,1])
// translate([0,0,plate_height/2])
// difference() {
//     union() {
//         square([cross_thickness, cross_size], center=true);
//         rotate(90,[0,0,1]) square([cross_thickness, cross_size], center=true);
//     }
//     circle(board_peg_radius + piece_tolerance);
// }

// Circle Piece
// translate([0,0,plate_height/2])
// difference() {
//     circle(circle_radius);
//     circle(board_peg_radius + piece_tolerance);
// }


// Piece Plate
square(piece_size, center=true);
translate([0,0,plate_height/2]) circle(board_peg_radius);