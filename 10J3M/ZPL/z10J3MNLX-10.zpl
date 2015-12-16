set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.2799, <2> 27.0081, <3> 26.5427, <4> 15.3359, <5> 30.2654, <6> 29.1762, <7> 25.0272, <8> 33.9482, <9> 23.1885, <10> 28.0326;
param workload[JOB] := <1> 4.9275, <2> 5.1969, <3> 5.152, <4> 3.9161, <5> 5.5014, <6> 5.4015, <7> 5.0027, <8> 5.8265, <9> 4.8154, <10> 5.2946;
param capacity[MACHINE] := <1> 17.0115, <2> 17.0115, <3> 17.0115;

var x[JM] binary;
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
