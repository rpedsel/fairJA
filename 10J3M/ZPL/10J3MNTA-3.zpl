set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.7252, <2> 22.8589, <3> 19.7231, <4> 26.6214, <5> 26.3778, <6> 18.9866, <7> 22.0615, <8> 24.045, <9> 22.524, <10> 17.4189;
param workload[JOB] := <1> 389.0835, <2> 522.5293, <3> 389.0007, <4> 708.6989, <5> 695.7883, <6> 360.491, <7> 486.7098, <8> 578.162, <9> 507.3306, <10> 303.4181;
param capacity[MACHINE] := <1> 1235.303, <2> 1235.303, <3> 1235.303;

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
