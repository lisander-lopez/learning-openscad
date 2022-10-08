$fn = 50;

// "Strips" start at 0.1MM and go up from there

baseHeight = 2;
baseLength = 30;
baseWidth = 20;

bottomOffset = 1;

// Variables for a specific strip
stripSpaceBetween = 3;
stripLength = 6;
stripExtrudeHeight = 1;
textLeftRightOffset = .5;
textHeight = .5;

_stripCount = 9;
//Create Array of _stripWidths
_stripWidths = [for (x = [1: 1: _stripCount]) .2*x -.1];

// Base object
difference() {
    translate([0,baseLength/2,0]) cube([baseWidth, baseLength, baseHeight], true);
    union(){
        for (_stripI =[1:_stripCount]) // Ew start at one? Yea! Math is easier :joy:
        {    
            _currStripWidth = _stripI * .2 - .1; // This was prederived using algebra... look at that, using things I learned in school

            // If we are on the first bottom strip then use bottom Offset for spacing
            if (_stripI == 1) {
                _stripWidth = _stripWidths[_stripI - 1];
                _rightStripXPos = (baseWidth/2) - textLeftRightOffset;
                translate([_rightStripXPos,bottomOffset, -baseHeight/2 + stripExtrudeHeight]) rotate(90) cube([_stripWidth, stripLength, stripExtrudeHeight + .1]);
            } else {
                _stripWidth = _stripWidths[_stripI - 1];
                _newBottOffset = (_stripI - 1) * stripSpaceBetween + bottomOffset;

                _rightStripXPos = (baseWidth/2) - textLeftRightOffset;
                translate([_rightStripXPos,_newBottOffset, -baseHeight/2 + stripExtrudeHeight]) rotate(90) cube([_stripWidth, stripLength, stripExtrudeHeight + .1]);
            }
            
        }
        translate([0, baseLength - 1.5,stripExtrudeHeight - .5]) linear_extrude(1) text("Big3DWorld", 2, halign="center", valign="center");
    }

}

// We will geneerate Left AND Text first AND THEN difference with Right
for (_stripI =[1:_stripCount]) // Ew start at one? Yea! Math is easier :joy:
{    
    _currStripWidth = _stripI * .2 - .1; // This was prederived using algebra... look at that, using things I learned in school
    // If we are on the first bottom strip then use bottom Offset for spacing
    if (_stripI == 1) {
        _stripWidth = _stripWidths[_stripI - 1];

        _leftStripXPos =  -(baseWidth/2) + stripLength + textLeftRightOffset;
        translate([_leftStripXPos,bottomOffset, baseHeight/2]) rotate(90) cube([_stripWidth, stripLength, stripExtrudeHeight]);
        translate([0, bottomOffset, baseHeight/2]) linear_extrude(textHeight) text(str(_stripWidth, " mm"),1, halign="center", valign="center");

    } else {
        _stripWidth = _stripWidths[_stripI - 1];

        _newBottOffset = (_stripI - 1) * stripSpaceBetween + bottomOffset;

        _leftStripXPos =  -(baseWidth/2) + stripLength + textLeftRightOffset;
        translate([_leftStripXPos,_newBottOffset, baseHeight/2]) rotate(90) cube([_stripWidth, stripLength, stripExtrudeHeight]);
        translate([0, _newBottOffset + .2, baseHeight/2]) linear_extrude(textHeight) text(str(_stripWidth, " mm"),1, halign="center", valign="center");

    }
    
}

