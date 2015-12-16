set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 15.9017, <2> 33.2269, <3> 16.4313, <4> 23.0766, <5> 27.3837, <6> 23.3928, <7> 27.5309, <8> 23.913, <9> 27.1275, <10> 26.9338, <11> 23.6629, <12> 31.268, <13> 21.9237, <14> 24.3483, <15> 20.8543, <16> 26.4814, <17> 25.1728, <18> 19.8123, <19> 25.4384, <20> 26.3525;
param workload[JOB] := <1> 15.9017, <2> 33.2269, <3> 16.4313, <4> 23.0766, <5> 27.3837, <6> 23.3928, <7> 27.5309, <8> 23.913, <9> 27.1275, <10> 26.9338, <11> 23.6629, <12> 31.268, <13> 21.9237, <14> 24.3483, <15> 20.8543, <16> 26.4814, <17> 25.1728, <18> 19.8123, <19> 25.4384, <20> 26.3525;
param capacity[MACHINE] := <1> 81.7055, <2> 81.7055, <3> 81.7055, <4> 81.7055, <5> 81.7055, <6> 81.7055;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
