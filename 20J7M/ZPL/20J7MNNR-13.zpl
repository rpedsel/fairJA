set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.7325, <2> 33.7712, <3> 22.3113, <4> 25.6988, <5> 20.0205, <6> 28.2037, <7> 23.496, <8> 27.5831, <9> 17.2349, <10> 18.7218, <11> 26.821, <12> 28.3499, <13> 23.4585, <14> 26.7245, <15> 25.0343, <16> 26.1744, <17> 39.1928, <18> 18.5351, <19> 16.6118, <20> 29.2537;
param workload[JOB] := <1> 9.4426, <2> 17.5402, <3> 48.9925, <4> 35.5309, <5> 15.7075, <6> 28.4424, <7> 47.1979, <8> 17.5796, <9> 48.2613, <10> 5.8876, <11> 21.5139, <12> 24.2249, <13> 47.4514, <14> 49.4352, <15> 37.4396, <16> 8.6922, <17> 2.1043, <18> 7.7486, <19> 14.8797, <20> 36.8315;
param capacity[MACHINE] := <1> 524.9038, <2> 524.9038, <3> 524.9038, <4> 524.9038, <5> 524.9038, <6> 524.9038, <7> 524.9038;

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
