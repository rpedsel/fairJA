set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.5834, <2> 25.5658, <3> 30.1004, <4> 18.2389, <5> 13.8698, <6> 25.1954, <7> 23.0532, <8> 27.9807, <9> 23.4594, <10> 20.8006;
param workload[JOB] := <1> 345.3428, <2> 653.6101, <3> 906.0341, <4> 332.6575, <5> 192.3714, <6> 634.8082, <7> 531.45, <8> 782.9196, <9> 550.3434, <10> 432.665;
param capacity[MACHINE] := <1> 1787.4007, <2> 1787.4007, <3> 1787.4007;

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
