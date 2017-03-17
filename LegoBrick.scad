Lego_size = [8,8,3.2];
clearance = [0.2,0.2,0];
Lego_peg = [5,1.7];
Lego_peg_spacing = 8;
peg_clearance = 0.1;

module Lego_brick(x=1,y=1,z=1){
  difference(){
    union(){
      cube([Lego_size[0]*x-clearance[0],
            Lego_size[1]*y-clearance[1],
            Lego_size[2]*z-clearance[2]],
              center=true);      
      for(i=[-(x-1)/2:(x-1)/2])
        for(j=[-(y-1)/2:(y-1)/2])
          translate([i*Lego_peg_spacing,j*Lego_peg_spacing,
                      Lego_size[2]/2*z])
            cylinder(d=Lego_peg[0],h=Lego_peg[1],$fn=64);
    }
    for(i=[-(x-1)/2:(x-1)/2])
      for(j=[-(y-1)/2:(y-1)/2])
        translate([i*Lego_peg_spacing,j*Lego_peg_spacing,
                    -Lego_size[2]/2*z-1])
            cylinder(d=Lego_peg[0]+2*peg_clearance,
                      h=Lego_peg[1]+peg_clearance+1,$fn=64);
  }
}

Lego_brick(2,4,3);