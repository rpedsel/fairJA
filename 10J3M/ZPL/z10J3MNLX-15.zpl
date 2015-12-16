set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.6127, <2> 23.4665, <3> 28.8121, <4> 22.7852, <5> 31.6893, <6> 25.5235, <7> 31.7337, <8> 30.5975, <9> 22.3054, <10> 32.4955;
param workload[JOB] := <1> 4.4286, <2> 4.8442, <3> 5.3677, <4> 4.7734, <5> 5.6293, <6> 5.0521, <7> 5.6333, <8> 5.5315, <9> 4.7229, <10> 5.7005;
param capacity[MACHINE] := <1> 17.2278, <2> 17.2278, <3> 17.2278;

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
