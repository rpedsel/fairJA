set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.1363, <2> 22.2787, <3> 30.323, <4> 22.8525, <5> 23.1941, <6> 23.5939, <7> 15.2135, <8> 25.5805, <9> 20.0866, <10> 28.4127, <11> 21.5208, <12> 25.3871, <13> 23.599, <14> 38.1333, <15> 26.4349, <16> 29.4177, <17> 24.1084, <18> 23.819, <19> 26.7879, <20> 20.0222;
param workload[JOB] := <1> 4.3745, <2> 4.72, <3> 5.5066, <4> 4.7804, <5> 4.816, <6> 4.8574, <7> 3.9004, <8> 5.0577, <9> 4.4818, <10> 5.3304, <11> 4.6391, <12> 5.0386, <13> 4.8579, <14> 6.1752, <15> 5.1415, <16> 5.4238, <17> 4.91, <18> 4.8805, <19> 5.1757, <20> 4.4746;
param capacity[MACHINE] := <1> 12.3178, <2> 12.3178, <3> 12.3178, <4> 12.3178, <5> 12.3178, <6> 12.3178;

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
