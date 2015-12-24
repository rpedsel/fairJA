set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.1113, <2> 23.8661, <3> 21.5377, <4> 18.6687, <5> 30.543, <6> 23.1857, <7> 15.948, <8> 32.1617, <9> 24.7445, <10> 11.1342;
param workload[JOB] := <1> 4.3716, <2> 4.8853, <3> 4.6409, <4> 4.3207, <5> 5.5266, <6> 4.8152, <7> 3.9935, <8> 5.6711, <9> 4.9744, <10> 3.3368;
param capacity[MACHINE] := <1> 46.5361, <2> 46.5361, <3> 46.5361;

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
